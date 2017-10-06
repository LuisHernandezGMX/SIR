Imports System.Data
Partial Class MesaControl_Tablero
    Inherits System.Web.UI.Page

    Private Sub MesaControl_Tablero_Load(sender As Object, e As EventArgs) Handles Me.Load
        Try
            If Not IsPostBack Then
                'Funciones.LlenaCatDDL(ddl_Moneda, "Mon")

                Dim dt As DataTable
                dt = New DataTable

                dt.Columns.Add("Folio")
                dt.Columns.Add("FecRecibido")
                dt.Columns.Add("Responsable")
                dt.Columns.Add("Oficina")
                dt.Columns.Add("Suscriptor")
                dt.Columns.Add("Asegurado")
                dt.Columns.Add("Giro")
                dt.Columns.Add("Agrupador")
                dt.Columns.Add("Ramo")
                dt.Columns.Add("Tipo_Mov")
                dt.Columns.Add("Intermediario")
                dt.Columns.Add("Moneda")
                dt.Columns.Add("SumaAseg")
                dt.Columns.Add("Prima")

                dt.Rows.Add(155, "27/09/2017", "YANIN AVENDAÑO", "CIUDAD DE MEXICO", "VICTOR GARCIA", "PLASTICOS HHHHH", "INDUSTRIA", "INCENDIO", "RIESGOS GENERALES", "POLIZA NUEVA", "REASINTER", "DOLARES", 1000000, 55245)
                dt.Rows.Add(155, "27/09/2017", "YANIN AVENDAÑO", "CIUDAD DE MEXICO", "VICTOR GARCIA", "PLASTICOS HHHHH", "INDUSTRIA", "INCENDIO", "RIESGOS GENERALES", "POLIZA NUEVA", "REASINTER", "DOLARES", 1000000, 55245)
                dt.Rows.Add(155, "27/09/2017", "YANIN AVENDAÑO", "CIUDAD DE MEXICO", "VICTOR GARCIA", "PLASTICOS HHHHH", "INDUSTRIA", "INCENDIO", "RIESGOS GENERALES", "POLIZA NUEVA", "REASINTER", "DOLARES", 1000000, 55245)
                dt.Rows.Add(155, "27/09/2017", "YANIN AVENDAÑO", "CIUDAD DE MEXICO", "VICTOR GARCIA", "PLASTICOS HHHHH", "INDUSTRIA", "INCENDIO", "RIESGOS GENERALES", "POLIZA NUEVA", "REASINTER", "DOLARES", 1000000, 55245)
                dt.Rows.Add(155, "27/09/2017", "YANIN AVENDAÑO", "CIUDAD DE MEXICO", "VICTOR GARCIA", "PLASTICOS HHHHH", "INDUSTRIA", "INCENDIO", "RIESGOS GENERALES", "POLIZA NUEVA", "REASINTER", "DOLARES", 1000000, 55245)
                dt.Rows.Add(155, "27/09/2017", "YANIN AVENDAÑO", "CIUDAD DE MEXICO", "VICTOR GARCIA", "PLASTICOS HHHHH", "INDUSTRIA", "INCENDIO", "RIESGOS GENERALES", "POLIZA NUEVA", "REASINTER", "DOLARES", 1000000, 55245)
                dt.Rows.Add(155, "27/09/2017", "YANIN AVENDAÑO", "CIUDAD DE MEXICO", "VICTOR GARCIA", "PLASTICOS HHHHH", "INDUSTRIA", "INCENDIO", "RIESGOS GENERALES", "POLIZA NUEVA", "REASINTER", "DOLARES", 1000000, 55245)

                Funciones.LlenaGrid(gvd_Monitor, dt)
            End If
        Catch ex As Exception

        End Try
    End Sub
End Class
