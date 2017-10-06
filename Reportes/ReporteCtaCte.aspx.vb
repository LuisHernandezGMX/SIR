Imports Mensaje
Partial Class Reportes_ReporteCtaCte
    Inherits System.Web.UI.Page

    Private Sub btn_AddPol_Click(sender As Object, e As EventArgs) Handles btn_AddPol.Click
        Try
            Master.MuestraPolizario("gvd_Poliza", False, False, False, False, False)
        Catch ex As Exception
            Mensaje.MuestraMensaje("Detalle Cuenta Corriente", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Private Sub btn_Reporte_Click(sender As Object, e As EventArgs) Handles btn_Reporte.Click
        Try
            Dim FiltroBroker As String = vbNullString
            Dim FiltroCia As String = vbNullString
            Dim FiltroRamoContable As String = vbNullString
            Dim FiltroOP As String = vbNullString

            Dim ws As New ws_Generales.GeneralesClient
            Dim server As String = ws.ObtieneParametro(3)

            FiltroBroker = Funciones.ObtieneElementos(gvd_Broker, "Bro", False)
            FiltroCia = Funciones.ObtieneElementos(gvd_Compañia, "Cia", False)
            FiltroRamoContable = Funciones.ObtieneElementos(gvd_RamoContable, "RamC", False)

            If Len(FiltroBroker) > 0 Then FiltroBroker = "&cod_broker=" & FiltroBroker
            If Len(FiltroCia) > 0 Then FiltroCia = "&cod_cia=" & FiltroCia
            If Len(FiltroRamoContable) > 0 Then FiltroRamoContable = "&ramo_contabler=" & FiltroRamoContable
            If Len(txt_NroOP.Text) > 0 Then FiltroOP = "&nro_op=" & txt_NroOP.Text

            server = Replace(Replace(server, "@Reporte", "DetCtaCorriente"), "@Formato", "EXCEL") & "&fecha_desde=" & CDate(txtFecPagoDe.Text).ToString("yyyyMMdd") & "&fecha_hasta=" & CDate(txtFecPagoA.Text).ToString("yyyyMMdd") & "&Tipo_repo=0&cod_agente=-1&tipo_contrato=-1"

            server = server & FiltroBroker & FiltroCia & FiltroRamoContable & FiltroOP & "&cod_moneda=" & ddl_Moneda.SelectedValue

            Funciones.EjecutaFuncion("window.open('" & server & "');")
        Catch ex As Exception
            Mensaje.MuestraMensaje("Detalle Cuenta Corriente", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Private Sub Reportes_ReporteCtaCte_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Funciones.LlenaCatDDL(ddl_Moneda, "Mon")
            ddl_Moneda.SelectedValue = -1
        End If
    End Sub


End Class
