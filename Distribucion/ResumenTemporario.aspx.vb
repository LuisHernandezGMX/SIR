
Imports System.Data
Imports System.Data.SqlClient
Imports Mensaje
Partial Class Distribucion_ResumenTemporario
    Inherits System.Web.UI.Page

    Private Enum Filtros
        Capa = 0
        Linea
        Id_Contrato
        Broker
        Compañia
    End Enum

    Public Property dtTemporarios() As DataTable
        Get
            Return Session("dtTemporarios")
        End Get
        Set(ByVal value As DataTable)
            Session("dtTemporarios") = value
        End Set
    End Property

    Public Property dtDistribucion() As DataTable
        Get
            Return Session("dtDistribucion")
        End Get
        Set(ByVal value As DataTable)
            Session("dtDistribucion") = value
        End Set
    End Property

    Public Property dtFiltrado() As DataTable
        Get
            Return Session("dtFiltrado")
        End Get
        Set(ByVal value As DataTable)
            Session("dtFiltrado") = value
        End Set
    End Property

    Private Sub btn_Reporte_Click(sender As Object, e As EventArgs) Handles btn_Reporte.Click
        Try


            ConsultaTemporario(False)


        Catch ex As Exception
            Mensaje.MuestraMensaje("Resumen Temporario", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Private Sub ConsultaTemporario(ByVal blnFiltrado As Boolean)
        Dim strFields As String = ""
        Dim strTemporario As String = ""

        If blnFiltrado = False Then
            LlenaGridDistribucion(True)
            hid_Capa.Value = ""
            hid_Linea.Value = ""
            hid_IdContrato.Value = ""
            hid_Broker.Value = ""
            hid_Compañia.Value = ""

            Dim sCnn As String = ""
            Dim sSel As String
            sCnn = ConfigurationManager.ConnectionStrings("CadenaConexion").ConnectionString

            Dim dtDetalle As DataTable
            dtDetalle = New DataTable

            strTemporario = fn_ObtieneTemporarios()
            If strTemporario <> "-1" Then
                strFields = fn_ObtieneSeleccionados()

                sSel = "spR_Reporteador_T2 '','','','','','','','" & strFields & "','',0,4,0,'" & " wrf.id_proceso IN (" & strTemporario & ")'"

                Dim da As SqlDataAdapter

                da = New SqlDataAdapter(sSel, sCnn)

                da.Fill(dtDetalle)

                If dtDetalle.Rows.Count > 0 Then
                    For Each row In dtDetalle.Rows
                        dtDistribucion.Rows.Add(row("NRO_TEMPORARIO"), row("NRO_LAYER"), row("ID_LINEA"), row("LINEA"), row("ID_CONTRATO"), row("CONTRATO"),
                                                row("TIPO_CONTRATO"), row("COD_BROKER"), IIf(IsDBNull(row("BROKER")), "", row("BROKER")), row("COD_CIA"), IIf(IsDBNull(row("COMPAÑIA")), "", row("COMPAÑIA")),
                                                row("SUMA_ASEGURADA"), row("PJE_SUMA"), row("PRIMA"), row("PJE_PRIMA"), row("PJE_COMISION"),
                                                row("COMISION"), row("PRIMA_NETA"))
                    Next
                Else
                    Mensaje.MuestraMensaje("Resumen Temporario", "La consulta no devolvió ninún resultado", TipoMsg.Advertencia)
                End If

                dtFiltrado = dtDistribucion

            Else
                Mensaje.MuestraMensaje("Resumen Temporario", "No se han seleccionado temporarios para consulta", TipoMsg.Advertencia)
                Funciones.LlenaGrid(gvd_DetalleTemporario, Nothing)
            End If
        End If

        Funciones.LlenaGrid(gvd_DetalleTemporario, dtFiltrado)

        gvd_DetalleTemporario.Columns(1).Visible = TryCast(gvd_Generales.Rows(0).FindControl("chk_Sel"), CheckBox).Checked
        gvd_DetalleTemporario.Columns(2).Visible = TryCast(gvd_Generales.Rows(1).FindControl("chk_Sel"), CheckBox).Checked
        gvd_DetalleTemporario.Columns(3).Visible = TryCast(gvd_Generales.Rows(2).FindControl("chk_Sel"), CheckBox).Checked
        gvd_DetalleTemporario.Columns(4).Visible = TryCast(gvd_Generales.Rows(3).FindControl("chk_Sel"), CheckBox).Checked
        gvd_DetalleTemporario.Columns(5).Visible = TryCast(gvd_Generales.Rows(4).FindControl("chk_Sel"), CheckBox).Checked
        gvd_DetalleTemporario.Columns(6).Visible = TryCast(gvd_Generales.Rows(5).FindControl("chk_Sel"), CheckBox).Checked
        gvd_DetalleTemporario.Columns(7).Visible = TryCast(gvd_Generales.Rows(6).FindControl("chk_Sel"), CheckBox).Checked
        gvd_DetalleTemporario.Columns(8).Visible = TryCast(gvd_Generales.Rows(7).FindControl("chk_Sel"), CheckBox).Checked
        gvd_DetalleTemporario.Columns(9).Visible = TryCast(gvd_Generales.Rows(8).FindControl("chk_Sel"), CheckBox).Checked
        gvd_DetalleTemporario.Columns(10).Visible = TryCast(gvd_Generales.Rows(9).FindControl("chk_Sel"), CheckBox).Checked
        gvd_DetalleTemporario.Columns(11).Visible = TryCast(gvd_Montos.Rows(0).FindControl("chk_Sel"), CheckBox).Checked
        gvd_DetalleTemporario.Columns(12).Visible = TryCast(gvd_Montos.Rows(1).FindControl("chk_Sel"), CheckBox).Checked
        gvd_DetalleTemporario.Columns(13).Visible = TryCast(gvd_Montos.Rows(2).FindControl("chk_Sel"), CheckBox).Checked
        gvd_DetalleTemporario.Columns(14).Visible = TryCast(gvd_Montos.Rows(3).FindControl("chk_Sel"), CheckBox).Checked
        gvd_DetalleTemporario.Columns(15).Visible = TryCast(gvd_Montos.Rows(4).FindControl("chk_Sel"), CheckBox).Checked
        gvd_DetalleTemporario.Columns(16).Visible = TryCast(gvd_Montos.Rows(5).FindControl("chk_Sel"), CheckBox).Checked
        gvd_DetalleTemporario.Columns(17).Visible = TryCast(gvd_Montos.Rows(6).FindControl("chk_Sel"), CheckBox).Checked

        Dim btn_Capa = DirectCast(gvd_DetalleTemporario.HeaderRow.FindControl("btn_Capa"), ImageButton)
        Dim btn_Linea = DirectCast(gvd_DetalleTemporario.HeaderRow.FindControl("btn_Linea"), ImageButton)
        Dim btn_IdContrato = DirectCast(gvd_DetalleTemporario.HeaderRow.FindControl("btn_IdContrato"), ImageButton)
        Dim btn_Broker = DirectCast(gvd_DetalleTemporario.HeaderRow.FindControl("btn_Broker"), ImageButton)
        Dim btn_Compañia = DirectCast(gvd_DetalleTemporario.HeaderRow.FindControl("btn_Compañia"), ImageButton)

        btn_Capa.CssClass = IIf(Len(hid_Capa.Value) > 0, "btn-filtro-verde", "btn-filtro")
        btn_Linea.CssClass = IIf(Len(hid_Linea.Value) > 0, "btn-filtro-verde", "btn-filtro")
        btn_IdContrato.CssClass = IIf(Len(hid_IdContrato.Value) > 0, "btn-filtro-verde", "btn-filtro")
        btn_Broker.CssClass = IIf(Len(hid_Broker.Value) > 0, "btn-filtro-verde", "btn-filtro")
        btn_Compañia.CssClass = IIf(Len(hid_Compañia.Value) > 0, "btn-filtro-verde", "btn-filtro")

        SumaTotales()
    End Sub

    Private Function fn_ObtieneSeleccionados() As String
        Dim strSalida As String = "-1"

        For Each row In gvd_Generales.Rows
            If TryCast(row.FindControl("chk_Sel"), CheckBox).Checked = True Then
                strSalida = strSalida & "," & TryCast(row.FindControl("lbl_Clave"), Label).Text
            End If
        Next
        For Each row In gvd_Montos.Rows
            If TryCast(row.FindControl("chk_Sel"), CheckBox).Checked = True Then
                strSalida = strSalida & "," & TryCast(row.FindControl("lbl_Clave"), Label).Text
            End If
        Next
        Return strSalida
    End Function

    Private Function fn_ObtieneTemporarios() As String
        Dim strSalida As String = "-1"
        For Each row In gvd_Temporarios.Rows
            If TryCast(row.FindControl("chk_Sel"), CheckBox).Checked = True Then
                If TryCast(row.FindControl("txt_Nro"), TextBox).Text <> vbNullString Then
                    strSalida = strSalida & "," & TryCast(row.FindControl("txt_Nro"), TextBox).Text
                End If
            End If
        Next
        Return strSalida
    End Function

    Private Sub Distribucion_ResumenTemporario_Load(sender As Object, e As EventArgs) Handles Me.Load
        Try
            If Not IsPostBack Then
                Funciones.LlenaCatGrid(gvd_Generales, "Rep", " WHERE cod_reporte = 4 AND cod_seccion = 1")
                Funciones.LlenaCatGrid(gvd_Montos, "Rep", " WHERE cod_reporte = 4 AND cod_seccion = 2")

                LlenaGridTemporario(True)
                GeneraDTFiltrado()
            End If
        Catch ex As Exception

        End Try
    End Sub
    Protected Sub chk_Sel_CheckedChanged(sender As Object, e As EventArgs)
        Try
            ConsultaTemporario(False)
        Catch ex As Exception
            Mensaje.MuestraMensaje("Resumen Temporario", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Private Sub btn_AddTemporario_Click(sender As Object, e As EventArgs) Handles btn_AddTemporario.Click
        Try
            fn_ActualizaData()
            dtTemporarios.Rows.Add(False, "", "")
            LlenaGridTemporario(False)
        Catch ex As Exception
            Mensaje.MuestraMensaje("Resumen Temporario", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Private Function fn_ActualizaData() As DataTable

        LlenaGridTemporario(True, False)

        For Each row In gvd_Temporarios.Rows
            Dim chk_Sel As CheckBox = TryCast(row.FindControl("chk_Sel"), CheckBox)
            Dim txt_Nro As TextBox = TryCast(row.FindControl("txt_Nro"), TextBox)
            Dim txt_Sucursal As TextBox = TryCast(row.FindControl("txt_Sucursal"), TextBox)
            Dim txt_Ramo As TextBox = TryCast(row.FindControl("txt_Ramo"), TextBox)
            Dim txt_Movimiento As TextBox = TryCast(row.FindControl("txt_Movimiento"), TextBox)
            Dim txt_Poliza As TextBox = TryCast(row.FindControl("txt_Poliza"), TextBox)
            Dim txt_Asegurado As TextBox = TryCast(row.FindControl("txt_Asegurado"), TextBox)

            dtTemporarios.Rows.Add(chk_Sel.Checked, txt_Nro.Text, txt_Sucursal.Text, txt_Ramo.Text, txt_Movimiento.Text, txt_Poliza.Text, txt_Asegurado.Text)
        Next

        Return dtTemporarios
    End Function

    Private Sub LlenaGridTemporario(ByVal bln_Nuevo As Boolean, Optional ByVal bln_Llenado As Boolean = True)

        If bln_Nuevo = True Then
            dtTemporarios = New DataTable
            dtTemporarios.Columns.Add("sn_sel")
            dtTemporarios.Columns.Add("nro_temporario")
            dtTemporarios.Columns.Add("sucursal")
            dtTemporarios.Columns.Add("ramo")
            dtTemporarios.Columns.Add("grupo_endoso")
            dtTemporarios.Columns.Add("nro_pol")
            dtTemporarios.Columns.Add("asegurado")
        End If

        If bln_Llenado = True Then
            Funciones.LlenaGrid(gvd_Temporarios, dtTemporarios)
        End If

    End Sub

    Private Sub LlenaGridDistribucion(ByVal bln_Nuevo As Boolean)

        If bln_Nuevo = True Then
            dtDistribucion = New DataTable
            dtDistribucion.Columns.Add("NRO_TEMPORARIO")
            dtDistribucion.Columns.Add("NRO_LAYER")
            dtDistribucion.Columns.Add("ID_LINEA")
            dtDistribucion.Columns.Add("LINEA")
            dtDistribucion.Columns.Add("ID_CONTRATO")
            dtDistribucion.Columns.Add("CONTRATO")
            dtDistribucion.Columns.Add("TIPO_CONTRATO")
            dtDistribucion.Columns.Add("COD_BROKER")
            dtDistribucion.Columns.Add("BROKER")
            dtDistribucion.Columns.Add("COD_CIA")
            dtDistribucion.Columns.Add("COMPAÑIA")
            dtDistribucion.Columns.Add("SUMA_ASEGURADA")
            dtDistribucion.Columns.Add("PJE_SUMA")
            dtDistribucion.Columns.Add("PRIMA")
            dtDistribucion.Columns.Add("PJE_PRIMA")
            dtDistribucion.Columns.Add("PJE_COMISION")
            dtDistribucion.Columns.Add("COMISION")
            dtDistribucion.Columns.Add("PRIMA_NETA")
        End If

        Funciones.LlenaGrid(gvd_DetalleTemporario, dtDistribucion)

    End Sub

    Protected Sub txt_Nro_TextChanged(sender As Object, e As EventArgs)
        Try
            Dim row As GridViewRow = TryCast((TryCast(sender, TextBox)).Parent.Parent, GridViewRow)

            Dim sCnn As String = ""
            Dim sSel As String
            sCnn = ConfigurationManager.ConnectionStrings("CadenaConexion").ConnectionString

            Dim dtTemporario As DataTable
            dtTemporario = New DataTable

            sSel = "spS_Temporario " & sender.Text

            Dim da As SqlDataAdapter

            da = New SqlDataAdapter(sSel, sCnn)

            da.Fill(dtTemporario)

            If dtTemporario.Rows.Count > 0 Then
                TryCast(row.FindControl("txt_Sucursal"), TextBox).Text = dtTemporario.Rows(0)("sucursal")
                TryCast(row.FindControl("txt_Ramo"), TextBox).Text = dtTemporario.Rows(0)("ramo")
                TryCast(row.FindControl("txt_Movimiento"), TextBox).Text = dtTemporario.Rows(0)("grupo_endoso")
                TryCast(row.FindControl("txt_Poliza"), TextBox).Text = dtTemporario.Rows(0)("nro_pol")
                TryCast(row.FindControl("txt_Asegurado"), TextBox).Text = dtTemporario.Rows(0)("asegurado")
            Else
                TryCast(row.FindControl("txt_Sucursal"), TextBox).Text = vbNullString
                TryCast(row.FindControl("txt_Ramo"), TextBox).Text = vbNullString
                TryCast(row.FindControl("txt_Movimiento"), TextBox).Text = vbNullString
                TryCast(row.FindControl("txt_Poliza"), TextBox).Text = vbNullString
                TryCast(row.FindControl("txt_Asegurado"), TextBox).Text = vbNullString
            End If

        Catch ex As Exception
            Mensaje.MuestraMensaje("Resumen Temporario", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Protected Sub DespliegaFiltro(sender As Object, e As ImageClickEventArgs)
        Dim elemento As String
        Dim Datos As New ArrayList()
        Dim filtrados() As String = {""}
        Dim blnTodo As Boolean = True
        Dim Generales() As String = Split(sender.AlternateText, "|")
        Dim Consulta As String = "NRO_TEMPORARIO > '0'"

        hid_Filtro.Value = Generales(2)

        Dim ArrayOrden() As String = Split(hid_OrdenFiltrado.Value, "|")
        Dim Indice As Integer = Array.IndexOf(ArrayOrden, hid_Filtro.Value)

        For i = 1 To ArrayOrden.Length - 1
            If hid_Filtro.Value <> ArrayOrden(i) Then
                Select Case ArrayOrden(i)
                    Case Filtros.Capa
                        Consulta = Consulta & ArmaConsulta("NRO_LAYER", Split(hid_Capa.Value, "|"))
                    Case Filtros.Linea
                        Consulta = Consulta & ArmaConsulta("LINEA", Split(hid_Linea.Value, "|"))
                    Case Filtros.Id_Contrato
                        Consulta = Consulta & ArmaConsulta("ID_CONTRATO", Split(hid_IdContrato.Value, "|"))
                    Case Filtros.Broker
                        Consulta = Consulta & ArmaConsulta("BROKER", Split(hid_Broker.Value, "|"))
                    Case Filtros.Compañia
                        Consulta = Consulta & ArmaConsulta("COMPAÑIA", Split(hid_Compañia.Value, "|"))
                End Select
            End If
        Next


        Select Case hid_Filtro.Value
            Case Filtros.Capa
                filtrados = Split(hid_Capa.Value, "|")
            Case Filtros.Linea
                filtrados = Split(hid_Linea.Value, "|")
            Case Filtros.Id_Contrato
                filtrados = Split(hid_IdContrato.Value, "|")
            Case Filtros.Broker
                filtrados = Split(hid_Broker.Value, "|")
            Case Filtros.Compañia
                filtrados = Split(hid_Compañia.Value, "|")
        End Select

        'Titulo de la Ventana
        lbl_TituloFiltro.Text = "Filtrado " & Generales(1)

        chk_Filtro.Items.Clear()

        Dim myRow() As Data.DataRow
        myRow = dtDistribucion.Select(Consulta)

        GeneraDTFiltrado()
        For Each item In myRow
            dtFiltrado.Rows.Add(item("NRO_TEMPORARIO"), item("NRO_LAYER"), item("ID_LINEA"), item("LINEA"), item("ID_CONTRATO"), item("CONTRATO"),
                                item("TIPO_CONTRATO"), item("COD_BROKER"), item("BROKER"), item("COD_CIA"), item("COMPAÑIA"),
                                item("SUMA_ASEGURADA"), item("PJE_SUMA"), item("PRIMA"), item("PJE_PRIMA"), item("PJE_COMISION"),
                                item("COMISION"), item("PRIMA_NETA"))
        Next


        Dim ArrayElementos = dtFiltrado.AsEnumerable().[Select](Function(c) CType(c(Generales(0)), System.String)).Distinct().ToList()


        For Each elemento In ArrayElementos
            If Len(elemento) = 0 Then elemento = "(VACIAS)"
            chk_Filtro.Items.Add(elemento)
        Next

        If Len(filtrados(0)) > 0 Then
            blnTodo = False
        End If

        For Each item In chk_Filtro.Items
            If filtrados.Contains(item.Text) Or blnTodo = True Then
                item.Selected = True
            End If
        Next

        Funciones.AbrirModal("#Filtro")
        Funciones.EjecutaFuncion("fn_Desplazable('#Filtro');")
    End Sub

    Public Function ArmaConsulta(ByVal campo As String, ByVal elementos() As String) As String
        Dim Consulta As String = ""

        For Each item In elementos
            If Len(item) > 0 Then
                Consulta = Consulta & IIf(Len(Consulta) > 0, " OR ", " AND (") & campo & " = '" & IIf(item = "(VACIAS)", "", item) & "'"
            End If
        Next

        If Len(Consulta) > 0 Then
            Consulta = Consulta & ")"
        End If

        Return Consulta
    End Function

    Private Function GeneraDTFiltrado() As DataTable
        dtFiltrado = New DataTable
        With dtFiltrado
            .Columns.Add("NRO_TEMPORARIO")
            .Columns.Add("NRO_LAYER")
            .Columns.Add("ID_LINEA")
            .Columns.Add("LINEA")
            .Columns.Add("ID_CONTRATO")
            .Columns.Add("CONTRATO")
            .Columns.Add("TIPO_CONTRATO")
            .Columns.Add("COD_BROKER")
            .Columns.Add("BROKER")
            .Columns.Add("COD_CIA")
            .Columns.Add("COMPAÑIA")
            .Columns.Add("SUMA_ASEGURADA")
            .Columns.Add("PJE_SUMA")
            .Columns.Add("PRIMA")
            .Columns.Add("PJE_PRIMA")
            .Columns.Add("PJE_COMISION")
            .Columns.Add("COMISION")
            .Columns.Add("PRIMA_NETA")
        End With

        Return dtFiltrado
    End Function

    Private Sub btn_aceptar_filtro_Click(sender As Object, e As EventArgs) Handles btn_aceptar_filtro.Click
        Try
            Dim blnTodo As Boolean = True

            Dim hid_Control As HiddenField
            hid_Control = New HiddenField

            Select Case hid_Filtro.Value
                Case Filtros.Capa
                    hid_Control = hid_Capa
                Case Filtros.Linea
                    hid_Control = hid_Linea
                Case Filtros.Id_Contrato
                    hid_Control = hid_IdContrato
                Case Filtros.Broker
                    hid_Control = hid_Broker
                Case Filtros.Compañia
                    hid_Control = hid_Compañia
            End Select

            Dim ArrayOrden() As String = Split(hid_OrdenFiltrado.Value, "|")
            Dim Indice As Integer = Array.IndexOf(ArrayOrden, hid_Filtro.Value)

            If Indice = -1 Then
                hid_OrdenFiltrado.Value = hid_OrdenFiltrado.Value & "|" & hid_Filtro.Value
                ReDim Preserve ArrayOrden(ArrayOrden.Length)
                ArrayOrden(ArrayOrden.Length - 1) = hid_Filtro.Value
                Indice = ArrayOrden.Length - 1
            End If

            hid_Control.Value = ""

            For Each item In chk_Filtro.Items
                If item.Selected = True Then
                    hid_Control.Value = hid_Control.Value & IIf(Len(hid_Control.Value) > 0, "|", "") & item.Text
                Else
                    blnTodo = False
                End If
            Next

            If blnTodo = True Then
                hid_Control.Value = ""
            End If

            Dim Consulta As String = "NRO_TEMPORARIO > '0'"
            Consulta = Consulta & ArmaConsulta("NRO_LAYER", Split(hid_Capa.Value, "|"))
            Consulta = Consulta & ArmaConsulta("LINEA", Split(hid_Linea.Value, "|"))
            Consulta = Consulta & ArmaConsulta("ID_CONTRATO", Split(hid_IdContrato.Value, "|"))
            Consulta = Consulta & ArmaConsulta("BROKER", Split(hid_Broker.Value, "|"))
            Consulta = Consulta & ArmaConsulta("COMPAÑIA", Split(hid_Compañia.Value, "|"))

            GeneraDTFiltrado()

            Dim myRow() As Data.DataRow
            myRow = dtDistribucion.Select(Consulta)


            For Each item In myRow
                dtFiltrado.Rows.Add(item("NRO_TEMPORARIO"), item("NRO_LAYER"), item("ID_LINEA"), item("LINEA"), item("ID_CONTRATO"), item("CONTRATO"),
                                    item("TIPO_CONTRATO"), item("COD_BROKER"), item("BROKER"), item("COD_CIA"), item("COMPAÑIA"),
                                    item("SUMA_ASEGURADA"), item("PJE_SUMA"), item("PRIMA"), item("PJE_PRIMA"), item("PJE_COMISION"),
                                    item("COMISION"), item("PRIMA_NETA"))
            Next

            ConsultaTemporario(True)

        Catch ex As Exception
            Mensaje.MuestraMensaje("Resumen Temporario", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Private Sub btn_NingunoFiltro_Click(sender As Object, e As EventArgs) Handles btn_NingunoFiltro.Click
        Try
            For Each item In chk_Filtro.Items
                item.Selected = False
            Next
        Catch ex As Exception
            Mensaje.MuestraMensaje("Resumen Temporario", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Private Sub btn_TodosFiltro_Click(sender As Object, e As EventArgs) Handles btn_TodosFiltro.Click
        Try
            For Each item In chk_Filtro.Items
                item.Selected = True
            Next
        Catch ex As Exception
            Mensaje.MuestraMensaje("Resumen Temporario", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Private Sub SumaTotales()
        Dim dblSuma As Double = 0
        Dim dblPrima As Double = 0
        Dim dblComision As Double = 0
        Dim dblPrimaNeta As Double = 0

        For Each row In gvd_DetalleTemporario.Rows
            dblSuma = dblSuma + CDbl(Replace(TryCast(row.FindControl("txt_SumaAsegurada"), TextBox).Text, ",", ""))
            dblPrima = dblPrima + CDbl(Replace(TryCast(row.FindControl("txt_Prima"), TextBox).Text, ",", ""))
            dblComision = dblComision + CDbl(Replace(TryCast(row.FindControl("txt_Comision"), TextBox).Text, ",", ""))
            dblPrimaNeta = dblPrimaNeta + CDbl(Replace(TryCast(row.FindControl("txt_PrimaNeta"), TextBox).Text, ",", ""))
        Next

        txt_SumaAsegurada.Text = String.Format("{0:#,#0.00}", dblSuma)
        txt_Prima.Text = String.Format("{0:#,#0.00}", dblPrima)
        txt_Comision.Text = String.Format("{0:#,#0.00}", dblComision)
        txt_PrimaNeta.Text = String.Format("{0:#,#0.00}", dblPrimaNeta)
    End Sub

    Private Sub gvd_Temporarios_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles gvd_Temporarios.RowCommand
        Try
            Dim ws As New ws_Generales.GeneralesClient
            Dim server As String = ws.ObtieneParametro(8)

            If CType(gvd_Temporarios.Rows(e.CommandSource.NamingContainer.RowIndex).FindControl("txt_Nro"), TextBox).Text <> vbNullString Then
                server = Replace(Replace(server, "@Reporte", "Temporario"), "@Formato", "EXCEL") & "&id_pv=" & CType(gvd_Temporarios.Rows(e.CommandSource.NamingContainer.RowIndex).FindControl("txt_Nro"), TextBox).Text

                Funciones.EjecutaFuncion("window.open('" & server & "');")
            End If

        Catch ex As Exception
            Mensaje.MuestraMensaje("Resumen Temporario", ex.Message, TipoMsg.Falla)
        End Try
    End Sub
End Class
