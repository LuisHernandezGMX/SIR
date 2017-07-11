
Imports System.Data
Partial Class Recordatorios_ConsultaFacultativos
    Inherits System.Web.UI.Page

    Private Sub btn_AddPol_Click(sender As Object, e As EventArgs) Handles btn_AddPol.Click
        Master.MuestraPolizario("gvd_Poliza", False, False, False, False, False)
    End Sub

    Private Sub btn_AgregarAse_Click(sender As Object, e As EventArgs) Handles btn_AgregarAse.Click
        Dim dt As New DataTable
        Dim dw As DataRow
        dt.Columns.Add("Clave")
        dt.Columns.Add("Descripcion")

        'Checa los que ya estan agregados
        If gvd_Asegurado.Rows.Count > 0 Then
            For Each row In gvd_Asegurado.Rows
                Dim Elemento = DirectCast(row.FindControl("chk_SelAse"), HiddenField)
                If Elemento.Value <> "true" Then
                    dw = dt.NewRow()
                    dw("Clave") = gvd_Asegurado.DataKeys(row.rowIndex)("Clave")
                    dw("Descripcion") = gvd_Asegurado.DataKeys(row.rowIndex)("Descripcion")
                    dt.Rows.Add(dw)
                End If
            Next
            dw = dt.NewRow()
            dw("Clave") = hidClaveAse.Value.ToString.Trim()
            dw("Descripcion") = txtSearchAse.Text.Trim()
            dt.Rows.Add(dw)
        Else
            dw = dt.NewRow()
            dw("Clave") = hidClaveAse.Value.ToString.Trim()
            dw("Descripcion") = txtSearchAse.Text.Trim()
            dt.Rows.Add(dw)
        End If
        gvd_Asegurado.DataSource = dt
        gvd_Asegurado.DataBind()

    End Sub

    Private Sub btn_CancelaFac_Click(sender As Object, e As EventArgs) Handles btn_CancelaFac.Click
        Limpiar()
    End Sub
    Private Sub Limpiar()
        gvd_Asegurado.DataSource = Nothing
        gvd_Asegurado.DataBind()
    End Sub

End Class
