
Imports Mensaje
Partial Class Distribucion_ResumenTemporario
    Inherits System.Web.UI.Page

    Private Sub btn_Reporte_Click(sender As Object, e As EventArgs) Handles btn_Reporte.Click
        Try
            Dim ws As New ws_Generales.GeneralesClient
            Dim server As String = ws.ObtieneParametro(8)

            server = Replace(Replace(server, "@Reporte", "Temporario"), "@Formato", "EXCEL") & "&id_pv=" & txt_Temporario.Text

            Funciones.EjecutaFuncion("window.open('" & server & "');")

        Catch ex As Exception
            Mensaje.MuestraMensaje("Resumen Temporario", ex.Message, TipoMsg.Falla)
        End Try
    End Sub
End Class
