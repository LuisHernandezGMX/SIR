Imports Mensaje
Partial Class OrdenPago_CalendarioPago
    Inherits System.Web.UI.Page

    Private Sub OrdenPago_CalendarioPago_Load(sender As Object, e As EventArgs) Handles Me.Load
        Try
            If Not IsPostBack Then
                Funciones.LlenaCatDDL(ddl_Moneda, "Mon")
            End If
        Catch ex As Exception

        End Try
    End Sub

    Private Sub btn_AddPol_Click(sender As Object, e As EventArgs) Handles btn_AddPol.Click
        Try
            Master.MuestraPolizario("gvd_Poliza",, 0)
        Catch ex As Exception
            Mensaje.MuestraMensaje("Calendario Pagos", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Private Sub btn_Reporte_Click(sender As Object, e As EventArgs) Handles btn_Reporte.Click
        Try
            If Not IsDate(txtFecGeneraDe.Text) And Not IsDate(txtFecGeneraA.Text) Then
                Mensaje.MuestraMensaje("Calendario Pagos", "Se debe establecer un rango de fechas válido", TipoMsg.Advertencia)
                Exit Sub
            End If

            Dim server As String = "http://siigmxapp02/ReportServer_SIIGMX02?%2fReportesGMX%2f"

            server = server & "EstimacionOP" & "&rc:Parameters=false" & ObtieneFiltros() & "&intMoneda=" & IIf(ddl_Moneda.SelectedIndex = 2, -1, ddl_Moneda.SelectedValue)

            Funciones.EjecutaFuncion("window.open('" & server & "');")
        Catch ex As Exception
            Mensaje.MuestraMensaje("Calendario Pagos", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Private Function ObtieneFiltros() As String
        Dim Elementos As String
        Dim FiltroPol As String = "&FiltroPol="
        Dim FiltroRamoCont As String = "&FiltroRamoCont="
        Dim FiltroRamoTec As String = "&FiltroRamoTec="
        Dim FiltroFechaIni As String = "&FechaGarIni=" & txtFecGeneraDe.Text
        Dim FiltroFechaFin As String = "&FechaGarFin=" & txtFecGeneraA.Text
        Dim FiltroSalida As String = "&intSalida=0"


        Elementos = Funciones.ObtieneElementos(gvd_Poliza, "Pol", True)
        If Elementos <> "" Then
            FiltroPol = FiltroPol & Replace(Elementos, "'", "|")
        End If

        Elementos = Funciones.ObtieneElementos(gvd_RamoContable, "RamC", False)
        If Elementos <> "" Then
            FiltroRamoCont = FiltroRamoCont & Elementos
        End If

        Elementos = Funciones.ObtieneElementos(gvd_Producto, "Pro", False)
        If Elementos <> "" Then
            FiltroRamoTec = FiltroRamoTec & Elementos
        End If

        Return FiltroPol & FiltroRamoCont & FiltroRamoTec & FiltroFechaIni & FiltroFechaFin & FiltroSalida
    End Function
End Class
