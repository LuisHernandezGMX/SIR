Imports Microsoft.VisualBasic

Public Class Catalogo
    Private _Clave As String
    Private _Descripcion As String

    Public Sub Catalogo(ByVal clave As String, ByVal descripcion As String)
        Me.Clave = clave
        Me.Descripcion = descripcion
    End Sub

    Public Property Clave() As String
        Get
            Return _Clave
        End Get
        Set(ByVal value As String)
            _Clave = value
        End Set
    End Property

    Public Property Descripcion() As String
        Get
            Return _Descripcion
        End Get
        Set(ByVal value As String)
            _Descripcion = value
        End Set
    End Property
End Class
