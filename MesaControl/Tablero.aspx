<%@ Page Title="" Language="VB" MasterPageFile="~/Pages/SiteMaster.master" AutoEventWireup="false" CodeFile="Tablero.aspx.vb" Inherits="MesaControl_Tablero" %>
<%@ MasterType VirtualPath="~/Pages/SiteMaster.master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="cph_principal" Runat="Server" >
    <script src="../Scripts/MesaControl.js"></script>
    <asp:HiddenField runat="server" ID="hid_Ventanas" Value="0|1|1|1|1|0|0|0|0|0|" />

     <div style="width:1100px; min-width:1100px; overflow-x:hidden">
         <div class="cuadro-titulo panel-encabezado">
            <input type="image" src="../Images/contraer_mini_inv.png" id="coVentana0" class="contraer"  />
            <input type="image" src="../Images/expander_mini_inv.png"   id="exVentana0" class="expandir"  />
            Filtros
        </div>
        <div class="panel-contenido ventana0" >
            <asp:UpdatePanel runat="server" ID="upFiltros">
                <ContentTemplate>
                    <div class="row">
                        <div class="col-md-4">
                            <asp:label runat="server" class="col-md-1 etiqueta-control" Width="100px">Folio</asp:label>
                            <asp:TextBox runat="server" ID="txt_Folio" CssClass="estandar-control" Width="230px"></asp:TextBox>
                        </div>
                        <div class="col-md-4">
                            <asp:label runat="server" class="col-md-1 etiqueta-control" Width="90px">Oficina</asp:label>
                            <asp:TextBox runat="server" ID="txt_ClaveOfi" CssClass="NoDisplay"></asp:TextBox>
                            <asp:TextBox runat="server" ID="txt_SearchOfi" CssClass="col-md-1 estandar-control" Width="190px"></asp:TextBox>
                            <asp:LinkButton id="btn_SelOficina" runat="server" class="btn botones boton-chico AgregaOficina" data-toggle="modal" data-target="#EsperaModal">
                                <span>
                                    <img class="btn-buscar"/>
                                </span>
                            </asp:LinkButton>
                        </div>
                        <div class="col-md-4">
                            <asp:label runat="server" class="col-md-1 etiqueta-control" Width="110px">Fecha Recibido</asp:label>
                            <asp:TextBox runat="server" ID="txtFecGeneraDe" CssClass="col-md-1 estandar-control Fecha Centro" Width="90px" ></asp:TextBox>
                            <asp:label runat="server" class="col-md-1 etiqueta-control" Width="40px">A</asp:label>
                            <asp:TextBox runat="server" ID="txtFecGeneraA" CssClass="estandar-control Fecha Centro" Width="90px" ></asp:TextBox>
                        </div>

                    </div>

                    <div class="clear padding5"></div>

                    <div class="row">
                        <div class="col-md-4">
                            <asp:label runat="server" class="col-md-1 etiqueta-control" Width="100px">Moneda</asp:label>
                            <asp:DropDownList runat="server" ID="ddl_Moneda" CssClass="estandar-control" Width="230px" ></asp:DropDownList>
                        </div>
                        <div class="col-md-4">
                            <asp:label runat="server" class="col-md-1  etiqueta-control" Width="90px">Responsable</asp:label>
                            <asp:TextBox runat="server" ID="txt_ClaveResp" CssClass="NoDisplay"></asp:TextBox>
                            <asp:TextBox runat="server" ID="txt_SearchResp" CssClass="col-md-1 estandar-control" Width="190px"></asp:TextBox>
                            <asp:LinkButton id="btn_SelResponsable" runat="server" class="btn botones boton-chico AgregaResponsable" data-toggle="modal" data-target="#EsperaModal">
                                <span>
                                    <img class="btn-buscar"/>
                                </span>
                            </asp:LinkButton>
                        </div>
                        <div class="col-md-4">
                            <asp:label runat="server" class="col-md-1  etiqueta-control" Width="110px">Tipo Mov.</asp:label>
                            <asp:DropDownList runat="server" ID="ddl_TipoMov" CssClass="estandar-control TipoMov" Width="220px">
                                <asp:ListItem Text="Póliza Nueva" Value="1"></asp:ListItem>
                                <asp:ListItem Text="Renovación" Value="2"></asp:ListItem>
                                <asp:ListItem Text="Endoso A" Value="3"></asp:ListItem>
                                <asp:ListItem Text="Endoso B" Value="4"></asp:ListItem>
                                <asp:ListItem Text="Endoso D" Value="5"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>

                    <div class="clear padding5"></div>

                    <div class="row">
                        <div class="col-md-4">
                            <asp:label runat="server" class="col-md-1 etiqueta-control" Width="100px">Suma Aseg.</asp:label>
                            <asp:TextBox runat="server" ID="txt_SumaAsegDe" CssClass="col-md-1 estandar-control Monto Derecha" Width="90px" ></asp:TextBox>
                            <asp:label runat="server" class="col-md-1 etiqueta-control"  Width="40px">A</asp:label>
                            <asp:TextBox runat="server" ID="txt_SumaAsegA" CssClass="estandar-control Monto Derecha" Width="100px" ></asp:TextBox>
                        </div>

                        <div class="col-md-4">
                            <asp:label runat="server" class="col-md-1 etiqueta-control" Width="90px">Prima</asp:label>
                            <asp:TextBox runat="server" ID="TextBox1" CssClass="col-md-1 estandar-control Monto Derecha" Width="90px" ></asp:TextBox>
                            <asp:label runat="server" class="col-md-1 etiqueta-control" Width="40px">A</asp:label>
                            <asp:TextBox runat="server" ID="TextBox2" CssClass="estandar-control Monto Derecha" Width="100px" ></asp:TextBox>
                        </div>
                        
                        <div class="col-md-4">
                            <asp:label runat="server" class="col-md-1  etiqueta-control" Width="110px">Tipo Coloca.</asp:label>
                            <asp:DropDownList runat="server" ID="ddl_TipoColoca" CssClass="estandar-control TipoColoca" Width="220px">
                                <asp:ListItem Text="En Firme" Value="0"></asp:ListItem>
                                <asp:ListItem Text="Proyecto" Value="1"></asp:ListItem>
                                <asp:ListItem Text="Cancelado" Value="2"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>

            <div class="clear padding5"></div>

            <div class="row">
                <div class="col-md-6">
                    <div class="cuadro-subtitulo">
                        <input type="image" src="../Images/contraer_mini.png" id="coVentana1" class="contraer"  />
                        <input type="image" src="../Images/expander_mini.png"   id="exVentana1" class="expandir"  />
                        Agrupador
                    </div>
                    <div class="panel-subcontenido ventana1">
                            <asp:UpdatePanel runat="server" ID="upAgrupador">
                            <ContentTemplate>
                                    <asp:Panel runat="server" ID="pn_Agrupador" Width="100%" Height="130px" ScrollBars="Both">
                                    <asp:GridView runat="server" ID="gvd_Agrupador" AutoGenerateColumns="false" 
                                                    CssClass="grid-view" HeaderStyle-CssClass="header" AlternatingRowStyle-CssClass="altern"
                                                    GridLines="Horizontal"  ShowHeaderWhenEmpty="true" >
                                        <Columns>
                                            <asp:TemplateField HeaderText="">
                                                <ItemTemplate>
                                                        <asp:HiddenField runat="server" ID="chk_SelAgr" value="false"/>
                                                </ItemTemplate>
                                            </asp:TemplateField >
                                            <asp:TemplateField HeaderText="Clave">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="lbl_ClaveAgr" Text='<%# Eval("Clave") %>' Width="50px"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Descripción">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="lbl_Desc" Text='<%# Eval("Descripcion") %>' Width="410px"></asp:Label>
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
                                    <asp:LinkButton id="btn_AddRamoContable" runat="server" class="btn botones AgregaAgrupadores" data-toggle="modal" data-target="#EsperaModal">
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
                        Ramo
                    </div>
                    <div class="panel-subcontenido ventana2">
                            <asp:UpdatePanel runat="server" ID="up_Producto">
                            <ContentTemplate>
                                    <asp:Panel runat="server" ID="pnl_Producto" Width="100%" Height="130px" ScrollBars="Both">
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
                                                    <asp:Label runat="server" ID="lbl_Desc" Text='<%# Eval("Descripcion") %>' Width="410px"></asp:Label>
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
                                    <asp:LinkButton id="LinkButton1" runat="server" class="btn botones AgregaProducto" data-toggle="modal" data-target="#EsperaModal">
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
                        Intermediario
                    </div>
                    <div class="panel-subcontenido ventana3">
                            <asp:UpdatePanel runat="server" ID="upBroker">
                                <ContentTemplate>
                                    <asp:Panel runat="server" ID="pnlBroker" Width="100%" Height="130px" ScrollBars="Both">
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
                                                            <asp:Label runat="server" ID="lbl_Desc" Text='<%# Eval("Descripcion") %>' Width="410px"></asp:Label>
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
                                            <asp:LinkButton id="btn_AddBroker" runat="server" class="btn botones AgregaBrokers" data-toggle="modal" data-target="#EsperaModal">
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
                        Reasegurador
                    </div>
                    <div class="panel-subcontenido ventana4">
                            <asp:UpdatePanel runat="server" ID="upCompañia">
                                <ContentTemplate>
                                    <asp:Panel runat="server" ID="pnlCompañia" Width="100%" Height="130px" ScrollBars="Both">
                                            <asp:GridView runat="server" ID="gvd_Compañia" AutoGenerateColumns="false" 
                                                            CssClass="grid-view" HeaderStyle-CssClass="header" AlternatingRowStyle-CssClass="altern"
                                                            GridLines="Horizontal"  ShowHeaderWhenEmpty="true">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="" ItemStyle-CssClass="SelCia">
                                                        <ItemTemplate>
                                                            <asp:HiddenField runat="server" ID="chk_SelCia" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Clave" ItemStyle-CssClass="ClaveCia">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" ID="lbl_ClaveCia" Text='<%# Eval("Clave") %>' Width="50px" ></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Descripción" ItemStyle-CssClass="DescripcionCia">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" ID="lbl_Desc" Text='<%# Eval("Descripcion") %>' Width="410px"></asp:Label>
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
                                            <asp:LinkButton id="btn_AddCia" runat="server" class="btn botones AgregaCia" data-toggle="modal" data-target="#EsperaModal">
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
     </div>
      
     <div class="clear padding5"></div>

    <div style="width:100%; text-align:right; border-top-style:inset; border-width:1px; border-color:#003A5D">
        <asp:UpdatePanel runat="server" ID="upBusqueda">
            <ContentTemplate>
                <asp:LinkButton id="btn_Monitor" runat="server" class="btn botones">
                    <span>
                        <img class="btn-monitor"/>
                        Monitor
                    </span>
                </asp:LinkButton>

                <asp:LinkButton id="btn_Actualizar" runat="server" class="btn botones">
                    <span>
                        <img class="btn-refresh"/>
                        Actualiza
                    </span>
                </asp:LinkButton>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>

     <div class="clear padding5"></div>

     <div style="width:1100px; min-width:1100px; overflow-x:hidden">
         <div class="cuadro-titulo panel-encabezado">
            <input type="image" src="../Images/contraer_mini_inv.png" id="coVentana5" class="contraer"  />
            <input type="image" src="../Images/expander_mini_inv.png"   id="exVentana5" class="expandir"  />
            TABLERO DE CONTROL
        </div>
        <div class="panel-contenido ventana5" >
            <asp:UpdatePanel runat="server" ID="upMonitor">
                <ContentTemplate>
                    <asp:Panel runat="server" ID="pnl_Monitor" Width="100%" Height="400px" ScrollBars="Both">
                        <asp:GridView runat="server" ID="gvd_Monitor" AutoGenerateColumns="false" 
                                      CssClass="grid-view" HeaderStyle-CssClass="header" AlternatingRowStyle-CssClass="altern"
                                      GridLines="Horizontal"  ShowHeaderWhenEmpty="true">
                            <Columns>
                                <asp:TemplateField HeaderText="Folio">
                                    <ItemTemplate>
                                        <asp:linkbutton runat="server" ID="lnk_Folio" Text='<%# Eval("Folio") %>' CssClass="Folio" Width="50px" ></asp:linkbutton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Recibido">
                                    <ItemTemplate>
                                        <asp:label runat="server" ID="lbl_Recibido" Text='<%# Eval("FecRecibido") %>' Width="70px" ></asp:label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Responsable">
                                    <ItemTemplate>
                                        <asp:label runat="server" ID="lbl_Responsable" Text='<%# Eval("Responsable") %>' Width="100px" ></asp:label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Oficina">
                                    <ItemTemplate>
                                        <asp:label runat="server" ID="lbl_Oficina" Text='<%# Eval("Oficina") %>' Width="100px" ></asp:label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Suscriptor">
                                    <ItemTemplate>
                                        <asp:label runat="server" ID="lbl_Suscriptor" Text='<%# Eval("Suscriptor") %>' Width="100px" ></asp:label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Asegurado">
                                    <ItemTemplate>
                                        <asp:label runat="server" ID="lbl_Asegurado" Text='<%# Eval("Asegurado") %>' Width="150px" ></asp:label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Giro">
                                    <ItemTemplate>
                                        <asp:label runat="server" ID="lbl_Giro" Text='<%# Eval("Giro") %>' Width="150px" ></asp:label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Agrupador">
                                    <ItemTemplate>
                                        <asp:label runat="server" ID="lbl_Agrupador" Text='<%# Eval("Agrupador") %>' Width="100px" ></asp:label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Ramo">
                                    <ItemTemplate>
                                        <asp:label runat="server" ID="lbl_Ramo" Text='<%# Eval("Ramo") %>' Width="100px" ></asp:label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Tipo Mov">
                                    <ItemTemplate>
                                        <asp:label runat="server" ID="lbl_TipoMov" Text='<%# Eval("Tipo_Mov") %>' Width="100px" ></asp:label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Intermediario">
                                    <ItemTemplate>
                                        <asp:label runat="server" ID="lbl_Intermediario" Text='<%# Eval("Intermediario") %>' Width="100px" ></asp:label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Moneda">
                                    <ItemTemplate>
                                        <asp:label runat="server" ID="lbl_Moneda" Text='<%# Eval("Moneda") %>' Width="80px" ></asp:label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Suma Aseg">
                                    <ItemTemplate>
                                        <asp:label runat="server" ID="lbl_SumaAseg" Text='<%# Eval("SumaAseg") %>' Width="80px" ></asp:label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Prima">
                                    <ItemTemplate>
                                        <asp:label runat="server" ID="lbl_Prima" Text='<%# Eval("Prima") %>' Width="80px" ></asp:label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </asp:Panel>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>
    



