
Imports System.Data
Partial Class Recordatorios_DetalleSiniestros
    Inherits System.Web.UI.Page

    Private Sub gvd_Siniestros_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles gvd_Siniestros.RowCommand
        'Dim Indice As Int32
        'Indice = e.CommandArgument
        Dim NoSiniestro As Integer

        Dim wsGmx As New ws_RecSiniestros.RecSiniestrosClient
        Dim Resultado As New DataTable
        Dim FechaGen As String
        FechaGen = Session("FechaGen").ToString
        Resultado = Nothing
        Dim vIndex As Integer
        Try
            If e.CommandName = "MuestraDetalle" Then
                vIndex = e.CommandSource.NamingContainer.RowIndex
                NoSiniestro = gvd_Siniestros.DataKeys(vIndex)("SINIESTRO")
                Dim NumSinl As Label = DirectCast(Page.FindControl("NumSin"), Label)
                NumSin.Text = "Siniestro: " & NoSiniestro
                Session.Add("NoStro", "")
                Session("NoStro") = NoSiniestro
                Resultado = Funciones.Lista_A_Datatable(wsGmx.ObtieneSiniestros(IIf(opcFac.Checked, Cons.TipoMov.Fac, Cons.TipoMov.Esp), NoSiniestro, vbNullString, vbNullString, vbNullString, vbNullString, vbNullString, FechaGen, FechaGen).ToList)
                If Resultado.Rows.Count() > 0 Then
                    OcultaMuestraBtns(True)
                End If
                gvd_Detalle.DataSource = Resultado
                gvd_Detalle.DataBind()
            ElseIf e.CommandName = "GuardaAJ" Then
                vIndex = e.CommandSource.NamingContainer.RowIndex
            ElseIf e.CommandName = "Justifica" Then
                vIndex = e.CommandSource.NamingContainer.RowIndex
            End If

        Catch ex As Exception
            Mensaje.MuestraMensaje("Error", "Falla al obtener información", Mensaje.TipoMsg.Falla)
        End Try


    End Sub

    Private Sub Recordatorios_DetalleSiniestros_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim FechaGen As String
        If Not IsPostBack Then
            FechaGen = Replace(Request.QueryString("FechaRpt"), "", vbNullString)
            Session.Add("FechaGen", "")
            Session("FechaGen") = FechaGen
            lbl_FechaGen.Text = "Fecha de Consulta: " & Right(FechaGen, 2) & "/" & Mid(FechaGen, 5, 2) & "/" & Left(FechaGen, 4)
            CargaConsulta(Cons.TipoMov.Fac, FechaGen)
        End If

        Dim CheckBoxArray As ArrayList
        If ViewState("CheckBoxArray") IsNot Nothing Then
            CheckBoxArray = DirectCast(ViewState("CheckBoxArray"), ArrayList)
        Else
            CheckBoxArray = New ArrayList()
        End If

        If IsPostBack Then
            Dim CheckBoxIndex As Integer
            Dim CheckAllWasChecked As Boolean = False
            Dim chkAll As CheckBox = DirectCast(gvd_Siniestros.HeaderRow.Cells(0).FindControl("chkAll"), CheckBox)

            Dim checkAllIndex As String = "chkAll-" & gvd_Siniestros.PageIndex

            If chkAll.Checked Then
                If CheckBoxArray.IndexOf(checkAllIndex) = -1 Then
                    CheckBoxArray.Add(checkAllIndex)
                End If
            Else
                If CheckBoxArray.IndexOf(checkAllIndex) <> -1 Then
                    CheckBoxArray.Remove(checkAllIndex)
                    CheckAllWasChecked = True
                End If
            End If
            For i As Integer = 0 To gvd_Siniestros.Rows.Count - 1

                If gvd_Siniestros.Rows(i).RowType = DataControlRowType.DataRow Then
                    Dim chk_hid As HiddenField = DirectCast(gvd_Siniestros.Rows(i).Cells(0).FindControl("chk_SelSin"), HiddenField)
                    If chk_hid.Value = True Then gvd_Siniestros.Rows(i).Visible = False

                    Dim chk As CheckBox =
                     DirectCast(gvd_Siniestros.Rows(i).Cells(0) _
                     .FindControl("chkSeguir"), CheckBox)
                        CheckBoxIndex = gvd_Siniestros.PageSize * gvd_Siniestros.PageIndex + (i + 1)
                        If chk.Checked Then
                            If CheckBoxArray.IndexOf(CheckBoxIndex) = -1 And
                                Not CheckAllWasChecked Then
                                CheckBoxArray.Add(CheckBoxIndex)
                            End If
                        Else
                            If CheckBoxArray.IndexOf(CheckBoxIndex) <> -1 Or
                                CheckAllWasChecked Then
                                CheckBoxArray.Remove(CheckBoxIndex)
                            End If
                        End If
                    End If
            Next
        End If
        ViewState("CheckBoxArray") = CheckBoxArray
    End Sub
    Private Sub CargaConsulta(TipoMov As Integer, FechaGen As String)
        Dim ws As New ws_Reporteador.ReporteadorClient
        Dim lFiltros As IList = Nothing
        Dim lFiltrosF As IList = Nothing
        Dim Filtros As String() = Nothing
        Dim FiltroBroker As String = ""
        Dim FiltroCia As String = ""
        Dim FiltroPol As String = ""
        Dim FiltroRamoC As String = ""
        Dim FiltroAse As String = ""
        Dim FiltroNoSin As String = ""
        Dim inicio As Integer
        Dim fin As Integer

        Try


            lFiltros = ws.ObtieneVersionReporte(IIf(TipoMov = 1, Cons.RptFac, Cons.RptEsp), -1, "")
            Dim Elementos As Integer = lFiltros.Count

            If Elementos > 0 Then
                Filtros = Strings.Split(lFiltros(Elementos - 1).filtros, "&")

                For Indice = 1 To Filtros.Count - 1
                    inicio = InStr(Filtros(Indice), "=")
                    fin = Len(Filtros(Indice))
                    If fin <> inicio Then
                        Select Case Indice
                            Case 1
                                FiltroBroker = Filtros(Indice).Substring(inicio, fin - inicio)
                            Case 2
                                FiltroCia = Filtros(Indice).Substring(inicio, fin - inicio)
                            Case 3
                                FiltroPol = Filtros(Indice).Substring(inicio, fin - inicio)
                            Case 4
                                FiltroRamoC = Filtros(Indice).Substring(inicio, fin - inicio)
                            Case 5
                                FiltroAse = Filtros(Indice).Substring(inicio, fin - inicio)
                            Case 6
                                FiltroNoSin = Filtros(Indice).Substring(inicio, fin - inicio)
                        End Select
                    End If
                Next

                Dim Resultado As New DataTable
                Dim wsR As New ws_RecSiniestros.RecSiniestrosClient

                'cambiar el orden de los parametros. Revisar luego
                Resultado = Funciones.Lista_A_Datatable(wsR.ObtieneSiniestros(TipoMov, Replace(FiltroNoSin, "", vbNullString),
                                      Replace(FiltroBroker, "", vbNullString), Replace(FiltroAse, "", vbNullString),
                                      Replace(FiltroCia, "", vbNullString), Replace(FiltroRamoC, "", vbNullString),
                                      Replace(FiltroPol, "", vbNullString), Replace(FechaGen, "", vbNullString),
                                      Replace(FechaGen, "", vbNullString)).ToList())


                If Not Resultado Is Nothing Then
                    '---Agrupa
                    Dim dtAux As New DataTable
                    dtAux.Columns.Add("SINIESTRO", Type.GetType("System.String"))
                    dtAux.Columns.Add("SUBSINIESTRO", Type.GetType("System.String"))
                    dtAux.Columns.Add("SUCURSAL", Type.GetType("System.String"))
                    dtAux.Columns.Add("RAMO", Type.GetType("System.String"))
                    dtAux.Columns.Add("POLIZA", Type.GetType("System.String"))
                    dtAux.Columns.Add("SUFIJO", Type.GetType("System.String"))
                    dtAux.Columns.Add("ENDOSO", Type.GetType("System.String"))
                    dtAux.Columns.Add("UBICACION", Type.GetType("System.String"))
                    dtAux.Columns.Add("EVENTO_CAT", Type.GetType("System.String"))

                    Dim UltimoId As Integer
                    For Each irow In Resultado.Rows
                        If UltimoId <> irow("SINIESTRO") Then
                            dtAux.NewRow()
                            dtAux.Rows.Add(New Object() {irow("SINIESTRO"), irow("SUBSINIESTRO"), irow("SUCURSAL"), irow("RAMO"),
                                       irow("POLIZA"), irow("SUFIJO"), irow("ENDOSO"), irow("UBICACION"), irow("EVENTO_CAT")})

                            UltimoId = irow("SINIESTRO")
                        End If

                    Next

                    gvd_Siniestros.DataSource = dtAux
                    gvd_Siniestros.DataBind()
                End If

            End If

        Catch ex As Exception
            Mensaje.MuestraMensaje("", "", Mensaje.TipoMsg.Falla)

        End Try
    End Sub
    Protected Sub opcFac_CheckedChanged(sender As Object, e As EventArgs)
        opcEsp.Checked = False
        Limpiar()
        Dim FechaGen As String
        FechaGen = Session("FechaGen")
        CargaConsulta(Cons.TipoMov.Fac, FechaGen)
    End Sub
    Protected Sub opcEsp_CheckedChanged(sender As Object, e As EventArgs)
        opcFac.Checked = False
        Limpiar()
        Dim FechaGen As String
        FechaGen = Session("FechaGen")
        CargaConsulta(Cons.TipoMov.Esp, FechaGen)
    End Sub
    Private Sub Limpiar()
        gvd_Siniestros.DataSource = Nothing
        gvd_Siniestros.DataBind()
        gvd_Detalle.DataSource = Nothing
        gvd_Detalle.DataBind()

    End Sub

    Private Sub gvd_Siniestros_PageIndexChanging(sender As Object, e As GridViewPageEventArgs) Handles gvd_Siniestros.PageIndexChanging
        gvd_Siniestros.PageIndex = e.NewPageIndex
        Dim FechaGen As String
        FechaGen = Session("FechaGen")
        CargaConsulta(IIf(opcFac.Checked, Cons.TipoMov.Fac, Cons.TipoMov.Esp), FechaGen)

        If ViewState("CheckBoxArray") IsNot Nothing Then
            Dim CheckBoxArray As ArrayList =
            DirectCast(ViewState("CheckBoxArray"), ArrayList)
            Dim checkAllIndex As String = "chkAll-" & gvd_Siniestros.PageIndex

            If CheckBoxArray.IndexOf(checkAllIndex) <> -1 Then
                Dim chkAll As CheckBox =
                DirectCast(gvd_Siniestros.HeaderRow.Cells(0) _
                .FindControl("chkAll"), CheckBox)
                chkAll.Checked = True
            End If
            For i As Integer = 0 To gvd_Siniestros.Rows.Count - 1
                If gvd_Siniestros.Rows(i).RowType = DataControlRowType.DataRow Then
                    If CheckBoxArray.IndexOf(checkAllIndex) <> -1 Then
                        Dim chk As CheckBox =
                        DirectCast(gvd_Siniestros.Rows(i).Cells(0) _
                        .FindControl("chkSeguir"), CheckBox)
                        chk.Checked = True
                        'gvd_Siniestros.Rows(i).Attributes.Add("style", "background-color:aqua")
                    Else
                        Dim CheckBoxIndex As Integer = gvd_Siniestros.PageSize * (gvd_Siniestros.PageIndex) + (i + 1)
                        If CheckBoxArray.IndexOf(CheckBoxIndex) <> -1 Then
                            Dim chk As CheckBox =
                            DirectCast(gvd_Siniestros.Rows(i).Cells(0) _
                            .FindControl("chkSeguir"), CheckBox)
                            chk.Checked = True
                            '   gvd_Siniestros.Rows(i).Attributes.Add("style", "background-color:aqua")
                        End If
                    End If
                End If
            Next
        End If


    End Sub

    Private Sub lnk_PrevioAC_Click(sender As Object, e As EventArgs) Handles lnk_PrevioAC.Click
        If gvd_Detalle.Rows.Count > 0 Then

            Dim ws As New ws_Generales.GeneralesClient
            Dim server As String = ws.ObtieneParametro(Cons.ParamRpt)
            Dim Parametros As String = ParametrosRpt()
            server = Replace(Replace(server, "@Reporte", "AvisoCobroSin"), "&rs%3AFormat=@Formato", "") & Parametros
            Funciones.EjecutaFuncion("window.open('" & server & "');")
        Else
            Mensaje.MuestraMensaje("Validacion", "No existe registro seleccionado", Mensaje.TipoMsg.Advertencia)
        End If

    End Sub

    Public Function ParametrosRpt() As String
        Dim FecDesde As String
        Dim FecHasta As String
        Dim NoStro As String
        Dim Id_Pv As String
        Dim CadenaFinal As String

        Dim TipoMov As String

        Id_Pv = gvd_Detalle.DataKeys(0)("ID_PV")
        FecDesde = Session("FechaGen").ToString()
        FecHasta = Session("FechaGen").ToString()

        NoStro = Session("NoStro").ToString()
        TipoMov = IIf(opcFac.Checked, Cons.TipoMov.Fac, Cons.TipoMov.Esp)


        CadenaFinal = "&fec_desde=" & FecDesde & "&fec_hasta=" & FecHasta & "&tipo_mov=" & TipoMov & "&nro_stro=" & NoStro & "&id_pv=" & Id_Pv
        Return CadenaFinal

    End Function

    Private Sub btn_GuardaAJ_Click(sender As Object, e As EventArgs) Handles btn_GuardaAJ.Click
        Dim wsGmx As New ws_RecSiniestros.RecSiniestrosClient

        Try
            Dim NoStro As String = Session("NoStro").ToString()

            If gvd_Detalle.Rows.Count > 0 Then

                Dim lblini As Label = DirectCast(gvd_Detalle.Rows(0).Cells(0).FindControl("lbl_FecIniVig"), Label)
                Dim lblFin As Label = DirectCast(gvd_Detalle.Rows(0).Cells(0).FindControl("lbl_FecFinVig"), Label)
                Dim lblCausa As Label = DirectCast(gvd_Detalle.Rows(0).Cells(0).FindControl("lbl_CausaStro"), Label)
                Dim lblDirStro As Label = DirectCast(gvd_Detalle.Rows(0).Cells(0).FindControl("lbl_DirStro"), Label)
                Dim lblAjustador As Label = DirectCast(gvd_Detalle.Rows(0).Cells(0).FindControl("lbl_Ajustador"), Label)
                Dim lblid_pv As Label = DirectCast(gvd_Detalle.Rows(0).Cells(0).FindControl("lblId_Pv"), Label)

                lbl_NumSinModal.Text = "No. Siniestro: " & NoStro
                txt_ModFecIni.Text = lblini.Text
                txt_ModFecFin.Text = lblFin.Text
                txt_ModCausaStro.Text = lblCausa.Text
                txt_ModDirStro.Text = lblDirStro.Text
                txt_ModAjustador.Text = lblAjustador.Text

                Dim Resultado As New DataTable
                Resultado = Funciones.Lista_A_Datatable(wsGmx.ObtieneRepartoFac(lblid_pv.Text, NoStro).ToList)
                gvd_ModFac.DataSource = Resultado
                gvd_ModFac.DataBind()

            End If
            Funciones.AbrirModal("#GuardaAjustesAC")
        Catch ex As Exception

        End Try
    End Sub

    Private Sub btn_CancelaDet_Click(sender As Object, e As EventArgs) Handles btn_CancelaDet.Click
        gvd_Detalle.DataSource = Nothing
        gvd_Detalle.DataBind()
        OcultaMuestraBtns(False)
        Dim NumSinl As Label = DirectCast(Page.FindControl("NumSin"), Label)
        NumSin.Text = ""
    End Sub

    Private Sub gvd_Detalle_PageIndexChanging(sender As Object, e As GridViewPageEventArgs) Handles gvd_Detalle.PageIndexChanging
        gvd_Detalle.PageIndex = e.NewPageIndex
        Dim wsGmx As New ws_RecSiniestros.RecSiniestrosClient
        Dim Resultado As New DataTable
        Dim NoSiniestro As Integer = Session("NoStro")
        Dim FechaGen As String
        FechaGen = Session("FechaGen").ToString
        Resultado = Funciones.Lista_A_Datatable(wsGmx.ObtieneSiniestros(IIf(opcFac.Checked, Cons.TipoMov.Fac, Cons.TipoMov.Esp), NoSiniestro, vbNullString, vbNullString, vbNullString, vbNullString, vbNullString, FechaGen, FechaGen).ToList)
        gvd_Detalle.DataSource = Resultado
        gvd_Detalle.DataBind()
    End Sub

    Private Sub OcultaMuestraBtns(Estado As Boolean)
        btn_GuardaAJ.Visible = Estado
        btn_CancelaDet.Visible = Estado
        lnk_PrevioAC.Visible = Estado
        btn_Todos.Visible = Estado
        btn_Selec.Visible = Estado

    End Sub

End Class
