<%@ Page Title="" Language="VB" MasterPageFile="~/Pages/SiteMaster.master" AutoEventWireup="false" CodeFile="ResumenTemporario.aspx.vb" Inherits="Distribucion_ResumenTemporario" %>
<%@ MasterType VirtualPath="~/Pages/SiteMaster.master" %>


<asp:Content ID="Content2" ContentPlaceHolderID="cph_principal" Runat="Server">
    <asp:HiddenField runat="server" ID="hid_Ventanas" Value="0|0|0|1|" />

     <div style="width:1100px; min-width:1100px; overflow-x:hidden">
         <asp:label runat="server" class="col-md-1  etiqueta-control" Width="110px">Temporario</asp:label>
         <asp:TextBox runat="server" ID="txt_Temporario" CssClass="estandar-control Centro" Width="100px"></asp:TextBox>

         <div class="clear padding5"></div>

          <div style="width:100%; text-align:right; border-top-style:inset; border-width:1px; border-color:#003A5D">
            <asp:UpdatePanel runat="server" ID="upReporte">
                <ContentTemplate>
                    <asp:LinkButton id="btn_Reporte" runat="server" class="btn botones">
                        <span>
                            <img class="btn-buscar"/>
                            Reporte
                        </span>
                    </asp:LinkButton>
                </ContentTemplate>
            </asp:UpdatePanel>
         </div>
     </div>
</asp:Content>

