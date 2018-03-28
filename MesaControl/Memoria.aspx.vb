Imports Mensaje
Imports System.Data
Imports System.Data.SqlClient

Partial Class MesaControl_Memoria
    Inherits System.Web.UI.Page

    Public Property dtRiesgo() As DataTable
        Get
            Return Session("dtRiesgo")
        End Get
        Set(ByVal value As DataTable)
            Session("dtRiesgo") = value
        End Set
    End Property

    Public Property dtPolizasAseg() As DataTable
        Get
            Return Session("dtPolizasAseg")
        End Get
        Set(ByVal value As DataTable)
            Session("dtPolizasAseg") = value
        End Set
    End Property

    Public Property dtRiesgosPol() As DataTable
        Get
            Return Session("dtRiesgosPol")
        End Get
        Set(ByVal value As DataTable)
            Session("dtRiesgosPol") = value
        End Set
    End Property

    Public Property dtUbicaciones() As DataTable
        Get
            Return Session("dtUbicaciones")
        End Get
        Set(ByVal value As DataTable)
            Session("dtUbicaciones") = value
        End Set
    End Property

    Private Enum Columnas
        Incendio = 0
        Hidro = 1
        Terremoto = 2
        RCAviones = 3
        Cascos = 4
        Guerra = 5
    End Enum

    Private Enum Ramo
        Incendio = 902
        Hidro = 903
        Terremoto = 904
        RCAviones = 913
        CascosAereos = 916
    End Enum

    Private Sub MesaControl_Memoria_Load(sender As Object, e As EventArgs) Handles Me.Load
        Try
            If Not IsPostBack Then

                Funciones.LlenaCatDDL(ddl_Moneda, "Mon",,,,,, False)

                Funciones.LlenaCatGrid(gvd_RamoSbr, "Ras", "", "")
                LlenaGridRiesgo(True)


            End If
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub AjusteTamaño(sender As Object, e As ImageClickEventArgs)
        Try
            Dim estado As Integer
            Dim pixeles As Integer
            Dim Tamaño() As String = Split(hid_Tamaño.Value, "|")
            Dim Ajuste() As String = Split(hid_Ajuste.Value, "|")

            Dim lbl_Search = TryCast(gvd_Riesgo.HeaderRow.FindControl(Replace(sender.ID, "btn", "lbl")), Label)

            If Ajuste(sender.AlternateText) = "0" Then
                estado = 1
                pixeles = 50
                lbl_Search.Width = 10
                lbl_Search.Text = ". . ."
                sender.ImageUrl = "~/Images/mas_mini.png"
            Else
                estado = 0
                pixeles = 200
                lbl_Search.Width = 60
                lbl_Search.Text = Replace(lbl_Search.ID, "lbl_Search", "")
                sender.ImageUrl = "~/Images/quitar_mini.png"
            End If

            Ajuste(sender.AlternateText) = estado
            Tamaño(sender.AlternateText) = pixeles

            hid_Tamaño.Value = Tamaño(0) & "|" & Tamaño(1) & "|" & Tamaño(2) & "|" & Tamaño(3)
            hid_Ajuste.Value = Ajuste(0) & "|" & Ajuste(1) & "|" & Ajuste(2) & "|" & Ajuste(3)

            For Each row In gvd_Riesgo.Rows
                TryCast(row.FindControl(Replace(sender.ID, "btn", "txt")), TextBox).Width = pixeles
            Next
        Catch ex As Exception
            Mensaje.MuestraMensaje("Memoria de Calculo", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Private Sub btn_AgregaFila_Click(sender As Object, e As EventArgs) Handles btn_AgregaFila.Click
        Try
            Dim inciso As Integer = 1

            fn_ActualizaDataRiesgo()

            If dtRiesgo.Rows.Count > 0 Then
                inciso = gvd_Riesgo.DataKeys(gvd_Riesgo.Rows.Count - 1)("cod_inciso") + 1
            End If

            hid_SelCob.Value = ""
            For Each row In gvd_Cobertura.Rows
                Dim txt_SelCob As TextBox = TryCast(row.FindControl("txt_SelCob"), TextBox)

                If txt_SelCob.Text = "1" Then
                    Dim lbl_Clave As Label = TryCast(row.FindControl("lbl_Clave"), Label)
                    Dim lbl_Descripcion As Label = TryCast(row.FindControl("lbl_Descripcion"), Label)
                    hid_SelCob.Value = hid_SelCob.Value & "|" & lbl_Clave.Text & "~" & lbl_Descripcion.Text
                End If
            Next

            hid_SelRie.Value = ""
            If hid_SelCob.Value = "" Then
                For Each row In gvd_Seccion.Rows
                    Dim txt_SelRie As TextBox = TryCast(row.FindControl("txt_SelRie"), TextBox)
                    If txt_SelRie.Text = "1" Then
                        Dim lbl_Clave As Label = TryCast(row.FindControl("lbl_Clave"), Label)
                        Dim lbl_Descripcion As Label = TryCast(row.FindControl("lbl_Descripcion"), Label)
                        hid_SelRie.Value = hid_SelRie.Value & "|" & lbl_Clave.Text & "~" & lbl_Descripcion.Text
                    End If
                Next
            Else
                If CType(gvd_Seccion.Rows(hid_Seccion.Value).FindControl("txt_SelRie"), TextBox).Text = "1" Then
                    hid_SelRie.Value = hid_SelRie.Value & "|" & CType(gvd_Seccion.Rows(hid_Seccion.Value).FindControl("lbl_Clave"), Label).Text & "~" &
                                                                CType(gvd_Seccion.Rows(hid_Seccion.Value).FindControl("lbl_Descripcion"), Label).Text
                End If
            End If

            hid_SelRam.Value = ""
            If hid_SelRie.Value = "" Then
                For Each row In gvd_RamoSbr.Rows
                    Dim txt_SelRam As TextBox = TryCast(row.FindControl("txt_SelRam"), TextBox)
                    If txt_SelRam.Text = "1" Then
                        Dim lbl_ClaveRamo As Label = TryCast(row.FindControl("lbl_ClaveRamo"), Label)
                        Dim lbl_DescRamo As Label = TryCast(row.FindControl("lbl_DescRamo"), Label)
                        Dim lbl_ClaveSubramo As Label = TryCast(row.FindControl("lbl_ClaveSubramo"), Label)
                        Dim lbl_DescSubramo As Label = TryCast(row.FindControl("lbl_DescSubramo"), Label)

                        hid_SelRam.Value = hid_SelRam.Value & "|" & lbl_ClaveRamo.Text & "~" & lbl_DescRamo.Text & "~" & lbl_ClaveSubramo.Text & "~" & lbl_DescSubramo.Text
                    End If
                Next
            Else
                If CType(gvd_RamoSbr.Rows(hid_Ramo.Value).FindControl("txt_SelRam"), TextBox).Text = "1" Then
                    hid_SelRam.Value = hid_SelRam.Value & "|" & CType(gvd_RamoSbr.Rows(hid_Ramo.Value).FindControl("lbl_ClaveRamo"), Label).Text & "~" &
                                                                CType(gvd_RamoSbr.Rows(hid_Ramo.Value).FindControl("lbl_DescRamo"), Label).Text & "~" &
                                                                CType(gvd_RamoSbr.Rows(hid_Ramo.Value).FindControl("lbl_ClaveSubramo"), Label).Text & "~" &
                                                                CType(gvd_RamoSbr.Rows(hid_Ramo.Value).FindControl("lbl_DescSubramo"), Label).Text
                End If
            End If

            Dim Ramos() As String = Split(hid_SelRam.Value, "|")
            Dim Secciones() As String = Split(hid_SelRie.Value, "|")
            Dim Coberturas() As String = Split(hid_SelCob.Value, "|")

            If hid_SelRam.Value <> "" Then

                If dtRiesgo.Rows.Count = 0 Then
                    dtRiesgo.Rows.Add(0, 0, "0", "TOTAL", "", "", "", "", "", "", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
                End If

                If Len(hid_SelRie.Value) = 0 Then
                    For Each ramo In Ramos
                        If ramo <> "" Then
                            dtRiesgo.Rows.Add(0, inciso, Split(ramo, "~")(0), Split(ramo, "~")(1), Split(ramo, "~")(2), Split(ramo, "~")(3), "", "", "", "", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
                            inciso = inciso + 1
                        End If
                    Next
                Else
                    If Len(hid_SelCob.Value) = 0 Then
                        For Each seccion In Secciones
                            If seccion <> "" Then
                                dtRiesgo.Rows.Add(0, inciso, Split(Ramos(1), "~")(0), Split(Ramos(1), "~")(1), Split(Ramos(1), "~")(2), Split(Ramos(1), "~")(3), Split(seccion, "~")(0), Split(seccion, "~")(1), "", "", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
                                inciso = inciso + 1
                            End If
                        Next
                    Else
                        For Each cobertura In Coberturas
                            If cobertura <> "" Then
                                dtRiesgo.Rows.Add(0, inciso, Split(Ramos(1), "~")(0), Split(Ramos(1), "~")(1), Split(Ramos(1), "~")(2), Split(Ramos(1), "~")(3), Split(Secciones(1), "~")(0), Split(Secciones(1), "~")(1), Split(cobertura, "~")(0), Split(cobertura, "~")(1), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
                                inciso = inciso + 1
                            End If
                        Next
                    End If
                End If
            End If

            For Each row In gvd_RamoSbr.Rows
                TryCast(row.FindControl("txt_SelRam"), TextBox).Text = "0"
            Next

            Funciones.LlenaGrid(gvd_Seccion, Nothing)
            Funciones.LlenaGrid(gvd_Cobertura, Nothing)


            LlenaGridRiesgo(False)
        Catch ex As Exception
            Mensaje.MuestraMensaje("Memoria de Calculo", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Private Function fn_ActualizaDataRiesgo() As DataTable


        For Each row In gvd_Riesgo.Rows
            Dim chk_Riesgo As CheckBox = TryCast(row.FindControl("chk_Riesgo"), CheckBox)
            Dim txt_ClaveRamo As TextBox = TryCast(row.FindControl("txt_ClaveRamo"), TextBox)
            Dim txt_SearchRamo As TextBox = TryCast(row.FindControl("txt_SearchRamo"), TextBox)
            Dim txt_ClaveSubramo As TextBox = TryCast(row.FindControl("txt_ClaveSubramo"), TextBox)
            Dim txt_SearchSubramo As TextBox = TryCast(row.FindControl("txt_SearchSubramo"), TextBox)
            Dim txt_ClaveSeccion As TextBox = TryCast(row.FindControl("txt_ClaveSeccion"), TextBox)
            Dim txt_SearchSeccion As TextBox = TryCast(row.FindControl("txt_SearchSeccion"), TextBox)
            Dim txt_ClaveCobertura As TextBox = TryCast(row.FindControl("txt_ClaveCobertura"), TextBox)
            Dim txt_SearchCobertura As TextBox = TryCast(row.FindControl("txt_SearchCobertura"), TextBox)
            Dim opt_Facultativo As RadioButtonList = TryCast(row.FindControl("opt_Facultativo"), RadioButtonList)
            Dim opt_Adicional As RadioButtonList = TryCast(row.FindControl("opt_Adicional"), RadioButtonList)

            Dim txt_ValoresTotales As TextBox = TryCast(row.FindControl("txt_ValoresTotalesAux"), TextBox)
            Dim txt_LimResp As TextBox = TryCast(row.FindControl("txt_LimRespAux"), TextBox)
            Dim txt_PrimaNeta As TextBox = TryCast(row.FindControl("txt_PrimaNetaAux"), TextBox)

            Dim txt_PrimaINC As TextBox = TryCast(row.FindControl("txt_PrimaINCAux"), TextBox)
            Dim txt_PrimaTEV As TextBox = TryCast(row.FindControl("txt_PrimaTEVAux"), TextBox)
            Dim txt_PrimaFHM As TextBox = TryCast(row.FindControl("txt_PrimaFHMAux"), TextBox)
            Dim txt_PrimaRC As TextBox = TryCast(row.FindControl("txt_PrimaRCAux"), TextBox)
            Dim txt_PrimaCSC As TextBox = TryCast(row.FindControl("txt_PrimaCSCAux"), TextBox)
            Dim txt_PrimaGRA As TextBox = TryCast(row.FindControl("txt_PrimaGRAAux"), TextBox)

            Dim myRow() As Data.DataRow
            myRow = dtRiesgo.Select("cod_inciso ='" & gvd_Riesgo.DataKeys(row.RowIndex)("cod_inciso") & "'")

            If myRow.Length > 0 Then
                myRow(0)("sn_seleccionado") = IIf(chk_Riesgo.Enabled = False, 1, 0)
                myRow(0)("cod_ramo") = txt_ClaveRamo.Text
                myRow(0)("ramo_desc") = txt_SearchRamo.Text
                myRow(0)("cod_subramo") = txt_ClaveSubramo.Text
                myRow(0)("subramo_desc") = txt_SearchSubramo.Text
                myRow(0)("cod_riesgo") = txt_ClaveSeccion.Text
                myRow(0)("riesgo_desc") = txt_SearchSeccion.Text
                myRow(0)("cod_ind_cob") = txt_ClaveCobertura.Text
                myRow(0)("cobertura_desc") = txt_SearchCobertura.Text
                myRow(0)("sn_facultativo") = opt_Facultativo.SelectedValue
                myRow(0)("sn_adicional") = opt_Adicional.SelectedValue
                myRow(0)("valores_totales") = IIf(txt_ValoresTotales.Text = vbNullString, 0, txt_ValoresTotales.Text)
                myRow(0)("suma_asegurada") = IIf(txt_LimResp.Text = vbNullString, 0, txt_LimResp.Text)
                myRow(0)("prima_neta") = IIf(txt_PrimaNeta.Text = vbNullString, 0, txt_PrimaNeta.Text)
                myRow(0)("prima_inc") = IIf(txt_PrimaINC.Text = vbNullString, 0, txt_PrimaINC.Text)
                myRow(0)("prima_tev") = IIf(txt_PrimaTEV.Text = vbNullString, 0, txt_PrimaTEV.Text)
                myRow(0)("prima_fhm") = IIf(txt_PrimaFHM.Text = vbNullString, 0, txt_PrimaFHM.Text)
                myRow(0)("prima_rc") = IIf(txt_PrimaRC.Text = vbNullString, 0, txt_PrimaRC.Text)
                myRow(0)("prima_casco") = IIf(txt_PrimaCSC.Text = vbNullString, 0, txt_PrimaCSC.Text)
                myRow(0)("prima_guerra") = IIf(txt_PrimaGRA.Text = vbNullString, 0, txt_PrimaGRA.Text)
            End If
        Next
        Return dtRiesgo
    End Function

    Private Sub LlenaGridRiesgo(ByVal bln_Nuevo As Boolean)

        If bln_Nuevo = True Then
            dtRiesgo = New DataTable
            dtRiesgo.Columns.Add("sn_seleccionado")
            dtRiesgo.Columns.Add("cod_inciso")
            dtRiesgo.Columns.Add("cod_ramo")
            dtRiesgo.Columns.Add("ramo_desc")
            dtRiesgo.Columns.Add("cod_subramo")
            dtRiesgo.Columns.Add("subramo_desc")
            dtRiesgo.Columns.Add("cod_riesgo")
            dtRiesgo.Columns.Add("riesgo_desc")
            dtRiesgo.Columns.Add("cod_ind_cob")
            dtRiesgo.Columns.Add("cobertura_desc")
            dtRiesgo.Columns.Add("sn_facultativo")
            dtRiesgo.Columns.Add("sn_adicional")
            dtRiesgo.Columns.Add("1erRiesgo", GetType(Decimal))
            dtRiesgo.Columns.Add("valores_totales", GetType(Decimal))
            dtRiesgo.Columns.Add("suma_asegurada", GetType(Decimal))
            dtRiesgo.Columns.Add("prima_neta", GetType(Decimal))
            dtRiesgo.Columns.Add("tasa_base", GetType(Decimal))
            dtRiesgo.Columns.Add("descuento", GetType(Decimal))
            dtRiesgo.Columns.Add("recargo", GetType(Decimal))
            dtRiesgo.Columns.Add("prima_inc", GetType(Decimal))
            dtRiesgo.Columns.Add("prima_fhm", GetType(Decimal))
            dtRiesgo.Columns.Add("prima_tev", GetType(Decimal))
            dtRiesgo.Columns.Add("prima_rc", GetType(Decimal))
            dtRiesgo.Columns.Add("prima_casco", GetType(Decimal))
            dtRiesgo.Columns.Add("prima_guerra", GetType(Decimal))
        End If

        Funciones.LlenaGrid(gvd_Riesgo, dtRiesgo)

        If gvd_Riesgo.Rows.Count > 0 Then
            Dim lbl_Inciso As Label = CType(gvd_Riesgo.Rows(0).FindControl("lbl_Inciso"), Label)

            Dim chk_Riesgo As CheckBox = CType(gvd_Riesgo.Rows(0).FindControl("chk_Riesgo"), CheckBox)

            Dim txt_SearchRamo As TextBox = CType(gvd_Riesgo.Rows(0).FindControl("txt_SearchRamo"), TextBox)
            Dim txt_SearchSubramo As TextBox = CType(gvd_Riesgo.Rows(0).FindControl("txt_SearchSubramo"), TextBox)
            Dim txt_SearchSeccion As TextBox = CType(gvd_Riesgo.Rows(0).FindControl("txt_SearchSeccion"), TextBox)
            Dim txt_SearchCobertura As TextBox = CType(gvd_Riesgo.Rows(0).FindControl("txt_SearchCobertura"), TextBox)
            Dim opt_Adicional As RadioButtonList = CType(gvd_Riesgo.Rows(0).FindControl("opt_Adicional"), RadioButtonList)
            Dim opt_Facultativo As RadioButtonList = CType(gvd_Riesgo.Rows(0).FindControl("opt_Facultativo"), RadioButtonList)
            Dim opt_1erRiesgo As RadioButtonList = CType(gvd_Riesgo.Rows(0).FindControl("opt_1erRiesgo"), RadioButtonList)

            Dim txt_TasaBase As TextBox = CType(gvd_Riesgo.Rows(0).FindControl("txt_TasaBase"), TextBox)
            Dim txt_Descuento As TextBox = CType(gvd_Riesgo.Rows(0).FindControl("txt_Descuento"), TextBox)
            Dim txt_Recargo As TextBox = CType(gvd_Riesgo.Rows(0).FindControl("txt_Recargo"), TextBox)

            Dim txt_ValoresTotales As TextBox = CType(gvd_Riesgo.Rows(0).FindControl("txt_ValoresTotales"), TextBox)
            Dim txt_LimResp As TextBox = CType(gvd_Riesgo.Rows(0).FindControl("txt_LimResp"), TextBox)
            Dim txt_PrimaNeta As TextBox = CType(gvd_Riesgo.Rows(0).FindControl("txt_PrimaNeta"), TextBox)
            Dim txt_PrimaINC As TextBox = CType(gvd_Riesgo.Rows(0).FindControl("txt_PrimaINC"), TextBox)
            Dim txt_PrimaTEV As TextBox = CType(gvd_Riesgo.Rows(0).FindControl("txt_PrimaTEV"), TextBox)
            Dim txt_PrimaFHM As TextBox = CType(gvd_Riesgo.Rows(0).FindControl("txt_PrimaFHM"), TextBox)
            Dim txt_PrimaRC As TextBox = CType(gvd_Riesgo.Rows(0).FindControl("txt_PrimaRC"), TextBox)
            Dim txt_PrimaCSC As TextBox = CType(gvd_Riesgo.Rows(0).FindControl("txt_PrimaCSC"), TextBox)
            Dim txt_PrimaGRA As TextBox = CType(gvd_Riesgo.Rows(0).FindControl("txt_PrimaGRA"), TextBox)


            chk_Riesgo.Visible = False
            lbl_Inciso.Text = ""
            txt_SearchRamo.Enabled = False
            txt_SearchSubramo.Enabled = False
            txt_SearchSeccion.Enabled = False
            txt_SearchCobertura.Enabled = False
            opt_Facultativo.Visible = False
            opt_Adicional.Visible = False
            opt_1erRiesgo.Visible = False

            txt_TasaBase.Enabled = False
            txt_Descuento.Enabled = False
            txt_Recargo.Enabled = False


            txt_ValoresTotales.Enabled = False
            txt_LimResp.Enabled = False
            txt_PrimaNeta.Enabled = False
            txt_PrimaINC.Enabled = False
            txt_PrimaTEV.Enabled = False
            txt_PrimaFHM.Enabled = False
            txt_PrimaRC.Enabled = False
            txt_PrimaCSC.Enabled = False
            txt_PrimaGRA.Enabled = False

            txt_SearchRamo.Font.Bold = True
            txt_ValoresTotales.Font.Bold = True
            txt_LimResp.Font.Bold = True
            txt_PrimaNeta.Font.Bold = True
            txt_PrimaINC.Font.Bold = True
            txt_PrimaTEV.Font.Bold = True
            txt_PrimaFHM.Font.Bold = True
            txt_PrimaRC.Font.Bold = True
            txt_PrimaCSC.Font.Bold = True
            txt_PrimaGRA.Font.Bold = True


            txt_SearchRamo.BackColor = Drawing.Color.LightGray
            txt_SearchSubramo.BackColor = Drawing.Color.LightGray
            txt_SearchSeccion.BackColor = Drawing.Color.LightGray
            txt_SearchCobertura.BackColor = Drawing.Color.LightGray
            txt_ValoresTotales.BackColor = Drawing.Color.LightGray
            txt_LimResp.BackColor = Drawing.Color.LightGray
            txt_PrimaNeta.BackColor = Drawing.Color.LightGray
            txt_PrimaINC.BackColor = Drawing.Color.LightGray
            txt_PrimaTEV.BackColor = Drawing.Color.LightGray
            txt_PrimaFHM.BackColor = Drawing.Color.LightGray
            txt_PrimaRC.BackColor = Drawing.Color.LightGray
            txt_PrimaCSC.BackColor = Drawing.Color.LightGray
            txt_PrimaGRA.BackColor = Drawing.Color.LightGray


            Dim Ajustes() As String = Split(hid_Ajuste.Value, "|")

            If Ajustes(0) = "0" Then
                TryCast(gvd_Riesgo.HeaderRow.FindControl("btn_SearchRamo"), ImageButton).ImageUrl = "~/Images/quitar_mini.png"
                TryCast(gvd_Riesgo.HeaderRow.FindControl("lbl_SearchRamo"), Label).Text = Replace(TryCast(gvd_Riesgo.HeaderRow.FindControl("lbl_SearchRamo"), Label).ID, "lbl_Search", "")
                TryCast(gvd_Riesgo.HeaderRow.FindControl("lbl_SearchRamo"), Label).Width = 60
            Else
                TryCast(gvd_Riesgo.HeaderRow.FindControl("btn_SearchRamo"), ImageButton).ImageUrl = "~/Images/mas_mini.png"
                TryCast(gvd_Riesgo.HeaderRow.FindControl("lbl_SearchRamo"), Label).Text = ". . ."
                TryCast(gvd_Riesgo.HeaderRow.FindControl("lbl_SearchRamo"), Label).Width = 10
            End If

            If Ajustes(1) = "0" Then
                TryCast(gvd_Riesgo.HeaderRow.FindControl("btn_SearchSubramo"), ImageButton).ImageUrl = "~/Images/quitar_mini.png"
                TryCast(gvd_Riesgo.HeaderRow.FindControl("lbl_SearchSubramo"), Label).Text = Replace(TryCast(gvd_Riesgo.HeaderRow.FindControl("lbl_SearchSubramo"), Label).ID, "lbl_Search", "")
                TryCast(gvd_Riesgo.HeaderRow.FindControl("lbl_SearchSubramo"), Label).Width = 60
            Else
                TryCast(gvd_Riesgo.HeaderRow.FindControl("btn_SearchSubramo"), ImageButton).ImageUrl = "~/Images/mas_mini.png"
                TryCast(gvd_Riesgo.HeaderRow.FindControl("lbl_SearchSubramo"), Label).Text = ". . ."
                TryCast(gvd_Riesgo.HeaderRow.FindControl("lbl_SearchSubramo"), Label).Width = 10
            End If

            If Ajustes(2) = "0" Then
                TryCast(gvd_Riesgo.HeaderRow.FindControl("btn_SearchSeccion"), ImageButton).ImageUrl = "~/Images/quitar_mini.png"
                TryCast(gvd_Riesgo.HeaderRow.FindControl("lbl_SearchSeccion"), Label).Text = Replace(TryCast(gvd_Riesgo.HeaderRow.FindControl("lbl_SearchSeccion"), Label).ID, "lbl_Search", "")
                TryCast(gvd_Riesgo.HeaderRow.FindControl("lbl_SearchSeccion"), Label).Width = 60
            Else
                TryCast(gvd_Riesgo.HeaderRow.FindControl("btn_SearchSeccion"), ImageButton).ImageUrl = "~/Images/mas_mini.png"
                TryCast(gvd_Riesgo.HeaderRow.FindControl("lbl_SearchSeccion"), Label).Text = ". . ."
                TryCast(gvd_Riesgo.HeaderRow.FindControl("lbl_SearchSeccion"), Label).Width = 10
            End If

            If Ajustes(3) = "0" Then
                TryCast(gvd_Riesgo.HeaderRow.FindControl("btn_SearchCobertura"), ImageButton).ImageUrl = "~/Images/quitar_mini.png"
                TryCast(gvd_Riesgo.HeaderRow.FindControl("lbl_SearchCobertura"), Label).Text = Replace(TryCast(gvd_Riesgo.HeaderRow.FindControl("lbl_SearchCobertura"), Label).ID, "lbl_Search", "")
                TryCast(gvd_Riesgo.HeaderRow.FindControl("lbl_SearchCobertura"), Label).Width = 60
            Else
                TryCast(gvd_Riesgo.HeaderRow.FindControl("btn_SearchCobertura"), ImageButton).ImageUrl = "~/Images/mas_mini.png"
                TryCast(gvd_Riesgo.HeaderRow.FindControl("lbl_SearchCobertura"), Label).Text = ". . ."
                TryCast(gvd_Riesgo.HeaderRow.FindControl("lbl_SearchCobertura"), Label).Width = 10
            End If

            ValidaRamosRiesgo(gvd_Riesgo, 0, {15, 16, 17, 18, 19, 20})
            'Else
            '    LlenaGridRiesgo(True)
        End If
    End Sub

    Private Sub ValidaRamosRiesgo(ByRef gvd_Control As GridView, ByVal RowInicio As Integer, ByVal ArrayCols() As Integer)

        For Each col In ArrayCols
            gvd_Control.Columns(col).Visible = False
        Next

        For Each row In gvd_Control.Rows
            If row.rowIndex > RowInicio Then

                If gvd_Control.ID = "gvd_Riesgo" Then
                    TryCast(row.FindControl("chk_Riesgo"), CheckBox).Enabled = Not TryCast(row.FindControl("chk_Riesgo"), CheckBox).Checked
                    TryCast(row.FindControl("opt_Facultativo"), RadioButtonList).Enabled = Not TryCast(row.FindControl("chk_Riesgo"), CheckBox).Checked
                End If


                Select Case TryCast(row.FindControl("txt_ClaveRamo"), TextBox).Text
                    Case Ramo.Incendio
                        gvd_Control.Columns(ArrayCols(Columnas.Incendio)).Visible = True
                        TryCast(row.FindControl("txt_PrimaFHM"), TextBox).Attributes.Add("style", "display:none")
                        TryCast(row.FindControl("txt_PrimaTEV"), TextBox).Attributes.Add("style", "display:none")
                    Case Ramo.Hidro
                        gvd_Control.Columns(ArrayCols(Columnas.Hidro)).Visible = True
                        TryCast(row.FindControl("txt_PrimaINC"), TextBox).Attributes.Add("style", "display:none")
                        TryCast(row.FindControl("txt_PrimaTEV"), TextBox).Attributes.Add("style", "display:none")
                    Case Ramo.Terremoto
                        gvd_Control.Columns(ArrayCols(Columnas.Terremoto)).Visible = True
                        TryCast(row.FindControl("txt_PrimaINC"), TextBox).Attributes.Add("style", "display:none")
                        TryCast(row.FindControl("txt_PrimaFHM"), TextBox).Attributes.Add("style", "display:none")
                    Case Ramo.RCAviones
                        gvd_Control.Columns(ArrayCols(Columnas.RCAviones)).Visible = True
                        TryCast(row.FindControl("txt_PrimaCSC"), TextBox).Attributes.Add("style", "display:none")
                        TryCast(row.FindControl("txt_PrimaGRA"), TextBox).Attributes.Add("style", "display:none")
                    Case Ramo.CascosAereos
                        gvd_Control.Columns(ArrayCols(Columnas.Cascos)).Visible = True
                        gvd_Control.Columns(ArrayCols(Columnas.Guerra)).Visible = True

                        TryCast(row.FindControl("txt_PrimaRC"), TextBox).Attributes.Add("style", "display:none")
                    Case Else
                        If gvd_Control.ID = "gvd_Riesgo" Then
                            TryCast(row.FindControl("txt_PrimaNeta"), TextBox).Enabled = True
                        End If

                        TryCast(row.FindControl("txt_PrimaINC"), TextBox).Attributes.Add("style", "display:none")
                        TryCast(row.FindControl("txt_PrimaFHM"), TextBox).Attributes.Add("style", "display:none")
                        TryCast(row.FindControl("txt_PrimaTEV"), TextBox).Attributes.Add("style", "display:none")
                        TryCast(row.FindControl("txt_PrimaRC"), TextBox).Attributes.Add("style", "display:none")
                        TryCast(row.FindControl("txt_PrimaCSC"), TextBox).Attributes.Add("style", "display:none")
                        TryCast(row.FindControl("txt_PrimaGRA"), TextBox).Attributes.Add("style", "display:none")
                End Select
            End If
        Next
    End Sub

    Private Sub gvd_RamoSbr_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles gvd_RamoSbr.RowCommand
        Try
            If e.CommandName = "Seccion" Then
                hid_Ramo.Value = e.CommandSource.NamingContainer.RowIndex
                hid_Seccion.Value = 0

                Dim lbl_ClaveRamo As Label = CType(gvd_RamoSbr.Rows(hid_Ramo.Value).FindControl("lbl_ClaveRamo"), Label)
                Dim lbl_ClaveSubramo As Label = CType(gvd_RamoSbr.Rows(hid_Ramo.Value).FindControl("lbl_ClaveSubramo"), Label)

                For i = 0 To gvd_RamoSbr.Rows.Count - 1
                    CType(gvd_RamoSbr.Rows(i).FindControl("btn_Detalle"), ImageButton).ImageUrl = "~/Images/blue_arrow_mini.png"
                Next
                CType(gvd_RamoSbr.Rows(hid_Ramo.Value).FindControl("btn_Detalle"), ImageButton).ImageUrl = "~/Images/red_arrow_mini.png"

                Funciones.LlenaCatGrid(gvd_Seccion, "Rie", "", " AND cod_ramo = " & lbl_ClaveRamo.Text)

                CType(gvd_Seccion.Rows(hid_Seccion.Value).FindControl("txt_SelRie"), TextBox).Text = "1"
                CType(gvd_Seccion.Rows(hid_Seccion.Value).FindControl("btn_Detalle"), ImageButton).ImageUrl = "~/Images/red_arrow_mini.png"
                CType(gvd_Seccion.Rows(hid_Seccion.Value).FindControl("div_Seccion"), HtmlGenericControl).Attributes.Add("style", "background-color: lightgreen;")
                CType(gvd_Seccion.Rows(hid_Seccion.Value).FindControl("div_Cobertura"), HtmlGenericControl).Attributes.Add("style", "display: block")

                Funciones.LlenaCatGrid(gvd_Cobertura, "Cob", "", " AND cod_ramo = " & lbl_ClaveRamo.Text & " AND cod_subramo = " & lbl_ClaveSubramo.Text)
            End If
        Catch ex As Exception
            Mensaje.MuestraMensaje("Memoria de Calculo", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Private Sub gvd_Seccion_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles gvd_Seccion.RowCommand
        Try
            If e.CommandName = "Cobertura" Then
                hid_Seccion.Value = e.CommandSource.NamingContainer.RowIndex

                Dim lbl_ClaveRamo As Label = CType(gvd_RamoSbr.Rows(hid_Ramo.Value).FindControl("lbl_ClaveRamo"), Label)
                Dim lbl_ClaveSubramo As Label = CType(gvd_RamoSbr.Rows(hid_Ramo.Value).FindControl("lbl_ClaveSubramo"), Label)

                For i = 0 To gvd_Seccion.Rows.Count - 1
                    CType(gvd_Seccion.Rows(i).FindControl("btn_Detalle"), ImageButton).ImageUrl = "~/Images/blue_arrow_mini.png"
                Next
                CType(gvd_Seccion.Rows(hid_Seccion.Value).FindControl("btn_Detalle"), ImageButton).ImageUrl = "~/Images/red_arrow_mini.png"

                Funciones.LlenaCatGrid(gvd_Cobertura, "Cob", "", " AND cod_ramo = " & lbl_ClaveRamo.Text & " AND cod_subramo = " & lbl_ClaveSubramo.Text)
            End If
        Catch ex As Exception
            Mensaje.MuestraMensaje("Memoria de Calculo", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Private Sub gvd_Riesgo_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles gvd_Riesgo.RowDataBound
        Try

            If e.Row.RowType = DataControlRowType.DataRow Then
                Dim Tamaño() As String = Split(hid_Tamaño.Value, "|")

                TryCast(e.Row.FindControl("opt_Facultativo"), RadioButtonList).SelectedValue = sender.DataKeys(e.Row.RowIndex)("sn_facultativo")
                TryCast(e.Row.FindControl("opt_Adicional"), RadioButtonList).SelectedValue = sender.DataKeys(e.Row.RowIndex)("sn_adicional")

                TryCast(e.Row.FindControl("txt_SearchRamo"), TextBox).Width = Tamaño(0)
                TryCast(e.Row.FindControl("txt_SearchSubramo"), TextBox).Width = Tamaño(1)
                TryCast(e.Row.FindControl("txt_SearchSeccion"), TextBox).Width = Tamaño(2)
                TryCast(e.Row.FindControl("txt_SearchCobertura"), TextBox).Width = Tamaño(3)
            End If
        Catch ex As Exception
            Mensaje.MuestraMensaje("Memoria de Calculo", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Private Sub btn_buscaPol_Click(sender As Object, e As ImageClickEventArgs) Handles btn_buscaPol.Click
        Try
            Dim ws As New ws_MesaControl.MesaControlClient
            dtPolizasAseg = New DataTable
            dtPolizasAseg = Funciones.Lista_A_Datatable(ws.ObtienePolizasAseg(txt_SearchAse.Text).ToList)
            If dtPolizasAseg.Rows.Count > 0 Then
                Funciones.LlenaGrid(gvd_AsegPolizas, dtPolizasAseg)
                Funciones.EjecutaFuncion("fn_AbrirModal('#PolizasAsegurado')", "Polizas")
            Else
                Mensaje.MuestraMensaje("Mesa de Control", "No existen Pólizas para el Asegurado", TipoMsg.Falla)
            End If
        Catch ex As Exception
            Mensaje.MuestraMensaje("Mesa de Control", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Private Function ObtieneSeleccionados(ByRef gvd_Control As GridView, ByVal chk_Control As String, ByVal Clave As String, Optional ByVal Checked As Boolean = True) As String
        Dim strSel = "-1"
        For Each row In gvd_Control.Rows
            Dim chk_Sel As CheckBox = TryCast(row.FindControl(chk_Control), CheckBox)
            If chk_Sel.Checked = Checked And chk_Sel.Enabled = True Then
                strSel = strSel & "," & gvd_Control.DataKeys(row.RowIndex)(Clave)
            End If
        Next
        strSel = Replace(strSel, "-1,", "")
        ObtieneSeleccionados = IIf(strSel = "-1", vbNullString, strSel)
    End Function

    Private Sub btn_AceptarPol_Click(sender As Object, e As EventArgs) Handles btn_AceptarPol.Click
        Try
            Dim strSel = ObtieneSeleccionados(gvd_AsegPolizas, "chk_sel", "id_pv")
            If Len(strSel) > 0 Then

                Dim myRow() As Data.DataRow
                myRow = dtPolizasAseg.Select("id_pv IN (" & strSel & ")")

                If myRow.Length > 0 Then
                    txt_ClaveOfi.Text = myRow(0)("cod_suc")
                    txt_SearchOfi.Text = myRow(0)("sucursal")

                    txt_ClaveAseg.Text = myRow(0)("cod_aseg")
                    txt_SearchAse.Text = myRow(0)("asegurado")
                    txt_RFC.Text = myRow(0)("rfc")
                    ddl_Moneda.SelectedValue = myRow(0)("cod_moneda")
                    txt_ClaveTag.Text = myRow(0)("cod_tipo_agente")
                    txt_ClaveTagAux.Text = myRow(0)("cod_tipo_agente")
                    txt_SearchTag.Text = myRow(0)("tipo_agente")
                    txt_ClaveAge.Text = myRow(0)("cod_agente")
                    txt_SearchAge.Text = myRow(0)("agente")

                    txt_ClaveSusc.Text = myRow(0)("cod_usuario_suscriptor")
                    txt_SearchSusc.Text = myRow(0)("suscriptor")

                    txt_ClaveSuc.Text = myRow(0)("cod_suc")
                    txt_SearchSuc.Text = myRow(0)("sucursal")
                    txt_ClaveRam.Text = myRow(0)("cod_ramo")
                    txt_SearchRam.Text = myRow(0)("ramo")
                    txt_NroPoliza.Text = myRow(0)("nro_pol")
                    txt_Sufijo.Text = myRow(0)("aaaa_endoso")
                    txt_Endoso.Text = 0

                    txt_ClaveGre.Text = myRow(0)("cod_grupo_endo")
                    txt_ClaveGreAux.Text = myRow(0)("cod_grupo_endo")
                    txt_SearchGre.Text = myRow(0)("grupo_endoso")
                    txt_ClaveTte.Text = myRow(0)("cod_tipo_endo")
                    txt_SearchTte.Text = myRow(0)("tipo_endoso")

                    Funciones.EjecutaFuncion("fn_CerrarModal('#PolizasAsegurado')", "Polizas")
                End If
            End If

        Catch ex As Exception
            Mensaje.MuestraMensaje("Mesa de Control", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Private Sub btn_CerraPol_Click(sender As Object, e As EventArgs) Handles btn_CerraPol.Click
        Try
            dtPolizasAseg = Nothing
            Funciones.LlenaGrid(gvd_AsegPolizas, dtPolizasAseg)
            Funciones.EjecutaFuncion("fn_CerrarModal('#PolizasAsegurado')", "Polizas")
        Catch ex As Exception
            Mensaje.MuestraMensaje("Mesa de Control", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Private Sub btn_InfoRiesgos_Click(sender As Object, e As ImageClickEventArgs) Handles btn_InfoRiesgos.Click
        Try
            Dim ws As New ws_MesaControl.MesaControlClient
            Dim sCnn As String = ""
            Dim sSel As String
            sCnn = ConfigurationManager.ConnectionStrings("CadenaConexion").ConnectionString

            dtUbicaciones = New DataTable
            dtUbicaciones = Funciones.Lista_A_Datatable(ws.ObtieneUbicacionesPoliza(txt_ClaveSuc.Text, txt_ClaveRam.Text, txt_NroPoliza.Text, txt_Sufijo.Text, txt_Endoso.Text).ToList)

            If dtUbicaciones.Rows.Count > 0 Then
                dtRiesgosPol = New DataTable

                sSel = "spS_FactoresPoliza " & txt_ClaveSuc.Text & "," & txt_ClaveRam.Text & "," & txt_NroPoliza.Text & "," & txt_Sufijo.Text & "," & txt_Endoso.Text & "," & dtUbicaciones.Rows(0)("cod_item")

                Dim da As SqlDataAdapter

                da = New SqlDataAdapter(sSel, sCnn)

                da.Fill(dtRiesgosPol)



                If dtRiesgosPol.Rows.Count > 0 Then
                    Funciones.LlenaGrid(gvd_RiesgosPoliza, dtRiesgosPol)
                    ValidaRamosRiesgo(gvd_RiesgosPoliza, -1, {18, 19, 20, 21, 22, 23})

                    Dim ddl_Ubicacion As DropDownList = TryCast(gvd_RiesgosPoliza.HeaderRow.FindControl("ddl_Ubicacion"), DropDownList)
                    Funciones.LlenaDDL(ddl_Ubicacion, dtUbicaciones, "cod_item", "cod_item",)

                    lbl_RiesgoPoliza.Text = txt_ClaveSuc.Text & "-" & txt_ClaveRam.Text & "-" & txt_NroPoliza.Text & "-" & txt_Sufijo.Text & "-" & "0 >>> (" & txt_SearchAse.Text & ")"

                    Funciones.EjecutaFuncion("fn_AbrirModal('#RiesgosPoliza')", "Riesgos")
                Else
                    Mensaje.MuestraMensaje("Mesa de Control", "No existen Riesgos asociados a la Póliza", TipoMsg.Falla)
                End If
            End If

        Catch ex As Exception
            Mensaje.MuestraMensaje("Mesa de Control", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Private Sub btn_AceptarRie_Click(sender As Object, e As EventArgs) Handles btn_AceptarRie.Click
        Try
            Dim inciso As Integer = 1
            If dtRiesgo.Rows.Count > 0 Then
                inciso = gvd_Riesgo.DataKeys(gvd_Riesgo.Rows.Count - 1)("cod_inciso") + 1
            End If

            fn_ActualizaDataRiesgo()

            Dim strSel = ObtieneSeleccionados(gvd_RiesgosPoliza, "chk_sel", "id")

            If Len(strSel) > 0 Then
                Dim myRow() As Data.DataRow
                myRow = dtRiesgosPol.Select("id IN (" & strSel & ")")
                For Each Row In myRow
                    dtRiesgo.Rows.Add(0, inciso, Row("cod_ramo"), Row("ramo_desc"), Row("cod_subramo"), Row("subramo_desc"),
                                      Row("cod_riesgo"), Row("riesgo_desc"), Row("cod_ind_cob"), Row("cobertura_desc"),
                                      Row("sn_facultativo"), Row("sn_adicional"), 0, Row("suma_asegurada"), Row("prima_neta"),
                                      Row("prima_inc"), Row("prima_fhm"), Row("prima_tev"), Row("prima_rc"), Row("prima_casco"), Row("prima_guerra"),
                                      Row("prc_com_age"), Row("com_agente"), Row("prc_com_adi_age"), Row("com_adi_agente"), Row("Cuota"), 0, 0, 0, 0)
                    inciso = inciso + 1
                Next
                LlenaGridRiesgo(False)
                Funciones.EjecutaFuncion("fn_CerrarModal('#RiesgosPoliza')", "Riesgos")

                Funciones.EjecutaFuncion("fn_SumaTotales('gvd_Riesgo', ['SumaAsegurada', 'PrimaNeta', 'PrimaINC', 'PrimaTEV', 'PrimaFHM', 'PrimaRC', 'PrimaCSC', 'PrimaGRA', 'Cuota'], ['txt_LimRespAux', 'txt_PrimaNetaAux', 'txt_PrimaINCAux', 'txt_PrimaTEVAux', 'txt_PrimaFHMAux', 'txt_PrimaRCAux', 'txt_PrimaCSCAux', 'txt_PrimaGRAAux', 'txt_CuotaAux'], 1, [0], 0);", "Sumatoria")
            End If

            Funciones.EjecutaFuncion("fn_CerrarModal('#EsperaModal');", "CerrarModal")
        Catch ex As Exception
            Funciones.EjecutaFuncion("fn_CerrarModal('#EsperaModal');", "CerrarModal")
            Mensaje.MuestraMensaje("Mesa de Control", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Private Sub btn_CerrarRie_Click(sender As Object, e As EventArgs) Handles btn_CerrarRie.Click
        Try
            dtRiesgosPol = Nothing
            dtUbicaciones = Nothing
            Funciones.LlenaGrid(gvd_RiesgosPoliza, dtRiesgosPol)
            Funciones.EjecutaFuncion("fn_CerrarModal('#RiesgosPoliza')", "Riesgos")
        Catch ex As Exception
            Mensaje.MuestraMensaje("Mesa de Control", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Protected Sub ddl_Ubicacion_SelectedIndexChanged(sender As Object, e As EventArgs)
        Try
            Dim sCnn As String = ""
            Dim sSel As String
            sCnn = ConfigurationManager.ConnectionStrings("CadenaConexion").ConnectionString


            dtRiesgosPol = New DataTable
            sSel = "spS_FactoresPoliza " & txt_ClaveSuc.Text & "," & txt_ClaveRam.Text & "," & txt_NroPoliza.Text & "," & txt_Sufijo.Text & "," & txt_Endoso.Text & "," & sender.selectedValue

            Dim da As SqlDataAdapter

            da = New SqlDataAdapter(sSel, sCnn)

            da.Fill(dtRiesgosPol)

            Funciones.LlenaGrid(gvd_RiesgosPoliza, dtRiesgosPol)
            ValidaRamosRiesgo(gvd_RiesgosPoliza, -1, {18, 19, 20, 21, 22, 23})

            Dim ddl_Ubicacion As DropDownList = TryCast(gvd_RiesgosPoliza.HeaderRow.FindControl("ddl_Ubicacion"), DropDownList)
            Funciones.LlenaDDL(ddl_Ubicacion, dtUbicaciones, "cod_item", "cod_item", sender.selectedValue)

        Catch ex As Exception
            Mensaje.MuestraMensaje("Mesa de Control", ex.Message, TipoMsg.Falla)
        End Try
    End Sub
End Class
