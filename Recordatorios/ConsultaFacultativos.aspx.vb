
Imports System.Data


Partial Class Recordatorios_ConsultaFacultativos
    Inherits System.Web.UI.Page

    Private Sub btn_AddPol_Click(sender As Object, e As EventArgs) Handles btn_AddPol.Click
        Master.MuestraPolizario("gvd_Poliza", False, False, False, False, False, True, Cons.Recordatorio.Siniestros)
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

    Private Sub btn_Buscar_Click(sender As Object, e As EventArgs) Handles btn_Buscar.Click
        SQLFiltros(Cons.Accion.Consultar)
    End Sub

    Private Function SQLFiltros(Accion As Integer) As Integer
        Dim FiltroBro As String = vbNullString
        Dim FiltroCia As String = vbNullString
        Dim FiltroPol As String = vbNullString
        Dim FiltroRamoCont As String = vbNullString
        Dim FiltroSiniestro As String = vbNullString
        Dim FiltroAsegurado As String = vbNullString
        Dim Elementos As String = vbNullString
        Dim TipoMov As Integer = 1
        Dim strConsulta As String = vbNullString

        If opcEsp.Checked Then
            TipoMov = 2
            strConsulta = "CONSULTA ESPECIALES"
        Else
            TipoMov = 1
            strConsulta = "CONSULTA FACULTATIVOS"
        End If

        Try

            Elementos = Funciones.ObtieneElementos(gvd_Broker, "Bro", False)
            If Elementos <> "" Then
                FiltroBro = Elementos
                Elementos = ""
            End If

            Elementos = Funciones.ObtieneElementos(gvd_Compañia, "Cia", False)
            If Elementos <> "" Then
                FiltroCia = Elementos
                Elementos = ""
            End If

            Elementos = Funciones.ObtieneElementos(gvd_Poliza, "Pol", True, True)
            If Elementos <> "" Then
                FiltroPol = Elementos
            End If

            Elementos = Funciones.ObtieneElementos(gvd_RamoContable, "RamC", False)
            If Elementos <> "" Then
                FiltroRamoCont = Elementos
            End If

            Elementos = Funciones.ObtieneElementos(gvd_Asegurado, "Ase", False)
            If Elementos <> "" Then
                FiltroAsegurado = Elementos
            End If

            If txt_NoSiniestro.Text <> "" Then
                FiltroSiniestro = txt_NoSiniestro.Text
            End If

            Dim strSQL As String
            Dim strFiltros As String
            Dim ws As New ws_Generales.GeneralesClient
            Dim wsO As New ws_Reporteador.ReporteadorClient
            strFiltros = "&FiltroBroker=" & FiltroBro
            strFiltros = strFiltros & "&FiltroCia=" & FiltroCia
            strFiltros = strFiltros & "&FiltroPol=" & Strings.Replace(FiltroPol, "'", "")
            strFiltros = strFiltros & "&FiltroRamoCont=" & FiltroRamoCont
            strFiltros = strFiltros & "&FiltroAse=" & FiltroAsegurado
            strFiltros = strFiltros & "&FiltroNoSin=" & FiltroSiniestro

            If Accion = Cons.Accion.Consultar Then
                Dim wsR As New ws_RecSiniestros.RecSiniestrosClient
                Dim Resultado As New DataTable

                Resultado = Funciones.Lista_A_Datatable(wsR.ObtieneSiniestros(TipoMov, FiltroSiniestro, FiltroBro, FiltroAsegurado, FiltroCia, FiltroRamoCont, FiltroPol, vbNullString, vbNullString).ToList)
                If Resultado.Rows.Count > 0 Then
                    gvd_Siniestros.DataSource = Resultado
                    gvd_Siniestros.DataBind()
                Else
                    Mensaje.MuestraMensaje("Busqueda", "No se encontraron registros con los criterios seleccionados", Mensaje.TipoMsg.Advertencia)
                End If
            Else
                    strSQL = "sp_rptMovSinxReas " & TipoMov & "," & FiltroSiniestro & ",'" & FiltroBro & "','" & FiltroAsegurado & "','" & FiltroCia & "','" & FiltroRamoCont & "','','','" & Strings.Replace(FiltroPol, "'", "") & "'"
                ws.ActualizaParametro(IIf(TipoMov = 2, Cons.ConsulEsp, Cons.ConsulFac), Replace(Replace(strSQL, "''", "NULL"), ",,", ",NULL,"))
                wsO.InsertaVersionReporte(Cons.ModuloRea, Cons.SubModRecSin, IIf(TipoMov = 2, Cons.RptEsp, Cons.RptFac), Master.cod_usuario, strConsulta, strFiltros, "NAV", 0)
                Mensaje.MuestraMensaje("Configuración Consulta", "Se almacenó correctamente la consulta", Mensaje.TipoMsg.Confirma)
                Limpiar()
            End If

        Catch ex As Exception
            Mensaje.MuestraMensaje("Falla", "Se generó un error al guardar o consultar información con los filtros elegidos", Mensaje.TipoMsg.Advertencia)
        End Try
    End Function


    Private Sub btn_CancelaFac_Click(sender As Object, e As EventArgs) Handles btn_CancelaFac.Click
        Limpiar()
    End Sub
    Private Sub Limpiar()
        gvd_Asegurado.DataSource = Nothing
        gvd_Asegurado.DataBind()
        gvd_Broker.DataSource = Nothing
        gvd_Broker.DataBind()
        gvd_Compañia.DataSource = Nothing
        gvd_Compañia.DataBind()
        gvd_Poliza.DataSource = Nothing
        gvd_Poliza.DataBind()
        gvd_RamoContable.DataSource = Nothing
        gvd_RamoContable.DataBind()
        gvd_Siniestros.DataSource = Nothing
        gvd_Siniestros.DataBind()

        txtSearchAse.Text = ""
        txt_NoSiniestro.Text = ""
    End Sub

    Protected Sub opcFac_CheckedChanged(sender As Object, e As EventArgs)
        opcEsp.Checked = False
        Limpiar()
    End Sub
    Protected Sub opcEsp_CheckedChanged(sender As Object, e As EventArgs)
        opcFac.Checked = False
        Limpiar()
    End Sub

    Private Sub btn_CargaConsulta_Click(sender As Object, e As EventArgs) Handles btn_CargaConsulta.Click
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
            lFiltros = ws.ObtieneVersionReporte(IIf(opcFac.Checked, Cons.RptFac, Cons.RptEsp), -1, "")
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
                                If FiltroBroker <> "" Then Funciones.LlenaCatGrid(gvd_Broker, "Bro", " AND cod_cia_reas in (" & FiltroBroker & ")")
                            Case 2
                                FiltroCia = Filtros(Indice).Substring(inicio, fin - inicio)
                                If FiltroCia <> "" Then Funciones.LlenaCatGrid(gvd_Compañia, "Cia", " AND cod_cia_reas in (" & FiltroCia & ")")
                            Case 3
                                FiltroPol = Filtros(Indice).Substring(inicio, fin - inicio)
                                Dim wsGen As New ws_Generales.GeneralesClient
                                Dim Resultado As New DataTable
                                If FiltroPol <> "" Then
                                    Resultado = Funciones.Lista_A_Datatable(wsGen.ObtieneCatalogo("Pol", " Where PV.id_pv in (" & FiltroPol & ")", "").ToList)
                                    If Not Resultado Is Nothing Then
                                        Resultado.Columns(3).ColumnName = "id_pv"
                                        gvd_Poliza.DataSource = Resultado
                                        gvd_Poliza.DataBind()
                                    End If
                                End If
                            Case 4
                                FiltroRamoC = Filtros(Indice).Substring(inicio, fin - inicio)
                                If FiltroRamoC <> "" Then Funciones.LlenaCatGrid(gvd_RamoContable, "RamC", " Where cod_ramo_contable in (" & FiltroRamoC & ")")
                            Case 5
                                FiltroAse = Filtros(Indice).Substring(inicio, fin - inicio)
                                If FiltroAse <> "" Then Funciones.LlenaCatGrid(gvd_Asegurado, "Ase", " Where mh.id_persona in (" & FiltroAse & ")")
                            Case 6
                                FiltroNoSin = Filtros(Indice).Substring(inicio, fin - inicio)
                                txt_NoSiniestro.Text = FiltroNoSin
                        End Select
                    End If
                Next



            End If




        Catch ex As Exception
            Mensaje.MuestraMensaje("", "", 1)
        End Try



    End Sub

    Private Sub gvd_Siniestros_PageIndexChanging(sender As Object, e As GridViewPageEventArgs) Handles gvd_Siniestros.PageIndexChanging
        gvd_Siniestros.PageIndex = e.NewPageIndex
        SQLFiltros(Cons.Accion.Consultar)

    End Sub

    Private Sub btn_GuardarCons_Click(sender As Object, e As EventArgs) Handles btn_GuardarCons.Click
        SQLFiltros(Cons.Accion.Guardar)
    End Sub

    Private Sub btn_PolDescart_Click(sender As Object, e As EventArgs) Handles btn_PolDescart.Click
        Funciones.AbrirModal("#DescartadasModal")
    End Sub
End Class
