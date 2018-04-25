
Imports System.Data

Partial Class Reportes_Bdx_BdxFechaDistribucion
    Inherits System.Web.UI.Page

    Private Sub Reportes_Bdx_BdxFechaDistribucion_Load(sender As Object, e As EventArgs) Handles Me.Load
        Funciones.LlenaCatDDL(ddl_TipoContrato, "Tct",,,,, -1)
        If Not IsPostBack Then
            hidEjercicio.Value = Now.ToString("yyyy")
        End If
    End Sub

    'Protected Sub opcEstim_CheckedChanged(sender As Object, e As EventArgs)
    '    opcPagos.Checked = False
    '    opcAmbos.Checked = False
    'End Sub
    'Protected Sub opcPagos_CheckedChanged(sender As Object, e As EventArgs)
    '    opcEstim.Checked = False
    '    opcAmbos.Checked = False
    'End Sub

    Private Sub btn_Reporte_Click(sender As Object, e As EventArgs) Handles btn_Reporte.Click
        Try
            If txtFecGeneraDe.Text <> vbNullString Then
                If txtFecGeneraA.Text <> vbNullString Then

                    If ddl_tiporeporte.SelectedItem.Value <> 9 Then
                        Dim FiltroBroker As String = vbNullString
                        Dim FiltroCia As String = vbNullString
                        Dim FiltroPoliza As String = vbNullString
                        Dim FiltroNoStro As String = vbNullString
                        Dim FiltroAseg As String = vbNullString
                        Dim FiltroEvento As String = vbNullString
                        Dim FiltroRamC As String = vbNullString
                        Dim FiltroCto As String = vbNullString
                        Dim FiltroCtoL As String = vbNullString


                        Dim ws As New ws_Generales.GeneralesClient
                        Dim server As String = ws.ObtieneParametro(9)

                        FiltroNoStro = txt_Siniestros.Text
                        FiltroAseg = txtSearchAse.Text
                        FiltroEvento = txtSearchEve.Text
                        FiltroBroker = Funciones.ObtieneElementos(gvd_Broker, "Bro", False)
                        FiltroCia = Funciones.ObtieneElementos(gvd_Compañia, "Cia", False)
                        FiltroPoliza = Funciones.ObtieneElementos(gvd_Poliza, "Pol", False)
                        FiltroRamC = Funciones.ObtieneElementos(gvd_RamoContable, "RamC", False)
                        FiltroCto = Funciones.ObtieneElementos(gvdContrato, "Cto", False)
                        FiltroCtoL = Funciones.ObtieneElementos(gvdCtoLocal, "CtoL", False)
                        Dim FiltroPaso As String()
                        Dim FiltroCtoFinal As String = vbNullString
                        Dim FiltroCtoLFinal As String = vbNullString

                        If FiltroCto = vbNullString Then
                            FiltroCto = txt_Contrato.Text
                        End If

                        If FiltroCto <> vbNullString Then

                            FiltroPaso = FiltroCto.Split(",")

                            For x = 0 To FiltroPaso.Count - 1
                                FiltroCtoFinal = FiltroCtoFinal & "," & "|" & FiltroPaso(x).ToString() & "|"
                            Next
                            FiltroCtoFinal = FiltroCtoFinal.Substring(1, Len(FiltroCtoFinal) - 1)
                        End If

                        If FiltroCtoL <> vbNullString Then

                            FiltroPaso = FiltroCtoL.Split(",")

                            For x = 0 To FiltroPaso.Count - 1
                                FiltroCtoLFinal = FiltroCtoLFinal & "," & "|" & FiltroPaso(x).ToString() & "|"
                            Next
                            FiltroCtoLFinal = FiltroCtoLFinal.Substring(1, Len(FiltroCtoLFinal) - 1)
                        End If

                        Dim RptFilters As String
                        RptFilters = "&fec_desde=" & CDate(txtFecGeneraDe.Text).ToString("yyyyMMdd")
                        RptFilters = RptFilters & "&fec_hasta=" & CDate(txtFecGeneraA.Text).ToString("yyyyMMdd")
                        RptFilters = RptFilters & "&Tipo_repo=" & ddl_tiporeporte.SelectedItem.Value

                        RptFilters = RptFilters & IIf(FiltroBroker <> "", "&cod_broker=" & FiltroBroker, "")
                        RptFilters = RptFilters & IIf(FiltroCia <> "", "&cod_cia=" & FiltroCia, "")
                        RptFilters = RptFilters & IIf(ddl_TipoContrato.SelectedItem.Text <> ". . .", "&tipo_contrato=" & ddl_TipoContrato.SelectedValue, "")
                        RptFilters = RptFilters & "&sn_resumen=" & ddl_Agrupado.SelectedValue
                        RptFilters = RptFilters & IIf(FiltroNoStro <> "", "&nro_stro=" & FiltroNoStro, "")
                        RptFilters = RptFilters & IIf(FiltroRamC <> "", "&cod_ramo_conta=" & FiltroRamC, "")
                        RptFilters = RptFilters & IIf(FiltroPoliza <> "", "&poliza_idpv=" & FiltroPoliza, "")
                        RptFilters = RptFilters & IIf(FiltroEvento <> "", "&evento_cat=" & FiltroEvento, "")
                        RptFilters = RptFilters & IIf(FiltroAseg <> "", "&aseg=" & FiltroAseg, "")
                        RptFilters = RptFilters & IIf(FiltroCtoFinal <> "", "&contrato=" & FiltroCtoFinal, "")
                        RptFilters = RptFilters & IIf(FiltroCtoLFinal <> "", "&contrato_local=" & FiltroCtoLFinal, "")
                        RptFilters = RptFilters & IIf(chk_NoFilter.Checked = True And ddl_tiporeporte.SelectedItem.Value = 0, "&filtrofd=1", "&filtrofd=0")

                        server = Replace(Replace(server, "@Reporte", "BdxMovFecDist"), "@Formato", "EXCEL")

                        server = server & RptFilters

                        Funciones.EjecutaFuncion("window.open('" & server & "');")
                    Else
                        Mensaje.MuestraMensaje("Borderaux", "Debe seleccionar un Tipo de Reporte", Mensaje.TipoMsg.Advertencia)

                    End If
                Else
                    Mensaje.MuestraMensaje("Borderaux", "Debe seleccionar la fecha final", Mensaje.TipoMsg.Advertencia)

                End If
            Else
                Mensaje.MuestraMensaje("Borderaux", "Debe seleccionar una fecha inicial", Mensaje.TipoMsg.Advertencia)
            End If
        Catch ex As Exception
            Mensaje.MuestraMensaje("Borderaux", ex.Message, Mensaje.TipoMsg.Falla)
        End Try
    End Sub


    Private Sub btn_AddPol_Click(sender As Object, e As EventArgs) Handles btn_AddPol.Click
        Try
            Master.MuestraPolizario("gvd_Poliza", False, False, False, False, False, False)
        Catch ex As Exception
            Mensaje.MuestraMensaje("Firmas Electrónicas", ex.Message, Mensaje.TipoMsg.Falla)
        End Try
    End Sub

    Protected Sub ddlEjercicio_SelectedIndexChanged(sender As Object, e As EventArgs)
        hidEjercicio.Value = ddlEjercicio.SelectedItem.Text
    End Sub

    Private Sub btn_HistAJ_Click(sender As Object, e As EventArgs) Handles btn_HistAJ.Click
        CargaModalHist(CDate(txtFecDesde.Text).ToString("yyyyMMdd"), CDate(txtFecHasta.Text).ToString("yyyyMMdd"))
        Funciones.AbrirModal("#HistoricoModal")

    End Sub
    Private Sub CargaModalHist(Fecha_desde As String, fecha_hasta As String)
        Dim wsGmx As New ws_Reportes.BordereauxClient
        Dim Resultado As New DataTable
        Try

            Resultado = Funciones.Lista_A_Datatable(wsGmx.GetAjustesHist(Fecha_desde, fecha_hasta).ToList)
            gvd_Historicos.DataSource = Resultado
            gvd_Historicos.DataBind()
        Catch ex As Exception
            Resultado = Nothing
        End Try
    End Sub

    Private Sub btn_CerrarModHist_Click(sender As Object, e As EventArgs) Handles btn_CerrarModHist.Click
        gvd_Historicos.DataSource = Nothing
        gvd_Historicos.DataBind()
        Funciones.CerrarModal("#HistoricoModal")
    End Sub

    Private Sub ddl_tiporeporte_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddl_tiporeporte.SelectedIndexChanged
        If ddl_tiporeporte.SelectedItem.Value = 0 Then
            chk_NoFilter.Visible = True
        Else
            chk_NoFilter.Visible = False

        End If
    End Sub
End Class
