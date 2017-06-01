Imports Microsoft.VisualBasic

Public Class Funciones
    Public Shared Function AbrirModal(ByVal modal As String) As Boolean
        Dim page As Page = HttpContext.Current.CurrentHandler
        ScriptManager.RegisterClientScriptBlock(page, GetType(Page), "Abrir", "fn_AbrirModal('" & modal & "');", True)
        Return True
    End Function

    Public Shared Function CerrarModal(ByVal modal As String) As Boolean
        Dim page As Page = HttpContext.Current.CurrentHandler
        ScriptManager.RegisterClientScriptBlock(page, GetType(Page), "Cerrar", "fn_CerrarModal('" & modal & "');", True)
        Return True
    End Function
End Class
