Imports System.Data
Imports System.Data.SqlClient
Imports Mensaje

Partial Class OrdenPago_PlanPago
    Inherits System.Web.UI.Page
    Private dtConsulta As DataTable

    Private Enum Filtros
        Poliza = 0
        Capa
        RamoContable
        Id_Contrato
        Broker
        Compañia
        Cuota
        Fecha
        CuotaPro
        FechaPro
        Prima
    End Enum

    Public Property dtFacultativos() As DataTable
        Get
            Return Session("dtFacultativos")
        End Get
        Set(ByVal value As DataTable)
            Session("dtFacultativos") = value
        End Set
    End Property

    Public Property dtEndosos() As DataTable
        Get
            Return Session("dtEndosos")
        End Get
        Set(ByVal value As DataTable)
            Session("dtEndosos") = value
        End Set
    End Property

    Public Property dtGarantias() As DataTable
        Get
            Return Session("dtGarantias")
        End Get
        Set(ByVal value As DataTable)
            Session("dtGarantias") = value
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

    Protected Sub chk_Sel_CheckedChanged(sender As Object, e As EventArgs)
        Try
            fn_ActualizaDataGarantias()
            Dim row As GridViewRow = TryCast((TryCast(sender, CheckBox)).Parent.Parent, GridViewRow)
            ConsultaGarantias(False, gvd_ListaPolizas.DataKeys(row.RowIndex)("id_pv"), sender.checked)
        Catch ex As Exception
            Mensaje.MuestraMensaje("Plan de Pagos", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Private Sub ConsultaGarantias(ByVal blnFiltrado As Boolean, ByVal id_pv As Integer, ByVal blnSeleccion As Boolean)

        Dim FiltroBroker, FiltroCia, FiltroContrato, FecIni, FecFin As String

        If blnFiltrado = False Then
            hid_Poliza.Value = ""
            hid_Capa.Value = ""
            hid_RamoContable.Value = ""
            hid_IdContrato.Value = ""
            hid_Broker.Value = ""
            hid_Compañia.Value = ""
            hid_Cuota.Value = ""
            hid_Fecha.Value = ""
            hid_CuotaPro.Value = ""
            hid_FechaPro.Value = ""
            hid_Prima.Value = ""

            If blnSeleccion = True Then
                Dim sCnn As String = ""
                Dim sSel As String
                sCnn = ConfigurationManager.ConnectionStrings("CadenaConexion").ConnectionString

                If IsDate(txt_FecGarIni.Text) Then
                    FecIni = CDate(txt_FecGarIni.Text).ToString("yyyyMMdd")
                End If

                If IsDate(txt_FecGarFin.Text) Then
                    FecFin = CDate(txt_FecGarFin.Text).ToString("yyyyMMdd")
                End If

                fn_ActualizaDataFac()

                FiltroBroker = Funciones.ObtieneElementos(gvd_Broker, "Bro", False)
                FiltroCia = Funciones.ObtieneElementos(gvd_Compañia, "Cia", False)
                FiltroContrato = Funciones.ObtieneElementos(gvd_Contrato, "Fac", True)

                dtConsulta = New DataTable

                sSel = "spS_DetalleGarantia '" & id_pv & "','" &
                                                 FecIni & "','" &
                                                 FecFin & "','" &
                                                 FiltroContrato & "','" &
                                                 FiltroBroker & "','" &
                                                 FiltroCia & "'"

                Dim da As SqlDataAdapter

                da = New SqlDataAdapter(sSel, sCnn)

                da.Fill(dtConsulta)

                If dtConsulta.Rows.Count > 0 Then
                    For Each fila In dtConsulta.Rows
                        dtGarantias.Rows.Add(fila("id_pv"), fila("poliza"), fila("nro_layer"), fila("cod_ramo_contable"), fila("ramo_contable"), fila("id_contrato"),
                                             fila("nro_tramo"), fila("cod_cia_reas_brok"), fila("broker"), fila("cod_cia_reas_cia"), fila("compañia"),
                                             IIf(IsDBNull(fila("nro_cuota")), "", fila("nro_cuota")), fila("fecha"), IIf(IsDBNull(fila("pje_importe")), 0, fila("pje_importe")),
                                             IIf(IsDBNull(fila("nro_cuota_pro")), "", fila("nro_cuota_pro")), fila("fecha_pro"),
                                             IIf(IsDBNull(fila("pje_importe_pro")), 0, fila("pje_importe_pro")), IIf(IsDBNull(fila("pje_com")), 0, fila("pje_com")),
                                             IIf(IsDBNull(fila("Prima")), 0, fila("Prima")), IIf(IsDBNull(fila("Comision")), 0, fila("Comision")),
                                             IIf(IsDBNull(fila("Prima")), 0, fila("Prima")) - IIf(IsDBNull(fila("Comision")), 0, fila("Comision")))
                    Next
                End If
            Else
                Dim myRow() As Data.DataRow
                myRow = dtGarantias.Select("id_pv IN (" & id_pv & ")")

                For Each item In myRow
                    item.Delete()
                Next
                dtGarantias.AcceptChanges()
            End If

            dtFiltrado = dtGarantias
        End If

        Dim dataView As New DataView(dtFiltrado)
        dataView.Sort = "poliza ASC,nro_layer ASC,cod_ramo_contable ASC,id_contrato ASC,cod_cia_reas_brok ASC,cod_cia_reas_cia ASC,nro_cuota ASC"
        dtFiltrado = dataView.ToTable()

        Funciones.LlenaGrid(gvd_ListaGarantias, dtFiltrado)

        Dim btn_Poliza = DirectCast(gvd_ListaGarantias.HeaderRow.FindControl("btn_Poliza"), ImageButton)
        Dim btn_Capa = DirectCast(gvd_ListaGarantias.HeaderRow.FindControl("btn_Capa"), ImageButton)
        Dim btn_RamoContable = DirectCast(gvd_ListaGarantias.HeaderRow.FindControl("btn_RamoContable"), ImageButton)
        Dim btn_IdContrato = DirectCast(gvd_ListaGarantias.HeaderRow.FindControl("btn_IdContrato"), ImageButton)
        Dim btn_Broker = DirectCast(gvd_ListaGarantias.HeaderRow.FindControl("btn_Broker"), ImageButton)
        Dim btn_Compañia = DirectCast(gvd_ListaGarantias.HeaderRow.FindControl("btn_Compañia"), ImageButton)
        Dim btn_Cuota = DirectCast(gvd_ListaGarantias.HeaderRow.FindControl("btn_Cuota"), ImageButton)
        Dim btn_Fecha = DirectCast(gvd_ListaGarantias.HeaderRow.FindControl("btn_Fecha"), ImageButton)
        Dim btn_CuotaPro = DirectCast(gvd_ListaGarantias.HeaderRow.FindControl("btn_CuotaPro"), ImageButton)
        Dim btn_FechaPro = DirectCast(gvd_ListaGarantias.HeaderRow.FindControl("btn_FechaPro"), ImageButton)
        Dim btn_Prima = DirectCast(gvd_ListaGarantias.HeaderRow.FindControl("btn_Prima"), ImageButton)

        btn_Poliza.CssClass = IIf(Len(hid_Poliza.Value) > 0, "btn-filtro-verde", "btn-filtro")
        btn_Capa.CssClass = IIf(Len(hid_Capa.Value) > 0, "btn-filtro-verde", "btn-filtro")
        btn_RamoContable.CssClass = IIf(Len(hid_RamoContable.Value) > 0, "btn-filtro-verde", "btn-filtro")
        btn_IdContrato.CssClass = IIf(Len(hid_IdContrato.Value) > 0, "btn-filtro-verde", "btn-filtro")
        btn_Broker.CssClass = IIf(Len(hid_Broker.Value) > 0, "btn-filtro-verde", "btn-filtro")
        btn_Compañia.CssClass = IIf(Len(hid_Compañia.Value) > 0, "btn-filtro-verde", "btn-filtro")
        btn_Cuota.CssClass = IIf(Len(hid_Cuota.Value) > 0, "btn-filtro-verde", "btn-filtro")
        btn_Fecha.CssClass = IIf(Len(hid_Fecha.Value) > 0, "btn-filtro-verde", "btn-filtro")
        btn_CuotaPro.CssClass = IIf(Len(hid_CuotaPro.Value) > 0, "btn-filtro-verde", "btn-filtro")
        btn_FechaPro.CssClass = IIf(Len(hid_FechaPro.Value) > 0, "btn-filtro-verde", "btn-filtro")
        btn_Prima.CssClass = IIf(Len(hid_Prima.Value) > 0, "btn-filtro-verde", "btn-filtro")
    End Sub

    Private Sub btn_AddFac_Click(sender As Object, e As EventArgs) Handles btn_AddFac.Click
        Try
            fn_ActualizaDataFac()
            dtFacultativos.Rows.Add("false", "", "")
            LlenaGridFac(False)
        Catch ex As Exception
            Mensaje.MuestraMensaje("Plan de Pagos", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Private Sub btn_AddPol_Click(sender As Object, e As EventArgs) Handles btn_AddPol.Click
        Try
            Master.MuestraPolizario("gvd_Poliza", False, False)
        Catch ex As Exception
            Mensaje.MuestraMensaje("Plan de Pagos", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Private Sub LlenaGridFac(ByVal bln_Nuevo As Boolean, Optional ByVal bln_Llenado As Boolean = True)

        If bln_Nuevo = True Then
            dtFacultativos = New DataTable
            dtFacultativos.Columns.Add("sn_Delete")
            dtFacultativos.Columns.Add("Clave")
            dtFacultativos.Columns.Add("Descripcion")
        End If

        If bln_Llenado = True Then
            Funciones.LlenaGrid(gvd_Contrato, dtFacultativos)
        End If

    End Sub

    Private Sub LlenaGridEndosos(ByVal bln_Nuevo As Boolean)

        If bln_Nuevo = True Then
            dtEndosos = New DataTable
            dtEndosos.Columns.Add("sn_sel")
            dtEndosos.Columns.Add("id_pv")
            dtEndosos.Columns.Add("cod_suc")
            dtEndosos.Columns.Add("sucursal")
            dtEndosos.Columns.Add("cod_ramo")
            dtEndosos.Columns.Add("ramo")
            dtEndosos.Columns.Add("nro_pol")
            dtEndosos.Columns.Add("aaaa_endoso")
            dtEndosos.Columns.Add("nro_endoso")
            dtEndosos.Columns.Add("asegurado")
            dtEndosos.Columns.Add("grupo_endoso")
            dtEndosos.Columns.Add("tipo_endoso")
            dtEndosos.Columns.Add("fec_emi")
            dtEndosos.Columns.Add("fec_vig_desde")
            dtEndosos.Columns.Add("fec_vig_hasta")
            dtEndosos.Columns.Add("prima_neta")
            dtEndosos.Columns.Add("comisiones")
            dtEndosos.Columns.Add("prima_neta_reaseguro")
            dtEndosos.Columns.Add("sn_plan")
        End If

        Funciones.LlenaGrid(gvd_ListaPolizas, dtEndosos)
    End Sub

    Private Sub LlenaGridGarantias(ByVal bln_Nuevo As Boolean)

        If bln_Nuevo = True Then
            dtGarantias = New DataTable
            dtGarantias.Columns.Add("id_pv")
            dtGarantias.Columns.Add("poliza")
            dtGarantias.Columns.Add("nro_layer")
            dtGarantias.Columns.Add("cod_ramo_contable")
            dtGarantias.Columns.Add("ramo_contable")
            dtGarantias.Columns.Add("id_contrato")
            dtGarantias.Columns.Add("nro_tramo")
            dtGarantias.Columns.Add("cod_cia_reas_brok")
            dtGarantias.Columns.Add("broker")
            dtGarantias.Columns.Add("cod_cia_reas_cia")
            dtGarantias.Columns.Add("compañia")
            dtGarantias.Columns.Add("nro_cuota")
            dtGarantias.Columns.Add("fecha")
            dtGarantias.Columns.Add("pje_importe", GetType(Decimal))
            dtGarantias.Columns.Add("nro_cuota_pro")
            dtGarantias.Columns.Add("fecha_pro")
            dtGarantias.Columns.Add("pje_importe_pro", GetType(Decimal))
            dtGarantias.Columns.Add("pje_com", GetType(Decimal))
            dtGarantias.Columns.Add("Prima", GetType(Decimal))
            dtGarantias.Columns.Add("Comision", GetType(Decimal))
            dtGarantias.Columns.Add("prima_neta", GetType(Decimal))
        End If

        Funciones.LlenaGrid(gvd_ListaGarantias, dtGarantias)
    End Sub

    Private Function fn_ActualizaDataFac() As DataTable

        LlenaGridFac(True, False)

        For Each row In gvd_Contrato.Rows
            Dim chk_SelFac As HiddenField = TryCast(row.FindControl("chk_SelFac"), HiddenField)
            If chk_SelFac.Value <> "true" Then
                Dim lbl_ClaveFac As Label = TryCast(row.FindControl("lbl_ClaveFac"), Label)
                Dim txt_ClaveFac As TextBox = TryCast(row.FindControl("txt_ClaveFac"), TextBox)
                Dim txt_Desc As TextBox = TryCast(row.FindControl("txt_Desc"), TextBox)

                lbl_ClaveFac.Text = "'" & txt_ClaveFac.Text & "'"
                dtFacultativos.Rows.Add("false", txt_ClaveFac.Text, txt_Desc.Text)
            End If
        Next

        Return dtFacultativos
    End Function

    Private Function fn_ActualizaDataEndosos() As DataTable

        For Each row In gvd_ListaPolizas.Rows
            Dim chk_Sel As CheckBox = TryCast(row.FindControl("chk_Sel"), CheckBox)

            Dim myRow() As Data.DataRow
            myRow = dtEndosos.Select("id_pv ='" & gvd_ListaPolizas.DataKeys(row.RowIndex)("id_pv") & "'")

            If myRow.Length > 0 Then
                myRow(0)("sn_sel") = chk_Sel.Checked
            End If
        Next

        Return dtFacultativos
    End Function

    Private Sub OrdenPago_PlanPago_Load(sender As Object, e As EventArgs) Handles Me.Load
        Try
            If Not IsPostBack Then
                LlenaGridFac(True)
                LlenaGridEndosos(True)
                LlenaGridGarantias(True)
                GeneraDTFiltrado()
            End If
        Catch ex As Exception

        End Try
    End Sub

    Private Sub btn_Busqueda_Click(sender As Object, e As EventArgs) Handles btn_Busqueda.Click
        Try
            Dim FiltroBroker, FiltroCia, FiltroContrato, FiltroPoliza, FecIni, FecFin As String
            Dim sCnn As String = ""
            Dim sSel As String
            sCnn = ConfigurationManager.ConnectionStrings("CadenaConexion").ConnectionString

            If IsDate(txt_FecGarIni.Text) Then
                FecIni = CDate(txt_FecGarIni.Text).ToString("yyyyMMdd")
            End If

            If IsDate(txt_FecGarFin.Text) Then
                FecFin = CDate(txt_FecGarFin.Text).ToString("yyyyMMdd")
            End If

            fn_ActualizaDataFac()

            FiltroContrato = Funciones.ObtieneElementos(gvd_Contrato, "Fac", True)
            FiltroPoliza = Funciones.ObtieneElementos(gvd_Poliza, "Pol", False, True)
            FiltroBroker = Funciones.ObtieneElementos(gvd_Broker, "Bro", False)
            FiltroCia = Funciones.ObtieneElementos(gvd_Compañia, "Cia", False)

            sSel = "spS_PolizaGarantiaOP '" & FecIni & "','" &
                                              FecFin & "','" &
                                              txt_SearchAse.Text & "','" &
                                              FiltroContrato & "','" &
                                              FiltroPoliza & "','" &
                                              FiltroBroker & "','" &
                                              FiltroCia & "'"


            Dim da As SqlDataAdapter

            da = New SqlDataAdapter(sSel, sCnn)

            da.Fill(dtEndosos)

            LlenaGridEndosos(False)

        Catch ex As Exception
            Mensaje.MuestraMensaje("Plan de Pagos", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Private Sub gvd_ListaPolizas_PageIndexChanging(sender As Object, e As GridViewPageEventArgs) Handles gvd_ListaPolizas.PageIndexChanging
        Try
            fn_ActualizaDataEndosos()
            gvd_ListaPolizas.PageIndex = e.NewPageIndex
            LlenaGridEndosos(False)
        Catch ex As Exception
            Mensaje.MuestraMensaje("Plan de Pagos", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Private Sub gvd_ListaPolizas_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles gvd_ListaPolizas.RowDataBound
        Try
            If e.Row.RowType = DataControlRowType.DataRow Then
                If sender.DataKeys(e.Row.RowIndex)("sn_plan") = 0 Then
                    TryCast(e.Row.FindControl("txt_Sucursal"), TextBox).BackColor = System.Drawing.Color.Yellow
                    TryCast(e.Row.FindControl("txt_Ramo"), TextBox).BackColor = System.Drawing.Color.Yellow
                    TryCast(e.Row.FindControl("txt_NroPoliza"), TextBox).BackColor = System.Drawing.Color.Yellow
                    TryCast(e.Row.FindControl("txt_Sufijo"), TextBox).BackColor = System.Drawing.Color.Yellow
                    TryCast(e.Row.FindControl("txt_Endoso"), TextBox).BackColor = System.Drawing.Color.Yellow
                    TryCast(e.Row.FindControl("txt_Asegurado"), TextBox).BackColor = System.Drawing.Color.Yellow
                    TryCast(e.Row.FindControl("txt_GrupoEnd"), TextBox).BackColor = System.Drawing.Color.Yellow
                    TryCast(e.Row.FindControl("txt_TipoEnd"), TextBox).BackColor = System.Drawing.Color.Yellow
                    TryCast(e.Row.FindControl("txt_FechaEmi"), TextBox).BackColor = System.Drawing.Color.Yellow
                    TryCast(e.Row.FindControl("txt_FechaIV"), TextBox).BackColor = System.Drawing.Color.Yellow
                    TryCast(e.Row.FindControl("txt_FechaFV"), TextBox).BackColor = System.Drawing.Color.Yellow
                    TryCast(e.Row.FindControl("txt_PrimaNeta"), TextBox).BackColor = System.Drawing.Color.Yellow
                    TryCast(e.Row.FindControl("txt_Comisiones"), TextBox).BackColor = System.Drawing.Color.Yellow
                    TryCast(e.Row.FindControl("txt_PNR"), TextBox).BackColor = System.Drawing.Color.Yellow
                End If
            End If
        Catch ex As Exception
            Mensaje.MuestraMensaje("Plan de Pagos", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Private Sub gvd_ListaGarantias_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles gvd_ListaGarantias.RowDataBound
        Try
            If e.Row.RowType = DataControlRowType.DataRow Then
                If sender.DataKeys(e.Row.RowIndex)("Prima") <> 0 Then
                    TryCast(e.Row.FindControl("txt_FechaPro"), TextBox).Enabled = False
                    TryCast(e.Row.FindControl("txt_prcPro"), TextBox).Enabled = False

                    TryCast(e.Row.FindControl("lnk_Poliza"), LinkButton).BackColor = System.Drawing.Color.LightGreen
                    TryCast(e.Row.FindControl("txt_Capa"), TextBox).BackColor = System.Drawing.Color.LightGreen
                    TryCast(e.Row.FindControl("txt_RamoContable"), TextBox).BackColor = System.Drawing.Color.LightGreen
                    TryCast(e.Row.FindControl("txt_IdContrato"), TextBox).BackColor = System.Drawing.Color.LightGreen
                    TryCast(e.Row.FindControl("txt_Broker"), TextBox).BackColor = System.Drawing.Color.LightGreen
                    TryCast(e.Row.FindControl("txt_Compañia"), TextBox).BackColor = System.Drawing.Color.LightGreen
                    TryCast(e.Row.FindControl("txt_Cuota"), TextBox).BackColor = System.Drawing.Color.LightGreen
                    TryCast(e.Row.FindControl("txt_FechaOri"), TextBox).BackColor = System.Drawing.Color.LightGreen
                    TryCast(e.Row.FindControl("txt_prc"), TextBox).BackColor = System.Drawing.Color.LightGreen
                    TryCast(e.Row.FindControl("lnk_PNR"), LinkButton).BackColor = System.Drawing.Color.LightGreen

                ElseIf isdate(sender.DataKeys(e.Row.RowIndex)("fecha_pro")) Then
                    TryCast(e.Row.FindControl("lnk_Poliza"), LinkButton).BackColor = System.Drawing.Color.LightBlue
                    TryCast(e.Row.FindControl("txt_Capa"), TextBox).BackColor = System.Drawing.Color.LightBlue
                    TryCast(e.Row.FindControl("txt_RamoContable"), TextBox).BackColor = System.Drawing.Color.LightBlue
                    TryCast(e.Row.FindControl("txt_IdContrato"), TextBox).BackColor = System.Drawing.Color.LightBlue
                    TryCast(e.Row.FindControl("txt_Broker"), TextBox).BackColor = System.Drawing.Color.LightBlue
                    TryCast(e.Row.FindControl("txt_Compañia"), TextBox).BackColor = System.Drawing.Color.LightBlue
                    TryCast(e.Row.FindControl("txt_Cuota"), TextBox).BackColor = System.Drawing.Color.LightBlue
                    TryCast(e.Row.FindControl("txt_FechaOri"), TextBox).BackColor = System.Drawing.Color.LightBlue
                    TryCast(e.Row.FindControl("txt_prc"), TextBox).BackColor = System.Drawing.Color.LightBlue
                    TryCast(e.Row.FindControl("lnk_PNR"), LinkButton).BackColor = System.Drawing.Color.LightBlue

                End If
            End If
        Catch ex As Exception
            Mensaje.MuestraMensaje("Plan de Pagos", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Private Sub gvd_ListaGarantias_PageIndexChanging(sender As Object, e As GridViewPageEventArgs) Handles gvd_ListaGarantias.PageIndexChanging
        Try
            fn_ActualizaDataGarantias()
            gvd_ListaGarantias.PageIndex = e.NewPageIndex
            LlenaGridGarantias(False)
        Catch ex As Exception
            Mensaje.MuestraMensaje("Plan de Pagos", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Protected Sub DespliegaFiltro(sender As Object, e As ImageClickEventArgs)
        Dim elemento As String
        Dim Datos As New ArrayList()
        Dim filtrados() As String = {""}
        Dim blnTodo As Boolean = True
        Dim Generales() As String = Split(sender.AlternateText, "|")
        Dim Consulta As String = "id_pv > '0'"

        fn_ActualizaDataGarantias()

        hid_Filtro.Value = Generales(2)

        Dim ArrayOrden() As String = Split(hid_OrdenFiltrado.Value, "|")
        Dim Indice As Integer = Array.IndexOf(ArrayOrden, hid_Filtro.Value)

        For i = 1 To ArrayOrden.Length - 1
            If hid_Filtro.Value <> ArrayOrden(i) Then
                Select Case ArrayOrden(i)
                    Case Filtros.Poliza
                        Consulta = Consulta & ArmaConsulta("poliza", Split(hid_Poliza.Value, "|"))
                    Case Filtros.Capa
                        Consulta = Consulta & ArmaConsulta("nro_layer", Split(hid_Capa.Value, "|"))
                    Case Filtros.RamoContable
                        Consulta = Consulta & ArmaConsulta("ramo_contable", Split(hid_RamoContable.Value, "|"))
                    Case Filtros.Id_Contrato
                        Consulta = Consulta & ArmaConsulta("id_contrato", Split(hid_IdContrato.Value, "|"))
                    Case Filtros.Broker
                        Consulta = Consulta & ArmaConsulta("broker", Split(hid_Broker.Value, "|"))
                    Case Filtros.Compañia
                        Consulta = Consulta & ArmaConsulta("compañia", Split(hid_Compañia.Value, "|"))
                    Case Filtros.Cuota
                        Consulta = Consulta & ArmaConsulta("nro_cuota", Split(hid_Cuota.Value, "|"))
                    Case Filtros.Fecha
                        Consulta = Consulta & ArmaConsulta("fecha", Split(hid_Fecha.Value, "|"))
                    Case Filtros.CuotaPro
                        Consulta = Consulta & ArmaConsulta("nro_cuota_pro", Split(hid_CuotaPro.Value, "|"))
                    Case Filtros.FechaPro
                        Consulta = Consulta & ArmaConsulta("fecha_pro", Split(hid_FechaPro.Value, "|"))
                    Case Filtros.Prima
                        Consulta = Consulta & ArmaConsulta("prima_neta", Split(hid_Prima.Value, "|"))
                End Select
            End If
        Next


        Select Case hid_Filtro.Value
            Case Filtros.Poliza
                filtrados = Split(hid_Poliza.Value, "|")
            Case Filtros.Capa
                filtrados = Split(hid_Capa.Value, "|")
            Case Filtros.RamoContable
                filtrados = Split(hid_RamoContable.Value, "|")
            Case Filtros.Id_Contrato
                filtrados = Split(hid_IdContrato.Value, "|")
            Case Filtros.Broker
                filtrados = Split(hid_Broker.Value, "|")
            Case Filtros.Compañia
                filtrados = Split(hid_Compañia.Value, "|")
            Case Filtros.Cuota
                filtrados = Split(hid_Cuota.Value, "|")
            Case Filtros.Fecha
                filtrados = Split(hid_Fecha.Value, "|")
            Case Filtros.CuotaPro
                filtrados = Split(hid_CuotaPro.Value, "|")
            Case Filtros.FechaPro
                filtrados = Split(hid_FechaPro.Value, "|")
            Case Filtros.Prima
                filtrados = Split(hid_Prima.Value, "|")
        End Select

        'Titulo de la Ventana
        lbl_TituloFiltro.Text = "Filtrado " & Generales(1)

        chk_Filtro.Items.Clear()

        Dim myRow() As Data.DataRow
        myRow = dtGarantias.Select(Consulta)

        GeneraDTFiltrado()
        For Each fila In myRow
            dtFiltrado.Rows.Add(fila("id_pv"), fila("poliza"), fila("nro_layer"), fila("cod_ramo_contable"), fila("ramo_contable"), fila("id_contrato"),
                                fila("nro_tramo"), fila("cod_cia_reas_brok"), fila("broker"), fila("cod_cia_reas_cia"), fila("compañia"),
                                fila("nro_cuota"), fila("fecha"), fila("pje_importe"), fila("nro_cuota_pro"), fila("fecha_pro"),
                                fila("pje_importe_pro"), fila("pje_com"), fila("Prima"), fila("Comision"), fila("Prima") - fila("Comision"))
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
            .Columns.Add("id_pv")
            .Columns.Add("poliza")
            .Columns.Add("nro_layer")
            .Columns.Add("cod_ramo_contable")
            .Columns.Add("ramo_contable")
            .Columns.Add("id_contrato")
            .Columns.Add("nro_tramo")
            .Columns.Add("cod_cia_reas_brok")
            .Columns.Add("broker")
            .Columns.Add("cod_cia_reas_cia")
            .Columns.Add("compañia")
            .Columns.Add("nro_cuota")
            .Columns.Add("fecha")
            .Columns.Add("pje_importe", GetType(Decimal))
            .Columns.Add("nro_cuota_pro")
            .Columns.Add("fecha_pro")
            .Columns.Add("pje_importe_pro", GetType(Decimal))
            .Columns.Add("pje_com", GetType(Decimal))
            .Columns.Add("Prima", GetType(Decimal))
            .Columns.Add("Comision", GetType(Decimal))
            .Columns.Add("prima_neta", GetType(Decimal))
        End With

        Return dtFiltrado
    End Function

    Private Sub btn_NingunoFiltro_Click(sender As Object, e As EventArgs) Handles btn_NingunoFiltro.Click
        Try
            For Each item In chk_Filtro.Items
                item.Selected = False
            Next
        Catch ex As Exception
            Mensaje.MuestraMensaje("Plan de Pagos", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Private Sub btn_TodosFiltro_Click(sender As Object, e As EventArgs) Handles btn_TodosFiltro.Click
        Try
            For Each item In chk_Filtro.Items
                item.Selected = True
            Next
        Catch ex As Exception
            Mensaje.MuestraMensaje("Plan de Pagos", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Private Sub btn_aceptar_filtro_Click(sender As Object, e As EventArgs) Handles btn_aceptar_filtro.Click
        Try

            fn_ActualizaDataGarantias()

            Dim blnTodo As Boolean = True

            Dim hid_Control As HiddenField
            hid_Control = New HiddenField

            Select Case hid_Filtro.Value
                Case Filtros.Poliza
                    hid_Control = hid_Poliza
                Case Filtros.Capa
                    hid_Control = hid_Capa
                Case Filtros.RamoContable
                    hid_Control = hid_RamoContable
                Case Filtros.Id_Contrato
                    hid_Control = hid_IdContrato
                Case Filtros.Broker
                    hid_Control = hid_Broker
                Case Filtros.Compañia
                    hid_Control = hid_Compañia
                Case Filtros.Cuota
                    hid_Control = hid_Cuota
                Case Filtros.Fecha
                    hid_Control = hid_Fecha
                Case Filtros.CuotaPro
                    hid_Control = hid_CuotaPro
                Case Filtros.FechaPro
                    hid_Control = hid_FechaPro
                Case Filtros.Prima
                    hid_Control = hid_Prima
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

            Dim Consulta As String = "id_pv > '0'"
            Consulta = Consulta & ArmaConsulta("poliza", Split(hid_Poliza.Value, "|"))
            Consulta = Consulta & ArmaConsulta("nro_layer", Split(hid_Capa.Value, "|"))
            Consulta = Consulta & ArmaConsulta("ramo_contable", Split(hid_RamoContable.Value, "|"))
            Consulta = Consulta & ArmaConsulta("id_contrato", Split(hid_IdContrato.Value, "|"))
            Consulta = Consulta & ArmaConsulta("broker", Split(hid_Broker.Value, "|"))
            Consulta = Consulta & ArmaConsulta("compañia", Split(hid_Compañia.Value, "|"))
            Consulta = Consulta & ArmaConsulta("nro_cuota", Split(hid_Cuota.Value, "|"))
            Consulta = Consulta & ArmaConsulta("fecha", Split(hid_Fecha.Value, "|"))
            Consulta = Consulta & ArmaConsulta("nro_cuota_pro", Split(hid_CuotaPro.Value, "|"))
            Consulta = Consulta & ArmaConsulta("fecha_pro", Split(hid_FechaPro.Value, "|"))
            Consulta = Consulta & ArmaConsulta("prima_neta", Split(hid_Prima.Value, "|"))


            GeneraDTFiltrado()

            Dim myRow() As Data.DataRow
            myRow = dtGarantias.Select(Consulta)


            For Each fila In myRow
                dtFiltrado.Rows.Add(fila("id_pv"), fila("poliza"), fila("nro_layer"), fila("cod_ramo_contable"), fila("ramo_contable"), fila("id_contrato"),
                                    fila("nro_tramo"), fila("cod_cia_reas_brok"), fila("broker"), fila("cod_cia_reas_cia"), fila("compañia"),
                                    fila("nro_cuota"), fila("fecha"), fila("pje_importe"), fila("nro_cuota_pro"), fila("fecha_pro"),
                                    fila("pje_importe_pro"), fila("pje_com"), fila("Prima"), fila("Comision"), fila("Prima") - fila("Comision"))
            Next

            ConsultaGarantias(True, 0, False)

        Catch ex As Exception
            Mensaje.MuestraMensaje("Resumen Temporario", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Private Function fn_ActualizaDataGarantias() As DataTable

        For Each row In gvd_ListaGarantias.Rows
            Dim txt_CuotaPro As TextBox = TryCast(row.FindControl("txt_CuotaPro"), TextBox)
            Dim txt_FechaPro As TextBox = TryCast(row.FindControl("txt_FechaPro"), TextBox)
            Dim txt_prcPro As TextBox = TryCast(row.FindControl("txt_prcPro"), TextBox)


            Dim myRow() As Data.DataRow
            myRow = dtGarantias.Select("id_pv ='" & gvd_ListaGarantias.DataKeys(row.RowIndex)("id_pv") & "' AND " &
                                       "nro_layer ='" & gvd_ListaGarantias.DataKeys(row.RowIndex)("nro_layer") & "' AND " &
                                       "cod_ramo_contable ='" & gvd_ListaGarantias.DataKeys(row.RowIndex)("cod_ramo_contable") & "' AND " &
                                       "id_contrato ='" & gvd_ListaGarantias.DataKeys(row.RowIndex)("id_contrato") & "' AND " &
                                       "cod_cia_reas_brok ='" & gvd_ListaGarantias.DataKeys(row.RowIndex)("cod_cia_reas_brok") & "' AND " &
                                       "cod_cia_reas_cia ='" & gvd_ListaGarantias.DataKeys(row.RowIndex)("cod_cia_reas_cia") & "' AND " &
                                       "nro_cuota ='" & gvd_ListaGarantias.DataKeys(row.RowIndex)("nro_cuota") & "' AND " &
                                       "nro_cuota_pro ='" & TryCast(row.FindControl("txt_CuotaPro"), TextBox).Text & "'")


            If myRow.Length > 0 Then
                myRow(0)("nro_cuota_pro") = txt_CuotaPro.Text
                myRow(0)("fecha_pro") = txt_FechaPro.Text
                myRow(0)("pje_importe_pro") = IIf(Len(txt_prcPro.Text) = 0, 0, txt_prcPro.Text)
            End If
        Next

        Return dtGarantias
    End Function
End Class
