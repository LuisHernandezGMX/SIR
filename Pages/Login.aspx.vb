﻿Imports Mensaje
Imports System.Data
Imports System.Data.SqlClient
Partial Class Pages_Login
    Inherits System.Web.UI.Page

    Private Function ArmaMenu(ByVal dtMenu As DataTable) As String
        Dim Menu As String = "<ul id=""menu"">" &
                                "<li> " &
                                        "<div id=""casita"">" &
                                            "<a href=""../Pages/Inicio.aspx"">" &
                                            "<img src=""../Images/menu_home-up.png"" width=""26"" height=""22"" border=""0"" id=""home"" onmouseout=""MM_swapImgRestore()"" onmouseover=""MM_swapImage('home','','../Images/menu_home-over.png',1)"" onmousedown=""MM_swapImage('home','','../Images/menu_home-down.png',1)""></a>" &
                                       "</div>" &
                                "</li>"

        ' Menú temporal para Emisión
        Menu = Menu & "<li><img class=""separador"" /></li><li><a href=""CoaseguroLider.aspx"">Coaseguro Líder</a></li><li><img class=""separador"" /></li>"
        Menu = Menu & "<li><a href=""CoaseguroSeguidor.aspx"">Coaseguro Seguidor</a></li>"
        'Dim separador As String = "<li> <img Class=""separador"" /></li>"

        'Dim myRow() As Data.DataRow
        'myRow = dtMenu.Select("nivel ='" & 0 & "'")

        'For Each item In myRow
        '    Menu = Menu & separador & "<li>"

        '    If len(item("ubicacion")) > 0 Then
        '        Menu = Menu & "<a href=""" & item("ubicacion") & """>" & item("descripcion") & "</a>"
        '    Else
        '        Menu = Menu & item("descripcion") & "<ul>"
        '        Menu = Menu & ArmaSubMenus(dtMenu, item("cod_submodulo_web"))
        '        Menu = Menu & "</ul>"
        '    End If
        '    Menu = Menu & "</li>"
        'Next
        Menu = Menu & "</ul>"

        Return Menu
    End Function

    Private Function ArmaSubMenus(ByVal dtMenu As DataTable, ByVal cod_submodulo As Integer)
        Dim submenu As String = ""

        'Validación de Selección
        Dim myRow() As Data.DataRow
        myRow = dtMenu.Select("nivel ='" & cod_submodulo & "'")

        For Each item In myRow
            submenu = submenu & "<li>"

            If len(item("ubicacion")) > 0 Then
                submenu = submenu & "<a href=""" & item("ubicacion") & """>" & item("descripcion") & "</a>"
            Else
                submenu = submenu & item("descripcion") & "<ul>"
                submenu = submenu & ArmaSubMenus(dtMenu, item("cod_submodulo_web"))
                submenu = submenu & "</ul>"
            End If
            submenu = submenu & "</li>"
        Next

        Return submenu
    End Function


    Private Sub btn_Aceptar_Click(sender As Object, e As EventArgs) Handles btn_Aceptar.Click
        Try
            Dim ws As New ws_Generales.GeneralesClient
            Dim dtUsuario As New DataTable

            'Validadción en Active Directory
            If Funciones.AutenticaUsuario(txt_usuario.Text, txt_contraseña.Text) = True Then
                'Validadción en SII
                dtUsuario = Funciones.Lista_A_Datatable(ws.ObtieneUsuario(txt_usuario.Text).ToList)
                If dtUsuario.Rows.Count > 0 Then

                    Session.Add("Menu", ArmaMenu(Funciones.Lista_A_Datatable(ws.ObtieneMenu(dtUsuario.Rows(0)("cod_usuario"), 16).ToList)))

                    Dim authTicket As FormsAuthenticationTicket
                    authTicket = New FormsAuthenticationTicket(dtUsuario.Rows(0)("cod_usuario") & "|" & dtUsuario.Rows(0)("usuario") & "|" &
                                                               dtUsuario.Rows(0)("cod_suc") & "|" & dtUsuario.Rows(0)("sucursal") & "|" &
                                                               dtUsuario.Rows(0)("cod_sector") & "|" & dtUsuario.Rows(0)("sector") & "|" &
                                                               dtUsuario.Rows(0)("mail"), True, 180)

                    Dim encryptedTicket As String = FormsAuthentication.Encrypt(authTicket)
                    Dim authCookie As HttpCookie
                    authCookie = New HttpCookie(FormsAuthentication.FormsCookieName, encryptedTicket)
                    Response.Cookies.Add(authCookie)

                    If Len(Request.QueryString("ReturnUrl")) > 0 Then
                        Response.Redirect(FormsAuthentication.GetRedirectUrl(dtUsuario.Rows(0)("cod_usuario") & "|" & dtUsuario.Rows(0)("usuario"), False))
                    Else
                        'Response.Redirect("Inicio.aspx", False)
                        ' Redirección temporal para Emisión
                        Response.Redirect("~/Emision/CoaseguroLider.aspx")
                    End If

                Else
                    Mensaje.MuestraMensaje("Login", "No cuenta con permisos para ingresar a SII", TipoMsg.Falla)
                End If
            Else
                Mensaje.MuestraMensaje("Login", "Usuario y/o Contraseña incorrectos", TipoMsg.Falla)
            End If
        Catch ex As Exception
            Mensaje.MuestraMensaje("Login", ex.Message, TipoMsg.Falla)
        End Try
    End Sub
End Class
