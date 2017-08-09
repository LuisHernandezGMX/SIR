
Imports System.Data
Partial Class Recordatorios_DetalleSiniestros
    Inherits System.Web.UI.Page

    Private Sub gvd_Siniestros_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles gvd_Siniestros.RowCommand
        Dim Indice As Int32
        Indice = e.CommandArgument
        Dim NoSiniestro As Integer
        Dim wsGmx As New ws_RecSiniestros.RecSiniestrosClient
        Dim Resultado As New DataTable
        Resultado = Nothing
        Try
            If e.CommandName = "MuestraDetalle" Then
                NoSiniestro = gvd_Siniestros.DataKeys(Indice).Value
                Resultado = Funciones.Lista_A_Datatable(wsGmx.ObtieneSiniestros(IIf(opcFac.Checked, Cons.TipoMov.Fac, Cons.TipoMov.Esp), NoSiniestro, vbNullString, vbNullString, vbNullString, vbNullString, vbNullString, vbNullString, vbNullString).ToList)
                gvd_Detalle.DataSource = Resultado
                gvd_Detalle.DataBind()
            End If
        Catch ex As Exception
            Mensaje.MuestraMensaje("Error", "Falla al obtener información", Mensaje.TipoMsg.Falla)
        End Try


    End Sub

    Private Sub Recordatorios_DetalleSiniestros_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim FechaGen As String
        If Not IsPostBack Then
            FechaGen = Replace(Request.QueryString("FechaRpt"), "", vbNullString)
            Session.Add("FechaGen", "")
            Session("FechaGen") = FechaGen
            CargaConsulta(Cons.TipoMov.Fac, FechaGen)

        End If


    End Sub
    Private Sub CargaConsulta(TipoMov As Integer, FechaGen As String)
        Dim ws As New ws_Reporteador.ReporteadorClient
        Dim lFiltros As IList = Nothing
        Dim lFiltrosF As IList = Nothing
        Dim Filtros As String() = Nothing
        Dim FiltroBroker As String = ""
        Dim FiltroCia As String = ""
        Dim FiltroPol As String = ""
        Dim FiltroRamoC As String = ""
        Dim FiltroAse As String = ""
        Dim FiltroNoSin As String = ""
        Dim inicio As Integer
        Dim fin As Integer

        Try


            lFiltros = ws.ObtieneVersionReporte(IIf(TipoMov = 1, Cons.RptFac, Cons.RptEsp), -1, "")
            Dim Elementos As Integer = lFiltros.Count

            If Elementos > 0 Then
                Filtros = Strings.Split(lFiltros(Elementos - 1).filtros, "&")

                For Indice = 1 To Filtros.Count - 1
                    inicio = InStr(Filtros(Indice), "=")
                    fin = Len(Filtros(Indice))
                    If fin <> inicio Then
                        Select Case Indice
                            Case 1
                                FiltroBroker = Filtros(Indice).Substring(inicio, fin - inicio)
                            Case 2
                                FiltroCia = Filtros(Indice).Substring(inicio, fin - inicio)
                            Case 3
                                FiltroPol = Filtros(Indice).Substring(inicio, fin - inicio)
                            Case 4
                                FiltroRamoC = Filtros(Indice).Substring(inicio, fin - inicio)
                            Case 5
                                FiltroAse = Filtros(Indice).Substring(inicio, fin - inicio)
                            Case 6
                                FiltroNoSin = Filtros(Indice).Substring(inicio, fin - inicio)
                        End Select
                    End If
                Next

                Dim Resultado As New DataTable
                Dim wsR As New ws_RecSiniestros.RecSiniestrosClient

                'cambiar el orden de los parametros. Revisar luego
                Resultado = Funciones.Lista_A_Datatable(wsR.ObtieneSiniestros(TipoMov, Replace(FiltroNoSin, "", vbNullString),
                                      Replace(FiltroBroker, "", vbNullString), Replace(FiltroAse, "", vbNullString),
                                      Replace(FiltroCia, "", vbNullString), Replace(FiltroRamoC, "", vbNullString),
                                      Replace(FiltroPol, "", vbNullString), Replace(FechaGen, "", vbNullString),
                                      Replace(FechaGen, "", vbNullString)).ToList())

                gvd_Siniestros.DataSource = Resultado
                gvd_Siniestros.DataBind()


            End If

        Catch ex As Exception
            Mensaje.MuestraMensaje("", "", Mensaje.TipoMsg.Falla)

        End Try
    End Sub
    Protected Sub opcFac_CheckedChanged(sender As Object, e As EventArgs)
        opcEsp.Checked = False
        Limpiar()
        Dim FechaGen As String
        FechaGen = Session("FechaGen")
        CargaConsulta(Cons.TipoMov.Fac, FechaGen)
    End Sub
    Protected Sub opcEsp_CheckedChanged(sender As Object, e As EventArgs)
        opcFac.Checked = False
        Limpiar()
        Dim FechaGen As String
        FechaGen = Session("FechaGen")
        CargaConsulta(Cons.TipoMov.Esp, FechaGen)
    End Sub
    Private Sub Limpiar()
        gvd_Siniestros.DataSource = Nothing
        gvd_Siniestros.DataBind()
        gvd_Detalle.DataSource = Nothing
        gvd_Detalle.DataBind()

    End Sub

    Private Sub gvd_Siniestros_PageIndexChanging(sender As Object, e As GridViewPageEventArgs) Handles gvd_Siniestros.PageIndexChanging
        gvd_Siniestros.PageIndex = e.NewPageIndex
        Dim FechaGen As String
        FechaGen = Session("FechaGen")
        CargaConsulta(IIf(opcFac.Checked, Cons.TipoMov.Fac, Cons.TipoMov.Esp), FechaGen)
    End Sub

    Private Sub btn_Enviar_Click(sender As Object, e As EventArgs) Handles btn_Enviar.Click
        'chkSeguir
    End Sub
End Class
