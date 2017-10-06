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
                txt_SearchResp.Enabled = False
                btn_SelResponsable.Enabled = False
                txt_SearchOfi.Enabled = False
                btn_SelOficina.Enabled = False
                txt_SearchSusc.Enabled = False
                btn_SelSuscriptor.Enabled = False

                ddl_TipoMov.Enabled = False
                txt_DescMov.Enabled = False
                txt_SearchBro.Enabled = False
                btn_SelBroker.Enabled = False
                txt_VigIni.Enabled = False
                txt_VigFin.Enabled = False
                txt_FecOfrecimiento.Enabled = False
                txt_FecConfirmacion.Enabled = False

                txt_SearchAse.Enabled = False
                txt_SearchRamC.Enabled = False
                btn_SelAnteRamo.Enabled = False
                txt_ClaveRam.Enabled = False
                txt_SearchRam.Enabled = False
                txt_SearchGiro.Enabled = False
                txt_GiroAsegurado.Enabled = False

                ddl_TipoColoca.Enabled = False
                ddl_Estado.Enabled = False

                ddl_Moneda.Enabled = False
                txt_SumaAseg.Enabled = False
                txt_Prima.Enabled = False

                txt_ObsSuscriptor.Enabled = False
                txt_ObsConducto.Enabled = False
                txt_OfiSuscriptor.Enabled = False

                chk_Suscriptor.Enabled = False
                chk_Reaseguro.Enabled = False
                chk_Conducto.Enabled = False
                ddl_EstatusPol.Enabled = False
                ddl_EstatusDSV.Enabled = False

                gvd_Compañia.Enabled = False
                btn_AddCia.Visible = False

                btn_Nuevo.Visible = False
                btn_Consultar.Visible = False
                btn_Modificar.Visible = IIf(intOperacion = Operacion.Anula, False, True)
                btn_Anular.Visible = IIf(intOperacion = Operacion.Anula, False, True)

                btn_Guardar.Visible = IIf(intOperacion = Operacion.Consulta, False, True)
                btn_Cancelar.Visible = True



            Case Operacion.Nuevo, Operacion.Modifica
                txt_Folio.Enabled = False
                txt_FRecibido.Enabled = True
                txt_SearchResp.Enabled = True
                btn_SelResponsable.Enabled = True
                txt_SearchOfi.Enabled = True
                btn_SelOficina.Enabled = True
                txt_SearchSusc.Enabled = True
                btn_SelSuscriptor.Enabled = True

                ddl_TipoMov.Enabled = True
                txt_DescMov.Enabled = True
                txt_SearchBro.Enabled = True
                btn_SelBroker.Enabled = True
                txt_VigIni.Enabled = True
                txt_VigFin.Enabled = True
                txt_FecOfrecimiento.Enabled = True
                txt_FecConfirmacion.Enabled = True

                txt_SearchAse.Enabled = True
                txt_SearchRamC.Enabled = True
                btn_SelAnteRamo.Enabled = True
                txt_ClaveRam.Enabled = True
                txt_SearchRam.Enabled = True
                txt_SearchGiro.Enabled = True
                txt_GiroAsegurado.Enabled = True

                ddl_TipoColoca.Enabled = True
                ddl_Estado.Enabled = True

                ddl_Moneda.Enabled = True
                txt_SumaAseg.Enabled = True
                txt_Prima.Enabled = True

                txt_ObsSuscriptor.Enabled = True
                txt_ObsConducto.Enabled = True
                txt_OfiSuscriptor.Enabled = True

                chk_Suscriptor.Enabled = True
                chk_Reaseguro.Enabled = True
                chk_Conducto.Enabled = True
                ddl_EstatusPol.Enabled = True
                ddl_EstatusDSV.Enabled = True

                gvd_Compañia.Enabled = True
                btn_AddCia.Visible = True

                btn_Nuevo.Visible = False
                btn_Consultar.Visible = False
                btn_Modificar.Visible = False
                btn_Anular.Visible = False

                btn_Guardar.Visible = True
                btn_Cancelar.Visible = True

            Case Operacion.Ninguna
                txt_Folio.Enabled = True
                txt_FRecibido.Enabled = False
                txt_SearchResp.Enabled = False
                btn_SelResponsable.Enabled = False
                txt_SearchOfi.Enabled = False
                btn_SelOficina.Enabled = False
                txt_SearchSusc.Enabled = False
                btn_SelSuscriptor.Enabled = False

                ddl_TipoMov.Enabled = False
                txt_DescMov.Enabled = False
                txt_SearchBro.Enabled = False
                btn_SelBroker.Enabled = False
                txt_VigIni.Enabled = False
                txt_VigFin.Enabled = False
                txt_FecOfrecimiento.Enabled = False
                txt_FecConfirmacion.Enabled = False

                txt_SearchAse.Enabled = False
                txt_SearchRamC.Enabled = False
                btn_SelAnteRamo.Enabled = False
                txt_ClaveRam.Enabled = False
                txt_SearchRam.Enabled = False
                txt_SearchGiro.Enabled = False
                txt_GiroAsegurado.Enabled = False

                ddl_TipoColoca.Enabled = False
                ddl_Estado.Enabled = False

                ddl_Moneda.Enabled = False
                txt_SumaAseg.Enabled = False
                txt_Prima.Enabled = False

                txt_ObsSuscriptor.Enabled = False
                txt_ObsConducto.Enabled = False
                txt_OfiSuscriptor.Enabled = False

                chk_Suscriptor.Enabled = False
                chk_Reaseguro.Enabled = False
                chk_Conducto.Enabled = False
                ddl_EstatusPol.Enabled = False
                ddl_EstatusDSV.Enabled = False

                gvd_Compañia.Enabled = False
                btn_AddCia.Visible = False

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
End Class
