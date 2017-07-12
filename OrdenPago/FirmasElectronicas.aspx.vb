Imports System.Data
Imports Mensaje
Partial Class OrdenPago_FirmasElectronicas
    Inherits System.Web.UI.Page

    Public Property dtOrdenPago() As DataTable
        Get
            Return Session("dtOrdenPago")
        End Get
        Set(ByVal value As DataTable)
            Session("dtOrdenPago") = value
        End Set
    End Property

    Private Enum TipoPersona
        Solicitante = 0
        JefeInmediato
        DirectorArea
        Contabilidad
        Subdirector
    End Enum

    Private Enum Operacion
        Ninguna
        Consulta
    End Enum

    Private Sub OrdenPago_FirmasElectronicas_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            EdoControl(Operacion.Ninguna)
            dtOrdenPago = Nothing
        End If
    End Sub

    Private Function ConsultaOrdenesPago() As DataTable
        Dim FiltroFechaGen As String = ""
        Dim FiltroUsuario As String = ""
        Dim FiltroEstatus As String = ""
        Dim ws As New ws_OrdenPago.OrdenPagoClient

        FiltroUsuario = Funciones.ObtieneElementos(gvd_Usuario, "Usu", True)
        FiltroEstatus = Funciones.ObtieneElementos(gvd_Estatus, "Est", False)


        'If IsDate(txtFecGeneraDe.Text) And IsDate(txtFecGeneraA.Text) Then
        '    If CDate(txtFecGeneraDe.Text) <= CDate(txtFecGeneraA.Text) Then
        '        FiltroFechaGen = " AND fec_generacion >= ''" & FechaAIngles(txtFecGeneraDe.Text) & "'' AND fec_generacion < ''" & FechaAIngles(DateAdd(DateInterval.Day, 1, CDate(txtFecGeneraA.Text))) & "''"
        '    End If
        'End If

        ConsultaOrdenesPago = Funciones.Lista_A_Datatable(ws.ObtieneOrdenPago("0", "", "", "", "", "", FiltroUsuario, FiltroEstatus, "", "").ToList)
        dtOrdenPago = ConsultaOrdenesPago
    End Function

    Private Sub EdoControl(ByVal intOperacion As Integer)
        Select Case intOperacion
            Case Operacion.Consulta
                txtFecGeneraDe.Enabled = False
                txtFecGeneraA.Enabled = False
                gvd_Usuario.Enabled = False
                btn_AddUsuario.Visible = False
                gvd_Estatus.Enabled = False
                btn_AddEstatus.Visible = False
                btn_BuscaOP.Visible = False

                btn_Imprimir.Visible = True
                btn_Firmar.Visible = True

            Case Operacion.Ninguna
                Funciones.LlenaGrid(gvd_LstOrdenPago, Nothing)
                txtFecGeneraDe.Enabled = True
                txtFecGeneraA.Enabled = True
                gvd_Usuario.Enabled = True
                btn_AddUsuario.Visible = True
                gvd_Estatus.Enabled = True
                btn_AddEstatus.Visible = True
                btn_BuscaOP.Visible = True

                btn_Imprimir.Visible = False
                btn_Firmar.Visible = False
        End Select
    End Sub


    Private Sub btn_BuscaOP_Click(sender As Object, e As EventArgs) Handles btn_BuscaOP.Click
        Try
            Dim ws As New ws_OrdenPago.OrdenPagoClient

            Funciones.LlenaGrid(gvd_LstOrdenPago, ConsultaOrdenesPago)

            If gvd_LstOrdenPago.Rows.Count > 0 Then
                gvd_LstOrdenPago.PageIndex = 0
                ListaRamosContables()
                DesHabilitaChecksFirma()
                EdoControl(Operacion.Consulta)
            End If

        Catch ex As Exception
            Mensaje.MuestraMensaje("Firmas Electrónicas", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Private Sub btn_Limpiar_Click(sender As Object, e As EventArgs) Handles btn_Limpiar.Click
        Try
            EdoControl(Operacion.Ninguna)
        Catch ex As Exception
            Mensaje.MuestraMensaje("Firmas Electrónicas", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Private Sub btn_Firmar_Click(sender As Object, e As EventArgs) Handles btn_Firmar.Click
        Try
            ActualizaDataOP()

            Dim myRow() As Data.DataRow
            myRow = dtOrdenPago.Select("tSEl_Val ='" & True & "'")
            If myRow.Count = 0 Then
                Mensaje.MuestraMensaje("Firmas Electrónicas", "No se ha seleccionado ninguna orden de Pago para autorizar", TipoMsg.Falla)
                Exit Sub
            End If

            'Dim strNumOrds = CategorizaOPs()
            'Dim arrNumOrds() As String = strNumOrds.Split("|")
            ''UPDATE A FIRMAS
            'If Not arrNumOrds(0) = vbNullString Then ActualizaFirmas(arrNumOrds(0), 0, Master.cod_usuario) 'Solicitante
            'If Not arrNumOrds(1) = vbNullString Then ActualizaFirmas(arrNumOrds(1), 1, Master.cod_usuario) 'Jefe Inmediato
            'If Not arrNumOrds(2) = vbNullString Then ActualizaFirmas(arrNumOrds(2), 4, Master.cod_usuario) 'Subdirector
            'If Not arrNumOrds(3) = vbNullString Then ActualizaFirmas(arrNumOrds(3), 2, Master.cod_usuario) 'Dir Area
            'If Not arrNumOrds(4) = vbNullString Then ActualizaFirmas(arrNumOrds(4), 3, Master.cod_usuario) 'Conta

            'ENVIO DE MAILS
            'If Not arrNumOrds(0) = vbNullString Then EnviaMail(1, Master.cod_usuario, arrNumOrds(0)) 'Solicitante
            'If Not arrNumOrds(1) = vbNullString Then EnviaMail(2, Master.cod_usuario, arrNumOrds(1)) 'Jefe Inmediato
            'If Not arrNumOrds(2) = vbNullString Then EnviaMail(3, Master.cod_usuario, arrNumOrds(2)) 'Subdirector
            'If Not arrNumOrds(3) = vbNullString Then EnviaMail(4, Master.cod_usuario, arrNumOrds(3)) 'Dir Area


            DesHabilitaChecksFirma()
            Mensaje.MuestraMensaje("Firmas Electrónicas", "Se firmaron los documentos satisfactoriamente", TipoMsg.Confirma)

        Catch ex As Exception
            Mensaje.MuestraMensaje("Firmas Electrónicas", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Private Function ActualizaDataOP() As DataTable

        For Each row In gvd_LstOrdenPago.Rows
            Dim chk_SelOp = DirectCast(row.FindControl("chk_SelOp"), CheckBox)
            Dim chk_Impresion = DirectCast(row.FindControl("chk_Impresion"), CheckBox)
            Dim lbl_OrdenPago = DirectCast(row.FindControl("lbl_OrdenPago"), LinkButton)
            Dim myRow() As Data.DataRow
            myRow = dtOrdenPago.Select("nro_op ='" & lbl_OrdenPago.Text & "'")

            myRow(0)("tSEl_Val") = chk_SelOp.Checked
            myRow(0)("sn_impresion") = chk_Impresion.Checked
        Next
        Return dtOrdenPago
    End Function

    Private Sub ListaRamosContables()
        Dim Ramos() As String

        For Each Row In gvd_LstOrdenPago.Rows
            Dim lbl_RamosContables As Label = Row.FindControl("lbl_RamosContables")
            Dim ddl_RamosContables As DropDownList = Row.FindControl("ddl_RamosContables")

            Ramos = Split(lbl_RamosContables.Text, "|")
            For intPos = 1 To UBound(Ramos)
                ddl_RamosContables.Items.Add(Ramos(intPos))
            Next
            ddl_RamosContables.SelectedIndex = 0
        Next
    End Sub

    Protected Sub chk_FirmaSol_CheckedChanged(sender As Object, e As EventArgs)
        Try
            SelectRow(sender, "chk_FirmaSol")
        Catch ex As Exception
            Mensaje.MuestraMensaje("Firmas Electrónicas", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Protected Sub chk_FirmaJefe_CheckedChanged(sender As Object, e As EventArgs)
        Try
            SelectRow(sender, "chk_FirmaJefe")
        Catch ex As Exception
            Mensaje.MuestraMensaje("Firmas Electrónicas", ex.Message, TipoMsg.Falla)
        End Try
    End Sub
    Protected Sub chk_FirmaDir_CheckedChanged(sender As Object, e As EventArgs)
        Try
            SelectRow(sender, "chk_FirmaDir")
        Catch ex As Exception
            Mensaje.MuestraMensaje("Firmas Electrónicas", ex.Message, TipoMsg.Falla)
        End Try
    End Sub
    Protected Sub chk_FirmaCon_CheckedChanged(sender As Object, e As EventArgs)
        Try
            SelectRow(sender, "chk_FirmaCon")
        Catch ex As Exception
            Mensaje.MuestraMensaje("Firmas Electrónicas", ex.Message, TipoMsg.Falla)
        End Try
    End Sub
    Protected Sub chk_SubDir_CheckedChanged(sender As Object, e As EventArgs)
        Try
            SelectRow(sender, "chk_SubDir")
        Catch ex As Exception
            Mensaje.MuestraMensaje("Firmas Electrónicas", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Private Sub SelectRow(sender As Object, CrtlNombre As String)
        Dim CrtlPrevio As String = ""
        Dim gr As GridViewRow = DirectCast(DirectCast(DirectCast(sender, CheckBox).Parent.Parent, DataControlFieldCell).Parent, GridViewRow)
        Dim chkCtrl As CheckBox = TryCast(gvd_LstOrdenPago.Rows(gr.RowIndex).FindControl(CrtlNombre), CheckBox)
        CrtlPrevio = ""
        If CrtlNombre = "chk_FirmaJefe" Then CrtlPrevio = "chk_FirmaSol"
        If CrtlNombre = "chk_SubDir" Then CrtlPrevio = "chk_FirmaJefe"
        If CrtlNombre = "chk_FirmaDir" Then CrtlPrevio = "chk_SubDir"
        If CrtlNombre = "chk_FirmaCon" Then CrtlPrevio = "chk_FirmaDir"
        Dim chkPrevio As CheckBox = TryCast(gvd_LstOrdenPago.Rows(gr.RowIndex).FindControl(CrtlPrevio), CheckBox)
        Dim chkSelRenglon As CheckBox = TryCast(gvd_LstOrdenPago.Rows(gr.RowIndex).FindControl("chk_SelOp"), CheckBox)

        If CrtlPrevio <> vbNullString Then
            If chkPrevio.Checked = True Then
                If chkCtrl.Checked = True And chkCtrl.Enabled = True Then
                    chkSelRenglon.Checked = True
                ElseIf chkCtrl.Checked = False And chkCtrl.Enabled = True Then
                    chkSelRenglon.Checked = False
                End If
            Else
                chkCtrl.Checked = False
                Mensaje.MuestraMensaje("Firmas Electrónicas", "No puede firmar la Orden de Pago,si no cuenta con la firma previa.", TipoMsg.Falla)
            End If
        Else
            If chkCtrl.Checked = True And chkCtrl.Enabled = True Then
                chkSelRenglon.Checked = True
            ElseIf chkCtrl.Checked = False And chkCtrl.Enabled = True Then
                chkSelRenglon.Checked = False
            End If
        End If

    End Sub
    Private Sub CargaModalFirmas(TPersona As Integer)
        ObtieneUsuarioMail(TPersona)
        lblDestinatario.Text = ObtieneUsuarios(TPersona, 1)
        hid_Persona.Value = TPersona
        Funciones.AbrirModal("#Destinatario")
    End Sub

    Protected Sub lnk_SelJefe_Click(sender As Object, e As EventArgs)
        Try
            CargaModalFirmas(TipoPersona.JefeInmediato)
        Catch ex As Exception
            Mensaje.MuestraMensaje("Firmas Electrónicas", ex.Message, TipoMsg.Falla)
        End Try
    End Sub
    Protected Sub lnk_SelSubDir_Click(sender As Object, e As EventArgs)
        Try
            CargaModalFirmas(TipoPersona.Subdirector)
        Catch ex As Exception
            Mensaje.MuestraMensaje("Firmas Electrónicas", ex.Message, TipoMsg.Falla)
        End Try
    End Sub
    Protected Sub lnk_SelDir_Click(sender As Object, e As EventArgs)
        Try
            CargaModalFirmas(TipoPersona.DirectorArea)
        Catch ex As Exception
            Mensaje.MuestraMensaje("Firmas Electrónicas", ex.Message, TipoMsg.Falla)
        End Try
    End Sub
    Protected Sub lnk_SelConta_Click(sender As Object, e As EventArgs)
        Try
            CargaModalFirmas(TipoPersona.Contabilidad)
        Catch ex As Exception
            Mensaje.MuestraMensaje("Firmas Electrónicas", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Private Function ObtieneUsuarioMail(tPersona As Integer) As String
        Dim ws As New ws_FirmaDigital.FirmasDigitalClient
        Dim ListaResultado As IList = Nothing
        Dim strDestinatarios As String = ""
        Try

            ListaResultado = ws.ObtieneUsuarioFirmaE(tPersona)
            ddl_Destinatario.DataSource = ListaResultado
            ddl_Destinatario.DataTextField = "descripcion"
            ddl_Destinatario.DataValueField = "clave"
            ddl_Destinatario.DataBind()

        Catch ex As Exception
            Mensaje.MuestraMensaje("Firmas Electrónicas", ex.Message, TipoMsg.Falla)
            Return vbNullString
        End Try
        Return strDestinatarios
    End Function

    Private Function ObtieneUsuarios(tPersona As Integer, Optional _Default As Integer = 0) As String
        Dim ws As New ws_FirmaDigital.FirmasDigitalClient
        Dim ListaResultado As IList = Nothing
        Dim strDestinatarios As String = ""
        If _Default = 1 Then tPersona = (tPersona * 10) + 1
        Try
            ListaResultado = ws.ObtieneUsuarioFirmaE(tPersona)
            For Each item In ListaResultado
                If _Default = 1 Then
                    strDestinatarios = item.Descripcion
                Else
                    strDestinatarios += item.mail & ","
                End If
            Next
            If _Default = 0 Then
                strDestinatarios = Left(strDestinatarios, Len(strDestinatarios) - 1)
            End If
        Catch ex As Exception
            Mensaje.MuestraMensaje("Firmas Electrónicas", ex.Message, TipoMsg.Falla)
            Return vbNullString
        End Try
        Return strDestinatarios
    End Function

    Private Sub DesHabilitaChecksFirma()
        For Each row In gvd_LstOrdenPago.Rows
            Dim chkSol = DirectCast(row.FindControl("chk_FirmaSol"), CheckBox)
            Dim chkJefe = DirectCast(row.FindControl("chk_FirmaJefe"), CheckBox)
            Dim chkSubDir = DirectCast(row.FindControl("chk_SubDir"), CheckBox)
            Dim chkDir = DirectCast(row.FindControl("chk_FirmaDir"), CheckBox)
            Dim chkCon = DirectCast(row.FindControl("chk_FirmaCon"), CheckBox)

            If chkSol.Checked = True Then chkSol.Enabled = False
            If chkJefe.Checked = True Then chkJefe.Enabled = False
            If chkSubDir.Checked = True Then chkSubDir.Enabled = False
            If chkDir.Checked = True Then chkDir.Enabled = False
            If chkCon.Checked = True Then chkCon.Enabled = False
        Next
    End Sub

    Private Sub gvd_LstOrdenPago_PageIndexChanging(sender As Object, e As GridViewPageEventArgs) Handles gvd_LstOrdenPago.PageIndexChanging
        Try
            gvd_LstOrdenPago.PageIndex = e.NewPageIndex
            Funciones.LlenaGrid(gvd_LstOrdenPago, ActualizaDataOP)
            ListaRamosContables()
            DesHabilitaChecksFirma()
        Catch ex As Exception
            Mensaje.MuestraMensaje("Firmas Electrónicas", ex.Message, TipoMsg.Falla)
        End Try
    End Sub
End Class
