Imports System.Data
Imports Mensaje
Imports System.DateTime
Partial Class MesaControl_Gestion
    Inherits System.Web.UI.Page



    Private Enum Operacion
        Ninguna
        Nuevo
        Modifica
        Consulta
        Anula
    End Enum

    Public Property dtRiesgo() As DataTable
        Get
            Return Session("dtRiesgo")
        End Get
        Set(ByVal value As DataTable)
            Session("dtRiesgo") = value
        End Set
    End Property

    Public Property dtAgrupacion() As DataTable
        Get
            Return Session("dtAgrupacion")
        End Get
        Set(ByVal value As DataTable)
            Session("dtAgrupacion") = value
        End Set
    End Property

    Public Property dtDistribucion() As DataTable
        Get
            Return Session("dtDistribucion")
        End Get
        Set(ByVal value As DataTable)
            Session("dtDistribucion") = value
        End Set
    End Property

    Public Property dtBroker() As DataTable
        Get
            Return Session("dtBroker")
        End Get
        Set(ByVal value As DataTable)
            Session("dtBroker") = value
        End Set
    End Property

    Public Property dtReasegurador() As DataTable
        Get
            Return Session("dtReasegurador")
        End Get
        Set(ByVal value As DataTable)
            Session("dtReasegurador") = value
        End Set
    End Property

    Public Property dtSubjetividad() As DataTable
        Get
            Return Session("dtSubjetividad")
        End Get
        Set(ByVal value As DataTable)
            Session("dtSubjetividad") = value
        End Set
    End Property

    Public Property EdoOperacion() As Integer
        Get
            Return hid_Operacion.Value
        End Get
        Set(ByVal value As Integer)
            hid_Operacion.Value = value
        End Set
    End Property

    Private Sub MesaControl_Gestion_Load(sender As Object, e As EventArgs) Handles Me.Load
        Try
            If Not IsPostBack Then


                Master.Titulo = "Mesa de Control"

                Funciones.LlenaCatDDL(ddl_Moneda, "Mon",,,,,, False)

                Funciones.LlenaCatGrid(gvd_RamoSbr, "Ras", "", "")
                'Funciones.LlenaCatGrid(gvd_Seccion, "Rie", "", " AND cod_ramo = " & ddl_Ramo.SelectedValue)


                EdoControl(Operacion.Ninguna)
                EdoOperacion = Operacion.Ninguna

                Master.Clase_Logo = "zona-logo-ancha"
                Master.Clase_Form = "zona-form-ancha"
                Master.tablero_visible = True
                Master.fecha_visible = False

                Dim dt As DataTable
                dt = New DataTable

                dt.Columns.Add("Id")
                dt.Columns.Add("Proceso")
                dt.Columns.Add("Estatus")
                dt.Columns.Add("Fecha_Inicio")
                dt.Columns.Add("Fecha_Termino")
                dt.Columns.Add("Lapso")
                dt.Columns.Add("Notas")

                dt.Rows.Add(1, "PRODUCTOR-SUSCRIPCIÓN", "PSP", "", "", 0, "")
                dt.Rows.Add(2, "SUSCRIPCIÓN-REASEGURO", "SRSP", "", "", 0, "")
                dt.Rows.Add(3, "REASEGURO-CONDUCTO", "RCSP", "", "", 0, "")
                dt.Rows.Add(4, "CONDUCTO-REASEGURO", "CCP", "", "", 0, "")
                dt.Rows.Add(5, "REASEGURO-SUSCRIPCIÓN", "RSCP", "", "", 0, "")
                dt.Rows.Add(6, "SUSCRIPTOR-PRODUCTOR", "SPCP", "", "", 0, "")
                dt.Rows.Add(7, "PRODUCTOR-SUSCRIPCIÓN", "PSF", "", "", 0, "")
                dt.Rows.Add(8, "SUSCRIPCIÓN-REASEGURO", "SRSF", "", "", 0, "")
                dt.Rows.Add(9, "REASEGURO-CONDUCTO", "RCSF", "", "", 0, "")
                dt.Rows.Add(10, "CONDUCTO-REASEGURO", "CCF", "", "", 0, "")
                dt.Rows.Add(11, "REASEGURO-SUSCRIPCIÓN", "RSCF", "", "", 0, "")
                dt.Rows.Add(12, "SUSCRIPTOR-PRODUCTOR", "SPCF", "", "", 0, "")

                Funciones.LlenaGrid(Master.mgv_Tablero, dt)

                LlenaGridRiesgo(True)
                LlenaGridAgrupacion(True)
                LlenaGridDistribucion(True, 0)
                LlenaGridBroker(True)
                LlenaGridReasegurador(True)
                LlenaGridSubjetividad(True, 0, 0)
            End If

            AddHandler Master.gv_Tablero_Rowcommand, AddressOf Muestra_Notas

            If Master.mPrefijo = "Bro" And Len(Master.mSeleccionados) > 0 Then
                Agrega_Intermediario()
                Master.mPrefijo = vbNullString
            ElseIf Master.mPrefijo = "Cia" And Len(Master.mSeleccionados) > 0 Then
                Agrega_Reasegurador()
                Master.mPrefijo = vbNullString
            End If

        Catch ex As Exception

        End Try
    End Sub

    Private Sub EdoControl(ByVal intOperacion As Integer)
        Select Case intOperacion
            Case Operacion.Consulta, Operacion.Anula
                Master.mtx_Folio.Enabled = False
                Master.mgv_Tablero.Enabled = False

                txt_SearchAse.Enabled = False
                txt_RFC.Enabled = False
                txt_DomicilioFiscal.Enabled = False
                txt_DomicilioRiesgo.Enabled = False
                ddl_Moneda.Enabled = False
                txt_VigIni.Enabled = False
                txt_VigFin.Enabled = False
                txt_FecEmision.Enabled = False

                txt_SearchOfi.Enabled = False
                btn_SelOficina.Attributes.Add("disabled", "true")
                txt_SearchSusc.Enabled = False
                btn_SelSuscriptor.Attributes.Add("disabled", "true")
                txt_SearchAge.Enabled = False

                txt_ClaveSuc.Enabled = False
                txt_ClaveRam.Enabled = False
                txt_NroPoliza.Enabled = False
                txt_Sufijo.Enabled = False
                txt_Endoso.Enabled = False
                txt_SearchGre.Enabled = False
                txt_SearchTte.Enabled = False
                txt_SearchGiro.Enabled = False
                txt_GiroAsegurado.Enabled = False
                txt_Notas.Enabled = False

                btn_AddRiesgo.Attributes.Add("disabled", "true")
                btn_RemoveRiesgo.Attributes.Add("disabled", "true")
                gvd_Riesgo.Enabled = False

                '--------------------------------------

                btn_AddBroker.Attributes.Add("disabled", "true")

                gvd_Reasegurador.Enabled = False
                btn_AddCia.Attributes.Add("disabled", "true")
                '--------------------------------------

                gvd_CuadroSoporte.Enabled = False
                txt_Solicitud.Enabled = False
                txt_Ofrecimiento.Enabled = False
                txt_Integracion.Enabled = False
                txt_OrdenFirme.Enabled = False
                txt_Confirmacion.Enabled = False
                txt_Conclusion.Enabled = False

                txt_NotasGenerales.Enabled = False

                btn_Nuevo.Visible = False
                btn_Consultar.Visible = False
                btn_Modificar.Visible = IIf(intOperacion = Operacion.Anula, False, True)
                btn_Anular.Visible = IIf(intOperacion = Operacion.Anula, False, True)

                btn_Guardar.Visible = IIf(intOperacion = Operacion.Consulta, False, True)
                btn_Cancelar.Visible = True



            Case Operacion.Nuevo, Operacion.Modifica
                Master.mtx_Folio.Enabled = False
                Master.mgv_Tablero.Enabled = True

                txt_SearchAse.Enabled = True
                txt_RFC.Enabled = True
                txt_DomicilioFiscal.Enabled = True
                txt_DomicilioRiesgo.Enabled = True
                ddl_Moneda.Enabled = True
                txt_VigIni.Enabled = True
                txt_VigFin.Enabled = True
                txt_FecEmision.Enabled = True

                txt_SearchOfi.Enabled = True
                btn_SelOficina.Attributes.Remove("disabled")
                txt_SearchSusc.Enabled = True
                btn_SelSuscriptor.Attributes.Remove("disabled")
                txt_SearchAge.Enabled = True

                txt_ClaveSuc.Enabled = True
                txt_ClaveRam.Enabled = True
                txt_NroPoliza.Enabled = True
                txt_Sufijo.Enabled = True
                txt_Endoso.Enabled = True
                txt_SearchGre.Enabled = True
                txt_SearchTte.Enabled = True
                txt_SearchGiro.Enabled = True
                txt_GiroAsegurado.Enabled = True
                txt_Notas.Enabled = True

                btn_AddRiesgo.Attributes.Remove("disabled")
                btn_RemoveRiesgo.Attributes.Remove("disabled")
                gvd_Riesgo.Enabled = True

                '--------------------------------------

                btn_AddBroker.Attributes.Remove("disabled")

                gvd_Reasegurador.Enabled = True
                btn_AddCia.Attributes.Add("disabled", "true")
                '--------------------------------------

                gvd_CuadroSoporte.Enabled = True
                txt_Solicitud.Enabled = True
                txt_Ofrecimiento.Enabled = True
                txt_Integracion.Enabled = True
                txt_OrdenFirme.Enabled = True
                txt_Confirmacion.Enabled = True
                txt_Conclusion.Enabled = True

                txt_NotasGenerales.Enabled = True

                btn_Nuevo.Visible = False
                btn_Consultar.Visible = False
                btn_Modificar.Visible = False
                btn_Anular.Visible = False

                btn_Guardar.Visible = True
                btn_Cancelar.Visible = True

            Case Operacion.Ninguna
                Master.mtx_Folio.Enabled = True
                Master.mgv_Tablero.Enabled = False

                txt_SearchAse.Enabled = False
                txt_RFC.Enabled = False
                txt_DomicilioFiscal.Enabled = False
                txt_DomicilioRiesgo.Enabled = False
                ddl_Moneda.Enabled = False
                txt_VigIni.Enabled = False
                txt_VigFin.Enabled = False
                txt_FecEmision.Enabled = False

                txt_SearchOfi.Enabled = False
                btn_SelOficina.Attributes.Add("disabled", "true")
                txt_SearchSusc.Enabled = False
                btn_SelSuscriptor.Attributes.Add("disabled", "true")
                txt_SearchAge.Enabled = False

                txt_ClaveSuc.Enabled = False
                txt_ClaveRam.Enabled = False
                txt_NroPoliza.Enabled = False
                txt_Sufijo.Enabled = False
                txt_Endoso.Enabled = False
                txt_SearchGre.Enabled = False
                txt_SearchTte.Enabled = False
                txt_SearchGiro.Enabled = False
                txt_GiroAsegurado.Enabled = False
                txt_Notas.Enabled = False

                btn_AddRiesgo.Attributes.Add("disabled", "true")
                btn_RemoveRiesgo.Attributes.Add("disabled", "true")
                gvd_Riesgo.Enabled = False
                '--------------------------------------

                btn_AddBroker.Attributes.Add("disabled", "true")

                gvd_Reasegurador.Enabled = False
                btn_AddCia.Attributes.Add("disabled", "true")
                '--------------------------------------

                gvd_CuadroSoporte.Enabled = False
                txt_Solicitud.Enabled = False
                txt_Ofrecimiento.Enabled = False
                txt_Integracion.Enabled = False
                txt_OrdenFirme.Enabled = False
                txt_Confirmacion.Enabled = False
                txt_Conclusion.Enabled = False

                txt_NotasGenerales.Enabled = False

                btn_Nuevo.Visible = True
                btn_Consultar.Visible = True
                btn_Modificar.Visible = True
                btn_Anular.Visible = True

                btn_Guardar.Visible = False
                btn_Cancelar.Visible = False

        End Select
    End Sub

    Private Sub btn_Nuevo_Click(sender As Object, e As EventArgs) Handles btn_Nuevo.Click
        Try
            EdoOperacion = Operacion.Nuevo
            EdoControl(EdoOperacion)
        Catch ex As Exception
            Mensaje.MuestraMensaje("Mesa de Control", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Private Sub btn_Modificar_Click(sender As Object, e As EventArgs) Handles btn_Modificar.Click
        Try
            EdoOperacion = Operacion.Modifica
            EdoControl(EdoOperacion)
        Catch ex As Exception
            Mensaje.MuestraMensaje("Mesa de Control", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Private Sub btn_Consultar_Click(sender As Object, e As EventArgs) Handles btn_Consultar.Click
        Try
            EdoOperacion = Operacion.Consulta
            EdoControl(EdoOperacion)
        Catch ex As Exception
            Mensaje.MuestraMensaje("Mesa de Control", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Private Sub btn_Anular_Click(sender As Object, e As EventArgs) Handles btn_Anular.Click
        Try
            EdoOperacion = Operacion.Anula
            EdoControl(EdoOperacion)
        Catch ex As Exception
            Mensaje.MuestraMensaje("Mesa de Control", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Private Sub btn_Guardar_Click(sender As Object, e As EventArgs) Handles btn_Guardar.Click
        Try
            EdoOperacion = Operacion.Ninguna
            EdoControl(EdoOperacion)
        Catch ex As Exception
            Mensaje.MuestraMensaje("Mesa de Control", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Private Sub btn_Cancelar_Click(sender As Object, e As EventArgs) Handles btn_Cancelar.Click
        Try
            EdoOperacion = Operacion.Ninguna
            EdoControl(EdoOperacion)
        Catch ex As Exception
            Mensaje.MuestraMensaje("Mesa de Control", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    'Private Sub lst_Brokers_SelectedIndexChanged(sender As Object, e As EventArgs) Handles lst_Brokers.SelectedIndexChanged
    '    Try
    '        Dim Cadena As String

    '        ReDim Preserve dtSubjetividad(lst_Brokers.Items.Count - 1)
    '        ReDim Preserve dtReasegurador(lst_Brokers.Items.Count - 1)

    '        If hid_Indice.Value > -1 Then

    '            dtSubjetividad(hid_Indice.Value).Rows.Clear()
    '            dtSubjetividad(hid_Indice.Value).Rows.Add(txt_Subjetividad1.Text, txt_FecSubjetividad1.Text, chk_Subjetividad1.Checked)
    '            dtSubjetividad(hid_Indice.Value).Rows.Add(txt_Subjetividad2.Text, txt_FecSubjetividad2.Text, chk_Subjetividad2.Checked)
    '            dtSubjetividad(hid_Indice.Value).Rows.Add(txt_Subjetividad3.Text, txt_FecSubjetividad3.Text, chk_Subjetividad3.Checked)
    '            dtSubjetividad(hid_Indice.Value).Rows.Add(txt_Subjetividad4.Text, txt_FecSubjetividad4.Text, chk_Subjetividad4.Checked)
    '            dtSubjetividad(hid_Indice.Value).Rows.Add(txt_Subjetividad5.Text, txt_FecSubjetividad5.Text, chk_Subjetividad5.Checked)

    '            dtReasegurador(hid_Indice.Value).Rows.Clear()

    '            For Each Row In gvd_Reasegurador.Rows
    '                Dim Elemento = TryCast(Row.FindControl("chk_SelCia"), HiddenField).Value

    '                If Elemento <> "true" Then
    '                    Dim Clave As String = TryCast(Row.FindControl("lbl_ClaveCia"), Label).Text
    '                    Dim Descripcion As String = TryCast(Row.FindControl("lbl_Desc"), Label).Text

    '                    Dim lbl_Oculta1 As String = TryCast(Row.FindControl("lbl_Oculta1"), CheckBox).Checked
    '                    Dim lbl_Oculta4 As String = TryCast(Row.FindControl("lbl_Oculta4"), TextBox).Text
    '                    Dim lbl_Oculta5 As String = TryCast(Row.FindControl("lbl_Oculta5"), TextBox).Text
    '                    Dim lbl_Oculta6 As String = TryCast(Row.FindControl("lbl_Oculta6"), CheckBox).Checked
    '                    Dim lbl_Oculta7 As String = TryCast(Row.FindControl("lbl_Oculta7"), TextBox).Text
    '                    Dim lbl_Oculta8 As String = TryCast(Row.FindControl("lbl_Oculta8"), TextBox).Text
    '                    Dim lbl_Oculta9 As String = TryCast(Row.FindControl("lbl_Oculta9"), CheckBox).Checked
    '                    Dim lbl_Oculta10 As String = TryCast(Row.FindControl("lbl_Oculta10"), TextBox).Text
    '                    Dim lbl_Oculta11 As String = TryCast(Row.FindControl("lbl_Oculta11"), TextBox).Text

    '                    Cadena = lbl_Oculta1 & "|" & lbl_Oculta4 & "|" & lbl_Oculta5 & "|" & lbl_Oculta6 & "|" & lbl_Oculta7 & "|" & lbl_Oculta8 & "|" & lbl_Oculta9 & "|" & lbl_Oculta10 & "|" & lbl_Oculta11

    '                    Dim lbl_Oculta2 As String = TryCast(Row.FindControl("lbl_Oculta2"), TextBox).Text

    '                    Dim lbl_Oculta3 As String = TryCast(Row.FindControl("lbl_Oculta3"), TextBox).Text
    '                    Dim lbl_Oculta12 As String = TryCast(Row.FindControl("lbl_Oculta12"), DropDownList).SelectedValue

    '                    dtReasegurador(hid_Indice.Value).Rows.Add(Clave, Descripcion, Cadena, lbl_Oculta2, lbl_Oculta3 & "|" & lbl_Oculta12)
    '                End If
    '            Next
    '        End If

    '        hid_Indice.Value = lst_Brokers.SelectedIndex

    '        If Split(lst_Brokers.SelectedValue, "-")(0) = 0 Then
    '            btn_Subjetividad.Attributes.Add("disabled", "true")
    '        Else
    '            btn_Subjetividad.Attributes.Remove("disabled")
    '        End If

    '        lbl_Intermediario.Text = IIf(Len(lst_Brokers.SelectedItem.Text) > 80, Mid(lst_Brokers.SelectedItem.Text, 1, 80) & "...", lst_Brokers.SelectedItem.Text)

    '        If dtSubjetividad(hid_Indice.Value) Is Nothing Then
    '            dtSubjetividad(hid_Indice.Value) = New DataTable
    '            dtSubjetividad(hid_Indice.Value).Columns.Add("Subjetividad")
    '            dtSubjetividad(hid_Indice.Value).Columns.Add("Fecha")
    '            dtSubjetividad(hid_Indice.Value).Columns.Add("sn_Subjetividad")
    '        End If

    '        If dtSubjetividad(hid_Indice.Value).Rows.Count = 5 Then
    '            txt_Subjetividad1.Text = dtSubjetividad(hid_Indice.Value).Rows(0)("Subjetividad")
    '            txt_FecSubjetividad1.Text = dtSubjetividad(hid_Indice.Value).Rows(0)("Fecha")
    '            chk_Subjetividad1.Checked = dtSubjetividad(hid_Indice.Value).Rows(0)("sn_Subjetividad")

    '            txt_Subjetividad2.Text = dtSubjetividad(hid_Indice.Value).Rows(1)("Subjetividad")
    '            txt_FecSubjetividad2.Text = dtSubjetividad(hid_Indice.Value).Rows(1)("Fecha")
    '            chk_Subjetividad2.Checked = dtSubjetividad(hid_Indice.Value).Rows(1)("sn_Subjetividad")

    '            txt_Subjetividad3.Text = dtSubjetividad(hid_Indice.Value).Rows(2)("Subjetividad")
    '            txt_FecSubjetividad3.Text = dtSubjetividad(hid_Indice.Value).Rows(2)("Fecha")
    '            chk_Subjetividad3.Checked = dtSubjetividad(hid_Indice.Value).Rows(2)("sn_Subjetividad")

    '            txt_Subjetividad4.Text = dtSubjetividad(hid_Indice.Value).Rows(3)("Subjetividad")
    '            txt_FecSubjetividad4.Text = dtSubjetividad(hid_Indice.Value).Rows(3)("Fecha")
    '            chk_Subjetividad4.Checked = dtSubjetividad(hid_Indice.Value).Rows(3)("sn_Subjetividad")

    '            txt_Subjetividad5.Text = dtSubjetividad(hid_Indice.Value).Rows(4)("Subjetividad")
    '            txt_FecSubjetividad5.Text = dtSubjetividad(hid_Indice.Value).Rows(4)("Fecha")
    '            chk_Subjetividad5.Checked = dtSubjetividad(hid_Indice.Value).Rows(4)("sn_Subjetividad")
    '        Else
    '            txt_Subjetividad1.Text = vbNullString
    '            txt_FecSubjetividad1.Text = vbNullString
    '            chk_Subjetividad1.Checked = False

    '            txt_Subjetividad2.Text = vbNullString
    '            txt_FecSubjetividad2.Text = vbNullString
    '            chk_Subjetividad2.Checked = False

    '            txt_Subjetividad3.Text = vbNullString
    '            txt_FecSubjetividad3.Text = vbNullString
    '            chk_Subjetividad3.Checked = False

    '            txt_Subjetividad4.Text = vbNullString
    '            chk_Subjetividad4.Checked = False

    '            txt_FecSubjetividad4.Text = vbNullString
    '            txt_Subjetividad5.Text = vbNullString
    '            txt_FecSubjetividad5.Text = vbNullString
    '            chk_Subjetividad5.Checked = False
    '        End If

    '        btn_AddCia.Attributes.Remove("disabled")

    '        If dtReasegurador(hid_Indice.Value) Is Nothing Then
    '            dtReasegurador(hid_Indice.Value) = New DataTable
    '            dtReasegurador(hid_Indice.Value).Columns.Add("Clave")
    '            dtReasegurador(hid_Indice.Value).Columns.Add("Descripcion")
    '            dtReasegurador(hid_Indice.Value).Columns.Add("OcultaCampo1")
    '            dtReasegurador(hid_Indice.Value).Columns.Add("OcultaCampo2")
    '            dtReasegurador(hid_Indice.Value).Columns.Add("OcultaCampo3")
    '        End If

    '        Funciones.LlenaGrid(gvd_Reasegurador, dtReasegurador(hid_Indice.Value))

    '    Catch ex As Exception
    '        Mensaje.MuestraMensaje("Mesa de Control", ex.Message, TipoMsg.Falla)
    '    End Try
    'End Sub

    'Private Sub gvd_Reasegurador_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles gvd_Reasegurador.RowDataBound
    '    Try
    '        If e.Row.RowType = DataControlRowType.DataRow Then

    '            If Split(lst_Brokers.SelectedValue, "-")(0) <> 0 Then
    '                Dim btn_Subjetividad As HtmlButton = TryCast(e.Row.FindControl("btn_Subjetividad"), HtmlButton)
    '                btn_Subjetividad.Attributes.Add("disabled", "true")
    '            End If

    '            Dim indice As Integer = 1

    '            Dim lbl_Oculta3 As TextBox = TryCast(e.Row.FindControl("lbl_Oculta3"), TextBox)
    '            Dim lbl_Oculta12 As DropDownList = TryCast(e.Row.FindControl("lbl_Oculta12"), DropDownList)

    '            Dim adicionales() As String = Split(sender.DataKeys(e.Row.RowIndex)("OcultaCampo3"), "|")
    '            If UBound(adicionales) > 0 Then
    '                lbl_Oculta3.Text = adicionales(0)
    '                lbl_Oculta12.SelectedValue = adicionales(1)
    '            End If

    '            Dim cadena() As String = Split(sender.DataKeys(e.Row.RowIndex)("OcultaCampo1"), "|")

    '            If UBound(cadena) > 0 Then
    '                TryCast(e.Row.FindControl("lbl_Oculta1"), CheckBox).Checked = cadena(0)
    '                TryCast(e.Row.FindControl("lbl_Oculta4"), TextBox).Text = cadena(1)
    '                TryCast(e.Row.FindControl("lbl_Oculta5"), TextBox).Text = cadena(2)

    '                TryCast(e.Row.FindControl("lbl_Oculta6"), CheckBox).Checked = cadena(3)
    '                TryCast(e.Row.FindControl("lbl_Oculta7"), TextBox).Text = cadena(4)
    '                TryCast(e.Row.FindControl("lbl_Oculta8"), TextBox).Text = cadena(5)

    '                TryCast(e.Row.FindControl("lbl_Oculta9"), CheckBox).Checked = cadena(6)
    '                TryCast(e.Row.FindControl("lbl_Oculta10"), TextBox).Text = cadena(7)
    '                TryCast(e.Row.FindControl("lbl_Oculta11"), TextBox).Text = cadena(8)
    '            End If

    '        End If
    '    Catch ex As Exception
    '        Mensaje.MuestraMensaje("Mesa de Control", ex.Message, TipoMsg.Falla)
    '    End Try
    'End Sub

    Private Sub LlenaGridRiesgo(ByVal bln_Nuevo As Boolean)

        If bln_Nuevo = True Then
            dtRiesgo = New DataTable
            dtRiesgo.Columns.Add("cod_inciso")
            dtRiesgo.Columns.Add("cod_ramo")
            dtRiesgo.Columns.Add("ramo_desc")
            dtRiesgo.Columns.Add("cod_subramo")
            dtRiesgo.Columns.Add("subramo_desc")
            dtRiesgo.Columns.Add("cod_riesgo")
            dtRiesgo.Columns.Add("riesgo_desc")
            dtRiesgo.Columns.Add("cod_ind_cob")
            dtRiesgo.Columns.Add("cobertura_desc")
            dtRiesgo.Columns.Add("sn_facultativo")
            dtRiesgo.Columns.Add("sn_adicional")
            dtRiesgo.Columns.Add("valores_totales")
            dtRiesgo.Columns.Add("suma_asegurada")
            dtRiesgo.Columns.Add("prima_neta")
            dtRiesgo.Columns.Add("prima_inc")
            dtRiesgo.Columns.Add("prima_tev")
            dtRiesgo.Columns.Add("prima_fhm")
            dtRiesgo.Columns.Add("prc_com_age")
            dtRiesgo.Columns.Add("com_agente")
            dtRiesgo.Columns.Add("prc_com_adi_age")
            dtRiesgo.Columns.Add("com_adi_agente")
            dtRiesgo.Columns.Add("cuota")
            dtRiesgo.Columns.Add("prc_FeeGMX")
            dtRiesgo.Columns.Add("mnt_FeeGMX")
            dtRiesgo.Columns.Add("prc_ComFac")
            dtRiesgo.Columns.Add("mnt_ComFac")

            dtRiesgo.Rows.Add(0, "0", "TOTAL", "", "", "", "", "", "", 0, 0, "0.00", "0.00", "0.00", "0.00", "0.00", "0.00", "", "0.00", "", "0.00", "0.00", "", "0.00", "", "0.00")
        End If

        Funciones.LlenaGrid(gvd_Riesgo, dtRiesgo)

        Dim lbl_Inciso As Label = CType(gvd_Riesgo.Rows(0).FindControl("lbl_Inciso"), Label)

        Dim chk_Riesgo As CheckBox = CType(gvd_Riesgo.Rows(0).FindControl("chk_Riesgo"), CheckBox)

        Dim txt_SearchRamo As TextBox = CType(gvd_Riesgo.Rows(0).FindControl("txt_SearchRamo"), TextBox)
        Dim txt_SearchSubramo As TextBox = CType(gvd_Riesgo.Rows(0).FindControl("txt_SearchSubramo"), TextBox)
        Dim txt_SearchSeccion As TextBox = CType(gvd_Riesgo.Rows(0).FindControl("txt_SearchSeccion"), TextBox)
        Dim txt_SearchCobertura As TextBox = CType(gvd_Riesgo.Rows(0).FindControl("txt_SearchCobertura"), TextBox)
        Dim opt_Adicional As RadioButtonList = CType(gvd_Riesgo.Rows(0).FindControl("opt_Adicional"), RadioButtonList)
        Dim opt_Facultativo As RadioButtonList = CType(gvd_Riesgo.Rows(0).FindControl("opt_Facultativo"), RadioButtonList)

        Dim txt_ValoresTotales As TextBox = CType(gvd_Riesgo.Rows(0).FindControl("txt_ValoresTotales"), TextBox)
        Dim txt_LimResp As TextBox = CType(gvd_Riesgo.Rows(0).FindControl("txt_LimResp"), TextBox)
        Dim txt_PrimaNeta As TextBox = CType(gvd_Riesgo.Rows(0).FindControl("txt_PrimaNeta"), TextBox)
        Dim txt_PrimaINC As TextBox = CType(gvd_Riesgo.Rows(0).FindControl("txt_PrimaINC"), TextBox)
        Dim txt_PrimaTEV As TextBox = CType(gvd_Riesgo.Rows(0).FindControl("txt_PrimaTEV"), TextBox)
        Dim txt_PrimaFHM As TextBox = CType(gvd_Riesgo.Rows(0).FindControl("txt_PrimaFHM"), TextBox)
        Dim txt_PrcComAge As TextBox = CType(gvd_Riesgo.Rows(0).FindControl("txt_PrcComAge"), TextBox)
        Dim txt_ComAge As TextBox = CType(gvd_Riesgo.Rows(0).FindControl("txt_ComAge"), TextBox)
        Dim txt_PrcComAdiAge As TextBox = CType(gvd_Riesgo.Rows(0).FindControl("txt_PrcComAdiAge"), TextBox)
        Dim txt_ComAdiAge As TextBox = CType(gvd_Riesgo.Rows(0).FindControl("txt_ComAdiAge"), TextBox)

        Dim txt_PrcFeeGmx As TextBox = CType(gvd_Riesgo.Rows(0).FindControl("txt_PrcFeeGmx"), TextBox)
        Dim txt_FeeGmx As TextBox = CType(gvd_Riesgo.Rows(0).FindControl("txt_FeeGmx"), TextBox)
        Dim txt_PrcComFac As TextBox = CType(gvd_Riesgo.Rows(0).FindControl("txt_PrcComFac"), TextBox)
        Dim txt_ComFac As TextBox = CType(gvd_Riesgo.Rows(0).FindControl("txt_ComFac"), TextBox)

        chk_Riesgo.Visible = False
        lbl_Inciso.Text = ""
        txt_SearchRamo.Enabled = False
        txt_SearchSubramo.Enabled = False
        txt_SearchSeccion.Enabled = False
        txt_SearchCobertura.Enabled = False
        opt_Facultativo.Visible = False
        opt_Adicional.Visible = False

        txt_ValoresTotales.Enabled = False
        txt_LimResp.Enabled = False
        txt_PrimaNeta.Enabled = False
        txt_PrimaINC.Enabled = False
        txt_PrimaTEV.Enabled = False
        txt_PrimaFHM.Enabled = False
        txt_PrcComAge.Enabled = False
        txt_ComAge.Enabled = False
        txt_PrcComAdiAge.Enabled = False
        txt_ComAdiAge.Enabled = False

        txt_SearchRamo.Font.Bold = True
        txt_ValoresTotales.Font.Bold = True
        txt_LimResp.Font.Bold = True
        txt_PrimaNeta.Font.Bold = True
        txt_PrimaINC.Font.Bold = True
        txt_PrimaTEV.Font.Bold = True
        txt_PrimaFHM.Font.Bold = True
        txt_PrcComAge.Font.Bold = True
        txt_ComAge.Font.Bold = True
        txt_PrcComAdiAge.Font.Bold = True
        txt_ComAdiAge.Font.Bold = True

        txt_PrcFeeGmx.Font.Bold = True
        txt_FeeGmx.Font.Bold = True
        txt_PrcComFac.Font.Bold = True
        txt_ComFac.Font.Bold = True

        txt_SearchRamo.BackColor = Drawing.Color.LightGray
        txt_SearchSubramo.BackColor = Drawing.Color.LightGray
        txt_SearchSeccion.BackColor = Drawing.Color.LightGray
        txt_SearchCobertura.BackColor = Drawing.Color.LightGray
        txt_ValoresTotales.BackColor = Drawing.Color.LightGray
        txt_LimResp.BackColor = Drawing.Color.LightGray
        txt_PrimaNeta.BackColor = Drawing.Color.LightGray
        txt_PrimaINC.BackColor = Drawing.Color.LightGray
        txt_PrimaTEV.BackColor = Drawing.Color.LightGray
        txt_PrimaFHM.BackColor = Drawing.Color.LightGray
        txt_PrcComAge.BackColor = Drawing.Color.LightGray
        txt_ComAge.BackColor = Drawing.Color.LightGray
        txt_PrcComAdiAge.BackColor = Drawing.Color.LightGray
        txt_ComAdiAge.BackColor = Drawing.Color.LightGray

        txt_PrcFeeGmx.BackColor = Drawing.Color.LightGray
        txt_FeeGmx.BackColor = Drawing.Color.LightGray
        txt_PrcComFac.BackColor = Drawing.Color.LightGray
        txt_ComFac.BackColor = Drawing.Color.LightGray
    End Sub

    Private Sub LlenaGridAgrupacion(ByVal bln_Nuevo As Boolean)

        If bln_Nuevo = True Then
            dtAgrupacion = New DataTable
            dtAgrupacion.Columns.Add("Clave")
            dtAgrupacion.Columns.Add("Descripcion")
            dtAgrupacion.Columns.Add("suma_asegurada")
            dtAgrupacion.Columns.Add("prima_neta")
            dtAgrupacion.Columns.Add("prima_inc")
            dtAgrupacion.Columns.Add("prima_tev")
            dtAgrupacion.Columns.Add("prima_fhm")
            dtAgrupacion.Columns.Add("incisos")

            'dtAgrupacion.Rows.Add(1, "Grupo 1", "0.00", "0.00", "0.00", "0.00", "")
        End If

        Funciones.LlenaGrid(gvd_Agrupacion, dtAgrupacion)
    End Sub

    Private Sub LlenaGridDistribucion(ByVal bln_Nuevo As Boolean, Optional ByVal Grupo As Integer = 0)
        If bln_Nuevo = True Then
            dtDistribucion = New DataTable
            dtDistribucion.Columns.Add("Grupo")
            dtDistribucion.Columns.Add("Clave")
            dtDistribucion.Columns.Add("Descripcion")
            dtDistribucion.Columns.Add("prc_part")
            dtDistribucion.Columns.Add("prc_partGMX")
            dtDistribucion.Columns.Add("suma_asegurada")
            dtDistribucion.Columns.Add("prima_neta")
            dtDistribucion.Columns.Add("prima_inc")
            dtDistribucion.Columns.Add("prima_tev")
            dtDistribucion.Columns.Add("prima_fhm")
        End If

        If dtDistribucion.Select("Grupo ='" & Grupo & "'").Length = 0 Then
            dtDistribucion.Rows.Add(Grupo, 1, "GMX", "0.0000", "0.0000", "0.00", "0.00", "0.00", "0.00", "0.00")
            dtDistribucion.Rows.Add(Grupo, 2, "COASEGURADOR 1", "0.0000", "0.0000", "0.00", "0.00", "0.00", "0.00", "0.00")
            dtDistribucion.Rows.Add(Grupo, 3, "COASEGURADOR 2", "0.0000", "0.0000", "0.00", "0.00", "0.00", "0.00", "0.00")
            dtDistribucion.Rows.Add(Grupo, 4, "TOTAL", "0.0000", "0.0000", "0.00", "0.00", "0.00", "0.00", "0.00")

            dtDistribucion.Rows.Add(Grupo, 5, "", "Al 100%", "GMX", "0.00", "0.00", "0.00", "0.00", "0.00")

            dtDistribucion.Rows.Add(Grupo, 6, "RETENCION", "0.0000", "0.0000", "0.00", "0.00", "0.00", "0.00", "0.00")
            dtDistribucion.Rows.Add(Grupo, 7, "CUOTA PARTE", "0.0000", "0.0000", "0.00", "0.00", "0.00", "0.00", "0.00")
            dtDistribucion.Rows.Add(Grupo, 8, "1ER EXCEDENTE", "0.0000", "0.0000", "0.00", "0.00", "0.00", "0.00", "0.00")
            dtDistribucion.Rows.Add(Grupo, 9, "2DO EXCEDENTE", "0.0000", "0.0000", "0.00", "0.00", "0.00", "0.00", "0.00")
            dtDistribucion.Rows.Add(Grupo, 10, "FACULTATIVO", "0.0000", "0.0000", "0.00", "0.00", "0.00", "0.00", "0.00")
            dtDistribucion.Rows.Add(Grupo, 11, "TOTAL", "0.0000", "0.0000", "0.00", "0.00", "0.00", "0.00", "0.00")
        End If

        Funciones.LlenaGrid(gvd_Distribucion, (From c In dtDistribucion.AsEnumerable() Where c.Field(Of String)("Grupo") = Grupo Select c).CopyToDataTable)

        CType(gvd_Distribucion.Rows(0).FindControl("txt_Descripcion"), TextBox).Attributes("style") = "background-color: #3B6882;color: White;"
        CType(gvd_Distribucion.Rows(1).FindControl("txt_Descripcion"), TextBox).Attributes("style") = "background-color: #3B6882;color: White;"
        CType(gvd_Distribucion.Rows(2).FindControl("txt_Descripcion"), TextBox).Attributes("style") = "background-color: #3B6882;color: White;"
        CType(gvd_Distribucion.Rows(3).FindControl("txt_Descripcion"), TextBox).BackColor = Drawing.Color.LightGray

        CType(gvd_Distribucion.Rows(5).FindControl("txt_Descripcion"), TextBox).Attributes("style") = "background-color: #3B6882;color: White;"
        CType(gvd_Distribucion.Rows(6).FindControl("txt_Descripcion"), TextBox).Attributes("style") = "background-color: #3B6882;color: White;"
        CType(gvd_Distribucion.Rows(7).FindControl("txt_Descripcion"), TextBox).Attributes("style") = "background-color: #3B6882;color: White;"
        CType(gvd_Distribucion.Rows(8).FindControl("txt_Descripcion"), TextBox).Attributes("style") = "background-color: #3B6882;color: White;"
        CType(gvd_Distribucion.Rows(9).FindControl("txt_Descripcion"), TextBox).Attributes("style") = "background-color: #3B6882;color: White;"

        CType(gvd_Distribucion.Rows(0).FindControl("txt_PrcPart"), TextBox).Width = 130
        CType(gvd_Distribucion.Rows(1).FindControl("txt_PrcPart"), TextBox).Width = 130
        CType(gvd_Distribucion.Rows(2).FindControl("txt_PrcPart"), TextBox).Width = 130
        CType(gvd_Distribucion.Rows(3).FindControl("txt_PrcPart"), TextBox).Width = 130

        CType(gvd_Distribucion.Rows(0).FindControl("txt_PrcPartGMX"), TextBox).Attributes.Add("style", "display:none")
        CType(gvd_Distribucion.Rows(1).FindControl("txt_PrcPartGMX"), TextBox).Attributes.Add("style", "display:none")
        CType(gvd_Distribucion.Rows(2).FindControl("txt_PrcPartGMX"), TextBox).Attributes.Add("style", "display:none")
        CType(gvd_Distribucion.Rows(3).FindControl("txt_PrcPartGMX"), TextBox).Attributes.Add("style", "display:none")

        CType(gvd_Distribucion.Rows(4).FindControl("txt_PrcPart"), TextBox).Enabled = False
        CType(gvd_Distribucion.Rows(5).FindControl("txt_PrcPart"), TextBox).Enabled = False
        CType(gvd_Distribucion.Rows(6).FindControl("txt_PrcPart"), TextBox).Enabled = False
        CType(gvd_Distribucion.Rows(7).FindControl("txt_PrcPart"), TextBox).Enabled = False
        CType(gvd_Distribucion.Rows(8).FindControl("txt_PrcPart"), TextBox).Enabled = False
        CType(gvd_Distribucion.Rows(9).FindControl("txt_PrcPart"), TextBox).Enabled = False

        CType(gvd_Distribucion.Rows(4).FindControl("txt_PrcPartGMX"), TextBox).Enabled = False

        CType(gvd_Distribucion.Rows(4).FindControl("txt_PrcPart"), TextBox).Attributes("style") = "background-color: #3B6882;color: White;padding-right:10px;"
        CType(gvd_Distribucion.Rows(4).FindControl("txt_PrcPartGMX"), TextBox).Attributes("style") = "background-color: #3B6882;color: White;padding-right:15px;"

        CType(gvd_Distribucion.Rows(4).FindControl("txt_Descripcion"), TextBox).Attributes.Add("style", "display:none")
        CType(gvd_Distribucion.Rows(4).FindControl("txt_LimResp"), TextBox).Attributes.Add("style", "display:none")
        CType(gvd_Distribucion.Rows(4).FindControl("txt_PrimaNeta"), TextBox).Attributes.Add("style", "display:none")
        CType(gvd_Distribucion.Rows(4).FindControl("txt_PrimaINC"), TextBox).Attributes.Add("style", "display:none")
        CType(gvd_Distribucion.Rows(4).FindControl("txt_PrimaTEV"), TextBox).Attributes.Add("style", "display:none")
        CType(gvd_Distribucion.Rows(4).FindControl("txt_PrimaFHM"), TextBox).Attributes.Add("style", "display:none")

        CType(gvd_Distribucion.Rows(gvd_Distribucion.Rows.Count - 1).FindControl("txt_Descripcion"), TextBox).BackColor = Drawing.Color.LightGray

        CType(gvd_Distribucion.Rows(3).FindControl("txt_PrcPart"), TextBox).Enabled = False
        CType(gvd_Distribucion.Rows(3).FindControl("txt_Descripcion"), TextBox).Font.Bold = True
        CType(gvd_Distribucion.Rows(3).FindControl("txt_PrcPart"), TextBox).Font.Bold = True
        CType(gvd_Distribucion.Rows(3).FindControl("txt_LimResp"), TextBox).Font.Bold = True
        CType(gvd_Distribucion.Rows(3).FindControl("txt_PrimaNeta"), TextBox).Font.Bold = True
        CType(gvd_Distribucion.Rows(3).FindControl("txt_PrimaINC"), TextBox).Font.Bold = True
        CType(gvd_Distribucion.Rows(3).FindControl("txt_PrimaTEV"), TextBox).Font.Bold = True
        CType(gvd_Distribucion.Rows(3).FindControl("txt_PrimaFHM"), TextBox).Font.Bold = True

        CType(gvd_Distribucion.Rows(gvd_Distribucion.Rows.Count - 1).FindControl("txt_PrcPart"), TextBox).Enabled = False
        CType(gvd_Distribucion.Rows(gvd_Distribucion.Rows.Count - 1).FindControl("txt_PrcPartGMX"), TextBox).Enabled = False
        CType(gvd_Distribucion.Rows(gvd_Distribucion.Rows.Count - 1).FindControl("txt_Descripcion"), TextBox).Font.Bold = True
        CType(gvd_Distribucion.Rows(gvd_Distribucion.Rows.Count - 1).FindControl("txt_PrcPart"), TextBox).Font.Bold = True
        CType(gvd_Distribucion.Rows(gvd_Distribucion.Rows.Count - 1).FindControl("txt_PrcPartGMX"), TextBox).Font.Bold = True
        CType(gvd_Distribucion.Rows(gvd_Distribucion.Rows.Count - 1).FindControl("txt_LimResp"), TextBox).Font.Bold = True
        CType(gvd_Distribucion.Rows(gvd_Distribucion.Rows.Count - 1).FindControl("txt_PrimaNeta"), TextBox).Font.Bold = True
        CType(gvd_Distribucion.Rows(gvd_Distribucion.Rows.Count - 1).FindControl("txt_PrimaINC"), TextBox).Font.Bold = True
        CType(gvd_Distribucion.Rows(gvd_Distribucion.Rows.Count - 1).FindControl("txt_PrimaTEV"), TextBox).Font.Bold = True
        CType(gvd_Distribucion.Rows(gvd_Distribucion.Rows.Count - 1).FindControl("txt_PrimaFHM"), TextBox).Font.Bold = True

    End Sub

    Private Sub LlenaGridBroker(ByVal bln_Nuevo As Boolean, Optional ByVal Grupo As Integer = 0)

        If bln_Nuevo = True Then
            dtBroker = New DataTable
            dtBroker.Columns.Add("Grupo")
            dtBroker.Columns.Add("Consecutivo")
            dtBroker.Columns.Add("Clave")
            dtBroker.Columns.Add("Descripcion")
            dtBroker.Columns.Add("prc_part")
            dtBroker.Columns.Add("suma_asegurada")
            dtBroker.Columns.Add("prima_neta")
            dtBroker.Columns.Add("prc_com")
            dtBroker.Columns.Add("comision")
            dtBroker.Columns.Add("pnr")
            dtBroker.Columns.Add("prima_inc")
            dtBroker.Columns.Add("prc_com_inc")
            dtBroker.Columns.Add("com_inc")
            dtBroker.Columns.Add("pnr_inc")
            dtBroker.Columns.Add("prima_tev")
            dtBroker.Columns.Add("prc_com_tev")
            dtBroker.Columns.Add("com_tev")
            dtBroker.Columns.Add("pnr_tev")
            dtBroker.Columns.Add("prima_fhm")
            dtBroker.Columns.Add("prc_com_fhm")
            dtBroker.Columns.Add("com_fhm")
            dtBroker.Columns.Add("pnr_fhm")
            dtBroker.Columns.Add("prc_corretaje")
            dtBroker.Columns.Add("corretaje")
            dtBroker.Columns.Add("estatus")
            dtBroker.Columns.Add("observaciones")
        End If


        Dim qry = From c In dtBroker.AsEnumerable() Where c.Field(Of String)("Grupo") = Grupo Select c

        If qry.Count > 0 Then
            Funciones.LlenaGrid(gvd_Intermediario, qry.CopyToDataTable())
        Else
            Funciones.LlenaGrid(gvd_Intermediario, Nothing)
        End If

        For Each row In gvd_Intermediario.Rows
            If TryCast(row.FindControl("lnk_Clave"), LinkButton).Text = 0 Then
                TryCast(row.FindControl("txt_PrcCorretaje"), TextBox).Enabled = False
                TryCast(row.FindControl("txt_Corretaje"), TextBox).Enabled = False
            End If
        Next


    End Sub

    Private Sub LlenaGridReasegurador(ByVal bln_Nuevo As Boolean, Optional ByVal Grupo As Integer = 0, Optional ByVal Consecutivo As Integer = 0)

        If bln_Nuevo = True Then
            dtReasegurador = New DataTable
            dtReasegurador.Columns.Add("Grupo")
            dtReasegurador.Columns.Add("Consecutivo")
            dtReasegurador.Columns.Add("Clave")
            dtReasegurador.Columns.Add("Descripcion")
            dtReasegurador.Columns.Add("prc_part")
            dtReasegurador.Columns.Add("suma_asegurada")
            dtReasegurador.Columns.Add("prima_neta")
            dtReasegurador.Columns.Add("prc_com")
            dtReasegurador.Columns.Add("comision")
            dtReasegurador.Columns.Add("pnr")
            dtReasegurador.Columns.Add("prima_inc")
            dtReasegurador.Columns.Add("prc_com_inc")
            dtReasegurador.Columns.Add("com_inc")
            dtReasegurador.Columns.Add("pnr_inc")
            dtReasegurador.Columns.Add("prima_tev")
            dtReasegurador.Columns.Add("prc_com_tev")
            dtReasegurador.Columns.Add("com_tev")
            dtReasegurador.Columns.Add("pnr_tev")
            dtReasegurador.Columns.Add("prima_fhm")
            dtReasegurador.Columns.Add("prc_com_fhm")
            dtReasegurador.Columns.Add("com_fhm")
            dtReasegurador.Columns.Add("pnr_fhm")
            dtReasegurador.Columns.Add("estatus")
            dtReasegurador.Columns.Add("observaciones")
        End If

        Dim qry = From c In dtReasegurador.AsEnumerable() Where c.Field(Of String)("Grupo") = Grupo And c.Field(Of String)("Consecutivo") = Consecutivo Select c

        If qry.Count > 0 Then
            Funciones.LlenaGrid(gvd_Reasegurador, qry.CopyToDataTable())
        Else
            Funciones.LlenaGrid(gvd_Reasegurador, Nothing)
        End If
    End Sub

    Private Sub LlenaGridSubjetividad(ByVal bln_Nuevo As Boolean, ByVal Grupo As Integer, ByVal Consecutivo As Integer, Optional ByVal Clave As Integer = 0)

        If bln_Nuevo = True Then
            dtSubjetividad = New DataTable
            dtSubjetividad.Columns.Add("Grupo")
            dtSubjetividad.Columns.Add("Consecutivo")
            dtSubjetividad.Columns.Add("Clave")
            dtSubjetividad.Columns.Add("Num")
            dtSubjetividad.Columns.Add("Fecha")
            dtSubjetividad.Columns.Add("Subjetividad")
            dtSubjetividad.Columns.Add("sn_Subjetividad")
        End If

        Dim qry = From c In dtSubjetividad.AsEnumerable() Where c.Field(Of String)("Grupo") = Grupo And c.Field(Of String)("Consecutivo") = Consecutivo And c.Field(Of String)("Clave") = Clave Select c

        If qry.Count > 0 Then
            Funciones.LlenaGrid(gvd_Subjetividad, qry.CopyToDataTable())
        Else
            Funciones.LlenaGrid(gvd_Subjetividad, Nothing)
        End If
    End Sub

    Private Function ObtieneSeleccionados(ByRef gvd_Control As GridView, ByVal chk_Control As String, ByVal Clave As String) As String
        Dim strSel = "-1"
        For Each row In gvd_Control.Rows
            Dim chk_Sel As CheckBox = TryCast(row.FindControl(chk_Control), CheckBox)
            If chk_Sel.Checked = True Then
                strSel = strSel & "," & gvd_Control.DataKeys(row.RowIndex)(Clave)
            End If
        Next
        ObtieneSeleccionados = strSel
    End Function

    Private Sub btn_AgregaFila_Click(sender As Object, e As EventArgs) Handles btn_AgregaFila.Click
        Try
            Dim inciso As Integer = 1

            fn_ActualizaDataRiesgo()

            If dtRiesgo.Rows.Count > 0 Then
                inciso = gvd_Riesgo.DataKeys(gvd_Riesgo.Rows.Count - 1)("cod_inciso") + 1
            End If

            hid_SelCob.Value = ""
            For Each row In gvd_Cobertura.Rows
                Dim txt_SelCob As TextBox = TryCast(row.FindControl("txt_SelCob"), TextBox)

                If txt_SelCob.Text = "1" Then
                    Dim lbl_Clave As Label = TryCast(row.FindControl("lbl_Clave"), Label)
                    Dim lbl_Descripcion As Label = TryCast(row.FindControl("lbl_Descripcion"), Label)
                    hid_SelCob.Value = hid_SelCob.Value & "|" & lbl_Clave.Text & "~" & lbl_Descripcion.Text
                End If
            Next

            hid_SelRie.Value = ""
            If hid_SelCob.Value = "" Then
                For Each row In gvd_Seccion.Rows
                    Dim txt_SelRie As TextBox = TryCast(row.FindControl("txt_SelRie"), TextBox)
                    If txt_SelRie.Text = "1" Then
                        Dim lbl_Clave As Label = TryCast(row.FindControl("lbl_Clave"), Label)
                        Dim lbl_Descripcion As Label = TryCast(row.FindControl("lbl_Descripcion"), Label)
                        hid_SelRie.Value = hid_SelRie.Value & "|" & lbl_Clave.Text & "~" & lbl_Descripcion.Text
                    End If
                Next
            Else
                If CType(gvd_Seccion.Rows(hid_Seccion.Value).FindControl("txt_SelRie"), TextBox).Text = "1" Then
                    hid_SelRie.Value = hid_SelRie.Value & "|" & CType(gvd_Seccion.Rows(hid_Seccion.Value).FindControl("lbl_Clave"), Label).Text & "~" &
                                                                CType(gvd_Seccion.Rows(hid_Seccion.Value).FindControl("lbl_Descripcion"), Label).Text
                End If
            End If

            hid_SelRam.Value = ""
            If hid_SelRie.Value = "" Then
                For Each row In gvd_RamoSbr.Rows
                    Dim txt_SelRam As TextBox = TryCast(row.FindControl("txt_SelRam"), TextBox)
                    If txt_SelRam.Text = "1" Then
                        Dim lbl_ClaveRamo As Label = TryCast(row.FindControl("lbl_ClaveRamo"), Label)
                        Dim lbl_DescRamo As Label = TryCast(row.FindControl("lbl_DescRamo"), Label)
                        Dim lbl_ClaveSubramo As Label = TryCast(row.FindControl("lbl_ClaveSubramo"), Label)
                        Dim lbl_DescSubramo As Label = TryCast(row.FindControl("lbl_DescSubramo"), Label)

                        hid_SelRam.Value = hid_SelRam.Value & "|" & lbl_ClaveRamo.Text & "~" & lbl_DescRamo.Text & "~" & lbl_ClaveSubramo.Text & "~" & lbl_DescSubramo.Text
                    End If
                Next
            Else
                If CType(gvd_RamoSbr.Rows(hid_Ramo.Value).FindControl("txt_SelRam"), TextBox).Text = "1" Then
                    hid_SelRam.Value = hid_SelRam.Value & "|" & CType(gvd_RamoSbr.Rows(hid_Ramo.Value).FindControl("lbl_ClaveRamo"), Label).Text & "~" &
                                                                CType(gvd_RamoSbr.Rows(hid_Ramo.Value).FindControl("lbl_DescRamo"), Label).Text & "~" &
                                                                CType(gvd_RamoSbr.Rows(hid_Ramo.Value).FindControl("lbl_ClaveSubramo"), Label).Text & "~" &
                                                                CType(gvd_RamoSbr.Rows(hid_Ramo.Value).FindControl("lbl_DescSubramo"), Label).Text
                End If
            End If

            Dim Ramos() As String = Split(hid_SelRam.Value, "|")
            Dim Secciones() As String = Split(hid_SelRie.Value, "|")
            Dim Coberturas() As String = Split(hid_SelCob.Value, "|")

            If hid_SelRam.Value <> "" Then
                If UBound(Ramos) > 1 Then
                    For Each ramo In Ramos
                        If ramo <> "" Then
                            dtRiesgo.Rows.Add(inciso, Split(ramo, "~")(0), Split(ramo, "~")(1), Split(ramo, "~")(2), Split(ramo, "~")(3), "", "", "", "", 0, 0, "0.00", "0.00", "0.00", "0.00", "0.00", "0.00", "0.00", "0.00", "0.00", "0.00", "0.00", "0.00", "0.00", "0.00", "0.00")
                            inciso = inciso + 1
                        End If
                    Next
                Else
                    If hid_SelRie.Value <> "" Then
                        If UBound(Secciones) > 1 Then
                            For Each seccion In Secciones
                                If seccion <> "" Then
                                    dtRiesgo.Rows.Add(inciso, Split(Ramos(1), "~")(0), Split(Ramos(1), "~")(1), Split(Ramos(1), "~")(2), Split(Ramos(1), "~")(3), Split(seccion, "~")(0), Split(seccion, "~")(1), "", "", 0, 0, "0.00", "0.00", "0.00", "0.00", "0.00", "0.00", "0.00", "0.00", "0.00", "0.00", "0.00", "0.00", "0.00", "0.00", "0.00")
                                    inciso = inciso + 1
                                End If
                            Next
                        Else
                            For Each cobertura In Coberturas
                                If cobertura <> "" Then
                                    dtRiesgo.Rows.Add(inciso, Split(Ramos(1), "~")(0), Split(Ramos(1), "~")(1), Split(Ramos(1), "~")(2), Split(Ramos(1), "~")(3), Split(Secciones(1), "~")(0), Split(Secciones(1), "~")(1), Split(cobertura, "~")(0), Split(cobertura, "~")(1), 0, 0, "0.00", "0.00", "0.00", "0.00", "0.00", "0.00", "0.00", "0.00", "0.00", "0.00", "0.00", "0.00", "0.00", "0.00", "0.00")
                                    inciso = inciso + 1
                                End If
                            Next
                        End If
                    End If
                End If
            End If

            LlenaGridRiesgo(False)
        Catch ex As Exception
            Mensaje.MuestraMensaje("Mesa de Control", ex.Message, TipoMsg.Falla)
        End Try
    End Sub


    Private Sub btn_RemoveRiesgo_Click(sender As Object, e As EventArgs) Handles btn_RemoveRiesgo.Click
        Try

            fn_ActualizaDataRiesgo()

            Dim strSel As String = ObtieneSeleccionados(gvd_Riesgo, "chk_Riesgo", "cod_inciso")

            Dim myRow() As Data.DataRow
            myRow = dtRiesgo.Select("cod_inciso IN (" & strSel & ")")

            For Each item In myRow
                item.Delete()
            Next
            dtRiesgo.AcceptChanges()

            LlenaGridRiesgo(False)

        Catch ex As Exception
            Mensaje.MuestraMensaje("Mesa de Control", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Private Sub btn_RemoveGrupo_Click(sender As Object, e As EventArgs) Handles btn_RemoveGrupo.Click
        Try
            fn_ActualizaDataGrupo()

            Dim myRow() As Data.DataRow
            myRow = dtAgrupacion.Select("Clave IN (" & ObtieneSeleccionados(gvd_Agrupacion, "chk_Sel", "Clave") & ")")

            For Each item In myRow
                Quita_Distribucion(item("Clave"))
                Quita_Intermediario(item("Clave"), vbNullString)
                item.Delete()
            Next
            dtAgrupacion.AcceptChanges()

            LlenaGridAgrupacion(False)

            If gvd_Agrupacion.Rows.Count > 0 Then
                hid_IndiceGrupo.Value = 0
                SeleccionaAgrupacion(hid_IndiceGrupo.Value, gvd_Agrupacion.Rows.Count - 1)
                Funciones.EjecutaFuncion("fn_CerrarModalSimple('#Subjetividad');", "Subjetividad")
                Funciones.EjecutaFuncion("fn_CerrarModalSimple('#Comisiones')", "Comisiones")
            Else
                hid_IndiceGrupo.Value = -1

                'Llena Información de Distribución
                LlenaGridDistribucion(False, 0)

                'Llena Información de Broker
                LlenaGridBroker(False, 0)

                'Llena Información de Broker
                LlenaGridReasegurador(False, 0)

                'Llena Información de Broker
                LlenaGridSubjetividad(False, 0, 0)
            End If

        Catch ex As Exception
            Mensaje.MuestraMensaje("Mesa de Control", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Private Sub Quita_Distribucion(ByVal Grupo As Integer)
        Dim myRow() As Data.DataRow
        myRow = dtDistribucion.Select("Grupo = " & Grupo)

        For Each item In myRow
            item.Delete()
        Next
        dtDistribucion.AcceptChanges()
    End Sub

    Private Sub Quita_Intermediario(ByVal Grupo As Integer, ByVal Consecutivos As String)
        Dim myRow() As Data.DataRow
        Dim strConsulta As String = vbNullString

        If Len(Consecutivos) > 0 Then
            strConsulta = " AND Consecutivo IN (" & Consecutivos & ")"
        End If

        myRow = dtBroker.Select("Grupo = " & Grupo & strConsulta)

        For Each item In myRow
            item.Delete()
        Next
        dtBroker.AcceptChanges()

        Quita_Reasegurador(Grupo, Consecutivos, vbNullString)
        Quita_Subjetividad(Grupo, Consecutivos, vbNullString)

    End Sub

    Private Sub Quita_Reasegurador(ByVal Grupo As Integer, ByVal Consecutivos As String, ByVal Reaseguradores As String)
        Dim myRow() As Data.DataRow
        Dim strConsulta As String = vbNullString

        If Len(Consecutivos) > 0 Then
            strConsulta = " AND Consecutivo IN (" & Consecutivos & ")"
        End If

        If Len(Reaseguradores) > 0 Then
            strConsulta = strConsulta & " AND Clave IN (" & Reaseguradores & ")"
        End If

        myRow = dtReasegurador.Select("Grupo = " & Grupo & strConsulta)

        For Each item In myRow
            item.Delete()
        Next
        dtReasegurador.AcceptChanges()

        Quita_Subjetividad(Grupo, Consecutivos, vbNullString)

    End Sub

    Private Sub Quita_Subjetividad(ByVal Grupo As Integer, ByVal Consecutivos As String, ByVal Claves As String)
        Dim myRow() As Data.DataRow
        Dim strConsulta As String = vbNullString

        If Len(Consecutivos) > 0 Then
            strConsulta = " AND Consecutivo IN (" & Consecutivos & ")"
        End If

        If Len(Claves) > 0 Then
            strConsulta = strConsulta & " AND Clave IN (" & Claves & ")"
        End If

        myRow = dtSubjetividad.Select("Grupo = " & Grupo & strConsulta)

        For Each item In myRow
            item.Delete()
        Next
        dtSubjetividad.AcceptChanges()
    End Sub

    Private Function fn_ActualizaDataRiesgo() As DataTable

        For Each row In gvd_Riesgo.Rows
            Dim txt_ClaveRamo As TextBox = TryCast(row.FindControl("txt_ClaveRamo"), TextBox)
            Dim txt_SearchRamo As TextBox = TryCast(row.FindControl("txt_SearchRamo"), TextBox)
            Dim txt_ClaveSubramo As TextBox = TryCast(row.FindControl("txt_ClaveSubramo"), TextBox)
            Dim txt_SearchSubramo As TextBox = TryCast(row.FindControl("txt_SearchSubramo"), TextBox)
            Dim txt_ClaveSeccion As TextBox = TryCast(row.FindControl("txt_ClaveSeccion"), TextBox)
            Dim txt_SearchSeccion As TextBox = TryCast(row.FindControl("txt_SearchSeccion"), TextBox)
            Dim txt_ClaveCobertura As TextBox = TryCast(row.FindControl("txt_ClaveCobertura"), TextBox)
            Dim txt_SearchCobertura As TextBox = TryCast(row.FindControl("txt_SearchCobertura"), TextBox)
            Dim opt_Facultativo As RadioButtonList = TryCast(row.FindControl("opt_Facultativo"), RadioButtonList)
            Dim opt_Adicional As RadioButtonList = TryCast(row.FindControl("opt_Adicional"), RadioButtonList)

            Dim txt_ValoresTotales As TextBox = TryCast(row.FindControl("txt_ValoresTotalesAux"), TextBox)
            Dim txt_LimResp As TextBox = TryCast(row.FindControl("txt_LimRespAux"), TextBox)
            Dim txt_PrimaNeta As TextBox = TryCast(row.FindControl("txt_PrimaNetaAux"), TextBox)

            Dim txt_PrimaINC As TextBox = TryCast(row.FindControl("txt_PrimaINCAux"), TextBox)
            Dim txt_PrimaTEV As TextBox = TryCast(row.FindControl("txt_PrimaTEVAux"), TextBox)
            Dim txt_PrimaFHM As TextBox = TryCast(row.FindControl("txt_PrimaFHMAux"), TextBox)
            Dim txt_PrcComAge As TextBox = TryCast(row.FindControl("txt_PrcComAge"), TextBox)
            Dim txt_ComAge As TextBox = TryCast(row.FindControl("txt_ComAgeAux"), TextBox)
            Dim txt_PrcComAdiAge As TextBox = TryCast(row.FindControl("txt_PrcComAdiAge"), TextBox)
            Dim txt_ComAdiAge As TextBox = TryCast(row.FindControl("txt_ComAdiAgeAux"), TextBox)
            Dim txt_Cuota As TextBox = TryCast(row.FindControl("txt_Cuota"), TextBox)

            Dim txt_PrcFeeGmx As TextBox = TryCast(row.FindControl("txt_PrcFeeGmx"), TextBox)
            Dim txt_FeeGmx As TextBox = TryCast(row.FindControl("txt_FeeGmxAux"), TextBox)
            Dim txt_PrcComFac As TextBox = TryCast(row.FindControl("txt_PrcComFac"), TextBox)
            Dim txt_ComFac As TextBox = TryCast(row.FindControl("txt_ComFacAux"), TextBox)

            Dim myRow() As Data.DataRow
            myRow = dtRiesgo.Select("cod_inciso ='" & gvd_Riesgo.DataKeys(row.RowIndex)("cod_inciso") & "'")

            If myRow.Length > 0 Then
                myRow(0)("cod_ramo") = txt_ClaveRamo.Text
                myRow(0)("ramo_desc") = txt_SearchRamo.Text
                myRow(0)("cod_subramo") = txt_ClaveSubramo.Text
                myRow(0)("subramo_desc") = txt_SearchSubramo.Text
                myRow(0)("cod_riesgo") = txt_ClaveSeccion.Text
                myRow(0)("riesgo_desc") = txt_SearchSeccion.Text
                myRow(0)("cod_ind_cob") = txt_ClaveCobertura.Text
                myRow(0)("cobertura_desc") = txt_SearchCobertura.Text
                myRow(0)("sn_facultativo") = opt_Facultativo.SelectedValue
                myRow(0)("sn_adicional") = opt_Adicional.SelectedValue
                myRow(0)("valores_totales") = txt_ValoresTotales.Text
                myRow(0)("suma_asegurada") = txt_LimResp.Text
                myRow(0)("prima_neta") = txt_PrimaNeta.Text
                myRow(0)("prima_inc") = txt_PrimaINC.Text
                myRow(0)("prima_tev") = txt_PrimaTEV.Text
                myRow(0)("prima_fhm") = txt_PrimaFHM.Text
                myRow(0)("prc_com_age") = txt_PrcComAge.Text
                myRow(0)("com_agente") = txt_ComAge.Text
                myRow(0)("prc_com_adi_age") = txt_PrcComAdiAge.Text
                myRow(0)("com_adi_agente") = txt_ComAdiAge.Text
                myRow(0)("cuota") = txt_Cuota.Text
                myRow(0)("prc_FeeGMX") = txt_PrcFeeGmx.Text
                myRow(0)("mnt_FeeGMX") = txt_FeeGmx.Text
                myRow(0)("prc_ComFac") = txt_PrcComFac.Text
                myRow(0)("mnt_ComFac") = txt_ComFac.Text
            End If
        Next
        Return dtRiesgo
    End Function

    Private Function fn_ActualizaDataGrupo() As DataTable

        For Each row In gvd_Agrupacion.Rows
            Dim txt_Incisos As TextBox = TryCast(row.FindControl("txt_Incisos"), TextBox)
            Dim txt_LimResp As TextBox = TryCast(row.FindControl("txt_LimRespAux"), TextBox)
            Dim txt_PrimaNeta As TextBox = TryCast(row.FindControl("txt_PrimaNetaAux"), TextBox)
            Dim txt_PrimaTEV As TextBox = TryCast(row.FindControl("txt_PrimaTEVAux"), TextBox)
            Dim txt_PrimaFHM As TextBox = TryCast(row.FindControl("txt_PrimaFHMAux"), TextBox)

            Dim myRow() As Data.DataRow
            myRow = dtAgrupacion.Select("Clave ='" & gvd_Agrupacion.DataKeys(row.RowIndex)("Clave") & "'")

            If myRow.Length > 0 Then
                myRow(0)("incisos") = txt_Incisos.Text
                myRow(0)("suma_asegurada") = txt_LimResp.Text
                myRow(0)("prima_neta") = txt_PrimaNeta.Text
                myRow(0)("prima_tev") = txt_PrimaTEV.Text
                myRow(0)("prima_fhm") = txt_PrimaFHM.Text
            End If
        Next

        Return dtAgrupacion
    End Function

    Private Function fn_ActualizaDataDistribucion(ByVal Grupo As Integer) As DataTable
        Dim myRow() As Data.DataRow

        For Each row In gvd_Distribucion.Rows
            Dim txt_PrcPart As TextBox = TryCast(row.FindControl("txt_PrcPart"), TextBox)
            Dim txt_LimResp As TextBox = TryCast(row.FindControl("txt_LimRespAux"), TextBox)
            Dim txt_PrimaNeta As TextBox = TryCast(row.FindControl("txt_PrimaNetaAux"), TextBox)
            Dim txt_PrimaTEV As TextBox = TryCast(row.FindControl("txt_PrimaTEVAux"), TextBox)
            Dim txt_PrimaFHM As TextBox = TryCast(row.FindControl("txt_PrimaFHMAux"), TextBox)

            myRow = dtDistribucion.Select("Grupo ='" & Grupo & "' AND Clave = '" & gvd_Distribucion.DataKeys(row.RowIndex)("Clave") & "'")

            If myRow.Length > 0 Then
                myRow(0)("prc_part") = txt_PrcPart.Text
                myRow(0)("suma_asegurada") = txt_LimResp.Text
                myRow(0)("prima_neta") = txt_PrimaNeta.Text
                myRow(0)("prima_tev") = txt_PrimaTEV.Text
                myRow(0)("prima_fhm") = txt_PrimaFHM.Text
            End If
        Next

        Return dtDistribucion
    End Function

    Private Function fn_ActualizaDataBroker(ByVal Grupo As Integer) As DataTable
        Dim myRow() As Data.DataRow

        For Each row In gvd_Intermediario.Rows
            Dim txt_PrcPart As TextBox = TryCast(row.FindControl("txt_PrcPart"), TextBox)
            Dim txt_LimResp As TextBox = TryCast(row.FindControl("txt_LimRespAux"), TextBox)

            Dim txt_PrimaNeta As TextBox = TryCast(row.FindControl("txt_PrimaNetaAux"), TextBox)
            Dim txt_PrcComNeta As TextBox = TryCast(row.FindControl("txt_PrcComNeta"), TextBox)
            Dim txt_ComNeta As TextBox = TryCast(row.FindControl("txt_ComNeta"), TextBox)
            Dim txt_PnrNeta As TextBox = TryCast(row.FindControl("txt_PnrNeta"), TextBox)

            Dim txt_PrimaINC As TextBox = TryCast(row.FindControl("txt_PrimaINCAux"), TextBox)
            Dim txt_PrcComINC As TextBox = TryCast(row.FindControl("txt_PrcComINC"), TextBox)
            Dim txt_ComINC As TextBox = TryCast(row.FindControl("txt_ComINC"), TextBox)
            Dim txt_PnrINC As TextBox = TryCast(row.FindControl("txt_PnrINC"), TextBox)

            Dim txt_PrimaTEV As TextBox = TryCast(row.FindControl("txt_PrimaTEVAux"), TextBox)
            Dim txt_PrcComTEV As TextBox = TryCast(row.FindControl("txt_PrcComTEV"), TextBox)
            Dim txt_ComTEV As TextBox = TryCast(row.FindControl("txt_ComTEV"), TextBox)
            Dim txt_PnrTEV As TextBox = TryCast(row.FindControl("txt_PnrTEV"), TextBox)

            Dim txt_PrimaFHM As TextBox = TryCast(row.FindControl("txt_PrimaFHMAux"), TextBox)
            Dim txt_PrcComFHM As TextBox = TryCast(row.FindControl("txt_PrcComFHM"), TextBox)
            Dim txt_ComFHM As TextBox = TryCast(row.FindControl("txt_ComFHM"), TextBox)
            Dim txt_PnrFHM As TextBox = TryCast(row.FindControl("txt_PnrFHM"), TextBox)

            Dim txt_PrcCorretaje As TextBox = TryCast(row.FindControl("txt_PrcCorretaje"), TextBox)
            Dim txt_Corretaje As TextBox = TryCast(row.FindControl("txt_CorretajeAux"), TextBox)

            Dim ddl_Estatus As DropDownList = TryCast(row.FindControl("ddl_Estatus"), DropDownList)
            Dim txt_Observaciones As TextBox = TryCast(row.FindControl("txt_Observaciones"), TextBox)

            myRow = dtBroker.Select("Grupo ='" & Grupo & "' AND Consecutivo = '" & gvd_Intermediario.DataKeys(row.RowIndex)("Consecutivo") & "'")

            If myRow.Length > 0 Then
                myRow(0)("prc_part") = txt_PrcPart.Text
                myRow(0)("suma_asegurada") = txt_LimResp.Text
                myRow(0)("prima_neta") = txt_PrimaNeta.Text
                myRow(0)("prc_com") = txt_PrcComNeta.Text
                myRow(0)("comision") = txt_ComNeta.Text
                myRow(0)("pnr") = txt_PnrNeta.Text
                myRow(0)("prima_inc") = txt_PrimaINC.Text
                myRow(0)("prc_com_inc") = txt_PrcComINC.Text
                myRow(0)("com_inc") = txt_ComINC.Text
                myRow(0)("pnr_inc") = txt_PnrINC.Text
                myRow(0)("prima_tev") = txt_PrimaTEV.Text
                myRow(0)("prc_com_tev") = txt_PrcComTEV.Text
                myRow(0)("com_tev") = txt_ComTEV.Text
                myRow(0)("pnr_tev") = txt_PnrTEV.Text
                myRow(0)("prima_fhm") = txt_PrimaFHM.Text
                myRow(0)("prc_com_fhm") = txt_PrcComFHM.Text
                myRow(0)("com_fhm") = txt_ComFHM.Text
                myRow(0)("pnr_fhm") = txt_PnrFHM.Text
                myRow(0)("prc_corretaje") = txt_PrcCorretaje.Text
                myRow(0)("corretaje") = txt_Corretaje.Text
                myRow(0)("estatus") = ddl_Estatus.SelectedValue
                myRow(0)("observaciones") = txt_Observaciones.Text
            End If
        Next

        Return dtBroker
    End Function

    Private Function fn_ActualizaDataReasegurador(ByVal Grupo As Integer, ByVal Consecutivo As Integer) As DataTable
        Dim myRow() As Data.DataRow

        For Each row In gvd_Reasegurador.Rows
            Dim txt_PrcPart As TextBox = TryCast(row.FindControl("txt_PrcPart"), TextBox)
            Dim txt_LimResp As TextBox = TryCast(row.FindControl("txt_LimRespAux"), TextBox)

            Dim txt_PrimaNeta As TextBox = TryCast(row.FindControl("txt_PrimaNetaAux"), TextBox)
            Dim txt_PrcComNeta As TextBox = TryCast(row.FindControl("txt_PrcComNeta"), TextBox)
            Dim txt_ComNeta As TextBox = TryCast(row.FindControl("txt_ComNeta"), TextBox)
            Dim txt_PnrNeta As TextBox = TryCast(row.FindControl("txt_PnrNeta"), TextBox)

            Dim txt_PrimaINC As TextBox = TryCast(row.FindControl("txt_PrimaINCAux"), TextBox)
            Dim txt_PrcComINC As TextBox = TryCast(row.FindControl("txt_PrcComINC"), TextBox)
            Dim txt_ComINC As TextBox = TryCast(row.FindControl("txt_ComINC"), TextBox)
            Dim txt_PnrINC As TextBox = TryCast(row.FindControl("txt_PnrINC"), TextBox)

            Dim txt_PrimaTEV As TextBox = TryCast(row.FindControl("txt_PrimaTEVAux"), TextBox)
            Dim txt_PrcComTEV As TextBox = TryCast(row.FindControl("txt_PrcComTEV"), TextBox)
            Dim txt_ComTEV As TextBox = TryCast(row.FindControl("txt_ComTEV"), TextBox)
            Dim txt_PnrTEV As TextBox = TryCast(row.FindControl("txt_PnrTEV"), TextBox)

            Dim txt_PrimaFHM As TextBox = TryCast(row.FindControl("txt_PrimaFHMAux"), TextBox)
            Dim txt_PrcComFHM As TextBox = TryCast(row.FindControl("txt_PrcComFHM"), TextBox)
            Dim txt_ComFHM As TextBox = TryCast(row.FindControl("txt_ComFHM"), TextBox)
            Dim txt_PnrFHM As TextBox = TryCast(row.FindControl("txt_PnrFHM"), TextBox)

            Dim ddl_Estatus As DropDownList = TryCast(row.FindControl("ddl_Estatus"), DropDownList)
            Dim txt_Observaciones As TextBox = TryCast(row.FindControl("txt_Observaciones"), TextBox)

            myRow = dtReasegurador.Select("Grupo ='" & Grupo & "' AND Consecutivo = '" & Consecutivo & "' AND Clave = '" & gvd_Reasegurador.DataKeys(row.RowIndex)("Clave") & "'")

            If myRow.Length > 0 Then
                myRow(0)("prc_part") = txt_PrcPart.Text
                myRow(0)("suma_asegurada") = txt_LimResp.Text
                myRow(0)("prima_neta") = txt_PrimaNeta.Text
                myRow(0)("prc_com") = txt_PrcComNeta.Text
                myRow(0)("comision") = txt_ComNeta.Text
                myRow(0)("pnr") = txt_PnrNeta.Text
                myRow(0)("prima_inc") = txt_PrimaINC.Text
                myRow(0)("prc_com_inc") = txt_PrcComINC.Text
                myRow(0)("com_inc") = txt_ComINC.Text
                myRow(0)("pnr_inc") = txt_PnrINC.Text
                myRow(0)("prima_tev") = txt_PrimaTEV.Text
                myRow(0)("prc_com_tev") = txt_PrcComTEV.Text
                myRow(0)("com_tev") = txt_ComTEV.Text
                myRow(0)("pnr_tev") = txt_PnrTEV.Text
                myRow(0)("prima_fhm") = txt_PrimaFHM.Text
                myRow(0)("prc_com_fhm") = txt_PrcComFHM.Text
                myRow(0)("com_fhm") = txt_ComFHM.Text
                myRow(0)("pnr_fhm") = txt_PnrFHM.Text
                myRow(0)("estatus") = ddl_Estatus.SelectedValue
                myRow(0)("observaciones") = txt_Observaciones.Text
            End If
        Next

        Return dtReasegurador
    End Function

    Private Function fn_ActualizaDataSubjetividad(ByVal Grupo As Integer, ByVal Consecutivo As Integer, ByVal Clave As Integer) As DataTable
        Dim myRow() As Data.DataRow

        For Each row In gvd_Subjetividad.Rows
            Dim txt_Fecha As TextBox = TryCast(row.FindControl("txt_Fecha"), TextBox)
            Dim txt_Subjetividad As TextBox = TryCast(row.FindControl("txt_Subjetividad"), TextBox)
            Dim chk_Subjetividad As CheckBox = TryCast(row.FindControl("chk_Subjetividad"), CheckBox)

            myRow = dtSubjetividad.Select("Grupo ='" & Grupo & "' AND Consecutivo = '" & Consecutivo & "' AND Clave = '" & Clave & "' AND Num = '" & gvd_Subjetividad.DataKeys(row.RowIndex)("Num") & "'")

            If myRow.Length > 0 Then
                myRow(0)("Fecha") = txt_Fecha.Text
                myRow(0)("Subjetividad") = txt_Subjetividad.Text
                myRow(0)("sn_Subjetividad") = chk_Subjetividad.Checked
            End If
        Next

        Return dtSubjetividad
    End Function

    Private Sub Muestra_Notas(sender As Object, e As GridViewCommandEventArgs)
        Try
            If e.CommandName = "Notas" Then
                hid_IndexNota.Value = e.CommandSource.NamingContainer.RowIndex

                Dim txt_Nota As TextBox = CType(Master.mgv_Tablero.Rows(hid_IndexNota.Value).FindControl("txt_Nota"), TextBox)
                Dim lbl_Estatus As Label = CType(Master.mgv_Tablero.Rows(hid_IndexNota.Value).FindControl("lbl_Estatus"), Label)

                lbl_Proceso.Text = ">> " & lbl_Estatus.Text & " (" & IIf(hid_IndexNota.Value <= 5, "Proyecto", "En Firme") & ")"
                txt_NotaProceso.Text = txt_Nota.Text

                Funciones.EjecutaFuncion("fn_AbrirModalSimple('#Notas')")
            End If
        Catch ex As Exception
            Mensaje.MuestraMensaje("Mesa de Control", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Private Sub btn_AplicaNota_Click(sender As Object, e As EventArgs) Handles btn_AplicaNota.Click
        Try
            Dim txt_Nota As TextBox = CType(Master.mgv_Tablero.Rows(hid_IndexNota.Value).FindControl("txt_Nota"), TextBox)

            txt_Nota.Text = txt_NotaProceso.Text

        Catch ex As Exception
            Mensaje.MuestraMensaje("Mesa de Control", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Private Sub gvd_Riesgo_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles gvd_Riesgo.RowDataBound
        Try


            If e.Row.RowType = DataControlRowType.DataRow Then
                Dim Tamaño() As String = Split(hid_Tamaño.Value, "|")

                TryCast(e.Row.FindControl("opt_Facultativo"), RadioButtonList).SelectedValue = sender.DataKeys(e.Row.RowIndex)("sn_facultativo")
                TryCast(e.Row.FindControl("opt_Adicional"), RadioButtonList).SelectedValue = sender.DataKeys(e.Row.RowIndex)("sn_adicional")

                TryCast(e.Row.FindControl("txt_SearchRamo"), TextBox).Width = Tamaño(0)
                TryCast(e.Row.FindControl("txt_SearchSubramo"), TextBox).Width = Tamaño(1)
                TryCast(e.Row.FindControl("txt_SearchSeccion"), TextBox).Width = Tamaño(2)
                TryCast(e.Row.FindControl("txt_SearchCobertura"), TextBox).Width = Tamaño(3)

            ElseIf e.Row.RowType = DataControlRowType.Header Then
                Dim Ajustes() As String = Split(hid_Ajuste.Value, "|")

                If Ajustes(0) = "0" Then
                    TryCast(e.Row.FindControl("btn_SearchRamo"), ImageButton).ImageUrl = "~/Images/quitar_mini.png"
                    TryCast(e.Row.FindControl("lbl_SearchRamo"), Label).Text = Replace(TryCast(e.Row.FindControl("lbl_SearchRamo"), Label).ID, "lbl_Search", "")
                    TryCast(e.Row.FindControl("lbl_SearchRamo"), Label).Width = 60
                Else
                    TryCast(e.Row.FindControl("btn_SearchRamo"), ImageButton).ImageUrl = "~/Images/mas_mini.png"
                    TryCast(e.Row.FindControl("lbl_SearchRamo"), Label).Text = ". . ."
                    TryCast(e.Row.FindControl("lbl_SearchRamo"), Label).Width = 10
                End If

                If Ajustes(1) = "0" Then
                    TryCast(e.Row.FindControl("btn_SearchSubramo"), ImageButton).ImageUrl = "~/Images/quitar_mini.png"
                    TryCast(e.Row.FindControl("lbl_SearchSubramo"), Label).Text = Replace(TryCast(e.Row.FindControl("lbl_SearchSubramo"), Label).ID, "lbl_Search", "")
                    TryCast(e.Row.FindControl("lbl_SearchSubramo"), Label).Width = 60
                Else
                    TryCast(e.Row.FindControl("btn_SearchSubramo"), ImageButton).ImageUrl = "~/Images/mas_mini.png"
                    TryCast(e.Row.FindControl("lbl_SearchSubramo"), Label).Text = ". . ."
                    TryCast(e.Row.FindControl("lbl_SearchSubramo"), Label).Width = 10
                End If

                If Ajustes(2) = "0" Then
                    TryCast(e.Row.FindControl("btn_SearchSeccion"), ImageButton).ImageUrl = "~/Images/quitar_mini.png"
                    TryCast(e.Row.FindControl("lbl_SearchSeccion"), Label).Text = Replace(TryCast(e.Row.FindControl("lbl_SearchSeccion"), Label).ID, "lbl_Search", "")
                    TryCast(e.Row.FindControl("lbl_SearchSeccion"), Label).Width = 60
                Else
                    TryCast(e.Row.FindControl("btn_SearchSeccion"), ImageButton).ImageUrl = "~/Images/mas_mini.png"
                    TryCast(e.Row.FindControl("lbl_SearchSeccion"), Label).Text = ". . ."
                    TryCast(e.Row.FindControl("lbl_SearchSeccion"), Label).Width = 10
                End If

                If Ajustes(3) = "0" Then
                    TryCast(e.Row.FindControl("btn_SearchCobertura"), ImageButton).ImageUrl = "~/Images/quitar_mini.png"
                    TryCast(e.Row.FindControl("lbl_SearchCobertura"), Label).Text = Replace(TryCast(e.Row.FindControl("lbl_SearchCobertura"), Label).ID, "lbl_Search", "")
                    TryCast(e.Row.FindControl("lbl_SearchCobertura"), Label).Width = 60
                Else
                    TryCast(e.Row.FindControl("btn_SearchCobertura"), ImageButton).ImageUrl = "~/Images/mas_mini.png"
                    TryCast(e.Row.FindControl("lbl_SearchCobertura"), Label).Text = ". . ."
                    TryCast(e.Row.FindControl("lbl_SearchCobertura"), Label).Width = 10
                End If

            End If
        Catch ex As Exception
            Mensaje.MuestraMensaje("Mesa de Control", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Private Sub gvd_RamoSbr_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles gvd_RamoSbr.RowCommand
        Try
            If e.CommandName = "Seccion" Then
                hid_Ramo.Value = e.CommandSource.NamingContainer.RowIndex
                hid_Seccion.Value = 0

                Dim lbl_ClaveRamo As Label = CType(gvd_RamoSbr.Rows(hid_Ramo.Value).FindControl("lbl_ClaveRamo"), Label)
                Dim lbl_ClaveSubramo As Label = CType(gvd_RamoSbr.Rows(hid_Ramo.Value).FindControl("lbl_ClaveSubramo"), Label)

                For i = 0 To gvd_RamoSbr.Rows.Count - 1
                    CType(gvd_RamoSbr.Rows(i).FindControl("btn_Detalle"), ImageButton).ImageUrl = "~/Images/blue_arrow_mini.png"
                Next
                CType(gvd_RamoSbr.Rows(hid_Ramo.Value).FindControl("btn_Detalle"), ImageButton).ImageUrl = "~/Images/red_arrow_mini.png"

                Funciones.LlenaCatGrid(gvd_Seccion, "Rie", "", " AND cod_ramo = " & lbl_ClaveRamo.Text)

                CType(gvd_Seccion.Rows(hid_Seccion.Value).FindControl("txt_SelRie"), TextBox).Text = "1"
                CType(gvd_Seccion.Rows(hid_Seccion.Value).FindControl("btn_Detalle"), ImageButton).ImageUrl = "~/Images/red_arrow_mini.png"
                CType(gvd_Seccion.Rows(hid_Seccion.Value).FindControl("div_Seccion"), HtmlGenericControl).Attributes.Add("style", "background-color: lightgreen;")
                CType(gvd_Seccion.Rows(hid_Seccion.Value).FindControl("div_Cobertura"), HtmlGenericControl).Attributes.Add("style", "display: block")

                Funciones.LlenaCatGrid(gvd_Cobertura, "Cob", "", " AND cod_ramo = " & lbl_ClaveRamo.Text & " AND cod_subramo = " & lbl_ClaveSubramo.Text)
            End If
        Catch ex As Exception
            Mensaje.MuestraMensaje("Mesa de Control", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Private Sub gvd_Seccion_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles gvd_Seccion.RowCommand
        Try
            If e.CommandName = "Cobertura" Then
                hid_Seccion.Value = e.CommandSource.NamingContainer.RowIndex

                Dim lbl_ClaveRamo As Label = CType(gvd_RamoSbr.Rows(hid_Ramo.Value).FindControl("lbl_ClaveRamo"), Label)
                Dim lbl_ClaveSubramo As Label = CType(gvd_RamoSbr.Rows(hid_Ramo.Value).FindControl("lbl_ClaveSubramo"), Label)

                For i = 0 To gvd_Seccion.Rows.Count - 1
                    CType(gvd_Seccion.Rows(i).FindControl("btn_Detalle"), ImageButton).ImageUrl = "~/Images/blue_arrow_mini.png"
                Next
                CType(gvd_Seccion.Rows(hid_Seccion.Value).FindControl("btn_Detalle"), ImageButton).ImageUrl = "~/Images/red_arrow_mini.png"

                Funciones.LlenaCatGrid(gvd_Cobertura, "Cob", "", " AND cod_ramo = " & lbl_ClaveRamo.Text & " AND cod_subramo = " & lbl_ClaveSubramo.Text)
            End If
        Catch ex As Exception
            Mensaje.MuestraMensaje("Mesa de Control", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Protected Sub AjusteTamaño(sender As Object, e As ImageClickEventArgs)
        Try
            Dim estado As Integer
            Dim pixeles As Integer
            Dim Tamaño() As String = Split(hid_Tamaño.Value, "|")
            Dim Ajuste() As String = Split(hid_Ajuste.Value, "|")

            Dim lbl_Search = TryCast(gvd_Riesgo.HeaderRow.FindControl(Replace(sender.ID, "btn", "lbl")), Label)

            If Ajuste(sender.AlternateText) = "0" Then
                estado = 1
                pixeles = 50
                lbl_Search.Width = 10
                lbl_Search.Text = ". . ."
                sender.ImageUrl = "~/Images/mas_mini.png"
            Else
                estado = 0
                pixeles = 200
                lbl_Search.Width = 60
                lbl_Search.Text = Replace(lbl_Search.ID, "lbl_Search", "")
                sender.ImageUrl = "~/Images/quitar_mini.png"
            End If

            Ajuste(sender.AlternateText) = estado
            Tamaño(sender.AlternateText) = pixeles

            hid_Tamaño.Value = Tamaño(0) & "|" & Tamaño(1) & "|" & Tamaño(2) & "|" & Tamaño(3)
            hid_Ajuste.Value = Ajuste(0) & "|" & Ajuste(1) & "|" & Ajuste(2) & "|" & Ajuste(3)

            For Each row In gvd_Riesgo.Rows
                TryCast(row.FindControl(Replace(sender.ID, "btn", "txt")), TextBox).Width = pixeles
            Next
        Catch ex As Exception
            Mensaje.MuestraMensaje("Mesa de Control", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Private Sub btn_AgrupaRiesgo_Click(sender As Object, e As EventArgs) Handles btn_AgrupaRiesgo.Click
        Try
            Dim grupo As Integer = 1
            Dim strRiesgos = "-1"
            Dim suma_asegurada, prima_neta, prima_inc, prima_tev, prima_fhm As Double

            fn_ActualizaDataGrupo()

            If gvd_Agrupacion.Rows.Count > 0 Then
                grupo = gvd_Agrupacion.DataKeys(gvd_Agrupacion.Rows.Count - 1)("Clave") + 1
            End If

            For Each row In gvd_Riesgo.Rows
                Dim chk_Riesgo As CheckBox = TryCast(row.FindControl("chk_Riesgo"), CheckBox)
                If chk_Riesgo.Checked = True Then
                    strRiesgos = strRiesgos & "," & gvd_Riesgo.DataKeys(row.RowIndex)("cod_inciso")
                    suma_asegurada = suma_asegurada + IIf(TryCast(row.FindControl("opt_Adicional"), RadioButtonList).SelectedValue = 1, TryCast(row.FindControl("txt_LimRespAux"), TextBox).Text, 0)
                    prima_neta = prima_neta + TryCast(row.FindControl("txt_PrimaNetaAux"), TextBox).Text
                    prima_inc = prima_inc + TryCast(row.FindControl("txt_PrimaINCAux"), TextBox).Text
                    prima_tev = prima_tev + TryCast(row.FindControl("txt_PrimaTEVAux"), TextBox).Text
                    prima_fhm = prima_fhm + TryCast(row.FindControl("txt_PrimaFHMAux"), TextBox).Text
                End If
            Next

            dtAgrupacion.Rows.Add(grupo, "Grupo " & grupo, suma_asegurada, prima_neta, prima_inc, prima_tev, prima_fhm, strRiesgos)

            LlenaGridAgrupacion(False)

            SeleccionaAgrupacion(hid_IndiceGrupo.Value, gvd_Agrupacion.Rows.Count - 1)
        Catch ex As Exception
            Mensaje.MuestraMensaje("Mesa de Control", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Private Sub SeleccionaAgrupacion(ByVal IndiceAnterior As Integer, ByVal Indice As Integer)
        Dim Clave As Integer

        Funciones.EjecutaFuncion("fn_CerrarModalSimple('#Subjetividad');", "Subjetividad")
        Funciones.EjecutaFuncion("fn_CerrarModalSimple('#Comisiones')", "Comisiones")

        If IndiceAnterior > -1 Then
            fn_ActualizaDataDistribucion(gvd_Agrupacion.DataKeys(IndiceAnterior)("Clave"))
            fn_ActualizaDataBroker(gvd_Agrupacion.DataKeys(IndiceAnterior)("Clave"))

            If hid_IndiceBroker.Value > -1 Then
                fn_ActualizaDataReasegurador(gvd_Agrupacion.DataKeys(IndiceAnterior)("Clave"), gvd_Intermediario.DataKeys(hid_IndiceBroker.Value)("Consecutivo"))

                If gvd_Intermediario.DataKeys(hid_IndiceBroker.Value)("Clave") > 0 Then
                    Clave = 0
                Else
                    If gvd_Reasegurador.Rows.Count > 0 And hid_IndiceReas.Value > -1 Then
                        Clave = gvd_Reasegurador.DataKeys(hid_IndiceReas.Value)("Clave")
                    End If
                End If

                fn_ActualizaDataSubjetividad(gvd_Agrupacion.DataKeys(IndiceAnterior)("Clave"), gvd_Intermediario.DataKeys(hid_IndiceBroker.Value)("Consecutivo"), Clave)
            End If

        End If

        hid_IndiceGrupo.Value = Indice
        hid_IndiceGrupoDet.Value = Indice

        For Each row In gvd_Agrupacion.Rows
            TryCast(row.FindControl("lnk_Descripcion"), LinkButton).Font.Bold = False
            TryCast(row.FindControl("lnk_Descripcion"), LinkButton).ForeColor = Drawing.ColorTranslator.FromHtml("#555")
            TryCast(row.FindControl("lnk_Descripcion"), LinkButton).BorderColor = Drawing.ColorTranslator.FromHtml("#ccc")

            TryCast(row.FindControl("txt_LimResp"), TextBox).ForeColor = Drawing.ColorTranslator.FromHtml("#555")
            TryCast(row.FindControl("txt_PrimaNeta"), TextBox).ForeColor = Drawing.ColorTranslator.FromHtml("#555")
            TryCast(row.FindControl("txt_PrimaTEV"), TextBox).ForeColor = Drawing.ColorTranslator.FromHtml("#555")
            TryCast(row.FindControl("txt_PrimaFHM"), TextBox).ForeColor = Drawing.ColorTranslator.FromHtml("#555")
        Next

        CType(gvd_Agrupacion.Rows(Indice).FindControl("lnk_Descripcion"), LinkButton).Font.Bold = True
        CType(gvd_Agrupacion.Rows(Indice).FindControl("lnk_Descripcion"), LinkButton).ForeColor = Drawing.ColorTranslator.FromHtml("#003A5D")
        CType(gvd_Agrupacion.Rows(Indice).FindControl("lnk_Descripcion"), LinkButton).BorderColor = Drawing.ColorTranslator.FromHtml("#003A5D")

        CType(gvd_Agrupacion.Rows(Indice).FindControl("txt_LimResp"), TextBox).ForeColor = Drawing.ColorTranslator.FromHtml("#003A5D")
        CType(gvd_Agrupacion.Rows(Indice).FindControl("txt_PrimaNeta"), TextBox).ForeColor = Drawing.ColorTranslator.FromHtml("#003A5D")
        CType(gvd_Agrupacion.Rows(Indice).FindControl("txt_PrimaTEV"), TextBox).ForeColor = Drawing.ColorTranslator.FromHtml("#003A5D")
        CType(gvd_Agrupacion.Rows(Indice).FindControl("txt_PrimaFHM"), TextBox).ForeColor = Drawing.ColorTranslator.FromHtml("#003A5D")

        'Llena Información de Distribución
        LlenaGridDistribucion(False, gvd_Agrupacion.DataKeys(Indice)("Clave"))

        'Llena Información de Broker
        LlenaGridBroker(False, gvd_Agrupacion.DataKeys(Indice)("Clave"))

        If gvd_Intermediario.Rows.Count > 0 Then
            hid_IndiceBroker.Value = 0
            SeleccionaBroker(-1, hid_IndiceBroker.Value)
        Else
            hid_IndiceBroker.Value = -1
            LlenaGridReasegurador(False, 0, 0)
            LlenaGridSubjetividad(False, 0, 0, 0)
            btn_AddCia.Attributes.Add("disabled", "true")
        End If


        'Actualiza Reparto General
        Funciones.EjecutaFuncion("fn_CalculaReparto(-1, -1, ['SumaAsegurada', 'PrimaNeta', 'PrimaTEV', 'PrimaFHM'], ['txt_LimResp', 'txt_PrimaNeta', 'txt_PrimaTEV', 'txt_PrimaFHM']);", "Reparto")

        'Actualiza Distribución para GMX
        Funciones.EjecutaFuncion("fn_CalculaDistribucionGMX(-1, -1, ['SumaAsegurada', 'PrimaNeta', 'PrimaTEV', 'PrimaFHM'], ['txt_LimResp', 'txt_PrimaNeta', 'txt_PrimaTEV', 'txt_PrimaFHM']);", "Distribucion")

        'Actualiza Intermediario
        Funciones.EjecutaFuncion("fn_CalculaIntermediario(-1, -1, ['SumaAsegurada', 'PrimaNeta', 'PrimaINC', 'PrimaTEV', 'PrimaFHM'], ['txt_LimResp', 'txt_PrimaNeta', 'txt_PrimaINC', 'txt_PrimaTEV', 'txt_PrimaFHM']);", "Intermediario")

        'Actualiza Reasegurador
        Funciones.EjecutaFuncion("fn_CalculaReasegurador(-1, -1, ['SumaAsegurada', 'PrimaNeta', 'PrimaINC', 'PrimaTEV', 'PrimaFHM'], ['txt_LimResp', 'txt_PrimaNeta', 'txt_PrimaINC', 'txt_PrimaTEV', 'txt_PrimaFHM']);", "Reasegurador")

    End Sub

    Private Sub SeleccionaBroker(ByVal IndiceAnterior As Integer, ByVal Indice As Integer)
        Dim Clave As Integer
        btn_AddCia.Attributes.Remove("disabled")

        If IndiceAnterior > -1 Then
            fn_ActualizaDataReasegurador(gvd_Intermediario.DataKeys(IndiceAnterior)("Grupo"), gvd_Intermediario.DataKeys(IndiceAnterior)("Consecutivo"))

            If gvd_Intermediario.DataKeys(IndiceAnterior)("Clave") > 0 Then
                Clave = 0
            Else
                If gvd_Reasegurador.Rows.Count > 0 And hid_IndiceReas.Value > -1 Then
                    Clave = gvd_Reasegurador.DataKeys(hid_IndiceReas.Value)("Clave")
                End If
            End If

            fn_ActualizaDataSubjetividad(gvd_Intermediario.DataKeys(IndiceAnterior)("Grupo"), gvd_Intermediario.DataKeys(IndiceAnterior)("Consecutivo"), Clave)
        End If

        hid_IndiceBroker.Value = Indice

        For Each row In gvd_Intermediario.Rows
            TryCast(row.FindControl("lnk_Clave"), LinkButton).Font.Bold = False
            TryCast(row.FindControl("lnk_Clave"), LinkButton).ForeColor = Drawing.ColorTranslator.FromHtml("#555")
            TryCast(row.FindControl("lnk_Clave"), LinkButton).BorderColor = Drawing.ColorTranslator.FromHtml("#ccc")

            TryCast(row.FindControl("txt_Descripcion"), TextBox).Font.Bold = False
            TryCast(row.FindControl("txt_Descripcion"), TextBox).ForeColor = Drawing.ColorTranslator.FromHtml("#555")
            TryCast(row.FindControl("txt_Descripcion"), TextBox).BorderColor = Drawing.ColorTranslator.FromHtml("#ccc")
        Next

        CType(gvd_Intermediario.Rows(Indice).FindControl("lnk_Clave"), LinkButton).Font.Bold = True
        CType(gvd_Intermediario.Rows(Indice).FindControl("lnk_Clave"), LinkButton).ForeColor = Drawing.ColorTranslator.FromHtml("#003A5D")
        CType(gvd_Intermediario.Rows(Indice).FindControl("lnk_Clave"), LinkButton).BorderColor = Drawing.ColorTranslator.FromHtml("#003A5D")

        CType(gvd_Intermediario.Rows(Indice).FindControl("txt_Descripcion"), TextBox).Font.Bold = True
        CType(gvd_Intermediario.Rows(Indice).FindControl("txt_Descripcion"), TextBox).ForeColor = Drawing.ColorTranslator.FromHtml("#003A5D")
        CType(gvd_Intermediario.Rows(Indice).FindControl("txt_Descripcion"), TextBox).BorderColor = Drawing.ColorTranslator.FromHtml("#003A5D")

        'Llena Información de Reaseguradores
        LlenaGridReasegurador(False, gvd_Intermediario.DataKeys(Indice)("Grupo"), gvd_Intermediario.DataKeys(Indice)("Consecutivo"))

        ' Si es mediante Intermediario
        If gvd_Intermediario.DataKeys(Indice)("Clave") > 0 Then
            LlenaGridSubjetividad(False, gvd_Intermediario.DataKeys(Indice)("Grupo"),
                                  gvd_Intermediario.DataKeys(Indice)("Consecutivo"), 0)
            txt_Observaciones.Text = CType(gvd_Intermediario.Rows(Indice).FindControl("txt_Observaciones"), TextBox).Text

            txt_PrcComNeta.Text = String.Format("{0:#0.0000}", CDbl(CType(gvd_Intermediario.Rows(Indice).FindControl("txt_PrcComNeta"), TextBox).Text))
            txt_ComNeta.Text = String.Format("{0:#,#0.00}", CDbl(CType(gvd_Intermediario.Rows(Indice).FindControl("txt_ComNeta"), TextBox).Text))
            txt_ComNetaAux.Text = CType(gvd_Intermediario.Rows(Indice).FindControl("txt_ComNeta"), TextBox).Text
            txt_PnrNeta.Text = String.Format("{0:#,#0.00}", CDbl(CType(gvd_Intermediario.Rows(Indice).FindControl("txt_PnrNeta"), TextBox).Text))

            txt_PrcComINC.Text = String.Format("{0:#0.0000}", CDbl(CType(gvd_Intermediario.Rows(Indice).FindControl("txt_PrcComINC"), TextBox).Text))
            txt_ComINC.Text = String.Format("{0:#,#0.00}", CDbl(CType(gvd_Intermediario.Rows(Indice).FindControl("txt_ComINC"), TextBox).Text))
            txt_ComINCAux.Text = CType(gvd_Intermediario.Rows(Indice).FindControl("txt_ComINC"), TextBox).Text
            txt_PnrINC.Text = String.Format("{0:#,#0.00}", CDbl(CType(gvd_Intermediario.Rows(Indice).FindControl("txt_PnrINC"), TextBox).Text))

            txt_PrcComTEV.Text = String.Format("{0:#0.0000}", CDbl(CType(gvd_Intermediario.Rows(Indice).FindControl("txt_PrcComTEV"), TextBox).Text))
            txt_ComTEV.Text = String.Format("{0:#,#0.00}", CDbl(CType(gvd_Intermediario.Rows(Indice).FindControl("txt_ComTEV"), TextBox).Text))
            txt_ComTEVAux.Text = CType(gvd_Intermediario.Rows(Indice).FindControl("txt_ComTEV"), TextBox).Text
            txt_PnrTEV.Text = String.Format("{0:#,#0.00}", CDbl(CType(gvd_Intermediario.Rows(Indice).FindControl("txt_PnrTEV"), TextBox).Text))


            txt_PrcComFHM.Text = String.Format("{0:#0.0000}", CDbl(CType(gvd_Intermediario.Rows(Indice).FindControl("txt_PrcComFHM"), TextBox).Text))
            txt_ComFHM.Text = String.Format("{0:#,#0.00}", CDbl(CType(gvd_Intermediario.Rows(Indice).FindControl("txt_ComFHM"), TextBox).Text))
            txt_ComFHMAux.Text = CType(gvd_Intermediario.Rows(Indice).FindControl("txt_ComFHM"), TextBox).Text
            txt_PnrFHM.Text = String.Format("{0:#,#0.00}", CDbl(CType(gvd_Intermediario.Rows(Indice).FindControl("txt_PnrFHM"), TextBox).Text))


            Funciones.EjecutaFuncion("fn_AbrirModalSimple('#Subjetividad')", "Subjetividad")
            Funciones.EjecutaFuncion("fn_AbrirModalSimple('#Comisiones')", "Comisiones")
        Else 'Si es Negocio Directo
            If gvd_Reasegurador.Rows.Count > 0 Then
                hid_IndiceReas.Value = 0
                SeleccionaReasegurador(-1, hid_IndiceReas.Value)
            Else
                LlenaGridSubjetividad(False, 0, 0, 0)
                txt_Observaciones.Text = vbNullString

                txt_PrcComNeta.Text = "0.0000"
                txt_ComNeta.Text = "0.00"
                txt_ComNetaAux.Text = "0"
                txt_PnrNeta.Text = "0.00"

                txt_PrcComINC.Text = "0.0000"
                txt_ComINC.Text = "0.00"
                txt_ComINCAux.Text = "0"
                txt_PnrINC.Text = "0.00"

                txt_PrcComTEV.Text = "0.0000"
                txt_ComTEV.Text = "0.00"
                txt_ComTEVAux.Text = "0"
                txt_PnrTEV.Text = "0.00"


                txt_PrcComFHM.Text = "0.0000"
                txt_ComFHM.Text = "0.00"
                txt_ComFHMAux.Text = "0"
                txt_PnrFHM.Text = "0.00"

                Funciones.EjecutaFuncion("fn_CerrarModalSimple('#Subjetividad');", "Subjetividad")
                Funciones.EjecutaFuncion("fn_CerrarModalSimple('#Comisiones');", "Comisiones")
            End If
        End If

        'Actualiza Reasegurador
        'Actualiza Intermediario
        Funciones.EjecutaFuncion("fn_CalculaIntermediario(-1, " & Indice & ", ['SumaAsegurada', 'PrimaNeta', 'PrimaINC', 'PrimaTEV', 'PrimaFHM'], ['txt_LimResp', 'txt_PrimaNeta', 'txt_PrimaINC', 'txt_PrimaTEV', 'txt_PrimaFHM']);", "Intermediario")

        'Actualiza Reasegurador
        Funciones.EjecutaFuncion("fn_CalculaReasegurador(-1, -1, ['SumaAsegurada', 'PrimaNeta', 'PrimaINC', 'PrimaTEV', 'PrimaFHM'], ['txt_LimResp', 'txt_PrimaNeta', 'txt_PrimaINC', 'txt_PrimaTEV', 'txt_PrimaFHM']);", "Reasegurador")

    End Sub

    Private Sub SeleccionaReasegurador(ByVal IndiceAnterior As Integer, ByVal Indice As Integer)
        If IndiceAnterior > -1 Then
            'Solo si es Negocio Directo
            If gvd_Intermediario.DataKeys(hid_IndiceBroker.Value)("Clave") = 0 Then
                fn_ActualizaDataSubjetividad(gvd_Intermediario.DataKeys(hid_IndiceBroker.Value)("Grupo"),
                                             gvd_Intermediario.DataKeys(hid_IndiceBroker.Value)("Consecutivo"),
                                             gvd_Reasegurador.DataKeys(IndiceAnterior)("Clave"))
            End If
        End If

        hid_IndiceReas.Value = Indice

        For Each row In gvd_Reasegurador.Rows
            TryCast(row.FindControl("lnk_Clave"), LinkButton).Font.Bold = False
            TryCast(row.FindControl("lnk_Clave"), LinkButton).ForeColor = Drawing.ColorTranslator.FromHtml("#555")
            TryCast(row.FindControl("lnk_Clave"), LinkButton).BorderColor = Drawing.ColorTranslator.FromHtml("#ccc")

            TryCast(row.FindControl("txt_Descripcion"), TextBox).Font.Bold = False
            TryCast(row.FindControl("txt_Descripcion"), TextBox).ForeColor = Drawing.ColorTranslator.FromHtml("#555")
            TryCast(row.FindControl("txt_Descripcion"), TextBox).BorderColor = Drawing.ColorTranslator.FromHtml("#ccc")
        Next

        CType(gvd_Reasegurador.Rows(Indice).FindControl("lnk_Clave"), LinkButton).Font.Bold = True
        CType(gvd_Reasegurador.Rows(Indice).FindControl("lnk_Clave"), LinkButton).ForeColor = Drawing.ColorTranslator.FromHtml("#003A5D")
        CType(gvd_Reasegurador.Rows(Indice).FindControl("lnk_Clave"), LinkButton).BorderColor = Drawing.ColorTranslator.FromHtml("#003A5D")

        CType(gvd_Reasegurador.Rows(Indice).FindControl("txt_Descripcion"), TextBox).Font.Bold = True
        CType(gvd_Reasegurador.Rows(Indice).FindControl("txt_Descripcion"), TextBox).ForeColor = Drawing.ColorTranslator.FromHtml("#003A5D")
        CType(gvd_Reasegurador.Rows(Indice).FindControl("txt_Descripcion"), TextBox).BorderColor = Drawing.ColorTranslator.FromHtml("#003A5D")

        If gvd_Intermediario.DataKeys(hid_IndiceBroker.Value)("Clave") = 0 Then
            LlenaGridSubjetividad(False,
                                  gvd_Intermediario.DataKeys(hid_IndiceBroker.Value)("Grupo"),
                                  gvd_Intermediario.DataKeys(hid_IndiceBroker.Value)("Consecutivo"),
                                  gvd_Reasegurador.DataKeys(Indice)("Clave"))

            txt_Observaciones.Text = CType(gvd_Reasegurador.Rows(hid_IndiceReas.Value).FindControl("txt_Observaciones"), TextBox).Text

            txt_PrcComNeta.Text = String.Format("{0:#0.0000}", CDbl(CType(gvd_Reasegurador.Rows(Indice).FindControl("txt_PrcComNeta"), TextBox).Text))
            txt_ComNeta.Text = String.Format("{0:#,#0.00}", CDbl(CType(gvd_Reasegurador.Rows(Indice).FindControl("txt_ComNeta"), TextBox).Text))
            txt_ComNetaAux.Text = CType(gvd_Reasegurador.Rows(Indice).FindControl("txt_ComNeta"), TextBox).Text
            txt_PnrNeta.Text = String.Format("{0:#,#0.00}", CDbl(CType(gvd_Reasegurador.Rows(Indice).FindControl("txt_PnrNeta"), TextBox).Text))

            txt_PrcComINC.Text = String.Format("{0:#0.0000}", CDbl(CType(gvd_Reasegurador.Rows(Indice).FindControl("txt_PrcComINC"), TextBox).Text))
            txt_ComINC.Text = String.Format("{0:#,#0.00}", CDbl(CType(gvd_Reasegurador.Rows(Indice).FindControl("txt_ComINC"), TextBox).Text))
            txt_ComINCAux.Text = CType(gvd_Reasegurador.Rows(Indice).FindControl("txt_ComINC"), TextBox).Text
            txt_PnrINC.Text = String.Format("{0:#,#0.00}", CDbl(CType(gvd_Reasegurador.Rows(Indice).FindControl("txt_PnrINC"), TextBox).Text))

            txt_PrcComTEV.Text = String.Format("{0:#0.0000}", CDbl(CType(gvd_Reasegurador.Rows(Indice).FindControl("txt_PrcComTEV"), TextBox).Text))
            txt_ComTEV.Text = String.Format("{0:#,#0.00}", CDbl(CType(gvd_Reasegurador.Rows(Indice).FindControl("txt_ComTEV"), TextBox).Text))
            txt_ComTEVAux.Text = CType(gvd_Reasegurador.Rows(Indice).FindControl("txt_ComTEV"), TextBox).Text
            txt_PnrTEV.Text = String.Format("{0:#,#0.00}", CDbl(CType(gvd_Reasegurador.Rows(Indice).FindControl("txt_PnrTEV"), TextBox).Text))


            txt_PrcComFHM.Text = String.Format("{0:#0.0000}", CDbl(CType(gvd_Reasegurador.Rows(Indice).FindControl("txt_PrcComFHM"), TextBox).Text))
            txt_ComFHM.Text = String.Format("{0:#,#0.00}", CDbl(CType(gvd_Reasegurador.Rows(Indice).FindControl("txt_ComFHM"), TextBox).Text))
            txt_ComFHMAux.Text = CType(gvd_Reasegurador.Rows(Indice).FindControl("txt_ComFHM"), TextBox).Text
            txt_PnrFHM.Text = String.Format("{0:#,#0.00}", CDbl(CType(gvd_Reasegurador.Rows(Indice).FindControl("txt_PnrFHM"), TextBox).Text))

            Funciones.EjecutaFuncion("fn_AbrirModalSimple('#Subjetividad')", "Subjetividad")
            Funciones.EjecutaFuncion("fn_AbrirModalSimple('#Comisiones')", "Comisiones")
        End If

        'Actualiza Reasegurador
        Funciones.EjecutaFuncion("fn_CalculaReasegurador(-1, " & Indice & ", ['SumaAsegurada', 'PrimaNeta', 'PrimaINC', 'PrimaTEV', 'PrimaFHM'], ['txt_LimResp', 'txt_PrimaNeta', 'txt_PrimaINC', 'txt_PrimaTEV', 'txt_PrimaFHM']);", "Reasegurador")

    End Sub

    Private Sub gvd_Agrupacion_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles gvd_Agrupacion.RowCommand
        Try

            If e.CommandName = "Descripcion" Then
                SeleccionaAgrupacion(hid_IndiceGrupo.Value, e.CommandSource.NamingContainer.RowIndex)
            ElseIf e.CommandName = "Incisos" Then

                btn_AddRiesgoGrupo.Visible = False
                btn_RemoveRiesgoGrupo.Visible = True

                Dim dtIncisos As DataTable
                dtIncisos = New DataTable
                dtIncisos.Columns.Add("cod_inciso")
                dtIncisos.Columns.Add("Ramo")
                dtIncisos.Columns.Add("SubRamo")
                dtIncisos.Columns.Add("Seccion")
                dtIncisos.Columns.Add("Cobertura")
                dtIncisos.Columns.Add("sn_adicional")
                dtIncisos.Columns.Add("valores_totales")
                dtIncisos.Columns.Add("suma_asegurada")
                dtIncisos.Columns.Add("prima_neta")
                dtIncisos.Columns.Add("prima_tev")
                dtIncisos.Columns.Add("prima_fhm")

                hid_IndiceGrupoDet.Value = e.CommandSource.NamingContainer.RowIndex
                Dim incisos() As String = Split(CType(gvd_Agrupacion.Rows(hid_IndiceGrupoDet.Value).FindControl("txt_Incisos"), TextBox).Text, ",")
                For Each row In gvd_Riesgo.Rows
                    If incisos.Contains(TryCast(row.FindControl("lbl_Inciso"), Label).Text) Then
                        dtIncisos.Rows.Add(TryCast(row.FindControl("lbl_Inciso"), Label).Text,
                                           TryCast(row.FindControl("txt_SearchRamo"), TextBox).Text,
                                           TryCast(row.FindControl("txt_SearchSubramo"), TextBox).Text,
                                           TryCast(row.FindControl("txt_SearchSeccion"), TextBox).Text,
                                           TryCast(row.FindControl("txt_SearchCobertura"), TextBox).Text,
                                           TryCast(row.FindControl("opt_Adicional"), RadioButtonList).SelectedValue,
                                           TryCast(row.FindControl("txt_ValoresTotales"), TextBox).Text,
                                           TryCast(row.FindControl("txt_LimResp"), TextBox).Text,
                                           TryCast(row.FindControl("txt_PrimaNeta"), TextBox).Text,
                                           TryCast(row.FindControl("txt_PrimaTEV"), TextBox).Text,
                                           TryCast(row.FindControl("txt_PrimaFHM"), TextBox).Text)
                    End If
                Next

                Funciones.LlenaGrid(gvd_RiesgosGrupo, dtIncisos)
                Funciones.AbrirModal("#Incisos")
            ElseIf e.CommandName = "Agregar" Then

                btn_AddRiesgoGrupo.Visible = True
                btn_RemoveRiesgoGrupo.Visible = False

                Dim dtIncisos As DataTable
                dtIncisos = New DataTable
                dtIncisos.Columns.Add("cod_inciso")
                dtIncisos.Columns.Add("Ramo")
                dtIncisos.Columns.Add("SubRamo")
                dtIncisos.Columns.Add("Seccion")
                dtIncisos.Columns.Add("Cobertura")
                dtIncisos.Columns.Add("sn_adicional")
                dtIncisos.Columns.Add("valores_totales")
                dtIncisos.Columns.Add("suma_asegurada")
                dtIncisos.Columns.Add("prima_neta")
                dtIncisos.Columns.Add("prima_tev")
                dtIncisos.Columns.Add("prima_fhm")

                hid_IndiceGrupoDet.Value = e.CommandSource.NamingContainer.RowIndex
                Dim incisos() As String = Split(CType(gvd_Agrupacion.Rows(hid_IndiceGrupoDet.Value).FindControl("txt_Incisos"), TextBox).Text, ",")

                For Each row In gvd_Riesgo.Rows
                    If Not incisos.Contains(TryCast(row.FindControl("lbl_Inciso"), Label).Text) And TryCast(row.FindControl("lbl_Inciso"), Label).Text <> "" Then
                        dtIncisos.Rows.Add(TryCast(row.FindControl("lbl_Inciso"), Label).Text,
                                           TryCast(row.FindControl("txt_SearchRamo"), TextBox).Text,
                                           TryCast(row.FindControl("txt_SearchSubramo"), TextBox).Text,
                                           TryCast(row.FindControl("txt_SearchSeccion"), TextBox).Text,
                                           TryCast(row.FindControl("txt_SearchCobertura"), TextBox).Text,
                                           TryCast(row.FindControl("opt_Adicional"), RadioButtonList).SelectedValue,
                                           TryCast(row.FindControl("txt_ValoresTotales"), TextBox).Text,
                                           TryCast(row.FindControl("txt_LimResp"), TextBox).Text,
                                           TryCast(row.FindControl("txt_PrimaNeta"), TextBox).Text,
                                           TryCast(row.FindControl("txt_PrimaTEV"), TextBox).Text,
                                           TryCast(row.FindControl("txt_PrimaFHM"), TextBox).Text)
                    End If
                Next

                Funciones.LlenaGrid(gvd_RiesgosGrupo, dtIncisos)
                Funciones.AbrirModal("#Incisos")

            End If
        Catch ex As Exception
            Mensaje.MuestraMensaje("Mesa de Control", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Private Sub btn_RemoveRiesgoGrupo_Click(sender As Object, e As EventArgs) Handles btn_RemoveRiesgoGrupo.Click
        Try
            Dim Incisos = "-1"
            Dim dtIncisos As DataTable
            dtIncisos = New DataTable
            dtIncisos.Columns.Add("cod_inciso")
            dtIncisos.Columns.Add("Ramo")
            dtIncisos.Columns.Add("SubRamo")
            dtIncisos.Columns.Add("Seccion")
            dtIncisos.Columns.Add("Cobertura")
            dtIncisos.Columns.Add("sn_adicional")
            dtIncisos.Columns.Add("valores_totales")
            dtIncisos.Columns.Add("suma_asegurada")
            dtIncisos.Columns.Add("prima_neta")
            dtIncisos.Columns.Add("prima_tev")
            dtIncisos.Columns.Add("prima_fhm")

            For Each row In gvd_RiesgosGrupo.Rows
                If TryCast(row.FindControl("chk_Sel"), CheckBox).Checked = False Then
                    dtIncisos.Rows.Add(TryCast(row.FindControl("lbl_Inciso"), Label).Text,
                                       TryCast(row.FindControl("txt_SearchRamo"), TextBox).Text,
                                       TryCast(row.FindControl("txt_SearchSubramo"), TextBox).Text,
                                       TryCast(row.FindControl("txt_SearchSeccion"), TextBox).Text,
                                       TryCast(row.FindControl("txt_SearchCobertura"), TextBox).Text,
                                       TryCast(row.FindControl("chk_Adicional"), CheckBox).Checked,
                                       TryCast(row.FindControl("txt_ValoresTotales"), TextBox).Text,
                                       TryCast(row.FindControl("txt_LimResp"), TextBox).Text,
                                       TryCast(row.FindControl("txt_PrimaNeta"), TextBox).Text,
                                       TryCast(row.FindControl("txt_PrimaTEV"), TextBox).Text,
                                       TryCast(row.FindControl("txt_PrimaFHM"), TextBox).Text)

                    Incisos = Incisos & "," & TryCast(row.FindControl("lbl_Inciso"), Label).Text
                End If
            Next

            CType(gvd_Agrupacion.Rows(hid_IndiceGrupoDet.Value).FindControl("txt_Incisos"), TextBox).Text = Incisos

            Dim myRow() As Data.DataRow
            myRow = dtAgrupacion.Select("Clave ='" & gvd_Agrupacion.DataKeys(hid_IndiceGrupoDet.Value)("Clave") & "'")

            If myRow.Length > 0 Then
                myRow(0)("incisos") = Incisos
            End If

            Funciones.LlenaGrid(gvd_RiesgosGrupo, dtIncisos)

            'Actualiza Agrupacion
            Funciones.EjecutaFuncion("fn_ActualizaGrupo(" & gvd_Agrupacion.DataKeys(hid_IndiceGrupoDet.Value)("Clave") & ", 0, ['SumaAsegurada','PrimaNeta','PrimaINC','PrimaTEV','PrimaFHM'], ['txt_LimRespAux','txt_PrimaNetaAux','txt_PrimaINCAux','txt_PrimaTEVAux','txt_PrimaFHMAux'], 1)", "Grupos")

            'Si se trata del Grupo en Pantalla
            If hid_IndiceGrupo.Value = hid_IndiceGrupoDet.Value Then
                'Actualiza Reparto General
                Funciones.EjecutaFuncion("fn_CalculaReparto(-1, -1, ['SumaAsegurada', 'PrimaNeta', 'PrimaTEV', 'PrimaFHM'], ['txt_LimResp', 'txt_PrimaNeta', 'txt_PrimaTEV', 'txt_PrimaFHM']);", "Reparto")

                'Actualiza Distribución para GMX
                Funciones.EjecutaFuncion("fn_CalculaDistribucionGMX(-1, -1, ['SumaAsegurada', 'PrimaNeta', 'PrimaTEV', 'PrimaFHM'], ['txt_LimResp', 'txt_PrimaNeta', 'txt_PrimaTEV', 'txt_PrimaFHM']);", "Distribucion")

                'Actualiza Intermediario
                Funciones.EjecutaFuncion("fn_CalculaIntermediario(-1, -1, ['SumaAsegurada', 'PrimaNeta', 'PrimaINC', 'PrimaTEV', 'PrimaFHM'], ['txt_LimResp', 'txt_PrimaNeta', 'txt_PrimaINC', 'txt_PrimaTEV', 'txt_PrimaFHM']);", "Intermediario")

                'Actualiza Reasegurador
                Funciones.EjecutaFuncion("fn_CalculaReasegurador(-1, -1, ['SumaAsegurada', 'PrimaNeta', 'PrimaINC', 'PrimaTEV', 'PrimaFHM'], ['txt_LimResp', 'txt_PrimaNeta', 'txt_PrimaINC', 'txt_PrimaTEV', 'txt_PrimaFHM']);", "Reasegurador")
            End If

        Catch ex As Exception
            Mensaje.MuestraMensaje("Mesa de Control", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Private Sub btn_AddRiesgoGrupo_Click(sender As Object, e As EventArgs) Handles btn_AddRiesgoGrupo.Click
        Try
            Dim Incisos = CType(gvd_Agrupacion.Rows(hid_IndiceGrupoDet.Value).FindControl("txt_Incisos"), TextBox).Text
            Dim dtIncisos As DataTable
            dtIncisos = New DataTable
            dtIncisos.Columns.Add("cod_inciso")
            dtIncisos.Columns.Add("Ramo")
            dtIncisos.Columns.Add("SubRamo")
            dtIncisos.Columns.Add("Seccion")
            dtIncisos.Columns.Add("Cobertura")
            dtIncisos.Columns.Add("sn_adicional")
            dtIncisos.Columns.Add("valores_totales")
            dtIncisos.Columns.Add("suma_asegurada")
            dtIncisos.Columns.Add("prima_neta")
            dtIncisos.Columns.Add("prima_tev")
            dtIncisos.Columns.Add("prima_fhm")

            For Each row In gvd_RiesgosGrupo.Rows
                If TryCast(row.FindControl("chk_Sel"), CheckBox).Checked = True Then
                    Incisos = Incisos & "," & TryCast(row.FindControl("lbl_Inciso"), Label).Text
                Else
                    dtIncisos.Rows.Add(TryCast(row.FindControl("lbl_Inciso"), Label).Text,
                                       TryCast(row.FindControl("txt_SearchRamo"), TextBox).Text,
                                       TryCast(row.FindControl("txt_SearchSubramo"), TextBox).Text,
                                       TryCast(row.FindControl("txt_SearchSeccion"), TextBox).Text,
                                       TryCast(row.FindControl("txt_SearchCobertura"), TextBox).Text,
                                       TryCast(row.FindControl("chk_Adicional"), CheckBox).Checked,
                                       TryCast(row.FindControl("txt_ValoresTotales"), TextBox).Text,
                                       TryCast(row.FindControl("txt_LimResp"), TextBox).Text,
                                       TryCast(row.FindControl("txt_PrimaNeta"), TextBox).Text,
                                       TryCast(row.FindControl("txt_PrimaTEV"), TextBox).Text,
                                       TryCast(row.FindControl("txt_PrimaFHM"), TextBox).Text)
                End If
            Next

            CType(gvd_Agrupacion.Rows(hid_IndiceGrupoDet.Value).FindControl("txt_Incisos"), TextBox).Text = Incisos

            Dim myRow() As Data.DataRow
            myRow = dtAgrupacion.Select("Clave ='" & gvd_Agrupacion.DataKeys(hid_IndiceGrupoDet.Value)("Clave") & "'")

            If myRow.Length > 0 Then
                myRow(0)("incisos") = Incisos
            End If

            Funciones.LlenaGrid(gvd_RiesgosGrupo, dtIncisos)

            'Actualiza Agrupacion
            Funciones.EjecutaFuncion("fn_ActualizaGrupo(" & gvd_Agrupacion.DataKeys(hid_IndiceGrupoDet.Value)("Clave") & ", 0, ['SumaAsegurada','PrimaNeta','PrimaINC','PrimaTEV','PrimaFHM'], ['txt_LimRespAux','txt_PrimaNetaAux','txt_PrimaINCAux','txt_PrimaTEVAux','txt_PrimaFHMAux'], 1)", "Grupos")

            If hid_IndiceGrupo.Value = hid_IndiceGrupoDet.Value Then
                'Actualiza Reparto General
                Funciones.EjecutaFuncion("fn_CalculaReparto(-1, -1, ['SumaAsegurada', 'PrimaNeta', 'PrimaINC', 'PrimaTEV', 'PrimaFHM'], ['txt_LimResp', 'txt_PrimaNeta', 'txt_PrimaINC' , 'txt_PrimaTEV', 'txt_PrimaFHM']);", "Reparto")

                'Actualiza Distribución para GMX
                Funciones.EjecutaFuncion("fn_CalculaDistribucionGMX(-1, -1, ['SumaAsegurada', 'PrimaNeta', 'PrimaINC' , 'PrimaTEV', 'PrimaFHM'], ['txt_LimResp', 'txt_PrimaNeta', 'txt_PrimaINC' , 'txt_PrimaTEV', 'txt_PrimaFHM']);", "Distribucion")

                'Actualiza Intermediario
                Funciones.EjecutaFuncion("fn_CalculaIntermediario(-1, -1, ['SumaAsegurada', 'PrimaNeta', 'PrimaINC', 'PrimaTEV', 'PrimaFHM'], ['txt_LimResp', 'txt_PrimaNeta', 'txt_PrimaINC', 'txt_PrimaTEV', 'txt_PrimaFHM']);", "Intermediario")

                'Actualiza Reasegurador
                Funciones.EjecutaFuncion("fn_CalculaReasegurador(-1, -1, ['SumaAsegurada', 'PrimaNeta', 'PrimaINC', 'PrimaTEV', 'PrimaFHM'], ['txt_LimResp', 'txt_PrimaNeta', 'txt_PrimaINC', 'txt_PrimaTEV', 'txt_PrimaFHM']);", "Reasegurador")
            End If

        Catch ex As Exception
            Mensaje.MuestraMensaje("Mesa de Control", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Private Sub Agrega_Intermediario()
        Try
            Dim Consecutivo As Integer = 1

            'Si existe agrupación activa
            If hid_IndiceGrupo.Value > -1 Then
                fn_ActualizaDataBroker(gvd_Agrupacion.DataKeys(hid_IndiceGrupo.Value)("Clave"))
                Dim Datos() As String
                Dim Seleccionados As String = Master.mSeleccionados

                If Len(Seleccionados) > 0 Then
                    Datos = Split(Seleccionados.Substring(0, Seleccionados.Length - 1), "|")

                    If gvd_Intermediario.Rows.Count > 0 Then
                        Consecutivo = gvd_Intermediario.DataKeys(gvd_Intermediario.Rows.Count - 1)("Consecutivo") + 1
                    End If


                    For Each dato In Datos
                        dtBroker.Rows.Add(gvd_Agrupacion.DataKeys(hid_IndiceGrupo.Value)("Clave"), Consecutivo, Split(dato, "~")(0), Split(dato, "~")(1),
                                          "0.0000", "0.00", "0.00", "0.0000", "0.00", "0.00", "0.00", "0.0000", "0.00", "0.00", "0.00", "0.0000", "0.00", "0.00",
                                          "0.00", "0.0000", "0.00", "0.00", "0.0000", "0.00", 0, "")
                        Consecutivo = Consecutivo + 1
                    Next

                    LlenaGridBroker(False, gvd_Agrupacion.DataKeys(hid_IndiceGrupo.Value)("Clave"))
                    SeleccionaBroker(hid_IndiceBroker.Value, gvd_Intermediario.Rows.Count - 1)
                End If
            End If
        Catch ex As Exception
            Mensaje.MuestraMensaje("Mesa de Control", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Private Sub Agrega_Reasegurador()
        Try
            Dim Consecutivo As Integer = 1

            'Si existe agrupación activa
            If hid_IndiceBroker.Value > -1 Then
                fn_ActualizaDataReasegurador(gvd_Intermediario.DataKeys(hid_IndiceBroker.Value)("Grupo"), gvd_Intermediario.DataKeys(hid_IndiceBroker.Value)("Consecutivo"))
                Dim Datos() As String
                Dim Seleccionados As String = Master.mSeleccionados

                If Len(Seleccionados) > 0 Then
                    Datos = Split(Seleccionados.Substring(0, Seleccionados.Length - 1), "|")

                    If gvd_Reasegurador.Rows.Count > 0 Then
                        Consecutivo = gvd_Reasegurador.DataKeys(gvd_Reasegurador.Rows.Count - 1)("Consecutivo") + 1
                    End If


                    For Each dato In Datos
                        dtReasegurador.Rows.Add(gvd_Intermediario.DataKeys(hid_IndiceBroker.Value)("Grupo"), gvd_Intermediario.DataKeys(hid_IndiceBroker.Value)("Consecutivo"), Split(dato, "~")(0), Split(dato, "~")(1),
                                               "0.0000", "0.00", "0.00", "0.0000", "0.00", "0.00", "0.00", "0.0000", "0.00", "0.00", "0.00", "0.0000", "0.00", "0.00",
                                               "0.00", "0.0000", "0.00", "0.00", 0, "")
                        Consecutivo = Consecutivo + 1
                    Next

                    LlenaGridReasegurador(False, gvd_Intermediario.DataKeys(hid_IndiceBroker.Value)("Grupo"), gvd_Intermediario.DataKeys(hid_IndiceBroker.Value)("Consecutivo"))

                    SeleccionaReasegurador(hid_IndiceReas.Value, gvd_Reasegurador.Rows.Count - 1)
                End If
            End If
        Catch ex As Exception
            Mensaje.MuestraMensaje("Mesa de Control", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Private Sub Agrega_Subjetividad()
        Try
            Dim Num As Integer = 1
            Dim Clave As Integer = 0

            'Si existe agrupación activa
            If hid_IndiceBroker.Value > -1 Or hid_IndiceReas.Value > -1 Then

                If gvd_Intermediario.DataKeys(hid_IndiceBroker.Value)("Clave") = 0 Then
                    Clave = gvd_Reasegurador.DataKeys(hid_IndiceReas.Value)("Clave")
                End If
                fn_ActualizaDataSubjetividad(gvd_Intermediario.DataKeys(hid_IndiceBroker.Value)("Grupo"),
                                             gvd_Intermediario.DataKeys(hid_IndiceBroker.Value)("Consecutivo"),
                                             Clave)


                If gvd_Subjetividad.Rows.Count > 0 Then
                    Num = gvd_Subjetividad.DataKeys(gvd_Subjetividad.Rows.Count - 1)("Num") + 1
                End If

                dtSubjetividad.Rows.Add(gvd_Intermediario.DataKeys(hid_IndiceBroker.Value)("Grupo"),
                                        gvd_Intermediario.DataKeys(hid_IndiceBroker.Value)("Consecutivo"),
                                        Clave,
                                        Num,
                                        "", "", 0)

                LlenaGridSubjetividad(False, gvd_Intermediario.DataKeys(hid_IndiceBroker.Value)("Grupo"),
                                      gvd_Intermediario.DataKeys(hid_IndiceBroker.Value)("Consecutivo"),
                                      Clave)

            End If
        Catch ex As Exception
            Mensaje.MuestraMensaje("Mesa de Control", ex.Message, TipoMsg.Falla)
        End Try
    End Sub
    Private Sub gvd_Intermediario_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles gvd_Intermediario.RowCommand
        Try
            If e.CommandName = "Reasegurador" Then
                SeleccionaBroker(hid_IndiceBroker.Value, e.CommandSource.NamingContainer.RowIndex)
            End If
        Catch ex As Exception
            Mensaje.MuestraMensaje("Mesa de Control", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Private Sub btn_AddSubjetividad_Click(sender As Object, e As EventArgs) Handles btn_AddSubjetividad.Click
        Try
            Agrega_Subjetividad()
        Catch ex As Exception
            Mensaje.MuestraMensaje("Mesa de Control", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Private Sub gvd_Reasegurador_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles gvd_Reasegurador.RowCommand
        Try
            If e.CommandName = "Subjetividad" Then
                SeleccionaReasegurador(hid_IndiceReas.Value, e.CommandSource.NamingContainer.RowIndex)
            End If
        Catch ex As Exception
            Mensaje.MuestraMensaje("Mesa de Control", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Private Sub btn_RemoveBroker_Click(sender As Object, e As EventArgs) Handles btn_RemoveBroker.Click
        Try
            If hid_IndiceGrupo.Value > -1 Then
                Quita_Intermediario(gvd_Agrupacion.DataKeys(hid_IndiceGrupo.Value)("Clave"), ObtieneSeleccionados(gvd_Intermediario, "chk_Sel", "Consecutivo"))

                LlenaGridBroker(False, gvd_Agrupacion.DataKeys(hid_IndiceGrupo.Value)("Clave"))

                If gvd_Intermediario.Rows.Count > 0 Then
                    hid_IndiceBroker.Value = 0
                    SeleccionaBroker(hid_IndiceBroker.Value, gvd_Intermediario.Rows.Count - 1)
                Else
                    Funciones.EjecutaFuncion("fn_CerrarModalSimple('#Subjetividad');", "Subjetividad")
                    Funciones.EjecutaFuncion("fn_CerrarModalSimple('#Comisiones')", "Comisiones")

                    hid_IndiceBroker.Value = -1

                    'Llena Información de Broker
                    LlenaGridReasegurador(False, 0)

                    'Llena Información de Broker
                    LlenaGridSubjetividad(False, 0, 0)
                End If
            End If
        Catch ex As Exception
            Mensaje.MuestraMensaje("Mesa de Control", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Private Sub btn_RemoveCia_Click(sender As Object, e As EventArgs) Handles btn_RemoveCia.Click
        Try
            If hid_IndiceBroker.Value > -1 Then
                Quita_Reasegurador(gvd_Intermediario.DataKeys(hid_IndiceBroker.Value)("Grupo"),
                                   gvd_Intermediario.DataKeys(hid_IndiceBroker.Value)("Consecutivo"),
                                   ObtieneSeleccionados(gvd_Reasegurador, "chk_Sel", "Clave"))

                LlenaGridReasegurador(False, gvd_Intermediario.DataKeys(hid_IndiceBroker.Value)("Grupo"),
                                      gvd_Intermediario.DataKeys(hid_IndiceBroker.Value)("Consecutivo"))

                If gvd_Reasegurador.Rows.Count > 0 Then
                    hid_IndiceReas.Value = 0
                    SeleccionaReasegurador(hid_IndiceReas.Value, gvd_Reasegurador.Rows.Count - 1)
                Else
                    hid_IndiceReas.Value = -1

                    'Si se trata de un Negocio Directo
                    If gvd_Intermediario.DataKeys(hid_IndiceBroker.Value)("Clave") = 0 Then
                        Funciones.EjecutaFuncion("fn_CerrarModalSimple('#Subjetividad');", "Subjetividad")
                        Funciones.EjecutaFuncion("fn_CerrarModalSimple('#Comisiones')", "Comisiones")
                        LlenaGridSubjetividad(False, 0, 0)
                    End If
                End If
            End If
        Catch ex As Exception
            Mensaje.MuestraMensaje("Mesa de Control", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

End Class
