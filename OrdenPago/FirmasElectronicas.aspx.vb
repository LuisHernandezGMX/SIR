
Imports Mensaje
Partial Class OrdenPago_FirmasElectronicas
    Inherits System.Web.UI.Page

    Private Sub btn_BuscaOP_Click(sender As Object, e As EventArgs) Handles btn_BuscaOP.Click

    End Sub

    Private Sub btn_Firmar_Click(sender As Object, e As EventArgs) Handles btn_Firmar.Click
        Try
            Mensaje.MuestraMensaje("Firmas Electronicas", "La firma ha sido satisfactoria", TipoMsg.Confirma)
        Catch ex As Exception
            Mensaje.MuestraMensaje("Firmas Electronicas", ex.Message, TipoMsg.Falla)
        End Try
    End Sub
End Class
