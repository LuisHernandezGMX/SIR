Imports System.Data
Imports Mensaje
Partial Class MesaControl_Gestion
    Inherits System.Web.UI.Page

    Private Enum Operacion
        Ninguna
        Nuevo
        Modifica
        Consulta
        Anula
    End Enum

    Public Property dtReasegurador() As DataTable()
        Get
            Return Session("dtReasegurador")
        End Get
        Set(ByVal value As DataTable())
            Session("dtReasegurador") = value
        End Set
    End Property

    Public Property dtSubjetividad() As DataTable()
        Get
            Return Session("dtSubjetividad")
        End Get
        Set(ByVal value As DataTable())
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
                Funciones.LlenaCatDDL(ddl_Moneda, "Mon")
                ddl_Moneda.Items.RemoveAt(2)
                txt_FechaHoy.Text = Today.ToString("dd/MM/yyyy")

                EdoControl(Operacion.Ninguna)
                EdoOperacion = Operacion.Ninguna

            End If
        Catch ex As Exception

        End Try
    End Sub

    Private Sub EdoControl(ByVal intOperacion As Integer)
        Select Case intOperacion
            Case Operacion.Consulta, Operacion.Anula
                txt_Folio.Enabled = False
                txt_FRecibido.Enabled = False

                btn_SelOficina.Attributes.Add("disabled", "true")
                btn_SelAnteRamo.Attributes.Add("disabled", "true")
                btn_SelCobertura.Attributes.Add("disabled", "true")
                btn_SelSuscriptor.Attributes.Add("disabled", "true")
                btn_SelSucursal.Attributes.Add("disabled", "true")
                btn_SelProducto.Attributes.Add("disabled", "true")

                txt_SearchOfi.Enabled = False
                txt_SearchRamC.Enabled = False
                txt_SearchCob.Enabled = False
                txt_SearchSusc.Enabled = False
                txt_SearchSuc.Enabled = False
                txt_SearchRam.Enabled = False
                txt_SearchAse.Enabled = False
                txt_SearchGiro.Enabled = False
                txt_SearchAge.Enabled = False

                ddl_Moneda.Enabled = False
                ddl_TipoMov.Enabled = False

                txt_GiroAsegurado.Enabled = False
                txt_DescMov.Enabled = False
                txt_Aclaraciones.Enabled = False
                txt_ComAgente.Enabled = False
                txt_NroPoliza.Enabled = False
                txt_Sufijo.Enabled = False
                txt_VigIni.Enabled = False
                txt_DiasVig.Enabled = False
                txt_VigFin.Enabled = False
                txt_SumaAseg.Enabled = False
                txt_Prima.Enabled = False
                txt_Cuota.Enabled = False
                txt_Notas.Enabled = False

                chk_Target.Enabled = False

                '--------------------------------------
                btn_SelResponsable.Attributes.Add("disabled", "true")
                txt_SearchResp.Enabled = False

                ddl_Esquema.Enabled = False
                ddl_Estado.Enabled = False

                btn_Subjetividad.Attributes.Add("disabled", "true")

                chk_Subjetividad1.Enabled = False
                chk_Subjetividad2.Enabled = False
                chk_Subjetividad3.Enabled = False
                chk_Subjetividad4.Enabled = False
                chk_Subjetividad5.Enabled = False

                txt_Subjetividad1.Enabled = False
                txt_Subjetividad2.Enabled = False
                txt_Subjetividad3.Enabled = False
                txt_Subjetividad4.Enabled = False
                txt_Subjetividad5.Enabled = False

                txt_FecSubjetividad1.Enabled = False
                txt_FecSubjetividad2.Enabled = False
                txt_FecSubjetividad3.Enabled = False
                txt_FecSubjetividad4.Enabled = False
                txt_FecSubjetividad5.Enabled = False

                lst_Brokers.Enabled = True
                btn_AddBroker.Attributes.Add("disabled", "true")

                gvd_Compañia.Enabled = False
                btn_AddCia.Attributes.Add("disabled", "true")
                txt_NotasColocacion.Enabled = False
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
                txt_Folio.Enabled = False
                txt_FRecibido.Enabled = True

                btn_SelOficina.Attributes.Remove("disabled")
                btn_SelAnteRamo.Attributes.Remove("disabled")
                btn_SelCobertura.Attributes.Remove("disabled")
                btn_SelSuscriptor.Attributes.Remove("disabled")
                btn_SelSucursal.Attributes.Remove("disabled")
                btn_SelProducto.Attributes.Remove("disabled")

                txt_SearchOfi.Enabled = True
                txt_SearchRamC.Enabled = True
                txt_SearchCob.Enabled = True
                txt_SearchSusc.Enabled = True
                txt_SearchSuc.Enabled = True
                txt_SearchRam.Enabled = True
                txt_SearchAse.Enabled = True
                txt_SearchGiro.Enabled = True
                txt_SearchAge.Enabled = True

                ddl_Moneda.Enabled = True
                ddl_TipoMov.Enabled = True

                txt_GiroAsegurado.Enabled = True
                txt_DescMov.Enabled = True
                txt_Aclaraciones.Enabled = True
                txt_ComAgente.Enabled = True
                txt_NroPoliza.Enabled = True
                txt_Sufijo.Enabled = True
                txt_VigIni.Enabled = True
                txt_DiasVig.Enabled = True
                txt_VigFin.Enabled = True
                txt_SumaAseg.Enabled = True
                txt_Prima.Enabled = True
                txt_Cuota.Enabled = True
                txt_Notas.Enabled = True

                chk_Target.Enabled = True

                '--------------------------------------
                btn_SelResponsable.Attributes.Remove("disabled")
                txt_SearchResp.Enabled = True

                ddl_Esquema.Enabled = True
                ddl_Estado.Enabled = True

                btn_Subjetividad.Attributes.Add("disabled", "true")

                chk_Subjetividad1.Enabled = True
                chk_Subjetividad2.Enabled = True
                chk_Subjetividad3.Enabled = True
                chk_Subjetividad4.Enabled = True
                chk_Subjetividad5.Enabled = True

                txt_Subjetividad1.Enabled = True
                txt_Subjetividad2.Enabled = True
                txt_Subjetividad3.Enabled = True
                txt_Subjetividad4.Enabled = True
                txt_Subjetividad5.Enabled = True

                txt_FecSubjetividad1.Enabled = True
                txt_FecSubjetividad2.Enabled = True
                txt_FecSubjetividad3.Enabled = True
                txt_FecSubjetividad4.Enabled = True
                txt_FecSubjetividad5.Enabled = True

                lst_Brokers.Enabled = True
                btn_AddBroker.Attributes.Remove("disabled")

                gvd_Compañia.Enabled = True
                btn_AddCia.Attributes.Add("disabled", "true")
                txt_NotasColocacion.Enabled = True
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
                txt_Folio.Enabled = True
                txt_FRecibido.Enabled = False

                btn_SelOficina.Attributes.Add("disabled", "true")
                btn_SelAnteRamo.Attributes.Add("disabled", "true")
                btn_SelCobertura.Attributes.Add("disabled", "true")
                btn_SelSuscriptor.Attributes.Add("disabled", "true")
                btn_SelSucursal.Attributes.Add("disabled", "true")
                btn_SelProducto.Attributes.Add("disabled", "true")

                txt_SearchOfi.Enabled = False
                txt_SearchRamC.Enabled = False
                txt_SearchCob.Enabled = False
                txt_SearchSusc.Enabled = False
                txt_SearchSuc.Enabled = False
                txt_SearchRam.Enabled = False
                txt_SearchAse.Enabled = False
                txt_SearchGiro.Enabled = False
                txt_SearchAge.Enabled = False

                ddl_Moneda.Enabled = False
                ddl_TipoMov.Enabled = False

                txt_GiroAsegurado.Enabled = False
                txt_DescMov.Enabled = False
                txt_Aclaraciones.Enabled = False
                txt_ComAgente.Enabled = False
                txt_NroPoliza.Enabled = False
                txt_Sufijo.Enabled = False
                txt_VigIni.Enabled = False
                txt_DiasVig.Enabled = False
                txt_VigFin.Enabled = False
                txt_SumaAseg.Enabled = False
                txt_Prima.Enabled = False
                txt_Cuota.Enabled = False
                txt_Notas.Enabled = False

                chk_Target.Enabled = False

                '--------------------------------------
                btn_SelResponsable.Attributes.Add("disabled", "true")
                txt_SearchResp.Enabled = False

                ddl_Esquema.Enabled = False
                ddl_Estado.Enabled = False

                btn_Subjetividad.Attributes.Add("disabled", "true")

                chk_Subjetividad1.Enabled = False
                chk_Subjetividad2.Enabled = False
                chk_Subjetividad3.Enabled = False
                chk_Subjetividad4.Enabled = False
                chk_Subjetividad5.Enabled = False

                txt_Subjetividad1.Enabled = False
                txt_Subjetividad2.Enabled = False
                txt_Subjetividad3.Enabled = False
                txt_Subjetividad4.Enabled = False
                txt_Subjetividad5.Enabled = False

                txt_FecSubjetividad1.Enabled = False
                txt_FecSubjetividad2.Enabled = False
                txt_FecSubjetividad3.Enabled = False
                txt_FecSubjetividad4.Enabled = False
                txt_FecSubjetividad5.Enabled = False

                lst_Brokers.Enabled = False
                btn_AddBroker.Attributes.Add("disabled", "true")

                gvd_Compañia.Enabled = False
                btn_AddCia.Attributes.Add("disabled", "true")
                txt_NotasColocacion.Enabled = False
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

    Private Sub lst_Brokers_SelectedIndexChanged(sender As Object, e As EventArgs) Handles lst_Brokers.SelectedIndexChanged
        Try
            Dim Cadena As String

            ReDim Preserve dtSubjetividad(lst_Brokers.Items.Count - 1)
            ReDim Preserve dtReasegurador(lst_Brokers.Items.Count - 1)

            If hid_Indice.Value > -1 Then

                dtSubjetividad(hid_Indice.Value).Rows.Clear()
                dtSubjetividad(hid_Indice.Value).Rows.Add(txt_Subjetividad1.Text, txt_FecSubjetividad1.Text, chk_Subjetividad1.Checked)
                dtSubjetividad(hid_Indice.Value).Rows.Add(txt_Subjetividad2.Text, txt_FecSubjetividad2.Text, chk_Subjetividad2.Checked)
                dtSubjetividad(hid_Indice.Value).Rows.Add(txt_Subjetividad3.Text, txt_FecSubjetividad3.Text, chk_Subjetividad3.Checked)
                dtSubjetividad(hid_Indice.Value).Rows.Add(txt_Subjetividad4.Text, txt_FecSubjetividad4.Text, chk_Subjetividad4.Checked)
                dtSubjetividad(hid_Indice.Value).Rows.Add(txt_Subjetividad5.Text, txt_FecSubjetividad5.Text, chk_Subjetividad5.Checked)

                dtReasegurador(hid_Indice.Value).Rows.Clear()

                For Each Row In gvd_Compañia.Rows
                    Dim Elemento = TryCast(Row.FindControl("chk_SelCia"), HiddenField).Value

                    If Elemento <> "true" Then
                        Dim Clave As String = TryCast(Row.FindControl("lbl_ClaveCia"), Label).Text
                        Dim Descripcion As String = TryCast(Row.FindControl("lbl_Desc"), Label).Text

                        Dim lbl_Oculta1 As String = TryCast(Row.FindControl("lbl_Oculta1"), CheckBox).Checked
                        Dim lbl_Oculta4 As String = TryCast(Row.FindControl("lbl_Oculta4"), TextBox).Text
                        Dim lbl_Oculta5 As String = TryCast(Row.FindControl("lbl_Oculta5"), TextBox).Text
                        Dim lbl_Oculta6 As String = TryCast(Row.FindControl("lbl_Oculta6"), CheckBox).Checked
                        Dim lbl_Oculta7 As String = TryCast(Row.FindControl("lbl_Oculta7"), TextBox).Text
                        Dim lbl_Oculta8 As String = TryCast(Row.FindControl("lbl_Oculta8"), TextBox).Text
                        Dim lbl_Oculta9 As String = TryCast(Row.FindControl("lbl_Oculta9"), CheckBox).Checked
                        Dim lbl_Oculta10 As String = TryCast(Row.FindControl("lbl_Oculta10"), TextBox).Text
                        Dim lbl_Oculta11 As String = TryCast(Row.FindControl("lbl_Oculta11"), TextBox).Text

                        Cadena = lbl_Oculta1 & "|" & lbl_Oculta4 & "|" & lbl_Oculta5 & "|" & lbl_Oculta6 & "|" & lbl_Oculta7 & "|" & lbl_Oculta8 & "|" & lbl_Oculta9 & "|" & lbl_Oculta10 & "|" & lbl_Oculta11

                        Dim lbl_Oculta2 As String = TryCast(Row.FindControl("lbl_Oculta2"), TextBox).Text

                        Dim lbl_Oculta3 As String = TryCast(Row.FindControl("lbl_Oculta3"), TextBox).Text
                        Dim lbl_Oculta12 As String = TryCast(Row.FindControl("lbl_Oculta12"), DropDownList).SelectedValue

                        dtReasegurador(hid_Indice.Value).Rows.Add(Clave, Descripcion, Cadena, lbl_Oculta2, lbl_Oculta3 & "|" & lbl_Oculta12)
                    End If
                Next
            End If

            hid_Indice.Value = lst_Brokers.SelectedIndex

            If Split(lst_Brokers.SelectedValue, "-")(0) = 0 Then
                btn_Subjetividad.Attributes.Add("disabled", "true")
            Else
                btn_Subjetividad.Attributes.Remove("disabled")
            End If

            lbl_Intermediario.Text = IIf(Len(lst_Brokers.SelectedItem.Text) > 80, Mid(lst_Brokers.SelectedItem.Text, 1, 80) & "...", lst_Brokers.SelectedItem.Text)

            If dtSubjetividad(hid_Indice.Value) Is Nothing Then
                dtSubjetividad(hid_Indice.Value) = New DataTable
                dtSubjetividad(hid_Indice.Value).Columns.Add("Subjetividad")
                dtSubjetividad(hid_Indice.Value).Columns.Add("Fecha")
                dtSubjetividad(hid_Indice.Value).Columns.Add("sn_Subjetividad")
            End If

            If dtSubjetividad(hid_Indice.Value).Rows.Count = 5 Then
                txt_Subjetividad1.Text = dtSubjetividad(hid_Indice.Value).Rows(0)("Subjetividad")
                txt_FecSubjetividad1.Text = dtSubjetividad(hid_Indice.Value).Rows(0)("Fecha")
                chk_Subjetividad1.Checked = dtSubjetividad(hid_Indice.Value).Rows(0)("sn_Subjetividad")

                txt_Subjetividad2.Text = dtSubjetividad(hid_Indice.Value).Rows(1)("Subjetividad")
                txt_FecSubjetividad2.Text = dtSubjetividad(hid_Indice.Value).Rows(1)("Fecha")
                chk_Subjetividad2.Checked = dtSubjetividad(hid_Indice.Value).Rows(1)("sn_Subjetividad")

                txt_Subjetividad3.Text = dtSubjetividad(hid_Indice.Value).Rows(2)("Subjetividad")
                txt_FecSubjetividad3.Text = dtSubjetividad(hid_Indice.Value).Rows(2)("Fecha")
                chk_Subjetividad3.Checked = dtSubjetividad(hid_Indice.Value).Rows(2)("sn_Subjetividad")

                txt_Subjetividad4.Text = dtSubjetividad(hid_Indice.Value).Rows(3)("Subjetividad")
                txt_FecSubjetividad4.Text = dtSubjetividad(hid_Indice.Value).Rows(3)("Fecha")
                chk_Subjetividad4.Checked = dtSubjetividad(hid_Indice.Value).Rows(3)("sn_Subjetividad")

                txt_Subjetividad5.Text = dtSubjetividad(hid_Indice.Value).Rows(4)("Subjetividad")
                txt_FecSubjetividad5.Text = dtSubjetividad(hid_Indice.Value).Rows(4)("Fecha")
                chk_Subjetividad5.Checked = dtSubjetividad(hid_Indice.Value).Rows(4)("sn_Subjetividad")
            Else
                txt_Subjetividad1.Text = vbNullString
                txt_FecSubjetividad1.Text = vbNullString
                chk_Subjetividad1.Checked = False

                txt_Subjetividad2.Text = vbNullString
                txt_FecSubjetividad2.Text = vbNullString
                chk_Subjetividad2.Checked = False

                txt_Subjetividad3.Text = vbNullString
                txt_FecSubjetividad3.Text = vbNullString
                chk_Subjetividad3.Checked = False

                txt_Subjetividad4.Text = vbNullString
                txt_FecSubjetividad4.Text = vbNullString
                chk_Subjetividad4.Checked = False

                txt_Subjetividad5.Text = vbNullString
                txt_FecSubjetividad5.Text = vbNullString
                chk_Subjetividad5.Checked = False
            End If

            btn_AddCia.Attributes.Remove("disabled")

            If dtReasegurador(hid_Indice.Value) Is Nothing Then
                dtReasegurador(hid_Indice.Value) = New DataTable
                dtReasegurador(hid_Indice.Value).Columns.Add("Clave")
                dtReasegurador(hid_Indice.Value).Columns.Add("Descripcion")
                dtReasegurador(hid_Indice.Value).Columns.Add("OcultaCampo1")
                dtReasegurador(hid_Indice.Value).Columns.Add("OcultaCampo2")
                dtReasegurador(hid_Indice.Value).Columns.Add("OcultaCampo3")
            End If

            Funciones.LlenaGrid(gvd_Compañia, dtReasegurador(hid_Indice.Value))

        Catch ex As Exception
            Mensaje.MuestraMensaje("Mesa de Control", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Private Sub gvd_Compañia_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles gvd_Compañia.RowDataBound
        Try
            If e.Row.RowType = DataControlRowType.DataRow Then

                If Split(lst_Brokers.SelectedValue, "-")(0) <> 0 Then
                    Dim btn_Subjetividad As HtmlButton = TryCast(e.Row.FindControl("btn_Subjetividad"), HtmlButton)
                    btn_Subjetividad.Attributes.Add("disabled", "true")
                End If

                Dim indice As Integer = 1

                Dim lbl_Oculta3 As TextBox = TryCast(e.Row.FindControl("lbl_Oculta3"), TextBox)
                Dim lbl_Oculta12 As DropDownList = TryCast(e.Row.FindControl("lbl_Oculta12"), DropDownList)

                Dim adicionales() As String = Split(sender.DataKeys(e.Row.RowIndex)("OcultaCampo3"), "|")
                If UBound(adicionales) > 0 Then
                    lbl_Oculta3.Text = adicionales(0)
                    lbl_Oculta12.SelectedValue = adicionales(1)
                End If

                Dim cadena() As String = Split(sender.DataKeys(e.Row.RowIndex)("OcultaCampo1"), "|")

                If UBound(cadena) > 0 Then
                    TryCast(e.Row.FindControl("lbl_Oculta1"), CheckBox).Checked = cadena(0)
                    TryCast(e.Row.FindControl("lbl_Oculta4"), TextBox).Text = cadena(1)
                    TryCast(e.Row.FindControl("lbl_Oculta5"), TextBox).Text = cadena(2)

                    TryCast(e.Row.FindControl("lbl_Oculta6"), CheckBox).Checked = cadena(3)
                    TryCast(e.Row.FindControl("lbl_Oculta7"), TextBox).Text = cadena(4)
                    TryCast(e.Row.FindControl("lbl_Oculta8"), TextBox).Text = cadena(5)

                    TryCast(e.Row.FindControl("lbl_Oculta9"), CheckBox).Checked = cadena(6)
                    TryCast(e.Row.FindControl("lbl_Oculta10"), TextBox).Text = cadena(7)
                    TryCast(e.Row.FindControl("lbl_Oculta11"), TextBox).Text = cadena(8)
                End If

            End If
        Catch ex As Exception
            Mensaje.MuestraMensaje("Mesa de Control", ex.Message, TipoMsg.Falla)
        End Try
    End Sub
End Class
