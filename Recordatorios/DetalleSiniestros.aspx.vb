
Imports System.Data
Partial Class Recordatorios_DetalleSiniestros
    Inherits System.Web.UI.Page

    Private Sub Recordatorios_DetalleSiniestros_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim FechaGen As String
        FechaGen = Replace(Request.QueryString("FechaRpt"), "", vbNullString)

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


            lFiltros = ws.ObtieneVersionReporte(Cons.RptFac, -1, "")
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

                'cambiar el orden de los parametros. REvisar luego
                Resultado = Funciones.Lista_A_Datatable(wsR.ObtieneSiniestros(1, Replace(FiltroNoSin, "", vbNullString), Replace(FiltroBroker, "", vbNullString), Replace(FiltroAse, "", vbNullString), Replace(FiltroCia, "", vbNullString), Replace(FiltroRamoC, "", vbNullString), Replace(FechaGen, "", vbNullString), Replace(FechaGen, "", vbNullString), Replace(FiltroPol, "", vbNullString)).ToList)
                gvd_Siniestros.DataSource = Resultado
                gvd_Siniestros.DataBind()


            End If

        Catch ex As Exception
            Mensaje.MuestraMensaje("", "", Mensaje.TipoMsg.Falla)

        End Try



    End Sub
End Class
