Imports Mensaje
Imports System.Data
Imports System.Data.SqlClient

Partial Class Pages_Inicio
    Inherits System.Web.UI.Page

    Private Sub btn_Aceptar_Click(sender As Object, e As EventArgs) Handles btn_Aceptar.Click
        Mensaje.MuestraMensaje("Inicio", "Acción del botón Aceptar en CodeBehind", TipoMsg.Confirma)
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



        If Not IsPostBack Then

        End If


    End Sub

    <System.Web.Services.WebMethod>
    Public Shared Function ObtieneDatos(ByVal Consulta As String) As List(Of Catalogo)
        Dim sCnn As String

        Consulta = Replace(Consulta, "==", "'")

        sCnn = ConfigurationManager.ConnectionStrings("CadenaConexion").ConnectionString

        Dim da As SqlDataAdapter
        Dim dt As New DataTable

        da = New SqlDataAdapter(Consulta, sCnn)
        da.Fill(dt)

        Dim Lista = New List(Of Catalogo)

        Dim varCatalogo As Catalogo

        For Each dr In dt.Rows
            varCatalogo = New Catalogo
            varCatalogo.Catalogo(dr("Clave"), dr("Descripcion"))
            Lista.Add(varCatalogo)
        Next

        Return Lista
    End Function



End Class
