<%@ Page Title="" Language="VB" MasterPageFile="~/Pages/SiteMasterEmpty.master" AutoEventWireup="false" CodeFile="Login.aspx.vb" Inherits="Pages_Login" %>


<asp:Content ID="Content2" ContentPlaceHolderID="cph_principal" Runat="Server">
    <div class="clear padding50"></div>

    <div id="cuadro_login" class="panel-encabezado" >
        <div class="cuadro-titulo">
            <strong>INICIAR SESIÓN</strong>
        </div>

        <div class="clear padding30"></div>

        <table>
            <tr>
                <td>
                    <img class="profile-img" src ="../Images/Login.png" alt=""/>
                </td>
                <td>
           
                    <div class="input-group"> 
                        <asp:label runat="server" class="col-md-1 etiqueta-control" Width="90px">Usuario</asp:label>

                        <span class="input-group-addon">
                             <img src="../Images/user_text.png" height="15" width="15" />
                        </span>
                        <asp:TextBox runat="server" ID="txt_usuario" Width="163px" CssClass="estandar-control" ></asp:TextBox>
                    </div>
     
                    <div class="clear padding10"></div>

                    <div class="input-group"> 
                        <asp:label runat="server" class="col-md-1 etiqueta-control" Width="90px">Contraseña</asp:label>
                        <span class="input-group-addon">
                            <img src="../Images/pass_icon.png" height="15" width="15" />
                        </span>
                        <asp:TextBox runat="server" ID="txt_contraseña" Width="163px" CssClass="estandar-control" TextMode="Password" ></asp:TextBox>
                    </div>

                    <div class="clear padding10"></div>

                    <div style="width:100%; padding-left:90px;">
                        <asp:Button ID="btn_Aceptar" runat="server" Text="Iniciar sesión" Width="205px" BackColor="#003A5D" class="btn btn-primary etiqueta-control" />
                    </div>   

                    <div class="clear padding10"></div>

                    <div style="width:100%; padding-left:80px; text-align:center">
                        <asp:linkbutton runat="server" class="etiqueta-control">¿Olvidó su Contraseña?</asp:linkbutton>
                    </div>
                    <div style="width:100%; padding-left:80px; text-align:center">
                        <asp:linkbutton runat="server" class="etiqueta-control">Solicitud de Registro</asp:linkbutton>
                    </div>
                </td>
            </tr>
        </table>
    </div>

</asp:Content>

