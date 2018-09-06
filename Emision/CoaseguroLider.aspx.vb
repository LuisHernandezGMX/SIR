Imports System.Web.Services
Imports System.Web.Script.Services

Partial Class Emision_Coaseguro
    Inherits System.Web.UI.Page

    Protected Property CoaseguradorasJson As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        Using db As New UATEntities
            ' Catálogo de Prueba
            ' 1 = GMX, 9 = Grupo Nacional Provincial (que ya lo tenemos en la vista como líder)
            ' En la práctica se filtrará el cod_cia con el ID que provenga del SII
            Dim coaseguradoras = db.mcia _
                .Where(Function(cia) cia.cod_cia <> 1 AndAlso cia.cod_cia <> 9) _
                .Select(Function(cia) New With {.Id = cia.cod_cia, .Nombre = cia.txt_nom_cia}) _
                .ToList()

            ' Por ahora no contamos con Newtonsoft (NuGet está bloqueado), entonces crearemos el Json a manita :'v
            Dim builder As New StringBuilder("[")
            Dim cantidad = coaseguradoras.Count()

            For i = 0 To cantidad - 1
                builder _
                    .Append("{""Id"":") _
                    .Append(coaseguradoras(i).Id) _
                    .Append(",""Nombre"":""") _
                    .Append(coaseguradoras(i).Nombre) _
                    .Append(""",""EnUso"":false}")

                If i < cantidad - 1 Then
                    builder.Append(",")
                End If
            Next

            CoaseguradorasJson = builder.Append("]").ToString()
        End Using
    End Sub

    <WebMethod>
    <ScriptMethod(ResponseFormat:=ResponseFormat.Json)>
    Public Shared Function CalcularMontoPorcentaje(ByVal montoParticipacion As Decimal, ByVal porcentaje As Decimal) As MensajeCliente
        If porcentaje > 100D Or porcentaje < 0D Then
            Return New MensajeCliente(False, "El porcentaje debe ser mayor a 0.00 % y menor a 100.00 %")
        End If

        If montoParticipacion < 0D Then
            Return New MensajeCliente(False, "El monto de participación debe ser mayor a $ 0.00")
        End If

        Dim montoPorcentaje = Decimal.Round((montoParticipacion * porcentaje / 100D), 2)

        Return New MensajeClienteConValor(Of Decimal)(True, montoPorcentaje.ToString("N2"), montoPorcentaje)
    End Function

    <WebMethod>
    <ScriptMethod(ResponseFormat:=ResponseFormat.Json)>
    Public Shared Function SumatoriaPorcentajesYMontos(ByVal porcentajes As IEnumerable(Of Decimal), ByVal montos As IEnumerable(Of Decimal)) As MensajeCliente
        Dim sumPorcentajes = porcentajes.Sum()
        Dim sumMontos = montos.Sum()

        Return New MensajeClienteConValor(Of String)(True, sumPorcentajes.ToString("N2") & "||" & sumMontos.ToString("N2"), sumPorcentajes & "||" & sumMontos)
    End Function
End Class

Public Class MensajeCliente
    Public Property Status As Boolean
    Public Property Mensaje As String

    Public Sub New(status As Boolean, mensaje As String)
        Me.Status = status
        Me.Mensaje = mensaje
    End Sub
End Class

Public Class MensajeClienteConValor(Of T)
    Inherits MensajeCliente

    Public Property Valor As T

    Public Sub New(status As Boolean, mensaje As String, valor As T)
        MyBase.New(status, mensaje)
        Me.Valor = valor
    End Sub
End Class