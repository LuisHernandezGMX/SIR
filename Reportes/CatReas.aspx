<%@ Page Title="" Language="VB" MasterPageFile="~/Pages/SiteMaster.master" AutoEventWireup="false" CodeFile="CatReas.aspx.vb" Inherits="Reportes_CatReas" %>


<asp:Content ID="Content2" ContentPlaceHolderID="cph_principal" Runat="Server">
    <script src="../Scripts/FirmasElectronicas.js"></script>
    <asp:HiddenField runat="server" ID="hid_Ventanas" Value="0|" />

    <div style="width:1000px; min-width:1000px; overflow-x:hidden">
        <div class="cuadro-titulo panel-encabezado">
<%--            <input type="image" src="../Images/contraer_mini_inv.png" id="coVentana0" class="contraer"  />
            <input type="image" src="../Images/expander_mini_inv.png"   id="exVentana0" class="expandir"  />--%>
            Catálogo de Reaseguradores
        </div>
         <div class="panel-contenido ventana0" >
              <div class="clear padding5"></div>


            <div style="width:100%; text-align:right; border-top-style:inset; border-width:1px; border-color:#003A5D">
                <asp:UpdatePanel runat="server" ID="upBusqueda">
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

    </div>
</asp:Content>

