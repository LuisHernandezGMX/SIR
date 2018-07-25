Imports System.Data
Imports System.Data.SqlClient
Imports Mensaje
Partial Class MesaControl_Tablero
    Inherits System.Web.UI.Page

    Private Enum Operacion
        Ninguna
        Monitor
    End Enum

    Private Enum Filtros
        Responsable = 0
        Asegurado
        Moneda
        Regional
        Suscriptor
    End Enum

    Public Property dtNegocios() As DataTable
        Get
            Return Session("dtNegocios")
        End Get
        Set(ByVal value As DataTable)
            Session("dtNegocios") = value
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

    Public Property dtEstatus() As DataTable
        Get
            Return Session("dtEstatus")
        End Get
        Set(ByVal value As DataTable)
            Session("dtEstatus") = value
        End Set
    End Property

    Public Property dtColocacion() As DataTable
        Get
            Return Session("dtColocacion")
        End Get
        Set(ByVal value As DataTable)
            Session("dtColocacion") = value
        End Set
    End Property

    Public Property dtNegocioXRamo() As DataTable
        Get
            Return Session("dtNegocioXRamo")
        End Get
        Set(ByVal value As DataTable)
            Session("dtNegocioXRamo") = value
        End Set
    End Property

    Public Property dtNegocioXOficina() As DataTable
        Get
            Return Session("dtNegocioXOficina")
        End Get
        Set(ByVal value As DataTable)
            Session("dtNegocioXOficina") = value
        End Set
    End Property

    Private Sub MesaControl_Tablero_Load(sender As Object, e As EventArgs) Handles Me.Load
        Try
            If Not IsPostBack Then
                Funciones.LlenaCatDDL(ddl_Moneda, "Mon",,,,, -1)
                LlenaGridColocacion(True)
                LlenaGridNegocioXRamo(True)
                LlenaGridNegocioXOficina(True)

                EdoControl(Operacion.Ninguna)


            End If
        Catch ex As Exception

        End Try
    End Sub

    Private Function ArmaLinkMail(strNumOrds As String) As String
        Dim ws As New ws_Generales.GeneralesClient
        Dim strLink As String = ws.ObtieneParametro(4) & "/OrdenPago/FirmasElectronicas.aspx"
        Dim strParametros As String
        strParametros = "?NumOrds=" & strNumOrds
        strLink += strParametros
        Return strLink
    End Function

    Private Function FormatoCorreo(strNumOrds As String, UsuSol As String, TipoPer As Integer) As String


        Dim strBody As String = ""
        strBody = "<table style = 'margin: 0px; border: medium; border-image: none; border-collapse: collapse;' border='1' cellspacing='0' cellpadding='0'>"
        strBody += "<tbody> <tr style = 'mso-yfti-irow:0;mso-yfti-firstrow:yes;mso-yfti-lastrow:yes' >"
        strBody += "<td width='395' valign='top' style='margin: 0px; padding: 0cm 5.4pt; border: 1px solid rgb(0, 0, 0); border-image: none; width: 296pt; background-color: transparent;'>"
        strBody += "<p style='margin: 0px; line-height: normal;'><span style='margin: 0px; color: rgb(0, 32, 96);'><img width='74' height='74' src='\\gmxqroapp02\inetpub\wwwroot\OrdenPago\Images\Firmas\logo_gmx.jpg' v:shapes='Imagen_x0020_2'></span><span style='margin: 0px; color: rgb(0, 32, 96);'><span style='margin: 0px;'><font face='Calibri'>&nbsp;&nbsp;&nbsp;&nbsp; </font></span><span style='margin: 0px;'><font face='Calibri'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font></span></span><b style='mso-bidi-font-weight:&#10;  normal'><span style='margin: 0px; color: rgb(0, 32, 96); font-family: ' Myriad Pro',' sans-serif'; font-size: 16pt;'>GMX Seguros</span></b></p>"
        strBody += "<p style='margin: 0px; line-height: normal;'><span style='margin: 0px; color: rgb(0, 32, 96); font-family: ' Myriad Pro',' sans-serif';'>Autorización"
        strBody += " de Órdenes de Pago.</span></p>"
        strBody += "<p style='margin: 0px; line-height: normal;'><span style='margin: 0px; color: rgb(0, 32, 96); font-family: ' Myriad Pro',' sans-serif';'>&nbsp;</span></p>"
        strBody += "<p style='margin: 0px; line-height: normal;'><span style='margin: 0px; color: rgb(0, 32, 96); font-family: ' Myriad Pro',' sans-serif';'>Se solicita por parte de <b style='mso-bidi-font-weight:normal'>" & UsuSol & " </b>, sean firmadas"
        strBody += " las siguientes órdenes de pago por <b style='mso-bidi-font-weight:normal'> Administrador: </b> </span></p>"
        strBody += "<p style='margin: 0px; line-height: normal;'><span style='margin: 0px; color: rgb(0, 32, 96); font-family: ' Myriad Pro',' sans-serif';'><b style='mso-bidi-font-weight:normal'>" & strNumOrds & "</b></span></p>"
        strBody += "<p style='margin: 0px; line-height: normal;'><span style='margin: 0px; color: rgb(0, 32, 96); font-family: ' Myriad Pro',' sans-serif';'>Para"
        strBody += " firmarlas electrónicamente dar clic en el enlace debajo:</span></p>"
        strBody += "<p align='center' style='margin: 0px; text-align: center; line-height: normal;'><a href='"
        strBody += ArmaLinkMail(strNumOrds)
        strBody += "'><font color='#0000ff' face='Calibri'>Click Aqui</font></a></p>"
        strBody += "<p style='margin: 0px; line-height: normal;'><font face='Calibri'>&nbsp;</font></p>"
        strBody += "</td>"
        strBody += "<td width = '204' valign='top' style='background: rgb(15, 36, 62); border-width: 1px 1px 1px 0px; border-style: solid solid solid none; border-color: rgb(0, 0, 0); margin: 0px; padding: 0cm 5.4pt; border-image: none; width: 152.9pt;'>"
        strBody += "<p align='center' style='margin 0px; text-align: center; line-height: normal;'><img width='62' height='62' src='\\gmxqroapp02\inetpub\wwwroot\OrdenPago\Images\Firmas\logomail.png' v:shapes='_x0000_i1025'></p>"
        strBody += " <br> "
        strBody += "<p align ='center' style='margin 0px; text-align: center; line-height: normal;'><img width='62' height='62' src='\\gmxqroapp02\inetpub\wwwroot\OrdenPago\Images\Firmas\icono-pago_blanco.png' v:shapes='_x0000_i1025'></p>"
        strBody += "</td>"
        strBody += "</tr>"
        strBody += "</tbody></table>"

        Return strBody

    End Function

    Private Sub EdoControl(ByVal intOperacion As Integer)
        Select Case intOperacion
            Case Operacion.Monitor
                txt_Folio.Enabled = False
                txt_SearchOfi.Enabled = False
                btn_SelOficina.Attributes.Add("disabled", "true")
                txtFecGeneraDe.Enabled = False
                txtFecGeneraA.Enabled = False
                ddl_Moneda.Enabled = False
                txt_SearchResp.Enabled = False
                btn_SelResponsable.Attributes.Add("disabled", "true")
                txt_SearchAse.Enabled = False
                gvd_Agrupador.Enabled = False
                btn_AddRamoContable.Attributes.Add("disabled", "true")
                gvd_Ramo.Enabled = False
                btn_AddProducto.Attributes.Add("disabled", "true")
                gvd_Broker.Enabled = False
                btn_AddBroker.Attributes.Add("disabled", "true")
                gvd_Compañia.Enabled = False
                btn_AddCia.Attributes.Add("disabled", "true")
                btn_Monitor.Visible = False
                btn_Actualizar.Visible = True
                btn_Cancelar.Visible = True

            Case Operacion.Ninguna
                txt_Folio.Enabled = True
                txt_SearchOfi.Enabled = True
                btn_SelOficina.Attributes.Remove("disabled")
                txtFecGeneraDe.Enabled = True
                txtFecGeneraA.Enabled = True
                ddl_Moneda.Enabled = True
                txt_SearchResp.Enabled = True
                btn_SelResponsable.Attributes.Remove("disabled")
                txt_SearchAse.Enabled = True
                gvd_Agrupador.Enabled = True
                btn_AddRamoContable.Attributes.Remove("disabled")
                gvd_Ramo.Enabled = True
                btn_AddProducto.Attributes.Remove("disabled")
                gvd_Broker.Enabled = True
                btn_AddBroker.Attributes.Remove("disabled")
                gvd_Compañia.Enabled = True
                btn_AddCia.Attributes.Remove("disabled")
                btn_Monitor.Visible = True
                btn_Actualizar.Visible = False
                btn_Cancelar.Visible = False

                Funciones.LlenaGrid(gvd_Monitor, Nothing)
                dtNegocios = Nothing

                hid_Filtro.Value = 0
                hid_OrdenFiltrado.Value = -1
                hid_Responsable.Value = vbNullString
                hid_Asegurado.Value = vbNullString
                hid_Moneda.Value = vbNullString
                hid_Regional.Value = vbNullString
                hid_Suscriptor.Value = vbNullString
        End Select
    End Sub

    Private Sub ConsultaNegocios(ByVal blnFiltrado As Boolean)
        If blnFiltrado = False Then
            Dim id_folio As String = IIf(Len(txt_Folio.Text) = 0, -1, Replace(txt_Folio.Text, "REAS-", ""))
            Dim id_regional As Integer = IIf(Len(txt_ClaveOfi.Text) = 0, -1, txt_ClaveOfi.Text)

            Dim fecha_crea_ini, fecha_crea_fin As String
            If IsDate(txtFecGeneraDe.Text) Then
                fecha_crea_ini = CDate(txtFecGeneraDe.Text).ToString("yyyyMMdd")
            Else
                fecha_crea_ini = vbNullString
            End If

            If IsDate(txtFecGeneraA.Text) Then
                fecha_crea_fin = CDate(txtFecGeneraA.Text).ToString("yyyyMMdd")
            Else
                fecha_crea_fin = vbNullString
            End If

            Dim cod_usuario As String = IIf(Len(txt_ClaveResp.Text) = 0, vbNullString, txt_ClaveResp.Text)

            Dim FiltroAgrupador As String = Funciones.ObtieneElementos(gvd_Agrupador, "Agr", False)
            Dim FiltroRamo As String = Funciones.ObtieneElementos(gvd_Ramo, "Ram", False)
            Dim FiltroBroker As String = Funciones.ObtieneElementos(gvd_Broker, "Bro", False)
            Dim FiltroCia As String = Funciones.ObtieneElementos(gvd_Compañia, "Cia", False)

            Dim ws As New ws_MesaControl.MesaControlClient
            dtNegocios = Funciones.Lista_A_Datatable(ws.ObtieneNegocio(id_folio, id_regional, fecha_crea_ini, fecha_crea_fin, ddl_Moneda.SelectedValue, cod_usuario, -1,
                                                                       txt_SearchAse.Text, vbNullString, FiltroAgrupador, FiltroRamo, FiltroBroker,
                                                                       FiltroCia).ToList)

            dtFiltrado = dtNegocios



            Dim sCnn As String = ""
            Dim sSel As String
            sCnn = ConfigurationManager.ConnectionStrings("CadenaConexion").ConnectionString
            dtEstatus = New DataTable

            sSel = "spS_EstatusMC '" & id_folio & "'," & id_regional & ",'" & fecha_crea_ini & "','" & fecha_crea_fin & "'," & ddl_Moneda.SelectedValue & ",'" & cod_usuario & "',-1,'" & txt_SearchAse.Text & "','','" & FiltroAgrupador & "','" & FiltroRamo & "','" & FiltroBroker & "','" & FiltroCia & "'"

            Dim da As SqlDataAdapter

            da = New SqlDataAdapter(sSel, sCnn)

            da.Fill(dtEstatus)

            Funciones.LlenaGrid(gvd_Estatus, dtEstatus)

        End If

        Funciones.LlenaGrid(gvd_Monitor, dtFiltrado)

        Dim btn_Responsable = DirectCast(gvd_Monitor.HeaderRow.FindControl("btn_Responsable"), ImageButton)
        Dim btn_Asegurado = DirectCast(gvd_Monitor.HeaderRow.FindControl("btn_Asegurado"), ImageButton)
        Dim btn_Moneda = DirectCast(gvd_Monitor.HeaderRow.FindControl("btn_Moneda"), ImageButton)
        Dim btn_Regional = DirectCast(gvd_Monitor.HeaderRow.FindControl("btn_Regional"), ImageButton)
        Dim btn_Suscriptor = DirectCast(gvd_Monitor.HeaderRow.FindControl("btn_Suscriptor"), ImageButton)


        btn_Responsable.CssClass = IIf(Len(hid_Responsable.Value) > 0, "btn-filtro-verde", "btn-filtro")
        btn_Asegurado.CssClass = IIf(Len(hid_Asegurado.Value) > 0, "btn-filtro-verde", "btn-filtro")
        btn_Moneda.CssClass = IIf(Len(hid_Moneda.Value) > 0, "btn-filtro-verde", "btn-filtro")
        btn_Regional.CssClass = IIf(Len(hid_Regional.Value) > 0, "btn-filtro-verde", "btn-filtro")
        btn_Suscriptor.CssClass = IIf(Len(hid_Suscriptor.Value) > 0, "btn-filtro-verde", "btn-filtro")



    End Sub

    Private Sub LlenaGridColocacion(ByVal bln_Nuevo As Boolean)

        If bln_Nuevo = True Then
            dtColocacion = New DataTable
            dtColocacion.Columns.Add("colocacion")
            dtColocacion.Columns.Add("cantidad")
        End If

        If dtColocacion.Rows.Count = 0 Then
            dtColocacion.Rows.Add("FIRME", 0)
            dtColocacion.Rows.Add("PROYECTO", 0)
            dtColocacion.Rows.Add("CANCELADO", 0)
        End If

        Funciones.LlenaGrid(gvd_Colocacion, dtColocacion)
    End Sub

    Private Sub LlenaGridNegocioXRamo(ByVal bln_Nuevo As Boolean)

        If bln_Nuevo = True Then
            dtNegocioXRamo = New DataTable
            dtNegocioXRamo.Columns.Add("ramo")
            dtNegocioXRamo.Columns.Add("colocacion")
            dtNegocioXRamo.Columns.Add("sucursal1")
            dtNegocioXRamo.Columns.Add("sucursal2")
            dtNegocioXRamo.Columns.Add("sucursal3")
            dtNegocioXRamo.Columns.Add("sucursal4")
            dtNegocioXRamo.Columns.Add("sucursal5")
            dtNegocioXRamo.Columns.Add("sucursal6")
            dtNegocioXRamo.Columns.Add("sucursal7")
            dtNegocioXRamo.Columns.Add("sucursal8")
            dtNegocioXRamo.Columns.Add("sucursal9")
            dtNegocioXRamo.Columns.Add("sucursal10")
            dtNegocioXRamo.Columns.Add("sucursal11")
            dtNegocioXRamo.Columns.Add("sucursal12")
            dtNegocioXRamo.Columns.Add("sucursal13")
            dtNegocioXRamo.Columns.Add("sucursal14")
            dtNegocioXRamo.Columns.Add("sucursal15")
            dtNegocioXRamo.Columns.Add("total")
        End If

        If dtNegocioXRamo.Rows.Count = 0 Then
            dtNegocioXRamo.Rows.Add("Sin Ramo", "En Firme", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
            dtNegocioXRamo.Rows.Add("Sin Ramo", "Proyecto", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
            dtNegocioXRamo.Rows.Add("Sin Ramo", "Cancelado", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
        End If

        Funciones.LlenaGrid(gvd_NegocioXRamo, dtNegocioXRamo)
    End Sub

    Private Sub LlenaGridNegocioXOficina(ByVal bln_Nuevo As Boolean)

        If bln_Nuevo = True Then
            dtNegocioXOficina = New DataTable
            dtNegocioXOficina.Columns.Add("colocacion")
            dtNegocioXOficina.Columns.Add("sucursal1")
            dtNegocioXOficina.Columns.Add("sucursal2")
            dtNegocioXOficina.Columns.Add("sucursal3")
            dtNegocioXOficina.Columns.Add("sucursal4")
            dtNegocioXOficina.Columns.Add("sucursal5")
            dtNegocioXOficina.Columns.Add("sucursal6")
            dtNegocioXOficina.Columns.Add("sucursal7")
            dtNegocioXOficina.Columns.Add("sucursal8")
            dtNegocioXOficina.Columns.Add("sucursal9")
            dtNegocioXOficina.Columns.Add("sucursal10")
            dtNegocioXOficina.Columns.Add("sucursal11")
            dtNegocioXOficina.Columns.Add("sucursal12")
            dtNegocioXOficina.Columns.Add("sucursal13")
            dtNegocioXOficina.Columns.Add("sucursal14")
            dtNegocioXOficina.Columns.Add("sucursal15")
            dtNegocioXOficina.Columns.Add("total")
        End If

        If dtNegocioXOficina.Rows.Count = 0 Then
            dtNegocioXOficina.Rows.Add("En Firme", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
            dtNegocioXOficina.Rows.Add("Proyecto", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
            dtNegocioXOficina.Rows.Add("Cancelado", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
        End If

        Funciones.LlenaGrid(gvd_NegocioXOficina, dtNegocioXOficina)
    End Sub

    Private Sub btn_Monitor_Click(sender As Object, e As EventArgs) Handles btn_Monitor.Click
        Try
            ConsultaNegocios(False)
            EdoControl(Operacion.Monitor)
        Catch ex As Exception
            Mensaje.MuestraMensaje("Mesa de Control", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Private Sub btn_Actualizar_Click(sender As Object, e As EventArgs) Handles btn_Actualizar.Click
        Try
            ConsultaNegocios(False)
        Catch ex As Exception
            Mensaje.MuestraMensaje("Mesa de Control", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Private Sub btn_Cancelar_Click(sender As Object, e As EventArgs) Handles btn_Cancelar.Click
        Try
            EdoControl(Operacion.Ninguna)
        Catch ex As Exception
            Mensaje.MuestraMensaje("Mesa de Control", ex.Message, TipoMsg.Falla)
        End Try
    End Sub
    Protected Sub DespliegaFiltro(sender As Object, e As ImageClickEventArgs)
        Dim elemento As String
        Dim Datos As New ArrayList()
        Dim filtrados() As String = {""}
        Dim blnTodo As Boolean = True
        Dim Generales() As String = Split(sender.AlternateText, "|")
        Dim Consulta As String = "id_folio > '0'"

        hid_Filtro.Value = Generales(2)

        Dim ArrayOrden() As String = Split(hid_OrdenFiltrado.Value, "|")
        Dim Indice As Integer = Array.IndexOf(ArrayOrden, hid_Filtro.Value)

        For i = 1 To ArrayOrden.Length - 1
            If hid_Filtro.Value <> ArrayOrden(i) Then
                Select Case ArrayOrden(i)
                    Case Filtros.Responsable
                        Consulta = Consulta & ArmaConsulta("responsable", Split(hid_Responsable.Value, "|"))
                    Case Filtros.Asegurado
                        Consulta = Consulta & ArmaConsulta("nombre_asegurado", Split(hid_Asegurado.Value, "|"))
                    Case Filtros.Moneda
                        Consulta = Consulta & ArmaConsulta("Moneda", Split(hid_Moneda.Value, "|"))
                    Case Filtros.Regional
                        Consulta = Consulta & ArmaConsulta("sucursal_ofi", Split(hid_Regional.Value, "|"))
                    Case Filtros.Suscriptor
                        Consulta = Consulta & ArmaConsulta("suscriptor", Split(hid_Suscriptor.Value, "|"))
                End Select
            End If
        Next


        Select Case hid_Filtro.Value
            Case Filtros.Responsable
                filtrados = Split(hid_Responsable.Value, "|")
            Case Filtros.Asegurado
                filtrados = Split(hid_Asegurado.Value, "|")
            Case Filtros.Moneda
                filtrados = Split(hid_Moneda.Value, "|")
            Case Filtros.Regional
                filtrados = Split(hid_Regional.Value, "|")
            Case Filtros.Suscriptor
        End Select

        'Titulo de la Ventana
        lbl_TituloFiltro.Text = "Filtrado " & Generales(1)

        chk_Filtro.Items.Clear()

        Dim myRow() As Data.DataRow
        myRow = dtNegocios.Select(Consulta)

        GeneraDTFiltrado()
        For Each item In myRow
            dtFiltrado.Rows.Add(item("id_folio"), item("folio"), item("fec_creacion"), item("responsable"),
                                    item("nombre_asegurado"), item("cod_moneda"), item("Moneda"), item("fec_inivig"),
                                    item("fec_finvig"), item("sucursal_ofi"), item("agente"), item("suscriptor"), item("giro_asegurado"),
                                    item("grupo_endoso"), item("tipo_endoso"))
        Next


        Dim ArrayElementos = dtFiltrado.AsEnumerable().[Select](Function(c) CType(c(Generales(0)), System.String)).Distinct().ToList()

        'ArrayElementos = dtFiltrado.AsEnumerable().[Select](Function(c) CType(c(Generales(0)), System.String)).Distinct().ToList()


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

    Private Function GeneraDTFiltrado() As DataTable
        dtFiltrado = New DataTable
        With dtFiltrado
            .Columns.Add("id_folio")
            .Columns.Add("folio")
            .Columns.Add("fec_creacion")
            .Columns.Add("responsable")
            .Columns.Add("nombre_asegurado")
            .Columns.Add("cod_moneda")
            .Columns.Add("Moneda")
            .Columns.Add("fec_inivig")
            .Columns.Add("fec_finvig")
            .Columns.Add("sucursal_ofi")
            .Columns.Add("agente")
            .Columns.Add("suscriptor")
            .Columns.Add("giro_asegurado")
            .Columns.Add("grupo_endoso")
            .Columns.Add("tipo_endoso")
        End With
    End Function

    Private Sub btn_aceptar_filtro_Click(sender As Object, e As EventArgs) Handles btn_aceptar_filtro.Click
        Try
            Dim blnTodo As Boolean = True

            Dim hid_Control As HiddenField
            hid_Control = New HiddenField

            Select Case hid_Filtro.Value
                Case Filtros.Responsable
                    hid_Control = hid_Responsable
                Case Filtros.Asegurado
                    hid_Control = hid_Asegurado
                Case Filtros.Moneda
                    hid_Control = hid_Moneda
                Case Filtros.Regional
                    hid_Control = hid_Regional
                Case Filtros.Suscriptor
                    hid_Control = hid_Suscriptor
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

            Dim Consulta As String = "id_folio > '0'"
            Consulta = Consulta & ArmaConsulta("responsable", Split(hid_Responsable.Value, "|"))
            Consulta = Consulta & ArmaConsulta("nombre_asegurado", Split(hid_Asegurado.Value, "|"))
            Consulta = Consulta & ArmaConsulta("Moneda", Split(hid_Moneda.Value, "|"))
            Consulta = Consulta & ArmaConsulta("sucursal_ofi", Split(hid_Regional.Value, "|"))
            Consulta = Consulta & ArmaConsulta("suscriptor", Split(hid_Suscriptor.Value, "|"))

            GeneraDTFiltrado()

            Dim myRow() As Data.DataRow
            myRow = dtNegocios.Select(Consulta)


            For Each item In myRow
                dtFiltrado.Rows.Add(item("id_folio"), item("folio"), item("fec_creacion"), item("responsable"),
                                    item("nombre_asegurado"), item("cod_moneda"), item("Moneda"), item("fec_inivig"),
                                    item("fec_finvig"), item("sucursal_ofi"), item("agente"), item("suscriptor"), item("giro_asegurado"),
                                    item("grupo_endoso"), item("tipo_endoso"))
            Next

            ConsultaNegocios(True)

        Catch ex As Exception
            Mensaje.MuestraMensaje("Mesa de Control", ex.Message, TipoMsg.Falla)
        End Try
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

    Private Sub btn_NingunoFiltro_Click(sender As Object, e As EventArgs) Handles btn_NingunoFiltro.Click
        Try
            For Each item In chk_Filtro.Items
                item.Selected = False
            Next
        Catch ex As Exception
            Mensaje.MuestraMensaje("Mesa de Control", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Private Sub btn_TodosFiltro_Click(sender As Object, e As EventArgs) Handles btn_TodosFiltro.Click
        Try
            For Each item In chk_Filtro.Items
                item.Selected = True
            Next
        Catch ex As Exception
            Mensaje.MuestraMensaje("Mesa de Control", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Private Sub gvd_Monitor_PageIndexChanging(sender As Object, e As GridViewPageEventArgs) Handles gvd_Monitor.PageIndexChanging
        Try
            gvd_Monitor.PageIndex = e.NewPageIndex
            ConsultaNegocios(True)
        Catch ex As Exception
            Mensaje.MuestraMensaje("Mesa de Control", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Private Sub btn_Reporte_Click(sender As Object, e As EventArgs) Handles btn_Reporte.Click
        Try
            Dim ws As New ws_Generales.GeneralesClient
            Dim server As String = ws.ObtieneParametro(8)


            Dim id_folio As String = "&id_folio=" & IIf(Len(txt_Folio.Text) = 0, -1, Replace(txt_Folio.Text, "REAS-", ""))
            Dim id_regional As String = "&cod_suc_ofi=" & IIf(Len(txt_ClaveOfi.Text) = 0, -1, txt_ClaveOfi.Text)

            Dim fecha_crea_ini, fecha_crea_fin As String
            If IsDate(txtFecGeneraDe.Text) Then
                fecha_crea_ini = "&fecCorte_ini=" & CDate(txtFecGeneraDe.Text).ToString("yyyyMMdd")
            Else
                fecha_crea_ini = "&fecCorte_ini="
            End If

            If IsDate(txtFecGeneraA.Text) Then
                fecha_crea_fin = "&fecCorte_fin=" & CDate(txtFecGeneraA.Text).ToString("yyyyMMdd")
            Else
                fecha_crea_fin = "&fecCorte_fin="
            End If

            Dim cod_usuario As String = "&cod_usuario=" & IIf(Len(txt_ClaveResp.Text) = 0, "", txt_ClaveResp.Text)

            Dim FiltroAgrupador As String = Funciones.ObtieneElementos(gvd_Agrupador, "Agr", False)
            Dim FiltroRamo As String = Funciones.ObtieneElementos(gvd_Ramo, "Ram", False)
            Dim FiltroBroker As String = Funciones.ObtieneElementos(gvd_Broker, "Bro", False)
            Dim FiltroCia As String = Funciones.ObtieneElementos(gvd_Compañia, "Cia", False)

            FiltroAgrupador = "&strAgrupador=" & FiltroAgrupador
            FiltroRamo = "&strRamo=" & FiltroRamo
            FiltroBroker = "&strBroker=" & FiltroBroker
            FiltroCia = "&strCia=" & FiltroCia


            server = Replace(Replace(server, "@Reporte", "MesaControl"), "@Formato", "EXCEL") & id_folio & id_regional & fecha_crea_ini & fecha_crea_fin & "&cod_moneda=" & ddl_Moneda.SelectedValue & cod_usuario & "&estatus=-1"

            server = server & "&strAsegurado=" & txt_SearchAse.Text & "&strGiro=" & FiltroAgrupador & FiltroRamo & FiltroBroker & FiltroCia

            Funciones.EjecutaFuncion("window.open('" & server & "');")
        Catch ex As Exception
            Mensaje.MuestraMensaje("Detalle Cuenta Corriente", ex.Message, TipoMsg.Falla)
        End Try
    End Sub
End Class
