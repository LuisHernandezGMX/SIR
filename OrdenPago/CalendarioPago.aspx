<%@ Page Title="" Language="VB" MasterPageFile="~/Pages/SiteMaster.master" AutoEventWireup="false" CodeFile="CalendarioPago.aspx.vb" Inherits="OrdenPago_CalendarioPago" %>
<%@ MasterType VirtualPath="~/Pages/SiteMaster.master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="cph_principal" Runat="Server">
    <script src="../Scripts/Facultativos.js"></script>
    <asp:HiddenField runat="server" ID="hid_Ventanas" Value="0|1|1|1|1|" />

     <div style="width:1000px; min-width:1000px; overflow-x:hidden">
        <div class="cuadro-titulo panel-encabezado">
            <input type="image" src="../Images/contraer_mini_inv.png" id="coVentana0" class="contraer"  />
            <input type="image" src="../Images/expander_mini_inv.png"   id="exVentana0" class="expandir"  />
            Filtros
        </div>
        <div class="panel-contenido ventana0" >
            <div class="row">
                <div class="col-md-3">
                    <asp:label runat="server" class="col-md-1 etiqueta-control" Width="110px">Fecha Estimada</asp:label>
                    <asp:TextBox runat="server" ID="txtFecGeneraDe" CssClass="estandar-control Fecha Centro" Width="110px" ></asp:TextBox>
                </div>
                <div class="col-md-3">
                    <asp:label runat="server" class="col-md-1 etiqueta-control" Width="60px">A</asp:label>
                    <asp:TextBox runat="server" ID="txtFecGeneraA" CssClass="estandar-control Fecha Centro" Width="110px" ></asp:TextBox>
                </div>

                <div class="col-md-4">
                    <asp:label runat="server" class="col-md-1 etiqueta-control" Width="100px">Moneda</asp:label>
                    <asp:DropDownList runat="server" ID="ddl_Moneda" CssClass="estandar-control" Width="150px" ></asp:DropDownList>
                </div>
                
            </div>

            <div class="clear padding5"></div>
            
            <div class="row">
                <div class="col-md-6">
                    <div class="cuadro-subtitulo">
                        <input type="image" src="../Images/contraer_mini.png" id="coVentana1" class="contraer"  />
                        <input type="image" src="../Images/expander_mini.png"   id="exVentana1" class="expandir"  />
                        Póliza
                    </div>
                    <div class="panel-subcontenido ventana1">
                            <asp:UpdatePanel runat="server" ID="upPoliza">
                                <ContentTemplate>
                                    <asp:HiddenField runat="server" ID="hid_HTML" Value="" />
                                    <div class="clear padding5"></div>

                                    <asp:Panel runat="server" ID="pnlPoliza" Width="100%" Height="100px" ScrollBars="Both">
                                            <asp:GridView runat="server" ID="gvd_Poliza" AutoGenerateColumns="false" 
                                                            CssClass="grid-view" HeaderStyle-CssClass="header" AlternatingRowStyle-CssClass="altern"
                                                            GridLines="Horizontal"  ShowHeaderWhenEmpty="true" >
                                                <Columns>
                                                    <asp:TemplateField HeaderText="">
                                                        <ItemTemplate>
                                                            <asp:HiddenField runat="server" ID="chk_SelPol" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Clave">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" ID="lbl_ClavePol" Text='<%# Eval("Clave") %>' Width="100px"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Grupo Endoso">
                                                        <ItemTemplate>
                                                            <asp:label runat="server" ID="lbl_DescripcionPol" Enabled="false" Text='<%# Eval("Descripcion")   %>' Width="310px"></asp:label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <asp:imagebutton ImageUrl="~/Images/delete_rojo.png" CommandName="Delete" Height="26" runat="server" CssClass="btn Delete" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </asp:Panel>
                                        <div style="width:100%;  text-align:right">
                                            <asp:LinkButton id="btn_AddPol" runat="server" class="btn botones">
                                                <span>
                                                    <img class="btn-añadir"/>
                                                    Añadir
                                                </span>
                                            </asp:LinkButton>
                                        </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>       
                    </div>   
                </div>
                <div class="col-md-6">
                    <div class="cuadro-subtitulo">
                        <input type="image" src="../Images/contraer_mini.png" id="coVentana2" class="contraer"  />
                        <input type="image" src="../Images/expander_mini.png"   id="exVentana2" class="expandir"  />
                        Broker
                    </div>
                    <div class="panel-subcontenido ventana2">
                            <asp:UpdatePanel runat="server" ID="upBroker">
                                <ContentTemplate>
                                    <asp:Panel runat="server" ID="pnlBroker" Width="100%" Height="100px" ScrollBars="Both">
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
                                                            <asp:Label runat="server" ID="lbl_ClaveBro" Text='<%# Eval("Clave") %>' Width="50px"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Descripción">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" ID="lbl_Desc" Text='<%# Eval("Descripcion") %>' Width="360px"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <asp:imagebutton ImageUrl="~/Images/delete_rojo.png" CommandName="Delete" Height="26" runat="server" CssClass="btn Delete" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </asp:Panel>
                                        <div style="width:100%;  text-align:right">
                                            <asp:LinkButton id="btn_AddBroker" runat="server" class="btn botones AgregaBroker" data-toggle="modal" data-target="#EsperaModal">
                                                <span>
                                                    <img class="btn-añadir"/>
                                                    Añadir
                                                </span>
                                            </asp:LinkButton>
                                        </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                    </div>
                </div>
            </div>

            <div class="clear padding5"></div>
            
            <div class="row">
                <div class="col-md-6">
                    <div class="cuadro-subtitulo">
                        <input type="image" src="../Images/contraer_mini.png" id="coVentana3" class="contraer"  />
                        <input type="image" src="../Images/expander_mini.png"   id="exVentana3" class="expandir"  />
                        Ramo Contable
                    </div>
                    <div class="panel-subcontenido ventana3">
                            <asp:UpdatePanel runat="server" ID="upRamoContable">
                            <ContentTemplate>
                                    <asp:Panel runat="server" ID="pn_RamoContable" Width="100%" Height="100px" ScrollBars="Both">
                                    <asp:GridView runat="server" ID="gvd_RamoContable" AutoGenerateColumns="false" 
                                                    CssClass="grid-view" HeaderStyle-CssClass="header" AlternatingRowStyle-CssClass="altern"
                                                    GridLines="Horizontal"  ShowHeaderWhenEmpty="true" >
                                        <Columns>
                                            <asp:TemplateField HeaderText="">
                                                <ItemTemplate>
                                                        <asp:HiddenField runat="server" ID="chk_SelRamC" value="false"/>
                                                </ItemTemplate>
                                            </asp:TemplateField >
                                            <asp:TemplateField HeaderText="Clave">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="lbl_ClaveRamC" Text='<%# Eval("Clave") %>' Width="50px"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Descripción">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="lbl_Desc" Text='<%# Eval("Descripcion") %>' Width="360px"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:imagebutton ImageUrl="~/Images/delete_rojo.png" CommandName="Delete" Height="26" runat="server" CssClass="btn Delete" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </asp:Panel>
                                <div style="width:100%;  text-align:right">
                                    <asp:LinkButton id="btn_AddRamoContable" runat="server" class="btn botones AgregaRamoCont" data-toggle="modal" data-target="#EsperaModal">
                                        <span>
                                            <img class="btn-añadir"/>
                                            Añadir
                                        </span>
                                    </asp:LinkButton>
                                </div>
                            </ContentTemplate>
                            </asp:UpdatePanel>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="cuadro-subtitulo">
                        <input type="image" src="../Images/contraer_mini.png" id="coVentana4" class="contraer"  />
                        <input type="image" src="../Images/expander_mini.png"   id="exVentana4" class="expandir"  />
                        Producto
                    </div>
                    <div class="panel-subcontenido ventana4">
                            <asp:UpdatePanel runat="server" ID="upProducto">
                            <ContentTemplate>
                                    <asp:Panel runat="server" ID="pnl_Producto" Width="100%" Height="100px" ScrollBars="Both">
                                    <asp:GridView runat="server" ID="gvd_Producto" AutoGenerateColumns="false" 
                                                    CssClass="grid-view" HeaderStyle-CssClass="header" AlternatingRowStyle-CssClass="altern"
                                                    GridLines="Horizontal"  ShowHeaderWhenEmpty="true" >
                                        <Columns>
                                            <asp:TemplateField HeaderText="">
                                                <ItemTemplate>
                                                        <asp:HiddenField runat="server" ID="chk_SelPro" value="false"/>
                                                </ItemTemplate>
                                            </asp:TemplateField >
                                            <asp:TemplateField HeaderText="Clave">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="lbl_ClavePro" Text='<%# Eval("Clave") %>' Width="50px"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Descripción">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="lbl_Desc" Text='<%# Eval("Descripcion") %>' Width="360px"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:imagebutton ImageUrl="~/Images/delete_rojo.png" CommandName="Delete" Height="26" runat="server" CssClass="btn Delete" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </asp:Panel>
                                <div style="width:100%;  text-align:right">
                                    <asp:LinkButton id="btn_AddProducto" runat="server" class="btn botones AgregaProducto" data-toggle="modal" data-target="#EsperaModal">
                                        <span>
                                            <img class="btn-añadir"/>
                                            Añadir
                                        </span>
                                    </asp:LinkButton>
                                </div>
                            </ContentTemplate>
                            </asp:UpdatePanel>
                    </div>
                </div>
            </div>
        </div>

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
</asp:Content>




