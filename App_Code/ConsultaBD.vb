Imports System.Data
Imports System.Data.SqlClient
Imports System.Web
Imports System.Web.Script.Services
Imports System.Web.Services
Imports System.Web.Services.Protocols

' To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line.
' <System.Web.Script.Services.ScriptService()> _
<WebService(Namespace:="http://tempuri.org/")>
<WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)>
<ScriptService>
Public Class ConsultaBD
    Inherits System.Web.Services.WebService

    <WebMethod()>
    <ScriptMethod(ResponseFormat:=ResponseFormat.Json)>
    Public Function GetFase(ByVal Id As Integer) As String
        Dim ws As New ws_Generales.GeneralesClient
        Dim dtResult As New DataTable
        Dim Salida As String = vbNullString
        Try
            dtResult = Funciones.Lista_A_Datatable(ws.ObtieneCatalogo("Fas", "Where id_fase=" & Id.ToString(), "").ToList)
            If Not dtResult Is Nothing Then
                Salida = dtResult.Rows(0).ItemArray(2).ToString
            End If
        Catch ex As Exception
            Salida = vbNullString
        End Try
        Return Salida
    End Function

    <WebMethod()>
    <ScriptMethod(ResponseFormat:=ResponseFormat.Json)>
    Public Function GetDeptos(ByVal Id As Integer) As String
        Dim ws As New ws_Generales.GeneralesClient
        Dim dtResult As New DataTable
        Dim Salida As String = vbNullString
        Try
            dtResult = Funciones.Lista_A_Datatable(ws.ObtieneCatalogo("Sec", "Where cod_sector=" & Id, "").ToList)
            If Not dtResult Is Nothing Then
                Salida = dtResult.Rows(0).ItemArray(2).ToString
            End If
        Catch ex As Exception
            Salida = vbNullString
        End Try
        Return Salida
    End Function

    <WebMethod()>
    <ScriptMethod(ResponseFormat:=ResponseFormat.Json)>
    Public Function GetProducto(ByVal Id As Integer) As String
        Dim ws As New ws_Generales.GeneralesClient
        Dim dtResult As New DataTable
        Dim Salida As String = vbNullString
        Try
            dtResult = Funciones.Lista_A_Datatable(ws.ObtieneCatalogo("RamU", "AND cod_ramo=" & Id.ToString(), "").ToList)
            If Not dtResult Is Nothing Then
                Salida = dtResult.Rows(0).ItemArray(2).ToString
            End If
        Catch ex As Exception
            Salida = vbNullString
        End Try
        Return Salida
    End Function

End Class