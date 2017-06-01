<%@ Page Title="" Language="VB"  MasterPageFile="~/Pages/SiteMaster.master" AutoEventWireup="false"  CodeFile="Inicio.aspx.vb" Inherits="Pages_Inicio" %>
<%@ MasterType VirtualPath="~/Pages/SiteMaster.master" %>


<asp:Content ID="Content2" ContentPlaceHolderID="cph_principal" Runat="Server">
    <script src="../Scripts/Inicio.js"></script>

    <asp:UpdatePanel runat="server" ID="up">
    <ContentTemplate>
        <asp:HiddenField runat="server" ID="hid_Ventanas" Value="0|0|0|1|" />


        <div class="cuadro-titulo panel-encabezado">
            TITULO DE SECCION
        </div>

        <div class="clear padding20"></div>

        <div class="cuadro-subtitulo panel-subtitulo">
            <input type="image" src="../Images/contraer_mini.png" id="coVentana0"  />
            <input type="image" src="../Images/expander_mini.png" id="exVentana0"  />
            <label class="etiqueta-simple">Subtitulo Sección</label>
        </div>

        <div class="panel-body ventana0 etiqueta-simple" >
            CONTENIDO DE DIV
        </div>

        <div class="clear padding20"></div>

        <asp:LinkButton id="btn_Aceptar" runat="server" class="btn botones Confirmacion">
            <span>
                <img class="btn-aceptar"/>
                Aceptar
            </span>
        </asp:LinkButton>

        <asp:LinkButton id="btn_Cancelar" runat="server" class="btn botones Confirmacion">
            <span>
                <img class="btn-cancelar"/>
                Cancelar
            </span>
        </asp:LinkButton>

         <asp:LinkButton id="btn_Buscar" runat="server" class="btn botones">
            <span>
                <img class="btn-buscar"/>
                Buscar
            </span>
        </asp:LinkButton>

        <asp:LinkButton id="btn_Eliminar" runat="server" class="btn botones">
            <span>
                <img class="btn-eliminar"/>
                Eliminar
            </span>
        </asp:LinkButton>

         <asp:LinkButton id="btn_Modificar" runat="server" class="btn botones">
            <span>
                <img class="btn-modificar"/>
                Modificar
            </span>
        </asp:LinkButton>

         <asp:LinkButton id="btn_Guardar" runat="server" class="btn botones">
            <span>
                <img class="btn-guardar"/>
                Guardar
            </span>
        </asp:LinkButton>

         <asp:LinkButton id="btn_Limpiar" runat="server" class="btn botones">
            <span>
                <img class="btn-limpiar"/>
                Limpiar
            </span>
        </asp:LinkButton>

         <asp:LinkButton id="btn_Nuevo" runat="server" class="btn botones">
            <span>
                <img class="btn-añadir"/>
                Nuevo
            </span>
        </asp:LinkButton>

        <asp:LinkButton id="btn_Añadir" runat="server" class="btn botones AgregaBroker" data-toggle="modal" data-target="#EsperaModal">
            <span>
                <img class="btn-añadir"/>
                Añadir
            </span>
        </asp:LinkButton>

        <asp:LinkButton id="btn_Quitar" runat="server" class="btn botones">
            <span>
                <img class="btn-quitar"/>
                Quitar
            </span>
        </asp:LinkButton>

        <asp:LinkButton id="btn_Imprimir" runat="server" class="btn botones">
            <span>
                <img class="btn-imprimir"/>
                Imprimir
            </span>
        </asp:LinkButton>

        <div class="clear padding20"></div>

         <asp:Panel runat="server" ID="pnlBroker" Width="470px" Height="130px" ScrollBars="Both">
             <asp:GridView runat="server" ID="gvd_Broker" AutoGenerateColumns="false" 
                           CssClass="grid-view" HeaderStyle-CssClass="header" AlternatingRowStyle-CssClass="altern"
                           GridLines="Horizontal"  ShowHeaderWhenEmpty="true" >
                <Columns>
                    <asp:TemplateField HeaderText="">
                        <ItemTemplate>
                            <asp:HiddenField runat="server" ID="chk_SelBro" value="false"/>
                        </ItemTemplate>
                    </asp:TemplateField >
                    <asp:TemplateField HeaderText="Clave">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lbl_ClaveBro" Text='<%# Eval("Clave") %>' Width="50px" ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Descripción">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lbl_Desc" Text='<%# Eval("Descripcion") %>' Width="310px" ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                           <asp:imagebutton ID="btn_Edicion" ImageUrl="~/Images/edicion_ICONO.png" Height="28" runat="server" CssClass="btn" />
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField>
                        <ItemTemplate>
                           <asp:imagebutton ID="btn_Quitar" ImageUrl="~/Images/delete_rojo.png" CommandName="Delete" Height="28" runat="server" CssClass="btn Confirmacion" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </asp:Panel>

        <div class="clear padding20"></div>

        <div class="input-group"> 
            <asp:label runat="server" class="col-md-1 etiqueta-control" Width="90px">Usuario</asp:label>
            <asp:TextBox runat="server" ID="txt_usuario" Width="163px" CssClass="estandar-control" ></asp:TextBox>
        </div>

        <div class="clear padding20"></div>

        <asp:label runat="server" class="col-md-1 etiqueta-control" Width="90px">Fecha</asp:label>
        <asp:TextBox runat="server" ID="txt_Fecha" CssClass="estandar-control Fecha" Width="80px"  ></asp:TextBox>

         

    </ContentTemplate>
</asp:UpdatePanel>

    
</asp:Content>

