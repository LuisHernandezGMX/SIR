Imports System.Data
Imports Mensaje
Partial Class OrdenPago_FirmasElectronicas
    Inherits System.Web.UI.Page
    Private Enum Filtros
        Poliza = 0
        Capa
        Ramo
        Contrato
        Broker
        Compañia
        Cuota
    End Enum

    Public Property dtOrdenPago() As DataTable
        Get
            Return Session("dtOrdenPago")
        End Get
        Set(ByVal value As DataTable)
            Session("dtOrdenPago") = value
        End Set
    End Property

    Public Property dtContabilidad() As DataTable
        Get
            Return Session("dtContabilidad")
        End Get
        Set(ByVal value As DataTable)
            Session("dtContabilidad") = value
        End Set
    End Property

    Public Property EstadoOP() As Integer
        Get
            Return Session("EstadoOP")
        End Get
        Set(ByVal value As Integer)
            Session("EstadoOP") = value
        End Set
    End Property

    Private Enum TipoPersona
        Solicitante
        JefeInmediato
        DirectorArea
        Contabilidad
        Subdirector
        Rechazo
    End Enum

    Private Enum Operacion
        Ninguna
        Consulta
        Modifica
        Anula
    End Enum


    Private dtConsulta As DataTable

    Private Sub OrdenPago_FirmasElectronicas_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            EdoControl(Operacion.Ninguna)
            dtOrdenPago = Nothing
            EstadoOP = Operacion.Ninguna
            Funciones.LlenaCatDDL(ddl_Moneda, "Mon")
            ddl_Moneda.SelectedValue = -1

            txt_NroOP.Text = Request.QueryString("NumOrds")
            If Len(txt_NroOP.Text) > 0 Then
                Master.cod_usuario = Split(Context.User.Identity.Name, "|")(0)
                btn_BuscaOP_Click(Me, Nothing)
            End If
        End If
    End Sub

    Private Function ConsultaOrdenesPago() As DataTable
        Dim FiltroOP As String = ""
        Dim FiltroBrokerCia As String = ""
        Dim FiltroRamoContable As String = ""
        Dim FiltroPoliza As String = ""

        Dim FiltroFechaGen As String = ""
        Dim FiltroFechaPago As String = ""
        Dim FiltroUsuario As String = ""
        Dim FiltroEstatus As String = ""
        Dim FiltroMonto As String = ""

        Dim intFirmas As Integer = -1
        Dim FiltroNatOP As String = ""

        Dim ws As New ws_OrdenPago.OrdenPagoClient


        FiltroOP = IIf(Len(txt_NroOP.Text) > 0, txt_NroOP.Text, 0)


        FiltroBrokerCia = Funciones.ObtieneElementos(gvd_Broker, "Bro", False)
        FiltroBrokerCia = FiltroBrokerCia & IIf(Len(FiltroBrokerCia) > 0, ",", "") & Funciones.ObtieneElementos(gvd_Compañia, "Cia", False)
        FiltroRamoContable = Funciones.ObtieneElementos(gvd_RamoContable, "RamC", False)
        FiltroPoliza = Funciones.ObtieneElementos(gvd_Poliza, "Pol", True)

        FiltroUsuario = Funciones.ObtieneElementos(gvd_Usuario, "Usu", True)
        FiltroEstatus = Funciones.ObtieneElementos(gvd_Estatus, "Est", False)


        If IsDate(txtFecGeneraDe.Text) And IsDate(txtFecGeneraA.Text) Then
            If CDate(txtFecGeneraDe.Text) <= CDate(txtFecGeneraA.Text) Then
                FiltroFechaGen = " AND fec_generacion >= '" & txtFecGeneraDe.Text & "' AND fec_generacion < '" & txtFecGeneraA.Text & "'"
            End If
        End If

        If IsDate(txtFecPagoDe.Text) And IsDate(txtFecPagoA.Text) Then
            If CDate(txtFecPagoDe.Text) <= CDate(txtFecPagoA.Text) Then
                FiltroFechaPago = " AND fec_pago >= '" & txtFecPagoDe.Text & "' AND fec_pago < '" & txtFecPagoA.Text & "'"
            End If
        End If

        If IsNumeric(txt_MontoDe.Text) Then
            FiltroMonto = " WHERE imp_total >= " & txt_MontoDe.Text
        End If

        If IsNumeric(txt_MontoA.Text) Then
            FiltroMonto = IIf(Len(FiltroMonto) > 0, " AND ", " WHERE ") & " imp_total <= " & txt_MontoA.Text
        End If

        If chk_Devolucion.Checked = True Then
            FiltroNatOP = " AND sn_devolucion = -1 "
        End If

        If chk_ConISR.Checked = True Then
            FiltroNatOP = FiltroNatOP & " AND ISNULL(Impuesto,0) <> 0 "
        End If

        If chk_SinISR.Checked = True Then
            FiltroNatOP = FiltroNatOP & " AND ISNULL(Impuesto,0) = 0 "
        End If

        If chk_Firmas.Checked = True Then
            intFirmas = IIf(chk_Solicitante.Checked, 1, 0) +
                        IIf(chk_JefeDirecto.Checked, 1, 0) * 2 +
                        IIf(chk_Director.Checked, 1, 0) * 4 +
                        IIf(chk_SubDirector.Checked, 1, 0) * 8 +
                        IIf(chk_Contabilidad.Checked, 1, 0) * 16
        End If

        dtOrdenPago = Funciones.Lista_A_Datatable(ws.ObtieneOrdenPago(FiltroOP, FiltroBrokerCia, "", FiltroPoliza, FiltroFechaPago, FiltroRamoContable, FiltroUsuario, FiltroEstatus, FiltroFechaGen, ddl_Moneda.SelectedValue, Trim(txtSearchAse.Text), FiltroMonto, FiltroNatOP, intFirmas, Master.cod_usuario).ToList)


        Return dtOrdenPago
    End Function

    Private Sub EdoControl(ByVal intOperacion As Integer)
        Select Case intOperacion
            Case Operacion.Consulta
                txt_NroOP.Enabled = False
                ddl_Moneda.Enabled = False
                txtSearchAse.Enabled = False
                txtFecPagoDe.Enabled = False
                txtFecPagoA.Enabled = False
                txtFecGeneraDe.Enabled = False
                txtFecGeneraA.Enabled = False
                txt_MontoDe.Enabled = False
                txt_MontoA.Enabled = False

                gvd_Usuario.Enabled = False
                btn_AddUsuario.Visible = False
                gvd_Estatus.Enabled = False
                btn_AddEstatus.Visible = False

                gvd_Broker.Enabled = False
                btn_AddBroker.Visible = False

                gvd_Compañia.Enabled = False
                btn_AddCia.Visible = False

                gvd_Poliza.Enabled = False
                btn_AddPol.Visible = False

                gvd_RamoContable.Enabled = False
                btn_AddRamoContable.Visible = False

                chk_Devolucion.Enabled = False
                chk_ConISR.Enabled = False
                chk_SinISR.Enabled = False

                chk_Firmas.Enabled = False
                chk_Solicitante.Enabled = False
                chk_JefeDirecto.Enabled = False
                chk_Director.Enabled = False
                chk_SubDirector.Enabled = False
                chk_Contabilidad.Enabled = False

                btn_BuscaOP.Visible = False

                btn_Imprimir.Visible = True
                btn_Firmar.Visible = True

            Case Operacion.Ninguna
                Funciones.LlenaGrid(gvd_LstOrdenPago, Nothing)
                txt_NroOP.Enabled = True
                ddl_Moneda.Enabled = True
                txtSearchAse.Enabled = True
                txtFecPagoDe.Enabled = True
                txtFecPagoA.Enabled = True
                txtFecGeneraDe.Enabled = True
                txtFecGeneraA.Enabled = True
                txt_MontoDe.Enabled = True
                txt_MontoA.Enabled = True


                gvd_Usuario.Enabled = True
                btn_AddUsuario.Visible = True
                gvd_Estatus.Enabled = True
                btn_AddEstatus.Visible = True

                gvd_Broker.Enabled = True
                btn_AddBroker.Visible = True

                gvd_Compañia.Enabled = True
                btn_AddCia.Visible = True

                gvd_Poliza.Enabled = True
                btn_AddPol.Visible = True

                gvd_RamoContable.Enabled = True
                btn_AddRamoContable.Visible = True

                chk_Devolucion.Enabled = True
                chk_ConISR.Enabled = True
                chk_SinISR.Enabled = True

                chk_Firmas.Enabled = True
                chk_Solicitante.Enabled = True
                chk_JefeDirecto.Enabled = True
                chk_Director.Enabled = True
                chk_SubDirector.Enabled = True
                chk_Contabilidad.Enabled = True

                btn_BuscaOP.Visible = True

                btn_Imprimir.Visible = False
                btn_Firmar.Visible = False

        End Select
    End Sub

    Private Sub EdoControlOP(ByVal intOperacion As Integer)
        Select Case intOperacion
            Case Operacion.Consulta, Operacion.Anula
                lbl_Orden.Enabled = False
                txt_FechaEstimada.Enabled = False
                btn_CambiaCuenta.Visible = False
                lbl_EtiqBanco.Visible = True
                lbl_Texto.Enabled = False
                EdoCapturaMontos(False)

                btn_Consultar.Visible = False
                btn_Modificar.Visible = IIf(intOperacion = Operacion.Anula, False, True)
                btn_Anular.Visible = IIf(intOperacion = Operacion.Anula, False, True)

                btn_Guardar.Visible = IIf(intOperacion = Operacion.Consulta, False, True)
                btn_Cancelar.Visible = True

            Case Operacion.Modifica
                lbl_Orden.Enabled = False
                txt_FechaEstimada.Enabled = True
                btn_CambiaCuenta.Visible = True
                lbl_EtiqBanco.Visible = False
                lbl_Texto.Enabled = True
                EdoCapturaMontos(True)

                btn_Consultar.Visible = False
                btn_Modificar.Visible = False
                btn_Anular.Visible = False

                btn_Guardar.Visible = True
                btn_Cancelar.Visible = True

            Case Operacion.Ninguna
                lbl_Orden.Enabled = True
                txt_FechaEstimada.Enabled = False
                btn_CambiaCuenta.Visible = False
                lbl_EtiqBanco.Visible = True
                lbl_Texto.Enabled = False

                btn_Consultar.Visible = True
                btn_Modificar.Visible = True
                btn_Anular.Visible = True

                btn_Guardar.Visible = False
                btn_Cancelar.Visible = False

        End Select
    End Sub

    Private Sub EdoCapturaMontos(blnEstado As Boolean)
        'Si son devoluciones
        If hid_devolucion.Value = -1 Then blnEstado = False

        For Each row In gvd_Contabilidad.Rows
            DirectCast(row.FindControl("txt_prcPrima"), TextBox).Enabled = blnEstado
            DirectCast(row.FindControl("txt_Prima"), TextBox).Enabled = blnEstado
            DirectCast(row.FindControl("txt_prcCom"), TextBox).Enabled = blnEstado
            DirectCast(row.FindControl("txt_Comision"), TextBox).Enabled = blnEstado
        Next
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
            Else
                Mensaje.MuestraMensaje("Firmas Electrónicas", "La Consulta no devolvió resultados", TipoMsg.Advertencia)
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

            'Validación de Selección
            Dim myRow() As Data.DataRow
            myRow = dtOrdenPago.Select("tSEl_Val ='" & True & "'")
            If myRow.Count = 0 Then
                Mensaje.MuestraMensaje("Firmas Electrónicas", "No se ha seleccionado ninguna orden de Pago para Autorizar o Rechazar", TipoMsg.Falla)
                Exit Sub
            End If

            Dim strNumOrds = CategorizaOPs()
            Dim arrNumOrds() As String = strNumOrds.Split("|")

            'UPDATE A FIRMAS
            If Not arrNumOrds(0) = vbNullString Then ActualizaFirmas(arrNumOrds(0), TipoPersona.Solicitante, Master.cod_usuario) 'Solicitante
            If Not arrNumOrds(1) = vbNullString Then ActualizaFirmas(arrNumOrds(1), TipoPersona.JefeInmediato, Master.cod_usuario) 'Jefe Inmediato
            If Not arrNumOrds(3) = vbNullString Then ActualizaFirmas(arrNumOrds(3), TipoPersona.DirectorArea, Master.cod_usuario) 'Dirección Area
            If Not arrNumOrds(2) = vbNullString Then ActualizaFirmas(arrNumOrds(2), TipoPersona.Subdirector, Master.cod_usuario) 'Subdirector
            If Not arrNumOrds(4) = vbNullString Then ActualizaFirmas(arrNumOrds(4), TipoPersona.Contabilidad, Master.cod_usuario) 'Contabilidad
            If Not arrNumOrds(5) = vbNullString Then ActualizaFirmas(arrNumOrds(5), TipoPersona.Rechazo, Master.cod_usuario) 'Rechazos

            'ENVIO DE MAILS
            If Not arrNumOrds(0) = vbNullString Then EnviaMail(TipoPersona.JefeInmediato, Master.cod_usuario, arrNumOrds(0)) 'Del Solicitante Al Jefe Inmediato
            If Not arrNumOrds(1) = vbNullString Then EnviaMail(TipoPersona.DirectorArea, Master.cod_usuario, arrNumOrds(1))  'Del Jefe Inmediato Al Director
            If Not arrNumOrds(3) = vbNullString Then EnviaMail(TipoPersona.Contabilidad, Master.cod_usuario, arrNumOrds(3))  'Del Dir Area A Contabilidad
            If Not arrNumOrds(2) = vbNullString Then EnviaMail(TipoPersona.Contabilidad, Master.cod_usuario, arrNumOrds(2))  'Del Subdirector A Contabilidad
            If Not arrNumOrds(5) = vbNullString Then EnviaMail(TipoPersona.Solicitante, Master.cod_usuario, arrNumOrds(5), True)   'Hacia el Solicitante

            'Recarga de Grid en tiempo real despues de la Firma
            Funciones.LlenaGrid(gvd_LstOrdenPago, dtOrdenPago)
            ListaRamosContables()
            DesHabilitaChecksFirma()
            Mensaje.MuestraMensaje("Firmas Electrónicas", "Se firmarón y/o rechazaron los documentos satisfactoriamente", TipoMsg.Confirma)

        Catch ex As Exception
            Mensaje.MuestraMensaje("Firmas Electrónicas", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Private Sub EnviaMail(TipoPer As Integer, CodUSu As String, strNumOrds As String, Optional ByVal blnRechazo As Boolean = False)
        Dim ws As New ws_Generales.GeneralesClient
        Try
            Dim strBody As String
            Dim Mail As String

            If blnRechazo = False Then
                Mail = ObtieneUsuarioMail(TipoPer)
                strBody = FormatoCorreo(strNumOrds, Master.usuario, TipoPer)
                ws.EnviaCorreo("martinem@gmx.com.mx", strBody, "Solicitud de Firma de OPs", "", "")
            Else
                strBody = FormatoCorreoRechazo(strNumOrds, Master.usuario, TipoPer)
                ws.EnviaCorreo("martinem@gmx.com.mx", strBody, "Rechazo de Firma de OPs", "", "")
                ws.EnviaCorreo("oscar.sandoval@gmx.com.mx", strBody, "Rechazo de Firma de OPs", "", "")
            End If

        Catch ex As Exception
            Mensaje.MuestraMensaje("Firmas Electrónicas", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Private Function ActualizaDataOP() As DataTable

        For Each row In gvd_LstOrdenPago.Rows
            Dim chk_SelOp = DirectCast(row.FindControl("chk_SelOp"), CheckBox)
            Dim chk_Impresion = DirectCast(row.FindControl("chk_Impresion"), CheckBox)
            Dim chk_FirmaSol = DirectCast(row.FindControl("chk_FirmaSol"), CheckBox)
            Dim chk_FirmaJefe = DirectCast(row.FindControl("chk_FirmaJefe"), CheckBox)
            Dim chk_SubDir = DirectCast(row.FindControl("chk_SubDir"), CheckBox)
            Dim chk_FirmaDir = DirectCast(row.FindControl("chk_FirmaDir"), CheckBox)
            Dim chk_FirmaCon = DirectCast(row.FindControl("chk_FirmaCon"), CheckBox)
            Dim chk_Rechazo = DirectCast(row.FindControl("chk_Rechazo"), CheckBox)

            Dim lbl_OrdenPago = DirectCast(row.FindControl("lbl_OrdenPago"), LinkButton)
            Dim myRow() As Data.DataRow
            myRow = dtOrdenPago.Select("nro_op ='" & lbl_OrdenPago.Text & "'")

            myRow(0)("tSEl_Val") = chk_SelOp.Checked
            myRow(0)("sn_impresion") = chk_Impresion.Checked
            myRow(0)("sn_Solicita") = chk_FirmaSol.Checked
            myRow(0)("sn_JefeDirecto") = chk_FirmaJefe.Checked
            myRow(0)("sn_Subdirector") = chk_SubDir.Checked
            myRow(0)("sn_DireccionArea") = chk_FirmaDir.Checked
            myRow(0)("sn_Contabilidad") = chk_FirmaCon.Checked
            myRow(0)("sn_Rechazo") = chk_Rechazo.Checked
        Next
        Return dtOrdenPago
    End Function

    Private Function CategorizaOPs() As String
        Dim strOPRechazo As String = ""
        Dim strOPSubDir As String = ""
        Dim strOPConta As String = ""
        Dim strOPJefe As String = ""
        Dim strOPDirArea As String = ""
        Dim strOPSol As String = ""
        Dim strFinal As String = ""

        'Evauación de Firmas de Falso a Verdadero
        For Each row In dtOrdenPago.Rows
            If row("sn_Rechazo") = True And row("sn_Rechazo_Aux") = False Then strOPRechazo += row("nro_op") & ","
            If row("sn_Subdirector") = True And row("sn_Subdirector_Aux") = False Then strOPSubDir += row("nro_op") & ","
            If row("sn_Contabilidad") = True And row("sn_Contabilidad_Aux") = False Then strOPConta += row("nro_op") & ","
            If row("sn_DireccionArea") = True And row("sn_DireccionArea_Aux") = False Then strOPDirArea += row("nro_op") & ","
            If row("sn_JefeDirecto") = True And row("sn_JefeDirecto_Aux") = False Then strOPJefe += row("nro_op") & ","
            If row("sn_Solicita") = True And row("sn_Solicita_Aux") = False Then strOPSol += row("nro_op") & ","
        Next

        If Len(strOPSol) > 0 Then strOPSol = Left(strOPSol, Len(strOPSol) - 1)
        If Len(strOPJefe) > 0 Then strOPJefe = Left(strOPJefe, Len(strOPJefe) - 1)
        If Len(strOPDirArea) > 0 Then strOPDirArea = Left(strOPDirArea, Len(strOPDirArea) - 1)
        If Len(strOPConta) > 0 Then strOPConta = Left(strOPConta, Len(strOPConta) - 1)
        If Len(strOPSubDir) > 0 Then strOPSubDir = Left(strOPSubDir, Len(strOPSubDir) - 1)
        If Len(strOPRechazo) > 0 Then strOPRechazo = Left(strOPRechazo, Len(strOPRechazo) - 1)

        strFinal = strOPSol & "|" & strOPJefe & "|" & strOPSubDir & "|" & strOPDirArea & "|" & strOPConta & "|" & strOPRechazo

        Return strFinal

    End Function

    Private Sub ActualizaFirmas(NumOp As String, TipoPer As Integer, CodUsu As String)
        Dim ws As New ws_FirmaDigital.FirmasDigitalClient
        Dim Resultado As IList
        Dim myRow() As Data.DataRow
        Try
            Resultado = ws.ActualizaFirma(NumOp, TipoPer, CodUsu)

            If Resultado(0) = 0 Then
                For Each nro_op In Split(NumOp, ",")
                    myRow = dtOrdenPago.Select("nro_op ='" & nro_op & "'")
                    Select Case TipoPer
                        Case TipoPersona.Solicitante
                            myRow(0)("sn_Solicita_Aux") = True
                        Case TipoPersona.JefeInmediato
                            myRow(0)("sn_JefeDirecto_Aux") = True
                        Case TipoPersona.DirectorArea
                            myRow(0)("sn_DireccionArea_Aux") = True
                        Case TipoPersona.Contabilidad
                            myRow(0)("sn_Contabilidad_Aux") = True
                        Case TipoPersona.Subdirector
                            myRow(0)("sn_Subdirector_Aux") = True
                        Case TipoPersona.Rechazo
                            myRow(0)("sn_Rechazo_Aux") = True
                    End Select
                Next
            End If

        Catch ex As Exception
            Mensaje.MuestraMensaje("Firmas Electrónicas", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

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

    Protected Sub chk_Rechazo_CheckedChanged(sender As Object, e As EventArgs)
        Try
            SelectRow(sender, "chk_Rechazo")
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
        If CrtlNombre = "chk_FirmaDir" Then CrtlPrevio = "chk_FirmaJefe"
        If CrtlNombre = "chk_SubDir" Then CrtlPrevio = "chk_FirmaDir"
        If CrtlNombre = "chk_FirmaCon" Then CrtlPrevio = "chk_FirmaDir"
        If CrtlNombre = "chk_Rechazo" Then CrtlPrevio = "chk_FirmaSol"

        Dim chkPrevio As CheckBox = TryCast(gvd_LstOrdenPago.Rows(gr.RowIndex).FindControl(CrtlPrevio), CheckBox)

        Dim chkSelRenglon As CheckBox = TryCast(gvd_LstOrdenPago.Rows(gr.RowIndex).FindControl("chk_SelOp"), CheckBox)



        If CrtlPrevio <> vbNullString Then
            If chkPrevio.Checked = True Then
                If chkCtrl.Checked = True And chkCtrl.Enabled = True Then
                    chkSelRenglon.Checked = True

                    If CrtlNombre = "chk_Rechazo" Then
                        DirectCast(gvd_LstOrdenPago.Rows(gr.RowIndex).FindControl("chk_FirmaJefe"), CheckBox).Checked = False
                        DirectCast(gvd_LstOrdenPago.Rows(gr.RowIndex).FindControl("chk_FirmaDir"), CheckBox).Checked = False
                        DirectCast(gvd_LstOrdenPago.Rows(gr.RowIndex).FindControl("chk_SubDir"), CheckBox).Checked = False
                        DirectCast(gvd_LstOrdenPago.Rows(gr.RowIndex).FindControl("chk_FirmaCon"), CheckBox).Checked = False
                    Else
                        DirectCast(gvd_LstOrdenPago.Rows(gr.RowIndex).FindControl("chk_Rechazo"), CheckBox).Checked = False
                    End If

                ElseIf chkCtrl.Checked = False And chkCtrl.Enabled = True Then
                    chkSelRenglon.Checked = False
                End If
            Else
                chkCtrl.Checked = False
                Mensaje.MuestraMensaje("Firmas Electrónicas", "No puede firmar o rechazar la Orden de Pago si no cuenta con la firma previa.", TipoMsg.Falla)
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

    Protected Sub lnk_SelMotivo_Click(sender As Object, e As EventArgs)
        Try

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
            Dim chkRech = DirectCast(row.FindControl("chk_Rechazo"), CheckBox)


            Dim lnk_SelJefe = DirectCast(row.FindControl("lnk_SelJefe"), LinkButton)
            Dim lnk_SelDir = DirectCast(row.FindControl("lnk_SelDir"), LinkButton)
            Dim lnk_SelSubDir = DirectCast(row.FindControl("lnk_SelSubDir"), LinkButton)
            Dim lnk_SelConta = DirectCast(row.FindControl("lnk_SelConta"), LinkButton)
            Dim lnk_SelMotivo = DirectCast(row.FindControl("lnk_SelMotivo"), LinkButton)


            If gvd_LstOrdenPago.DataKeys(row.RowIndex)("sn_Solicita_Aux") = True Then
                chkSol.Enabled = False
            End If

            If gvd_LstOrdenPago.DataKeys(row.RowIndex)("sn_JefeDirecto_Aux") = True Then
                chkJefe.Enabled = False
                lnk_SelJefe.Enabled = False
                lnk_SelJefe.ForeColor = Drawing.Color.Gray
            End If

            If gvd_LstOrdenPago.DataKeys(row.RowIndex)("sn_DireccionArea_Aux") = True Then
                chkDir.Enabled = False
                lnk_SelDir.Enabled = False
                lnk_SelDir.ForeColor = Drawing.Color.Gray
            End If

            If gvd_LstOrdenPago.DataKeys(row.RowIndex)("sn_Subdirector_Aux") = True Then
                chkSubDir.Enabled = False
                lnk_SelSubDir.Enabled = False
                lnk_SelSubDir.ForeColor = Drawing.Color.Gray
            End If

            If gvd_LstOrdenPago.DataKeys(row.RowIndex)("sn_Contabilidad_Aux") = True Then
                chkCon.Enabled = False
                lnk_SelConta.Enabled = False
                lnk_SelConta.ForeColor = Drawing.Color.Gray
            End If

            If gvd_LstOrdenPago.DataKeys(row.RowIndex)("sn_Rechazo_Aux") = True Then
                chkRech.Enabled = False
                lnk_SelMotivo.Enabled = False
                lnk_SelMotivo.ForeColor = Drawing.Color.Gray
            End If
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

    Private Sub btnCambia_Click(sender As Object, e As EventArgs) Handles btnCambia.Click
        Dim ws As New ws_FirmaDigital.FirmasDigitalClient
        Dim Resultado As IList = Nothing
        Dim CodRol As Integer
        Select Case hid_Persona.Value
            Case 1
                CodRol = 5801
            Case 2
                CodRol = 5802
            Case 3
                CodRol = 5803
            Case 4
                CodRol = 5804
        End Select
        Try
            Resultado = ws.ActualizaDestinatarioFirma(ddl_Destinatario.SelectedValue.ToString, CodRol)
            If Resultado(0) = 0 Then
                Funciones.CerrarModal("#Destinatario")
                Mensaje.MuestraMensaje("Firmas Electrónicas", "Se actualizó correctamente", TipoMsg.Confirma)
            End If

        Catch ex As Exception
            Mensaje.MuestraMensaje("Firmas Electrónicas", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Private Sub btn_AddPol_Click(sender As Object, e As EventArgs) Handles btn_AddPol.Click
        Try
            Master.MuestraPolizario("gvd_Poliza", False, False, False, False, False)
        Catch ex As Exception
            Mensaje.MuestraMensaje("Firmas Electrónicas", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Private Sub btn_Imprimir_Click(sender As Object, e As EventArgs) Handles btn_Imprimir.Click
        Try
            Dim strOrdenPago As String = vbNullString

            ActualizaDataOP()

            For Each Row In dtOrdenPago.Rows
                If Row("sn_impresion") Then
                    strOrdenPago = strOrdenPago & Row("nro_op") & ","
                End If
            Next

            If Len(strOrdenPago) > 0 Then
                strOrdenPago = Mid(strOrdenPago, 1, Len(strOrdenPago) - 1)
                Dim ws As New ws_Generales.GeneralesClient
                Dim server As String = ws.ObtieneParametro(3)
                server = Replace(Replace(server, "@Reporte", "OrdenPago"), "@Formato", "PDF") & "&nro_op=@nro_op"
                Funciones.EjecutaFuncion("fn_ImprimirOrden('" & server & "','" & strOrdenPago & "');")
            End If

        Catch ex As Exception
            Mensaje.MuestraMensaje("Firmas Electrónicas", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Private Sub chk_Firmas_CheckedChanged(sender As Object, e As EventArgs) Handles chk_Firmas.CheckedChanged
        Try
            chk_Solicitante.Enabled = chk_Firmas.Checked
            chk_JefeDirecto.Enabled = chk_Firmas.Checked
            chk_Director.Enabled = chk_Firmas.Checked
            chk_SubDirector.Enabled = chk_Firmas.Checked
            chk_Contabilidad.Enabled = chk_Firmas.Checked
        Catch ex As Exception
            Mensaje.MuestraMensaje("Firmas Electrónicas", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Private Function FormatoCorreo(strNumOrds As String, UsuSol As String, TipoPer As Integer) As String
        Dim strTipoPersona As String = ""
        If TipoPer = TipoPersona.JefeInmediato Then strTipoPersona = "Jefe Inmediato"
        If TipoPer = TipoPersona.DirectorArea Then strTipoPersona = "Director de Área"
        If TipoPer = TipoPersona.Subdirector Then strTipoPersona = "SubDirector"
        If TipoPer = TipoPersona.Contabilidad Then strTipoPersona = "Contabilidad"

        Dim strBody As String = ""
        strBody = "<table style = 'margin: 0px; border: medium; border-image: none; border-collapse: collapse;' border='1' cellspacing='0' cellpadding='0'>"
        strBody += "<tbody> <tr style = 'mso-yfti-irow:0;mso-yfti-firstrow:yes;mso-yfti-lastrow:yes' >"
        strBody += "<td width='395' valign='top' style='margin: 0px; padding: 0cm 5.4pt; border: 1px solid rgb(0, 0, 0); border-image: none; width: 296pt; background-color: transparent;'>"
        strBody += "<p style='margin: 0px; line-height: normal;'><span style='margin: 0px; color: rgb(0, 32, 96);'><img width='74' height='74' src='\\gmxqroapp02\inetpub\wwwroot\OrdenPago\Images\Firmas\logo_gmx.jpg' v:shapes='Imagen_x0020_2'></span><span style='margin: 0px; color: rgb(0, 32, 96);'><span style='margin: 0px;'><font face='Calibri'>&nbsp;&nbsp;&nbsp;&nbsp; </font></span><span style='margin: 0px;'><font face='Calibri'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font></span></span><b style='mso-bidi-font-weight:&#10;  normal'><span style='margin: 0px; color: rgb(0, 32, 96); font-family: ' Myriad Pro',' sans-serif'; font-size: 16pt;'>GMX Seguros</span></b></p>"
        strBody += "<p style='margin: 0px; line-height: normal;'><span style='margin: 0px; color: rgb(0, 32, 96); font-family: ' Myriad Pro',' sans-serif';'>Autorización"
        strBody += " de Órdenes de Pago.</span></p>"
        strBody += "<p style='margin: 0px; line-height: normal;'><span style='margin: 0px; color: rgb(0, 32, 96); font-family: ' Myriad Pro',' sans-serif';'>&nbsp;</span></p>"
        strBody += "<p style='margin: 0px; line-height: normal;'><span style='margin: 0px; color: rgb(0, 32, 96); font-family: ' Myriad Pro',' sans-serif';'>Se solicita por parte de <b style='mso-bidi-font-weight:normal'>" & UsuSol & " </b>, sean firmadas"
        strBody += " las siguientes órdenes de pago por <b style='mso-bidi-font-weight:normal'> " & strTipoPersona & ": </b> </span></p>"
        strBody += "<p style='margin: 0px; line-height: normal;'><span style='margin: 0px; color: rgb(0, 32, 96); font-family: ' Myriad Pro',' sans-serif';'><b style='mso-bidi-font-weight:normal'>" & strNumOrds & "</b></span></p>"
        strBody += "<p style='margin: 0px; line-height: normal;'><span style='margin: 0px; color: rgb(0, 32, 96); font-family: ' Myriad Pro',' sans-serif';'>Para"
        strBody += " firmarlas electrónicamente dar clic en el enlace debajo:</span></p>"
        strBody += "<p align='center' style='margin: 0px; text-align: center; line-height: normal;'><a href='"
        strBody += ArmaLinkMail(strNumOrds)
        strBody += "'><font color='#0000ff' face='Calibri'>Click Aqui</font></a></p>"
        strBody += "<p style='margin: 0px; line-height: normal;'><font face='Calibri'>&nbsp;</font></p>"
        strBody += "</td>"
        strBody += "<td width = '204' valign='top' style='background: rgb(15, 36, 62); border-width: 1px 1px 1px 0px; border-style: solid solid solid none; border-color: rgb(0, 0, 0); margin: 0px; padding: 0cm 5.4pt; border-image: none; width: 152.9pt;'>"
        strBody += "<p align='center' style='margin 0px; text-align: center; line-height: normal;'><img width='62' height='62' src='\\gmxqroapp02\inetpub\wwwroot\OrdenPago\Images\Firmas\logomail.png' v:shapes='_x0000_i1025'></p>"
        strBody += " <br> "
        strBody += "<p align ='center' style='margin 0px; text-align: center; line-height: normal;'><img width='62' height='62' src='\\gmxqroapp02\inetpub\wwwroot\OrdenPago\Images\Firmas\icono-pago_blanco.png' v:shapes='_x0000_i1025'></p>"
        strBody += "</td>"
        strBody += "</tr>"
        strBody += "</tbody></table>"

        Return strBody

    End Function

    Private Function FormatoCorreoRechazo(strNumOrds As String, UsuSol As String, TipoPer As Integer) As String

        Dim strBody As String = ""
        strBody = "<table style = 'margin: 0px; border: medium; border-image: none; border-collapse: collapse;' border='1' cellspacing='0' cellpadding='0'>"
        strBody += "<tbody> <tr style = 'mso-yfti-irow:0;mso-yfti-firstrow:yes;mso-yfti-lastrow:yes' >"
        strBody += "<td width='395' valign='top' style='margin: 0px; padding: 0cm 5.4pt; border: 1px solid rgb(0, 0, 0); border-image: none; width: 296pt; background-color: transparent;'>"
        strBody += "<p style='margin: 0px; line-height: normal;'><span style='margin: 0px; color: rgb(0, 32, 96);'><img width='74' height='74' src='\\gmxqroapp02\inetpub\wwwroot\OrdenPago\Images\Firmas\logo_gmx.jpg' v:shapes='Imagen_x0020_2'></span><span style='margin: 0px; color: rgb(0, 32, 96);'><span style='margin: 0px;'><font face='Calibri'>&nbsp;&nbsp;&nbsp;&nbsp; </font></span><span style='margin: 0px;'><font face='Calibri'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font></span></span><b style='mso-bidi-font-weight:&#10;  normal'><span style='margin: 0px; color: rgb(0, 32, 96); font-family: ' Myriad Pro',' sans-serif'; font-size: 16pt;'>GMX Seguros</span></b></p>"
        strBody += "<p style='margin: 0px; line-height: normal;'><span style='margin: 0px; color: rgb(0, 32, 96); font-family: ' Myriad Pro',' sans-serif';'>Rechazo"
        strBody += " de Órdenes de Pago.</span></p>"
        strBody += "<p style='margin: 0px; line-height: normal;'><span style='margin: 0px; color: rgb(0, 32, 96); font-family: ' Myriad Pro',' sans-serif';'>&nbsp;</span></p>"
        strBody += "<p style='margin: 0px; line-height: normal;'><span style='margin: 0px; color: rgb(0, 32, 96); font-family: ' Myriad Pro',' sans-serif';'>Fueron rechazadas por parte de <b style='mso-bidi-font-weight:normal'>" & UsuSol & " </b>,"
        strBody += " las siguientes órdenes de pago: </span></p>"
        strBody += "<p style='margin: 0px; line-height: normal;'><span style='margin: 0px; color: rgb(0, 32, 96); font-family: ' Myriad Pro',' sans-serif';'><b style='mso-bidi-font-weight:normal'>" & strNumOrds & "</b></span></p>"
        strBody += "<p style='margin: 0px; line-height: normal;'><span style='margin: 0px; color: rgb(0, 32, 96); font-family: ' Myriad Pro',' sans-serif';'>Para"
        strBody += " ver el detalle dar clic en el enlace debajo:</span></p>"
        strBody += "<p align='center' style='margin: 0px; text-align: center; line-height: normal;'><a href='"
        strBody += ArmaLinkMail(strNumOrds)
        strBody += "'><font color='#0000ff' face='Calibri'>Click Aqui</font></a></p>"
        strBody += "<p style='margin: 0px; line-height: normal;'><font face='Calibri'>&nbsp;</font></p>"
        strBody += "</td>"
        strBody += "<td width = '204' valign='top' style='background: rgb(15, 36, 62); border-width: 1px 1px 1px 0px; border-style: solid solid solid none; border-color: rgb(0, 0, 0); margin: 0px; padding: 0cm 5.4pt; border-image: none; width: 152.9pt;'>"
        strBody += "<p align='center' style='margin 0px; text-align: center; line-height: normal;'><img width='62' height='62' src='\\gmxqroapp02\inetpub\wwwroot\OrdenPago\Images\Firmas\logomail.png' v:shapes='_x0000_i1025'></p>"
        strBody += " <br> "
        strBody += "<p align ='center' style='margin 0px; text-align: center; line-height: normal;'><img width='62' height='62' src='\\gmxqroapp02\inetpub\wwwroot\OrdenPago\Images\Firmas\icono-pago_blanco.png' v:shapes='_x0000_i1025'></p>"
        strBody += "</td>"
        strBody += "</tr>"
        strBody += "</tbody></table>"

        Return strBody
    End Function

    Private Function ArmaLinkMail(strNumOrds As String) As String
        Dim ws As New ws_Generales.GeneralesClient
        Dim strLink As String = ws.ObtieneParametro(4) & "/OrdenPago/FirmasElectronicas.aspx"
        Dim strParametros As String
        strParametros = "?NumOrds=" & strNumOrds
        strLink += strParametros
        Return strLink
    End Function

    Private Sub gvd_LstOrdenPago_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles gvd_LstOrdenPago.RowCommand
        Try
            If e.CommandName = "OrdenPago" Then

                hid_Poliza.Value = ""
                hid_Capa.Value = ""
                hid_Ramo.Value = ""
                hid_Contrato.Value = ""
                hid_Broker.Value = ""
                hid_Compañia.Value = ""
                hid_Cuota.Value = ""

                Dim Index As Integer = e.CommandSource.NamingContainer.RowIndex

                If Consulta(gvd_LstOrdenPago.DataKeys(Index)("nro_op")) Then
                    EstadoOP = Operacion.Consulta
                    LLenaControl()
                    EdoControlOP(Operacion.Consulta)
                End If

                'With gvd_LstOrdenPago
                '    lbl_Orden.Text = .DataKeys(Index)("nro_op")
                '    hid_devolucion.Value = .DataKeys(Index)("sn_devolucion")
                '    txt_Estatus.Text = .DataKeys(Index)("cod_estatus_op") & ".-" & .DataKeys(Index)("estatus")
                '    txt_FechaEstimada.Text = .DataKeys(Index)("fec_estim_pago")
                '    lbl_Transaccion.Text = IIf(IsDBNull(.DataKeys(Index)("nro_recibo")), "", .DataKeys(Index)("nro_recibo"))
                '    lbl_Compañia.Text = .DataKeys(Index)("txt_cheque_a_nom")
                '    lbl_Sucursal.Text = .DataKeys(Index)("SucEmision")
                '    lbl_MonedaPago.Text = .DataKeys(Index)("Moneda")
                '    lbl_TipoCambio.Text = .DataKeys(Index)("imp_cambio")
                '    lbl_MontoPago.Text = .DataKeys(Index)("Monto")
                '    lbl_Impuesto.Text = .DataKeys(Index)("Impuesto")
                '    lbl_Clave.Text = .DataKeys(Index)("nro_cuenta_transferencia")
                '    hid_codCuenta.Value = .DataKeys(Index)("id_cuenta_bancaria")
                '    lbl_Banco.Text = .DataKeys(Index)("Banco")
                '    hid_codBanco.Value = .DataKeys(Index)("cod_banco_transferencia")

                '    lbl_UsuAnula.Text = IIf(IsDBNull(.DataKeys(Index)("Baja")), "", .DataKeys(Index)("Baja"))
                '    lbl_FecAnula.Text = IIf(IsDBNull(.DataKeys(Index)("fec_baja")), "", .DataKeys(Index)("fec_baja"))

                '    lbl_Texto.Text = .DataKeys(Index)("Texto")

                '    lbl_UsuReaseguro.Text = IIf(IsDBNull(.DataKeys(Index)("Solicitante")), "", .DataKeys(Index)("Solicitante"))
                '    lbl_FecReaseguro.Text = IIf(IsDBNull(.DataKeys(Index)("fec_generacion")), "", .DataKeys(Index)("fec_generacion"))

                '    lbl_UsuTesoreria.Text = IIf(IsDBNull(.DataKeys(Index)("Tesoreria")), "", .DataKeys(Index)("Tesoreria"))
                '    lbl_FecTesoreria.Text = IIf(IsDBNull(.DataKeys(Index)("fec_autoriz_sector")), "", .DataKeys(Index)("fec_autoriz_sector"))

                '    lbl_UsuContabilidad.Text = IIf(IsDBNull(.DataKeys(Index)("Contabilidad")), "", .DataKeys(Index)("Contabilidad"))
                '    lbl_FecContabilidad.Text = IIf(IsDBNull(.DataKeys(Index)("fec_autoriz_contab")), "", .DataKeys(Index)("fec_autoriz_contab"))
                'End With

            End If
        Catch ex As Exception
            Mensaje.MuestraMensaje("Firmas Electrónicas", ex.Message, TipoMsg.Falla)
        End Try
    End Sub
    Protected Sub DespliegaFiltro(sender As Object, e As ImageClickEventArgs)
        Try
            Dim elemento As String
            Dim Datos As New ArrayList()
            Dim filtrados() As String = {""}
            Dim blnTodo As Boolean = True
            Dim Generales() As String = Split(sender.AlternateText, "|")

            hid_Filtro.Value = Generales(2)

            Select Case hid_Filtro.Value
                Case Filtros.Poliza
                    filtrados = Split(hid_Poliza.Value, "|")
                Case Filtros.Capa
                    filtrados = Split(hid_Capa.Value, "|")
                Case Filtros.Ramo
                    filtrados = Split(hid_Ramo.Value, "|")
                Case Filtros.Contrato
                    filtrados = Split(hid_Contrato.Value, "|")
                Case Filtros.Broker
                    filtrados = Split(hid_Broker.Value, "|")
                Case Filtros.Compañia
                    filtrados = Split(hid_Compañia.Value, "|")
                Case Filtros.Cuota
                    filtrados = Split(hid_Cuota.Value, "|")
            End Select

            'Titulo de la Ventana
            lbl_TituloFiltro.Text = "Filtrado " & Generales(1)

            chk_Filtro.Items.Clear()
            For Each row In gvd_Contabilidad.Rows
                elemento = gvd_Contabilidad.DataKeys(row.RowIndex)(Generales(0))
                If Not Datos.Contains(elemento) Then
                    Datos.Add(elemento)
                    chk_Filtro.Items.Add(elemento)
                End If
            Next

            If filtrados.Length = 1 Then
                blnTodo = True
            End If

            For Each item In chk_Filtro.Items
                If filtrados.Contains(item.Text) Or blnTodo = True Then
                    item.Selected = True
                End If
            Next

            Funciones.AbrirModal("#Filtro")
            Funciones.EjecutaFuncion("fn_Desplazable('#Filtro');")

        Catch ex As Exception
            Mensaje.MuestraMensaje("Firmas Electrónicas", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Private Function GeneraDTContabilidad() As DataTable
        GeneraDTContabilidad = New DataTable
        With GeneraDTContabilidad
            .Columns.Add("nro_reas")
            .Columns.Add("id_imputacion")
            .Columns.Add("txt_clave")
            .Columns.Add("txt_clave_isr")
            .Columns.Add("cod_cpto_pri")
            .Columns.Add("cod_deb_cred_pri")
            .Columns.Add("prima_cedida")
            .Columns.Add("pje_pri")
            .Columns.Add("prima")
            .Columns.Add("cod_cpto_com")
            .Columns.Add("cod_deb_cred_com")
            .Columns.Add("comisiones")
            .Columns.Add("pje_com")
            .Columns.Add("comision")
            .Columns.Add("prima_neta")
            .Columns.Add("pje_isr")
            .Columns.Add("monto_isr")
            .Columns.Add("cod_broker")
            .Columns.Add("broker")
            .Columns.Add("cod_cia")
            .Columns.Add("compañia")
            .Columns.Add("cod_profit_center")
            .Columns.Add("cod_subprofit_center")
            .Columns.Add("id_contrato")
            .Columns.Add("nro_tramo")
            .Columns.Add("id_pv")
            .Columns.Add("Poliza")
            .Columns.Add("cod_suc_stro")
            .Columns.Add("aaaa_ejercicio_stro")
            .Columns.Add("nro_stro")
            .Columns.Add("aaaamm_movimiento")
            .Columns.Add("cod_ramo_contable")
            .Columns.Add("ramo_contable")
            .Columns.Add("nro_cuota")
            .Columns.Add("fecha_fac")
            .Columns.Add("cod_major")
            .Columns.Add("cod_minor")
            .Columns.Add("cod_class_peril")
            .Columns.Add("sn_ogis")
            .Columns.Add("nro_layer")
            .Columns.Add("monto_isr_dev")
        End With
    End Function

    Private Sub btn_aceptar_filtro_Click(sender As Object, e As EventArgs) Handles btn_aceptar_filtro.Click
        Try
            Dim blnTodo As Boolean = True

            Dim hid_Control As HiddenField
            hid_Control = New HiddenField

            Select Case hid_Filtro.Value
                Case Filtros.Poliza
                    hid_Control = hid_Poliza
                Case Filtros.Capa
                    hid_Control = hid_Capa
                Case Filtros.Ramo
                    hid_Control = hid_Ramo
                Case Filtros.Contrato
                    hid_Control = hid_Contrato
                Case Filtros.Broker
                    hid_Control = hid_Broker
                Case Filtros.Compañia
                    hid_Control = hid_Compañia
                Case Filtros.Cuota
                    hid_Control = hid_Cuota
            End Select

            hid_Control.Value = ""

            For Each item In chk_Filtro.Items
                If item.Selected = True Then
                    hid_Control.Value = hid_Control.Value & IIf(Len(hid_Control.Value) > 0, "|", "") & item.Text
                Else
                    blnTodo = False
                End If
            Next

            If blnTodo = True Then
                hid_Control.Value = ""
            End If


            Dim Consulta As String = "id_pv > '0'"
            Consulta = Consulta & ArmaConsulta("poliza", Split(hid_Poliza.Value, "|"))
            Consulta = Consulta & ArmaConsulta("nro_layer", Split(hid_Capa.Value, "|"))
            Consulta = Consulta & ArmaConsulta("ramo_contable", Split(hid_Ramo.Value, "|"))
            Consulta = Consulta & ArmaConsulta("id_Contrato", Split(hid_Contrato.Value, "|"))
            Consulta = Consulta & ArmaConsulta("broker", Split(hid_Broker.Value, "|"))
            Consulta = Consulta & ArmaConsulta("compañia", Split(hid_Compañia.Value, "|"))
            Consulta = Consulta & ArmaConsulta("nro_cuota", Split(hid_Cuota.Value, "|"))

            Dim myRow() As Data.DataRow
            myRow = dtContabilidad.Select(Consulta)

            Dim dtDatos As DataTable
            dtDatos = GeneraDTContabilidad()

            For Each item In myRow
                dtDatos.Rows.Add(item("nro_reas"), item("id_imputacion"), item("txt_clave"), item("txt_clave_isr"), item("cod_cpto_pri"), item("cod_deb_cred_pri"), item("prima_cedida"), item("pje_pri"),
                                 item("prima"), item("cod_cpto_com"), item("cod_deb_cred_com"), item("comisiones"), item("pje_com"), item("comision"), item("prima_neta"), item("pje_isr"),
                                 item("monto_isr"), item("cod_broker"), item("broker"), item("cod_cia"), item("compañia"), item("cod_profit_center"), item("cod_subprofit_center"), item("id_contrato"),
                                 item("nro_tramo"), item("id_pv"), item("Poliza"), item("cod_suc_stro"), item("aaaa_ejercicio_stro"), item("nro_stro"), item("aaaamm_movimiento"), item("cod_ramo_contable"),
                                 item("ramo_contable"), item("nro_cuota"), item("fecha_fac"), item("cod_major"), item("cod_minor"), item("cod_class_peril"), item("sn_ogis"), item("nro_layer"), item("monto_isr_dev"))
            Next

            Funciones.LlenaGrid(gvd_Contabilidad, dtDatos)

            Dim btn_Poliza = DirectCast(gvd_Contabilidad.HeaderRow.FindControl("btn_Poliza"), ImageButton)
            Dim btn_Capa = DirectCast(gvd_Contabilidad.HeaderRow.FindControl("btn_Capa"), ImageButton)
            Dim btn_Ramo = DirectCast(gvd_Contabilidad.HeaderRow.FindControl("btn_Ramo"), ImageButton)
            Dim btn_Contrato = DirectCast(gvd_Contabilidad.HeaderRow.FindControl("btn_Contrato"), ImageButton)
            Dim btn_Broker = DirectCast(gvd_Contabilidad.HeaderRow.FindControl("btn_Broker"), ImageButton)
            Dim btn_Compañia = DirectCast(gvd_Contabilidad.HeaderRow.FindControl("btn_Compañia"), ImageButton)
            Dim btn_Cuota = DirectCast(gvd_Contabilidad.HeaderRow.FindControl("btn_Cuota"), ImageButton)


            btn_Poliza.CssClass = IIf(Len(hid_Poliza.Value) > 0, "btn-filtro-verde", "btn-filtro")
            btn_Capa.CssClass = IIf(Len(hid_Capa.Value) > 0, "btn-filtro-verde", "btn-filtro")
            btn_Ramo.CssClass = IIf(Len(hid_Ramo.Value) > 0, "btn-filtro-verde", "btn-filtro")
            btn_Contrato.CssClass = IIf(Len(hid_Contrato.Value) > 0, "btn-filtro-verde", "btn-filtro")
            btn_Broker.CssClass = IIf(Len(hid_Broker.Value) > 0, "btn-filtro-verde", "btn-filtro")
            btn_Compañia.CssClass = IIf(Len(hid_Compañia.Value) > 0, "btn-filtro-verde", "btn-filtro")
            btn_Cuota.CssClass = IIf(Len(hid_Cuota.Value) > 0, "btn-filtro-verde", "btn-filtro")

            EdoControlOP(EstadoOP)

        Catch ex As Exception
            Mensaje.MuestraMensaje("Firmas Electrónicas", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Public Function ArmaConsulta(ByVal campo As String, ByVal elementos() As String) As String
        Dim Consulta As String = ""

        For Each item In elementos
            If Len(item) > 0 Then
                Consulta = Consulta & IIf(Len(Consulta) > 0, " OR ", " AND (") & campo & " = '" & item & "'"
            End If
        Next

        If Len(Consulta) > 0 Then
            Consulta = Consulta & ")"
        End If

        Return Consulta
    End Function

    Private Sub btn_NingunoFiltro_Click(sender As Object, e As EventArgs) Handles btn_NingunoFiltro.Click
        Try
            For Each item In chk_Filtro.Items
                item.Selected = False
            Next
        Catch ex As Exception
            Mensaje.MuestraMensaje("Firmas Electrónicas", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Private Sub btn_TodosFiltro_Click(sender As Object, e As EventArgs) Handles btn_TodosFiltro.Click
        Try
            For Each item In chk_Filtro.Items
                item.Selected = True
            Next
        Catch ex As Exception
            Mensaje.MuestraMensaje("Firmas Electrónicas", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Private Function Consulta(ByVal nro_op As Integer) As Boolean
        Dim ws As New ws_OrdenPago.OrdenPagoClient
        Consulta = False
        dtConsulta = New DataTable
        dtConsulta = Funciones.Lista_A_Datatable(ws.ObtieneOrdenPago(nro_op, "", "", "", "", "", "", "", "", -1, "", "", "", -1, "").ToList)

        If dtConsulta.Rows.Count > 0 Then
            dtContabilidad = Funciones.Lista_A_Datatable(ws.ObtieneContabilidadOP(nro_op).ToList)
            Consulta = True
        End If
    End Function

    Private Sub LLenaControl()
        With dtConsulta
            lbl_Orden.Text = .Rows(0)("nro_op")
            hid_devolucion.Value = .Rows(0)("sn_devolucion")
            txt_Estatus.Text = .Rows(0)("cod_estatus_op") & ".-" & .Rows(0)("estatus")
            txt_FechaEstimada.Text = .Rows(0)("fec_estim_pago")
            lbl_Transaccion.Text = IIf(IsDBNull(.Rows(0)("nro_recibo")), "", .Rows(0)("nro_recibo"))
            lbl_Compañia.Text = .Rows(0)("txt_cheque_a_nom")
            lbl_Sucursal.Text = .Rows(0)("SucEmision")
            lbl_MonedaPago.Text = .Rows(0)("Moneda")
            lbl_TipoCambio.Text = .Rows(0)("imp_cambio")
            lbl_MontoPago.Text = .Rows(0)("Monto")
            lbl_Impuesto.Text = .Rows(0)("Impuesto")
            lbl_Clave.Text = .Rows(0)("nro_cuenta_transferencia")
            hid_codCuenta.Value = .Rows(0)("id_cuenta_bancaria")
            lbl_Banco.Text = .Rows(0)("Banco")
            hid_codBanco.Value = .Rows(0)("cod_banco_transferencia")

            lbl_UsuAnula.Text = IIf(IsDBNull(.Rows(0)("Baja")), "", .Rows(0)("Baja"))
            lbl_FecAnula.Text = IIf(IsDBNull(.Rows(0)("fec_baja")), "", .Rows(0)("fec_baja"))

            lbl_Texto.Text = .Rows(0)("Texto")

            lbl_UsuReaseguro.Text = IIf(IsDBNull(.Rows(0)("Solicitante")), "", .Rows(0)("Solicitante"))
            lbl_FecReaseguro.Text = IIf(IsDBNull(.Rows(0)("fec_generacion")), "", .Rows(0)("fec_generacion"))

            lbl_UsuTesoreria.Text = IIf(IsDBNull(.Rows(0)("Tesoreria")), "", .Rows(0)("Tesoreria"))
            lbl_FecTesoreria.Text = IIf(IsDBNull(.Rows(0)("fec_autoriz_sector")), "", .Rows(0)("fec_autoriz_sector"))

            lbl_UsuContabilidad.Text = IIf(IsDBNull(.Rows(0)("Contabilidad")), "", .Rows(0)("Contabilidad"))
            lbl_FecContabilidad.Text = IIf(IsDBNull(.Rows(0)("fec_autoriz_contab")), "", .Rows(0)("fec_autoriz_contab"))

            Funciones.LlenaGrid(gvd_Contabilidad, dtContabilidad)
        End With
    End Sub

    Private Sub LimpiaControl()
        With dtConsulta
            hid_devolucion.Value = 0
            txt_Estatus.Text = vbNullString
            txt_FechaEstimada.Text = vbNullString
            lbl_Transaccion.Text = vbNullString
            lbl_Compañia.Text = vbNullString
            lbl_Sucursal.Text = vbNullString
            lbl_MonedaPago.Text = vbNullString
            lbl_TipoCambio.Text = vbNullString
            lbl_MontoPago.Text = vbNullString
            lbl_Impuesto.Text = vbNullString
            lbl_Clave.Text = vbNullString
            hid_codCuenta.Value = vbNullString
            lbl_Banco.Text = vbNullString
            hid_codBanco.Value = vbNullString

            lbl_UsuAnula.Text = vbNullString
            lbl_FecAnula.Text = vbNullString

            lbl_Texto.Text = vbNullString

            lbl_UsuReaseguro.Text = vbNullString
            lbl_FecReaseguro.Text = vbNullString

            lbl_UsuTesoreria.Text = vbNullString
            lbl_FecTesoreria.Text = vbNullString

            lbl_UsuContabilidad.Text = vbNullString
            lbl_FecContabilidad.Text = vbNullString

            dtContabilidad = Nothing
            Funciones.LlenaGrid(gvd_Contabilidad, dtContabilidad)

            lbl_UsuReaseguro.Text = vbNullString
            lbl_FecReaseguro.Text = vbNullString

            lbl_UsuTesoreria.Text = vbNullString
            lbl_FecTesoreria.Text = vbNullString

            lbl_UsuContabilidad.Text = vbNullString
            lbl_FecContabilidad.Text = vbNullString

        End With
    End Sub

    Private Function ValidaCampoRequerido() As Boolean
        ValidaCampoRequerido = False

        If lbl_Orden.Text = vbNullString Then
            Mensaje.MuestraMensaje("Firmas Electrónicas", "Debe especificar la Orden de Pago", TipoMsg.Advertencia)
            lbl_Orden.Focus()
            Exit Function
        End If
        ValidaCampoRequerido = True
    End Function

    Private Sub btn_Modificar_Click(sender As Object, e As EventArgs) Handles btn_Modificar.Click
        Try
            If ValidaCampoRequerido() Then
                If Consulta(lbl_Orden.Text) Then
                    EstadoOP = Operacion.Modifica
                    LLenaControl()

                    If ValidaEstatusOP() = False Then
                        EstadoOP = Operacion.Consulta
                    End If

                    EdoControlOP(EstadoOP)
                Else
                    Mensaje.MuestraMensaje("Firmas Electrónicas", "La Orden de Pago no existe", TipoMsg.Advertencia)
                End If
            End If
        Catch ex As Exception
            Mensaje.MuestraMensaje("Firmas Electrónicas", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Private Sub btn_Anular_Click(sender As Object, e As EventArgs) Handles btn_Anular.Click
        Try
            If ValidaCampoRequerido() Then
                If Consulta(lbl_Orden.Text) Then
                    EstadoOP = Operacion.Anula
                    LLenaControl()

                    If ValidaEstatusOP() = False Then
                        EstadoOP = Operacion.Consulta
                    End If

                    EdoControlOP(EstadoOP)
                Else
                    Mensaje.MuestraMensaje("Firmas Electrónicas", "La Orden de Pago no existe", TipoMsg.Advertencia)
                End If
            End If
        Catch ex As Exception
            Mensaje.MuestraMensaje("Firmas Electrónicas", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Private Function ValidaEstatusOP() As Boolean

        If Val(txt_Estatus.Text) > 2 Then
            EdoControlOP(Operacion.Consulta)
            Mensaje.MuestraMensaje("Firmas Electrónicas", "El estatus de esta Órden de Pago es: " & txt_Estatus.Text & ", por lo tanto no puede ser modificada o anulada", TipoMsg.Advertencia)
            Return False
        End If

        If IsDate(lbl_FecAnula.Text) Then
            EdoControlOP(Operacion.Consulta)
            Mensaje.MuestraMensaje("Firmas Electrónicas", "Esta Orden de Pago fue anulada con anterioridad, solo puede ser consultada", TipoMsg.Advertencia)
            Return False
        End If

        If IsDate(lbl_FecContabilidad.Text) Then
            EdoControlOP(Operacion.Consulta)
            Mensaje.MuestraMensaje("Firmas Electrónicas", "Esta Orden de Pago ya fue autorizada por Contabilidad, solo puede ser consultada", TipoMsg.Advertencia)
            Return False
        End If

        If IsDate(lbl_FecTesoreria.Text) Then
            Mensaje.MuestraMensaje("Firmas Electrónicas", "Esta Orden de Pago ya fue autorizada por Tesoreria, al modificarla perdera dicha autorización", TipoMsg.Advertencia)
            Return True
        End If

        Return True
    End Function

    Private Sub btn_Consultar_Click(sender As Object, e As EventArgs) Handles btn_Consultar.Click
        Try
            If ValidaCampoRequerido() Then
                If Consulta(lbl_Orden.Text) Then
                    EstadoOP = Operacion.Consulta
                    LLenaControl()
                    EdoControlOP(Operacion.Consulta)
                Else
                    Mensaje.MuestraMensaje("Firmas Electrónicas", "La Orden de Pago no existe", TipoMsg.Advertencia)
                End If
            End If
        Catch ex As Exception
            Mensaje.MuestraMensaje("Firmas Electrónicas", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Private Sub btn_Cancelar_Click(sender As Object, e As EventArgs) Handles btn_Cancelar.Click
        Try
            EstadoOP = Operacion.Ninguna
            LimpiaControl()
            EdoControlOP(EstadoOP)
        Catch ex As Exception
            Mensaje.MuestraMensaje("Firmas Electrónicas", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

End Class
