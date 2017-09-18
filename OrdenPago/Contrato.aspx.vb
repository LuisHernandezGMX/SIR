Imports System.Data
Partial Class OrdenPago_Contrato
    Inherits System.Web.UI.Page

    Private Sub OrdenPago_Contrato_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim datos As DataTable
            datos = New DataTable

            datos.Columns.Add("tSEl_Val")
            datos.Columns.Add("broker")
            datos.Columns.Add("compañia")
            datos.Columns.Add("id_contrato")
            datos.Columns.Add("ramo_contable")
            datos.Columns.Add("concepto")
            datos.Columns.Add("importe")


            datos.Rows.Add(1, "Broker", "Compañia", "15CPCAR", "Incendio", "Prima CC-Extranjero-Contrato", 14375.36)
            datos.Rows.Add(1, "Broker", "Compañia", "15CPCAR", "Incendio", "Indemizacion CC-Extranjero-Contrato", 8045.38)
            datos.Rows.Add(1, "Broker", "Compañia", "15CPCAR", "Incendio", "Gastos CC-Extranjero-Contrato", -1419.26)
            datos.Rows.Add(1, "Broker", "Compañia", "15CPCAR", "Incendio", "Prima CC-Extranjero-Contrato", -13517.98)
            datos.Rows.Add(1, "Broker", "Compañia", "15CPCAR", "Incendio", "Comision CC-Extranjero-Contrato", 461.25)
            datos.Rows.Add(1, "Broker", "Compañia", "15CPCAR", "Incendio", "Prima CC-Extranjero-Contrato", 3819.93)

            gvd_SaldosNac.DataSource = datos
            gvd_SaldosNac.DataBind()

            gvd_SaldosDll.DataSource = datos
            gvd_SaldosDll.DataBind()
        End If
    End Sub
End Class
