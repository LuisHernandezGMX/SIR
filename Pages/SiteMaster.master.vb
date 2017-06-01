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

            If Len(Seleccionados) > 0 Then
                Dim gvd_Control As GridView = DirectCast(cph_principal.FindControl(hid_Control.Value), GridView)
                Dim Prefijo As String = hid_Prefijo.Value
                dt_Datos = New DataTable

                Datos = Split(Seleccionados.Substring(0, Seleccionados.Length - 1), "|")

                dt_Datos.Columns.Add("Clave")
                dt_Datos.Columns.Add("Descripcion")

                For Each row As GridViewRow In gvd_Control.Rows
                    Dim Elemento = DirectCast(row.FindControl("chk_Sel" & Prefijo), HiddenField)
                    If Elemento.Value <> "true" Then
                        Dim Fila As DataRow = dt_Datos.NewRow()
                        Fila("Clave") = DirectCast(row.FindControl("lbl_Clave" & Prefijo), Label).Text
                        Fila("Descripcion") = DirectCast(row.FindControl("lbl_Desc"), Label).Text
                        dt_Datos.Rows.Add(Fila)
                    End If
                Next

                For Each dato In Datos
                    Dim Fila As DataRow = dt_Datos.NewRow()
                    Fila("Clave") = Split(dato, "~")(0)
                    Fila("Descripcion") = Split(dato, "~")(1)
                    dt_Datos.Rows.Add(Fila)
                Next

                gvd_Control.DataSource = dt_Datos
                gvd_Control.DataBind()
            Else
                Mensaje.MuestraMensaje("Catálogo", "No seleccionó ningún elemento", TipoMsg.Advertencia)
            End If

            Funciones.CerrarModal("#Catalogo")
        Catch ex As Exception
            Mensaje.MuestraMensaje("Master Page", ex.Message, TipoMsg.Falla)
        End Try
    End Sub


End Class

