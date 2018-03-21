
Partial Class Reportes_CatReas
    Inherits System.Web.UI.Page

    Private Sub btn_Reporte_Click(sender As Object, e As EventArgs) Handles btn_Reporte.Click
        Dim ws As New ws_Generales.GeneralesClient

        Try
            Dim server As String = ws.ObtieneParametro(9)
            server = Replace(Replace(server, "@Reporte", "CatalogoReas"), "@Formato", "EXCEL")
            Funciones.EjecutaFuncion("window.open('" & server & "');")

        Catch ex As Exception

        End Try


    End Sub
End Class
