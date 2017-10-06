Imports Mensaje
Partial Class OrdenPago_ReporteOP
    Inherits System.Web.UI.Page

    Private Sub btn_AddPol_Click(sender As Object, e As EventArgs) Handles btn_AddPol.Click
        Try
            Master.MuestraPolizario("gvd_Poliza", False, False, False, False, False)
        Catch ex As Exception
            Mensaje.MuestraMensaje("Reporte OP", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Private Sub btn_Reporte_Click(sender As Object, e As EventArgs) Handles btn_Reporte.Click
        Try
            Dim FiltroOP As String = ""
            Dim FiltroBrokerCia As String = ""
            Dim FiltroRamoContable As String = ""
            Dim FiltroPoliza As String = ""

            Dim FiltroFechaGen As String = ""
            Dim FiltroFechaPago As String = ""
            Dim FiltroUsuario As String = ""
            Dim FiltroEstatus As String = ""
            Dim FiltroMonto As String = ""

            Dim FiltroNatOP As String = ""

            Dim ws As New ws_OrdenPago.OrdenPagoClient

            FiltroOP = IIf(Len(txt_NroOP.Text) > 0, txt_NroOP.Text, 0)

            FiltroBrokerCia = Funciones.ObtieneElementos(gvd_Broker, "Bro", False)
            FiltroBrokerCia = FiltroBrokerCia & IIf(Len(FiltroBrokerCia) > 0, ",", "") & Funciones.ObtieneElementos(gvd_Compañia, "Cia", False)
            FiltroRamoContable = Funciones.ObtieneElementos(gvd_RamoContable, "RamC", False)
            FiltroPoliza = Funciones.ObtieneElementos(gvd_Poliza, "Pol", True)

            FiltroUsuario = Funciones.ObtieneElementos(gvd_Usuario, "Usu", True)
            FiltroEstatus = Funciones.ObtieneElementos(gvd_Estatus, "Est", False)


            If IsDate(txtFecGeneraDe.Text) And IsDate(txtFecGeneraA.Text) Then
                If CDate(txtFecGeneraDe.Text) <= CDate(txtFecGeneraA.Text) Then
                    FiltroFechaGen = " AND fec_generacion >= '" & CDate(txtFecGeneraDe.Text).ToString("yyyyMMdd") & "' AND fec_generacion <= '" & CDate(txtFecGeneraA.Text).ToString("yyyyMMdd") & "'"
                End If
            End If

            If IsDate(txtFecPagoDe.Text) And IsDate(txtFecPagoA.Text) Then
                If CDate(txtFecPagoDe.Text) <= CDate(txtFecPagoA.Text) Then
                    FiltroFechaPago = " AND fec_pago >= '" & CDate(txtFecPagoDe.Text).ToString("yyyyMMdd") & "' AND fec_pago <= '" & CDate(txtFecPagoA.Text).ToString("yyyyMMdd") & "'"
                End If
            End If

            If IsNumeric(txt_MontoDe.Text) Then
                FiltroMonto = " WHERE imp_total >= " & txt_MontoDe.Text
            End If

            If IsNumeric(txt_MontoA.Text) Then
                FiltroMonto = IIf(Len(FiltroMonto) > 0, " AND ", " WHERE ") & " imp_total <= " & txt_MontoA.Text
            End If

            If chk_Devolucion.Checked = True Then
                FiltroNatOP = " AND sn_devolucion = -1 "
            End If

            If chk_ConISR.Checked = True Then
                FiltroNatOP = FiltroNatOP & " AND ISNULL(Impuesto,0) <> 0 "
            End If

            If chk_SinISR.Checked = True Then
                FiltroNatOP = FiltroNatOP & " AND ISNULL(Impuesto,0) = 0 "
            End If


        Catch ex As Exception
            Mensaje.MuestraMensaje("Reporte Orden de Pago", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Private Sub OrdenPago_ReporteOP_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Funciones.LlenaCatDDL(ddl_Moneda, "Mon")
            ddl_Moneda.SelectedValue = -1
        End If
    End Sub
End Class

