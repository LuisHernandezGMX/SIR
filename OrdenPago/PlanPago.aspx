<%@ Page Title="" Language="VB" MasterPageFile="~/Pages/SiteMaster.master" AutoEventWireup="false" CodeFile="PlanPago.aspx.vb" Inherits="OrdenPago_PlanPago" %>
<%@ MasterType VirtualPath="~/Pages/SiteMaster.master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="cph_principal" Runat="Server">
    <asp:HiddenField runat="server" ID="hid_Ventanas" Value="0|1|0|0|" />

    <div class="zona-principal" style="overflow-x:hidden;overflow-y:hidden">
            <script src="../Scripts/Facultativos.js"></script>
            <div class="cuadro-titulo panel-encabezado">
                <input type="image" src="../Images/contraer_mini_inv.png" id="coVentana0" class="contraer"  />
                <input type="image" src="../Images/expander_mini_inv.png"   id="exVentana0" class="expandir"  />
                <strong>Filtro Facultativos / Pólizas</strong>
            </div>
            <div class="panel-contenido ventana0" >

                <asp:UpdatePanel runat="server" ID="upFechas">
                    <ContentTemplate>
                        <div class="row">
                            <div class="col-md-6">
                                <asp:label runat="server" class="col-md-1 etiqueta-control" Width="30%">Fecha de Garantia</asp:label>
                                <asp:TextBox runat="server" ID="txt_FecGarIni" CssClass="col-md-1 estandar-control Tablero Fecha Centro" Width="30%" ></asp:TextBox>
                                <asp:label runat="server" class="col-md-1 etiqueta-control">A</asp:label>
                                <asp:TextBox runat="server" ID="txt_FecGarFin" CssClass="estandar-control Tablero Fecha Centro" Width="30%" ></asp:TextBox>
                            </div> 
                            <div class="col-md-6">
                                <asp:label runat="server" class="col-md-1  etiqueta-control" Width="16%">Asegurado</asp:label>
                                <asp:TextBox runat="server" ID="txt_ClaveAseg" CssClass="NoDisplay"></asp:TextBox>
                                <asp:TextBox runat="server" ID="txt_SearchAse" CssClass="col-md-1 estandar-control Tablero Seleccion" PlaceHolder="Nombre" Width="80%"></asp:TextBox> 
                                <asp:ImageButton runat="server" ID="btn_buscaPol" ImageUrl="~/Images/buscar_mini_inv.png" Height="17" Width="17" />    
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>

                <div class="clear padding5"></div>

                <div class="row">
                    <div class="col-md-6">
                        <div class="cuadro-subtitulo">
                            Facultativos
                        </div>
                        <div class="panel-subcontenido">
                            <asp:UpdatePanel runat="server" ID="upContrato">
                                <ContentTemplate>
                                    <asp:Panel runat="server" ID="pnlContrato" Width="100%" Height="130px" ScrollBars="Both">
                                        <asp:GridView runat="server" ID="gvd_Contrato" AutoGenerateColumns="false"  
                                                      CssClass="grid-view" HeaderStyle-CssClass="header" AlternatingRowStyle-CssClass="altern"
                                                      GridLines="Horizontal"  ShowHeaderWhenEmpty="true" >
                                            <Columns>
                                                <asp:TemplateField HeaderText="">
                                                    <ItemTemplate>
                                                        <asp:HiddenField runat="server" ID="chk_SelFac" Value='<%# Eval("sn_Delete") %>' />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Clave">
                                                    <ItemTemplate>
                                                        <asp:Textbox runat="server" ID="txt_ClaveFac" Text='<%# Eval("Clave") %>' CssClass="estandar-control Centro Tablero Id_Contrato"  Width="100px"></asp:Textbox>
                                                        <asp:Label runat="server" ID="lbl_ClaveFac" CssClass="NoDisplay" Text='<%# Eval("Clave") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Descripción" ItemStyle-CssClass="DescripcionCia">
                                                    <ItemTemplate>
                                                        <asp:Textbox runat="server" ID="txt_Desc" CssClass="estandar-control Tablero Contrato" Enabled="false"  Text='<%# Eval("Descripcion") %>' Width="300px"></asp:Textbox>
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
                                        <asp:LinkButton id="btn_AddFac" runat="server" class="btn botones">
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
                            Pólizas
                        </div>
                        <div class="panel-subcontenido">
                                <asp:UpdatePanel runat="server" ID="upPoliza">
                                    <ContentTemplate>
                                        <asp:HiddenField runat="server" ID="hid_HTML" Value="" />
                                        <div class="clear padding5"></div>

                                        <asp:Panel runat="server" ID="pnlPoliza" Width="100%" Height="130px" ScrollBars="Both">
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
                                                                <asp:Label runat="server" ID="lbl_ClavePol" CssClass="Tablero" Text='<%# Eval("Clave") %>' Width="100px"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Grupo Endoso">
                                                            <ItemTemplate>
                                                                <asp:label runat="server" ID="lbl_DescripcionPol" CssClass="Tablero" Enabled="false" Text='<%# Eval("Descripcion")   %>' Width="310px"></asp:label>
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
                </div>
            </div>


            <div class="clear padding5"></div>

            <div class="cuadro-titulo panel-encabezado">
                <input type="image" src="../Images/contraer_mini_inv.png" id="coVentana1" class="contraer"  />
                <input type="image" src="../Images/expander_mini_inv.png"   id="exVentana1" class="expandir"  />
                Filtro Broker / Compañia
            </div>

            <div class="panel-contenido ventana1">
                <div class="row">
                    <div class="col-md-6">
                        <div class="cuadro-subtitulo">
                            Broker
                        </div>
                        <div class="panel-subcontenido">
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
                                                                <asp:Label runat="server" ID="lbl_ClaveBro" CssClass="Tablero" Text='<%# Eval("Clave") %>' Width="50px"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Descripción">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" ID="lbl_Desc" CssClass="Tablero" Text='<%# Eval("Descripcion") %>' Width="360px"></asp:Label>
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

                    <div class="col-md-6">
                        <div class="cuadro-subtitulo">
                            Compañia
                        </div>
                        <div class="panel-subcontenido">
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
                                                            <asp:Label runat="server" ID="lbl_ClaveCia" CssClass="Tablero" Text='<%# Eval("Clave") %>' Width="50px" ></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Descripción"  ItemStyle-CssClass="DescripcionCia">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" ID="lbl_Desc" CssClass="Tablero" Text='<%# Eval("Descripcion") %>' Width="360px"></asp:Label>
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













            <div class="clear padding5"></div>


            <div style="width:100%; text-align:right; border-top-style:inset; border-width:1px; border-color:#003A5D">
                <asp:UpdatePanel runat="server" ID="upBusqueda">
                    <ContentTemplate>
                        <asp:LinkButton id="btn_Busqueda" runat="server" class="btn botones">
                            <span>
                                <img class="btn-buscar"/>
                                Garantias
                            </span>
                        </asp:LinkButton>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>

            <div class="clear padding5"></div>

            <div class="cuadro-titulo panel-encabezado">
                <input type="image" src="../Images/contraer_mini_inv.png" id="coVentana2" class="contraer"  />
                <input type="image" src="../Images/expander_mini_inv.png"   id="exVentana2" class="expandir"  />
                <strong>Listado de Pólizas</strong>
            </div>
            <div class="panel-contenido ventana2" >
                <asp:UpdatePanel runat="server" ID="upListaPolizas">
                    <ContentTemplate>

                        <asp:HiddenField runat="server" ID="hid_IndicePol" Value="-1" />
                        <asp:Panel runat="server" ID="pnl_ListaPolizas" Width="100%" Height="330px" ScrollBars="Vertical">
                            <asp:GridView runat="server" ID="gvd_ListaPolizas" AutoGenerateColumns="false" 
                                            CssClass="grid-view" HeaderStyle-CssClass="header" AlternatingRowStyle-CssClass="altern" AllowPaging ="true" PageSize="12"
                                            GridLines="Horizontal"  ShowHeaderWhenEmpty="true" DataKeyNames="id_pv,sn_plan" >
                                <Columns>
                                    <asp:TemplateField HeaderText="" HeaderStyle-CssClass="Centro" ItemStyle-CssClass="Centrado">
                                        <ItemTemplate>
                                            <asp:CheckBox runat="server" ID="chk_Sel" Checked='<%# Eval("sn_sel") %>' AutoPostBack="true" OnCheckedChanged="chk_Sel_CheckedChanged" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Sucusal" HeaderStyle-CssClass="Centro">
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="txt_Sucursal" Text='<%# Eval("sucursal") %>' Font-Bold="true" Enabled="false" CssClass="estandar-control Tablero" Width="120px"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Ramo" HeaderStyle-CssClass="Centro">
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="txt_Ramo" Text='<%# Eval("ramo") %>' Font-Bold="true" Enabled="false" CssClass="estandar-control Tablero" Width="150px"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Nro. Pol." HeaderStyle-CssClass="Centro">
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="txt_NroPoliza" Text='<%# Eval("nro_pol") %>' Font-Bold="true" Enabled="false" CssClass="estandar-control Tablero Centro" Width="50px"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Sufijo" HeaderStyle-CssClass="Centro">
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="txt_Sufijo" Text='<%# Eval("aaaa_endoso") %>' Font-Bold="true" Enabled="false" CssClass="estandar-control Tablero Centro" Width="50px"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Endoso" HeaderStyle-CssClass="Centro">
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="txt_Endoso" Text='<%# Eval("nro_endoso") %>' Font-Bold="true" Enabled="false" CssClass="estandar-control Tablero Centro" Width="50px"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Asegurado">
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="txt_Asegurado" Text='<%# Eval("asegurado") %>' Enabled="false" CssClass="estandar-control Tablero" Width="300px"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Grupo Endoso">
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="txt_GrupoEnd" Text='<%# Eval("grupo_endoso") %>' Enabled="false" CssClass="estandar-control Tablero" Width="100px"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Tipo Endoso">
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="txt_TipoEnd" Text='<%# Eval("tipo_endoso") %>' Enabled="false" CssClass="estandar-control Tablero" Width="100px"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Fecha Emisión" HeaderStyle-CssClass="Centro">
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="txt_FechaEmi" Text='<%# Eval("fec_emi") %>' Enabled="false" CssClass="estandar-control Tablero Fecha Centro" Width="85px"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Inicio Vig." HeaderStyle-CssClass="Centro">
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="txt_FechaIV" Text='<%# Eval("fec_vig_desde") %>' Enabled="false" CssClass="estandar-control Tablero Fecha Centro" Width="85px"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Fin Vig." HeaderStyle-CssClass="Centro">
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="txt_FechaFV" Text='<%# Eval("fec_vig_hasta") %>' Enabled="false" CssClass="estandar-control Tablero Fecha Centro" Width="85px"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Prima Neta" HeaderStyle-CssClass="Centro">
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="txt_PrimaNeta" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("prima_neta")))%>' CssClass="estandar-control Tablero Monto" Enabled="false" Width="100px"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Comisiones" HeaderStyle-CssClass="Centro">
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="txt_Comisiones" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("comisiones")))%>' CssClass="estandar-control Tablero Monto" Enabled="false" Width="100px"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Prima Neta Reas." HeaderStyle-CssClass="Centro">
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="txt_PNR" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("prima_neta_reaseguro")))%>' CssClass="estandar-control Tablero Monto" Enabled="false" Width="100px"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <PagerStyle CssClass="pager" />
                                <PagerSettings Mode="NumericFirstLast" FirstPageText="Primero" LastPageText="Ultimo" />
                            </asp:GridView>
                        </asp:Panel>

                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>

            <div class="clear padding5"></div>

            <div class="cuadro-titulo panel-encabezado">
                <input type="image" src="../Images/contraer_mini_inv.png" id="coVentana3" class="contraer"  />
                <input type="image" src="../Images/expander_mini_inv.png"   id="exVentana3" class="expandir"  />
                <strong>Detalle de Garantías</strong>
            </div>
            <div class="panel-contenido ventana3" >
                <asp:UpdatePanel runat="server" ID="upListaGarantias">
                    <ContentTemplate>
                        <asp:HiddenField runat="server" ID="hid_Filtro" Value="0" />
                        <asp:HiddenField runat="server" ID="hid_OrdenFiltrado" Value="-1" />
                        <asp:HiddenField runat="server" ID="hid_Poliza" Value="" />
                        <asp:HiddenField runat="server" ID="hid_Capa" Value="" />
                        <asp:HiddenField runat="server" ID="hid_RamoContable" Value="" />
                        <asp:HiddenField runat="server" ID="hid_IdContrato" Value="" />
                        <asp:HiddenField runat="server" ID="hid_Broker" Value="" />
                        <asp:HiddenField runat="server" ID="hid_Compañia" Value="" />
                        <asp:HiddenField runat="server" ID="hid_Cuota" Value="" />
                        <asp:HiddenField runat="server" ID="hid_Fecha" Value="" />
                        <asp:HiddenField runat="server" ID="hid_CuotaPro" Value="" />
                        <asp:HiddenField runat="server" ID="hid_FechaPro" Value="" />
                        <asp:HiddenField runat="server" ID="hid_Prima" Value="" />
                        <asp:Panel runat="server" ID="pnlListaGarantias" Width="100%" ScrollBars="Vertical">
                            <asp:GridView runat="server" ID="gvd_ListaGarantias" AutoGenerateColumns="false" AllowPaging ="true" PageSize="50"
                                            CssClass="grid-view" HeaderStyle-CssClass="header" AlternatingRowStyle-CssClass="altern"
                                            GridLines="Horizontal"  ShowHeaderWhenEmpty="true" DataKeyNames="id_pv,nro_layer,cod_ramo_contable,id_contrato,cod_cia_reas_brok,cod_cia_reas_cia,nro_cuota,fecha,fecha_pro,Prima,Comision" >
                                <Columns>
                                    <asp:TemplateField HeaderText="" HeaderStyle-CssClass="Centro" ItemStyle-CssClass="Centrado">
                                        <HeaderTemplate>
                                            <asp:CheckBox runat="server" ID="chk_SelAll" Width="20px" onclick="fn_SeleccionTodos('gvd_ListaGarantias', this, 'chk_Sel')" /> 
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox runat="server" ID="chk_Sel" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Poliza" HeaderStyle-CssClass="Centro">
                                        <HeaderTemplate>
                                            <div style="width:100px;text-align:center;">
                                                <asp:label runat="server" Text="Póliza"></asp:label>
                                                <asp:ImageButton runat="server" ID="btn_Poliza" AlternateText="poliza|Poliza|0" OnClick="DespliegaFiltro" CssClass="btn-filtro"/>
                                            </div>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:linkbutton runat="server" ID="lnk_Poliza" Text='<%# Eval("poliza") %>' Font-Bold="true" Enabled="false" CssClass="estandar-control Tablero Centro" Width="100px"></asp:linkbutton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Capa" HeaderStyle-CssClass="Centro">
                                        <HeaderTemplate>
                                            <div style="width:50px;text-align:center;">
                                                <asp:label runat="server" Text="Capa"></asp:label>
                                                <asp:ImageButton runat="server" ID="btn_Capa" AlternateText="nro_layer|Capa|1" OnClick="DespliegaFiltro" CssClass="btn-filtro"/>
                                            </div>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="txt_Capa" Text='<%# Eval("nro_layer") %>' Enabled="false" CssClass="estandar-control Tablero Centro" Width="50px"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Ramo Contable" HeaderStyle-CssClass="Centro">
                                        <HeaderTemplate>
                                            <div style="width:150px;text-align:center;">
                                                <asp:label runat="server" Text="Ramo Contable"></asp:label>
                                                <asp:ImageButton runat="server" ID="btn_RamoContable" AlternateText="ramo_contable|Ramo Contable|2" OnClick="DespliegaFiltro" CssClass="btn-filtro"/>
                                            </div>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="txt_RamoContable" Text='<%# Eval("ramo_contable") %>' Enabled="false" CssClass="estandar-control Tablero" Width="150px"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Id Contrato" HeaderStyle-CssClass="Centro">
                                        <HeaderTemplate>
                                            <div style="width:90px;text-align:center;">
                                                <asp:label runat="server" Text="Id Contrato"></asp:label>
                                                <asp:ImageButton runat="server" ID="btn_IdContrato" AlternateText="id_contrato|Id Contrato|3" OnClick="DespliegaFiltro" CssClass="btn-filtro"/>
                                            </div>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="txt_IdContrato" Text='<%# Eval("id_contrato") %>' Enabled="false" CssClass="estandar-control Tablero Centro" Width="90px"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Broker" HeaderStyle-CssClass="Centro">
                                        <HeaderTemplate>
                                            <div style="width:150px;text-align:center;">
                                                <asp:label runat="server" Text="Broker"></asp:label>
                                                <asp:ImageButton runat="server" ID="btn_Broker" AlternateText="broker|Broker|4" OnClick="DespliegaFiltro" CssClass="btn-filtro"/>
                                            </div>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="txt_Broker" Text='<%# Eval("broker") %>' Enabled="false" CssClass="estandar-control Tablero" Width="200px"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Reasegurador" HeaderStyle-CssClass="Centro">
                                        <HeaderTemplate>
                                            <div style="width:150px;text-align:center;">
                                                <asp:label runat="server" Text="Compañia"></asp:label>
                                                <asp:ImageButton runat="server" ID="btn_Compañia" AlternateText="compañia|Compañia|5" OnClick="DespliegaFiltro" CssClass="btn-filtro"/>
                                            </div>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="txt_Compañia" Text='<%# Eval("compañia") %>' Enabled="false" CssClass="estandar-control Tablero" Width="150px"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Cuota" HeaderStyle-CssClass="Centro">
                                        <HeaderTemplate>
                                            <div style="width:50px;text-align:center;">
                                                <asp:label runat="server" Text="Cuota"></asp:label>
                                                <asp:ImageButton runat="server" ID="btn_Cuota" AlternateText="nro_cuota|Cuota|6" OnClick="DespliegaFiltro" CssClass="btn-filtro"/>
                                            </div>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="txt_Cuota" Text='<%# Eval("nro_cuota") %>' Enabled="false" CssClass="estandar-control Tablero Centro" Width="50px"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Fecha" HeaderStyle-CssClass="Centro">
                                        <HeaderTemplate>
                                            <div style="width:100px;text-align:center;">
                                                <asp:label runat="server" Text="Fecha"></asp:label>
                                                <asp:ImageButton runat="server" ID="btn_Fecha" AlternateText="fecha|Fecha|7" OnClick="DespliegaFiltro" CssClass="btn-filtro"/>
                                            </div>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="txt_FechaOri" Text='<%# Eval("fecha") %>' Enabled="false" CssClass="estandar-control Tablero Fecha Centro" Width="100px"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Pje (%)" HeaderStyle-CssClass="Centro">
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="txt_prc" Text='<%# Eval("pje_importe") %>' Enabled="false" CssClass="estandar-control Tablero Monto" Width="60px"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Cuota Prorroga" HeaderStyle-CssClass="Centro">
                                         <HeaderTemplate>
                                            <div style="width:120px;text-align:center;">
                                                <asp:label runat="server" Text="Cuota Prorroga"></asp:label>
                                                <asp:ImageButton runat="server" ID="btn_CuotaPro" AlternateText="nro_cuota_pro|Cuota Prorroga|8" OnClick="DespliegaFiltro" CssClass="btn-filtro"/>
                                            </div>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="txt_CuotaPro" Text='<%# Eval("nro_cuota_pro") %>' Enabled="false" CssClass="estandar-control Tablero Centro" Width="120px"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Fecha Prorroga" HeaderStyle-CssClass="Centro">
                                        <HeaderTemplate>
                                            <div style="width:100px;text-align:center;">
                                                <asp:label runat="server" Text="Fecha Prorroga"></asp:label>
                                                <asp:ImageButton runat="server" ID="btn_FechaPro" AlternateText="fecha_pro|Fecha Prorroga|9" OnClick="DespliegaFiltro" CssClass="btn-filtro"/>
                                            </div>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="txt_FechaPro" Text='<%# Eval("fecha_pro") %>'  CssClass="estandar-control Tablero Fecha Centro" Width="100px"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="(%) Prorroga" HeaderStyle-CssClass="Centro">
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="txt_prcPro" Text='<%# Eval("pje_importe_pro") %>' CssClass="estandar-control Tablero Monto" Width="100px"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Prima Neta Pagada" HeaderStyle-CssClass="Centro">
                                        <HeaderTemplate>
                                            <div style="width:120px;text-align:center;">
                                                <asp:label runat="server" Text="Prima Neta Pagada"></asp:label>
                                                <asp:ImageButton runat="server" ID="btn_Prima" AlternateText="prima_neta|Prima Neta Pagada|10" OnClick="DespliegaFiltro" CssClass="btn-filtro"/>
                                            </div>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:linkbutton runat="server" ID="lnk_PNR" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("prima_neta")))%>' CssClass="estandar-control Tablero Monto" Enabled="false" Width="120px"></asp:linkbutton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <PagerStyle CssClass="pager" />
                                <PagerSettings Mode="NumericFirstLast" FirstPageText="Primero" LastPageText="Ultimo" />
                            </asp:GridView>
                        </asp:Panel>

                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <div class="clear padding100"></div>
           
            <div id="Filtro" style="width:420px; height:270px"  class="modal-catalogo">
                <asp:UpdatePanel runat="server" ID="upFiltro" >          
                        <ContentTemplate>
                        <div class="cuadro-titulo" style="height:30px">
                            <button type="button" class="close"  data-dismiss="modal">&times;</button>
                            <div class="titulo-modal"><asp:label runat="server" ID="lbl_TituloFiltro">FILTRO</asp:label></div>
                        </div>
        
                            <div style="height:200px;width:420px; overflow-y:scroll;overflow-x:scroll">
                                <asp:CheckBoxList runat="server" CssClass="texto-body" ID="chk_Filtro"></asp:CheckBoxList>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div style="padding-left:10px;">
                                    <asp:LinkButton id="btn_TodosFiltro" runat="server" class="btn botones">
                                        <span>
                                            <img class="btn-todos"/>
                                            Todos
                                        </span>
                                    </asp:LinkButton>
                                    <asp:LinkButton id="btn_NingunoFiltro" runat="server" class="btn botones">
                                        <span>
                                            <img class="btn-ninguno"/>
                                            Ninguno
                                        </span>
                                    </asp:LinkButton>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div style="width:100%; text-align:right; padding-right:10px; ">
                                    <asp:LinkButton id="btn_aceptar_filtro" runat="server" class="btn botones">
                                        <span>
                                            <img class="btn-aceptar"/>
                                            Aceptar
                                        </span>
                                    </asp:LinkButton>

                                    <asp:LinkButton id="btn_cancelar_filtro" runat="server" data-dismiss="modal" class="btn botones">
                                        <span>
                                            <img class="btn-cancelar"/>
                                            Cerrar
                                        </span>
                                    </asp:LinkButton>
                                    </div>
                                </div>
                            </div>
                 
                        </ContentTemplate>
                </asp:UpdatePanel>
            </div>
    </div>
</asp:Content>

