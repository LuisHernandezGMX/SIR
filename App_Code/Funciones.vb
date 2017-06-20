Imports System.ComponentModel
Imports System.Data
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

    Public Shared Function Lista_A_Datatable(Of T)(iList As List(Of T)) As DataTable
        Dim dataTable As New DataTable()
        Dim propertyDescriptorCollection As PropertyDescriptorCollection = TypeDescriptor.GetProperties(GetType(T))
        For i As Integer = 0 To propertyDescriptorCollection.Count - 1
            Dim propertyDescriptor As PropertyDescriptor = propertyDescriptorCollection(i)
            Dim type As Type = propertyDescriptor.PropertyType

            If type.IsGenericType AndAlso type.GetGenericTypeDefinition() = GetType(Nullable(Of )) Then
                type = Nullable.GetUnderlyingType(type)
            End If

            dataTable.Columns.Add(propertyDescriptor.Name, type)
        Next
        Dim values As Object() = New Object(propertyDescriptorCollection.Count - 1) {}
        For Each iListItem As T In iList
            For i As Integer = 0 To values.Length - 1
                values(i) = propertyDescriptorCollection(i).GetValue(iListItem)
            Next
            dataTable.Rows.Add(values)
        Next
        Return dataTable
    End Function
End Class
