Imports System.Data
Imports Mensaje
Imports Funciones
Partial Class Pages_SiteMaster
    Inherits System.Web.UI.MasterPage

    Private Sub Pages_SiteMaster_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            CargaRowOculto()
        End If
    End Sub

    Private Sub CargaRowOculto()
        Dim dummy As New DataTable()
        dummy.Columns.Add("Clave")
        dummy.Columns.Add("Descripcion")

        dummy.Rows.Add()
        gvd_Catalogo.DataSource = dummy
        gvd_Catalogo.DataBind()
    End Sub

    'Evento que evalua los elementos seleccionados en el Catalogo
    Private Sub btn_Aceptar_Catalogo_Click(sender As Object, e As EventArgs) Handles btn_Aceptar_Catalogo.Click
        Try
            Dim dt_Datos As DataTable
            Dim Datos() As String
            Dim Seleccionados As String = hid_Seleccion.Value
            Dim lbl_Oculta1 As Label
            Dim lbl_Oculta2 As Label
            Dim lbl_Oculta3 As Label

            If Len(Seleccionados) > 0 Then

                Dim gvd_Control As GridView = DirectCast(cph_principal.FindControl(hid_Control.Value), GridView)

                Dim Prefijo As String = hid_Prefijo.Value
                Datos = Split(Seleccionados.Substring(0, Seleccionados.Length - 1), "|")

                If Not gvd_Control Is Nothing Then

                    dt_Datos = New DataTable
                    dt_Datos.Columns.Add("Clave")
                    dt_Datos.Columns.Add("Descripcion")
                    dt_Datos.Columns.Add("OcultaCampo1")
                    dt_Datos.Columns.Add("OcultaCampo2")
                    dt_Datos.Columns.Add("OcultaCampo3")

                    For Each row As GridViewRow In gvd_Control.Rows
                        Dim Elemento = DirectCast(row.FindControl("chk_Sel" & Prefijo), HiddenField)
                        If Elemento.Value <> "true" Then
                            Dim Fila As DataRow = dt_Datos.NewRow()
                            Fila("Clave") = DirectCast(row.FindControl("lbl_Clave" & Prefijo), Label).Text
                            Fila("Descripcion") = DirectCast(row.FindControl("lbl_Desc"), Label).Text
                            Fila("OcultaCampo1") = ""
                            Fila("OcultaCampo2") = ""
                            Fila("OcultaCampo3") = ""

                            lbl_Oculta1 = DirectCast(row.FindControl("lbl_Oculta1"), Label)
                            If Not lbl_Oculta1 Is Nothing Then
                                Fila("OcultaCampo1") = lbl_Oculta1.Text
                            End If

                            lbl_Oculta2 = DirectCast(row.FindControl("lbl_Oculta2"), Label)
                            If Not lbl_Oculta2 Is Nothing Then
                                Fila("OcultaCampo2") = lbl_Oculta2.Text
                            End If

                            lbl_Oculta3 = DirectCast(row.FindControl("lbl_Oculta3"), Label)
                            If Not lbl_Oculta3 Is Nothing Then
                                Fila("OcultaCampo3") = lbl_Oculta3.Text
                            End If

                            dt_Datos.Rows.Add(Fila)
                        End If
                    Next

                    For Each dato In Datos
                        Dim Fila As DataRow = dt_Datos.NewRow()
                        Fila("Clave") = Split(dato, "~")(0)
                        Fila("Descripcion") = Split(dato, "~")(1)
                        Fila("OcultaCampo1") = Split(dato, "~")(2)
                        Fila("OcultaCampo2") = Split(dato, "~")(3)
                        Fila("OcultaCampo3") = Split(dato, "~")(4)
                        dt_Datos.Rows.Add(Fila)
                    Next

                    gvd_Control.DataSource = dt_Datos
                    gvd_Control.DataBind()
                Else
                    If Len(hid_Control.Value) > 0 Then
                        Dim Controles() As String = Split(hid_Control.Value, "|")

                        Select Case Controles.Count
                            Case 1
                                Dim txt_Clave As TextBox = DirectCast(cph_principal.FindControl(Controles(0)), TextBox)
                                txt_Clave.Text = Datos(0)
                            Case 2
                                Dim txt_Clave As TextBox = DirectCast(cph_principal.FindControl(Controles(0)), TextBox)
                                Dim txt_Descripcion As TextBox = DirectCast(cph_principal.FindControl(Controles(1)), TextBox)
                                If Not txt_Clave Is Nothing And Not txt_Descripcion Is Nothing Then
                                    txt_Clave.Text = Split(Datos(0), "~")(0)
                                    txt_Descripcion.Text = Split(Datos(0), "~")(1)
                                End If
                            Case 3
                                Dim txt_Clave As TextBox = DirectCast(cph_principal.FindControl(Controles(0)), TextBox)
                                Dim txt_Descripcion As TextBox = DirectCast(cph_principal.FindControl(Controles(1)), TextBox)
                                Dim gvd_GridView As GridView = DirectCast(cph_principal.FindControl(Controles(2)), GridView)
                                If Not txt_Clave Is Nothing And Not txt_Descripcion Is Nothing And Not gvd_GridView Is Nothing Then
                                    txt_Clave.Text = Split(Datos(0), "~")(0)
                                    txt_Descripcion.Text = Split(Datos(0), "~")(1)
                                    gvd_GridView.DataSource = Nothing
                                    gvd_GridView.DataBind()
                                End If
                        End Select
                    End If

                End If

            Else
                Mensaje.MuestraMensaje("Catálogo", "No seleccionó ningún elemento", TipoMsg.Advertencia)
            End If

            Funciones.CerrarModal("#Catalogo")
        Catch ex As Exception
            Mensaje.MuestraMensaje("Master Page", ex.Message, TipoMsg.Falla)
        End Try
    End Sub




End Class

