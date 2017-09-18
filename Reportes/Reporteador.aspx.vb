Imports Mensaje
Imports System.Data
Partial Class Reportes_Reporteador
    Inherits System.Web.UI.Page
    Private dtReporteador As DataTable
    Private dtValor As DataTable

    Private Sub Reportes_Reporteador_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then

        End If
    End Sub
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

    Private Sub gvd_Adicionales_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles gvd_Adicionales.RowDataBound
        Try
            If e.Row.RowType = DataControlRowType.DataRow Then
                Dim lbl_ClaveAdi As Label = TryCast(e.Row.FindControl("lbl_ClaveAdi"), Label)
                Dim lbl_Where As Label = TryCast(e.Row.FindControl("lbl_Where"), Label)
                Dim ddl_Union As DropDownList = TryCast(e.Row.FindControl("ddl_Union"), DropDownList)
                Dim ddl_Operador As DropDownList = DirectCast(e.Row.FindControl("ddl_Operador"), DropDownList)
                Dim hid_Union As HiddenField = TryCast(e.Row.FindControl("hid_Union"), HiddenField)
                Dim hid_Operador As HiddenField = DirectCast(e.Row.FindControl("hid_Operador"), HiddenField)

                If e.Row.RowIndex = 0 Then
                    lbl_Where.Visible = True
                    ddl_Union.Visible = False
                End If

                ddl_Union.SelectedValue = hid_Union.Value
                ddl_Operador.SelectedValue = hid_Operador.Value
            End If
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

            For Each Fila In gvd_Adicionales.Rows
                If DescartaClave <> DirectCast(Fila.FindControl("lbl_ClaveAdi"), Label).Text Then
                    dtReporteador.Rows.Add(TryCast(Fila.FindControl("lbl_ClaveAdi"), Label).Text,
                                           TryCast(Fila.FindControl("lbl_Desc"), Label).Text,
                                           TryCast(Fila.FindControl("hid_seccion"), HiddenField).Value,
                                           TryCast(Fila.FindControl("ddl_Union"), DropDownList).SelectedValue & ";" & DirectCast(Fila.FindControl("ddl_Operador"), DropDownList).SelectedValue,
                                           TryCast(Fila.FindControl("txt_Condicion"), TextBox).Text)
                End If
            Next

            If sender.checked = True Then
                dtReporteador.Rows.Add(Clave, Descripcion, Seccion, "Y;=", "")
            End If

            Funciones.LlenaGrid(gvd_Adicionales, dtReporteador)

        Catch ex As Exception
            Mensaje.MuestraMensaje("Reporteador", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Private Sub gvd_Adicionales_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles gvd_Adicionales.RowCommand
        Try
            If e.CommandName = "ValoresMultiples" Then
                hid_Todos.Value = 1

                dtValor = New DataTable
                dtValor.Columns.Add("Valor")

                Funciones.LlenaGrid(gvd_Multiples, Nothing)

                Dim Index As Integer = e.CommandSource.NamingContainer.RowIndex
                hid_RowCondicion.Value = Index
                Dim txt_Condicion As TextBox = CType(gvd_Adicionales.Rows(Index).FindControl("txt_Condicion"), TextBox)
                Dim Valores() As String = Split(Replace(txt_Condicion.Text, "'", ""), ",")

                For Each valor In Valores
                    dtValor.Rows.Add(valor)
                Next

                gvd_Multiples.DataSource = dtValor
                gvd_Multiples.DataBind()
            End If
        Catch ex As Exception
            Mensaje.MuestraMensaje("Reporteador", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Private Sub btn_AñadirValor_Click(sender As Object, e As EventArgs) Handles btn_AñadirValor.Click
        Try
            dtValor = New DataTable
            dtValor.Columns.Add("Valor")

            For Each Row In gvd_Multiples.Rows
                Dim txt_Valor As TextBox = DirectCast(Row.FindControl("txt_Valor"), TextBox)
                dtValor.Rows.Add(txt_Valor.Text)
            Next
            dtValor.Rows.Add("")

            Funciones.LlenaGrid(gvd_Multiples, dtValor)
        Catch ex As Exception
            Mensaje.MuestraMensaje("Reporteador", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Private Sub btn_QuitarValor_Click(sender As Object, e As EventArgs) Handles btn_QuitarValor.Click
        Try
            dtValor = New DataTable
            dtValor.Columns.Add("Valor")

            For Each Row In gvd_Multiples.Rows
                Dim chk_SelCol As CheckBox = DirectCast(Row.FindControl("chk_SelCol"), CheckBox)
                Dim txt_Valor As TextBox = DirectCast(Row.FindControl("txt_Valor"), TextBox)
                If chk_SelCol.Checked = False Then
                    dtValor.Rows.Add(txt_Valor.Text)
                End If
            Next

            Funciones.LlenaGrid(gvd_Multiples, dtValor)
        Catch ex As Exception
            Mensaje.MuestraMensaje("Reporteador", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Private Sub btn_AplicaValores_Click(sender As Object, e As EventArgs) Handles btn_AplicaValores.Click
        Try
            Dim txt_Condicion As TextBox
            Dim Condicion As String = vbNullString

            For Each Row In gvd_Multiples.Rows
                Dim txt_Valor As TextBox = DirectCast(Row.FindControl("txt_Valor"), TextBox)

                Condicion = Condicion & IIf(Len(Condicion) > 0, ",", "") & txt_Valor.Text
                txt_Condicion = CType(gvd_Adicionales.Rows(hid_RowCondicion.Value).FindControl("txt_Condicion"), TextBox)
                txt_Condicion.Text = Condicion
                Funciones.CerrarModal("#Multivalores")
            Next

        Catch ex As Exception
            Mensaje.MuestraMensaje("Reporteador", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

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

    Private Sub btn_AddPol_ServerClick(sender As Object, e As EventArgs) Handles btn_AddPol.ServerClick
        Try
            Master.MuestraPolizario("gvd_Poliza", False, False, True, True, False)
        Catch ex As Exception
            Mensaje.MuestraMensaje("Reporteador", ex.Message, TipoMsg.Falla)
        End Try
    End Sub
End Class


