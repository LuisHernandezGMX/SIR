
Partial Class Reportes_Reporteador
    Inherits System.Web.UI.Page

    Private Sub Reportes_Reporteador_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then

        End If

    End Sub
    Protected Sub Esconde_Click(sender As Object, e As ImageClickEventArgs)
        Funciones.EjecutaFuncion("fn_NoDesplazable('" & sender.AlternateText & "','" & Replace(sender.AlternateText, "div", "hid") & "')")
    End Sub

    Protected Sub Flotante_Click(sender As Object, e As ImageClickEventArgs)
        Funciones.EjecutaFuncion("fn_Desplazable('" & sender.AlternateText & "');")
    End Sub

    Private Sub btn_AddPol_Click(sender As Object, e As ImageClickEventArgs) Handles btn_AddPol.Click
        Master.MuestraPolizario("gvd_Poliza", False, False, True, True, False)
    End Sub
End Class


