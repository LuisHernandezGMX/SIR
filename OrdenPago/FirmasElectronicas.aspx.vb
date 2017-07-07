
Imports Mensaje
Partial Class OrdenPago_FirmasElectronicas
    Inherits System.Web.UI.Page

    Private Sub btn_BuscaOP_Click(sender As Object, e As EventArgs) Handles btn_BuscaOP.Click

    End Sub

    Private Sub btn_Firmar_Click(sender As Object, e As EventArgs) Handles btn_Firmar.Click
        Funciones.AbrirModal("#Autorizacion")
    End Sub
End Class
