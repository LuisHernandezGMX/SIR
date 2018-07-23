Imports System.Data
Imports Mensaje

Partial Class OrdenPago_GarantiasPago
    Inherits System.Web.UI.Page

    Private dtReporteador As DataTable
    Private dtValor As DataTable

    Protected Sub Esconde_Click(sender As Object, e As ImageClickEventArgs)
        Try
            Funciones.EjecutaFuncion("fn_NoDesplazable('" & sender.AlternateText & "','" & Replace(sender.AlternateText, "div", "hid") & "')")
        Catch ex As Exception
            Mensaje.MuestraMensaje("Reporteador", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Protected Sub Flotante_Click(sender As Object, e As ImageClickEventArgs)
        Try
            Funciones.EjecutaFuncion("fn_Desplazable('" & sender.AlternateText & "');")
        Catch ex As Exception
            Mensaje.MuestraMensaje("Reporteador", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Protected Sub FiltraCampo(sender As Object, e As EventArgs)
        Try
            Dim DescartaClave As String = ""
            Dim gvd_Control As GridView = DirectCast(DirectCast(sender, Control).Parent.Parent.Parent.Parent, GridView)
            Dim Row As GridViewRow = DirectCast(DirectCast(sender, Control).Parent.Parent, GridViewRow)

            Dim Clave As String = gvd_Control.DataKeys(Row.RowIndex)("Clave")
            Dim Descripcion As String = gvd_Control.DataKeys(Row.RowIndex)("Descripcion")
            Dim Seccion As String = gvd_Control.DataKeys(Row.RowIndex)("OcultaCampo1")

            If sender.checked = False Then
                DescartaClave = Clave
            End If

            dtReporteador = GeneradtReporteador()

            'For Each Fila In gvd_Adicionales.Rows
            '    If DescartaClave <> DirectCast(Fila.FindControl("lbl_ClaveAdi"), Label).Text Then
            '        dtReporteador.Rows.Add(TryCast(Fila.FindControl("lbl_ClaveAdi"), Label).Text,
            '                               TryCast(Fila.FindControl("lbl_Desc"), Label).Text,
            '                               TryCast(Fila.FindControl("hid_seccion"), HiddenField).Value,
            '                               TryCast(Fila.FindControl("ddl_Union"), DropDownList).SelectedValue & ";" & DirectCast(Fila.FindControl("ddl_Operador"), DropDownList).SelectedValue,
            '                               TryCast(Fila.FindControl("txt_Condicion"), TextBox).Text)
            '    End If
            'Next

            If sender.checked = True Then
                dtReporteador.Rows.Add(Clave, Descripcion, Seccion, "Y;=", "")
            End If

            'Funciones.LlenaGrid(gvd_Adicionales, dtReporteador)

        Catch ex As Exception
            Mensaje.MuestraMensaje("Reporteador", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Private Function GeneradtReporteador() As DataTable
        GeneradtReporteador = New DataTable
        With GeneradtReporteador
            .Columns.Add("Clave")
            .Columns.Add("Descripcion")
            .Columns.Add("OcultaCampo1")
            .Columns.Add("OcultaCampo2")
            .Columns.Add("OcultaCampo3")
        End With
    End Function

    Public Sub QuitaElementos(sender As Object, e As EventArgs)
        Try
            Dim cph_principal As ContentPlaceHolder = Master.Contenedor
            Dim gvd_Control As GridView = DirectCast(cph_principal.FindControl(Replace(sender.ID, "btn", "gvd")), GridView)

            dtReporteador = GeneradtReporteador()

            For Each row In gvd_Control.Rows
                If TryCast(row.FindControl("chk_Sel"), CheckBox).Checked = False Then
                    If sender.ID = "btn_Adicionales" Then
                        dtReporteador.Rows.Add(TryCast(row.FindControl("lbl_ClaveAdi"), Label).Text,
                                               TryCast(row.FindControl("lbl_Desc"), Label).Text,
                                               TryCast(row.FindControl("hid_seccion"), HiddenField).Value,
                                               TryCast(row.FindControl("ddl_Union"), DropDownList).SelectedValue & ";" & DirectCast(row.FindControl("ddl_Operador"), DropDownList).SelectedValue,
                                               TryCast(row.FindControl("txt_Condicion"), TextBox).Text)
                    Else
                        dtReporteador.Rows.Add(gvd_Control.DataKeys(row.RowIndex)("Clave"),
                                               gvd_Control.DataKeys(row.RowIndex)("Descripcion"),
                                               gvd_Control.DataKeys(row.RowIndex)("OcultaCampo1"),
                                               gvd_Control.DataKeys(row.RowIndex)("OcultaCampo2"),
                                               gvd_Control.DataKeys(row.RowIndex)("OcultaCampo3"))
                    End If
                End If
            Next

            Funciones.LlenaGrid(gvd_Control, dtReporteador)

        Catch ex As Exception
            Mensaje.MuestraMensaje("Reporteador", ex.Message, TipoMsg.Falla)
        End Try
    End Sub
End Class
