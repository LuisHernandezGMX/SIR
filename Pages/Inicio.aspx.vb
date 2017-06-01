Imports Mensaje
Imports System.Data


Partial Class Pages_Inicio
    Inherits System.Web.UI.Page

    Private Sub btn_Aceptar_Click(sender As Object, e As EventArgs) Handles btn_Aceptar.Click
        Mensaje.MuestraMensaje("Inicio", "Acción del botón Aceptar en CodeBehind", TipoMsg.Confirma)
    End Sub

    Private Sub btn_Buscar_Click(sender As Object, e As EventArgs) Handles btn_Buscar.Click

    End Sub

    Private Sub btn_Cancelar_Click(sender As Object, e As EventArgs) Handles btn_Cancelar.Click
        Mensaje.MuestraMensaje("Inicio", "Acción del botón Cancelar en CodeBehind", TipoMsg.Confirma)
    End Sub

    Private Sub gvd_Broker_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles gvd_Broker.RowCommand
        If e.CommandName = "Delete" Then
            Mensaje.MuestraMensaje("Inicio", "El registro se eliminó satisfactoriamente", TipoMsg.Confirma)
        End If
    End Sub

    Private Sub gvd_Broker_RowDeleting(sender As Object, e As GridViewDeleteEventArgs) Handles gvd_Broker.RowDeleting

    End Sub

    Private Sub Pages_Inicio_Load(sender As Object, e As EventArgs) Handles Me.Load

    End Sub


End Class
