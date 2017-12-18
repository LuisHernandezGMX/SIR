<%@ Page Title="" Language="VB" MasterPageFile="~/Pages/SiteMaster.master" AutoEventWireup="false" CodeFile="BdxFechaDistribucion.aspx.vb" Inherits="Reportes_Bdx_BdxFechaDistribucion" %>


<%@ MasterType VirtualPath="~/Pages/SiteMaster.master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="cph_principal" Runat="Server">
     <script src="../Scripts/FirmasElectronicas.js"></script>

     <asp:HiddenField runat="server" ID="hid_Ventanas" Value="0|1|1|1|1|1|1|1|" />

     <div style="width:1000px; min-width:1000px; overflow-x:hidden">
        <div class="cuadro-titulo panel-encabezado">
            <input type="image" src="../Images/contraer_mini_inv.png" id="coVentana0" class="contraer"  />
            <input type="image" src="../Images/expander_mini_inv.png"   id="exVentana0" class="expandir"  />
            Filtros Generales
        </div>

        <div class="panel-contenido ventana0" >
            <asp:UpdatePanel runat="server" ID="upFiltros">
                <ContentTemplate>
                   <div class="row">
                        
                       <div class="col-md-3">
                            <asp:label runat="server" class="col-md-1 etiqueta-control" Width="100px">* Fecha Distribución</asp:label>
                            <asp:TextBox runat="server" ID="txtFecGeneraDe" CssClass="estandar-control Fecha Centro" Width="110px" ></asp:TextBox>
                        </div>
                        <div class="col-sm-1">
                            <asp:label runat="server" class="etiqueta-control" Width="100px">A</asp:label>
                        </div>
                        <div class="col-md-2">
                            <asp:TextBox runat="server" ID="txtFecGeneraA" CssClass="estandar-control Fecha Centro" Width="110px" ></asp:TextBox>
                        </div>

                         <div class="col-md-4">
                            <asp:label runat="server" class="col-md-1 etiqueta-control" Width="100px">Tipo Contrato</asp:label>
                            <asp:DropDownList runat="server" ID="ddl_TipoContrato" CssClass="estandar-control" Width="200px" ></asp:DropDownList>
                        </div>
                        <div class="col-md-2">
                            <asp:DropDownList runat="server" ID="ddl_Agrupado" CssClass="estandar-control" Width="130px" >
                                <asp:ListItem Text="Agrupado" Value="1"></asp:ListItem>
                                <asp:ListItem Text="No Agrupado" Value="0"></asp:ListItem>
                            </asp:DropDownList>
                        </div>

  
                    </div>
                    <div class="clear padding10"></div>
                    <div class="row">
                        <div class="col-md-3">
                                <asp:Label runat="server" class="col-md-1 etiqueta-control" Width="85px">* Tipo de Reporte: </asp:Label>
                                <asp:DropDownList runat="server" ID="ddl_tiporeporte" CssClass="estandar-control" Width="130px" AutoPostBack="true">
                                    <asp:ListItem Value="9" Text=". . ."></asp:ListItem>
                                    <asp:ListItem Value ="0" Text="Estimaciones"></asp:ListItem>
                                    <asp:ListItem Value="1" Text ="Pagos"></asp:ListItem>
                                    <asp:ListItem Value="2" Text="Completo"></asp:ListItem>
                                </asp:DropDownList>
                              <div class="clear padding10"></div>
                                
                        </div>
                        <div class="col-sm-1">
                            <asp:label runat="server" class="etiqueta-control" Width="100px">Siniestro:</asp:label>
                        </div>
                        <div class="col-md-2">
                            <asp:TextBox runat="server" ID="txt_Siniestros" CssClass="estandar-control" Width="110px" placeholder="ejem: 201208107,201208103" ></asp:TextBox>
                        </div>
                      
                        <div class="col-md-3">
                            <asp:label runat="server" class="col-md-1 etiqueta-control" Width="85px">Asegurado</asp:label>
                            <asp:HiddenField runat="server" ID="hidClaveAse" Value="" />
                            <asp:textbox runat="server" ID="txtSearchAse" CssClass="estandar-control" Width="130px" ></asp:textbox>
                        </div>
                        <div class="col-md-3">
                            <asp:label runat="server" class="col-md-1 etiqueta-control" Width="85px">Evento Cat</asp:label>
                            <asp:HiddenField runat="server" ID="hidClaveEve" Value="" />
                            <asp:textbox runat="server" ID="txtSearchEve" CssClass="estandar-control" Width="130px" ></asp:textbox>
                        </div>

                    </div>
                    

                     <div class="row">
                        <div class="col-md-6">
                            <div class="cuadro-subtitulo">
                                <input type="image" src="../Images/contraer_mini.png" id="coVentana1" class="contraer"  />
                                <input type="image" src="../Images/expander_mini.png"   id="exVentana1" class="expandir"  />
                                Broker
                            </div>
                            <div class="panel-subcontenido ventana1">
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

                            <div class="col-md-6">
                                <div class="cuadro-subtitulo">
                                    <input type="image" src="../Images/contraer_mini.png" id="coVentana2" class="contraer"  />
                                    <input type="image" src="../Images/expander_mini.png"   id="exVentana2" class="expandir"  />
                                    Reasegurador
                                </div>
                                <div class="panel-subcontenido ventana2">
                                        <asp:UpdatePanel runat="server" ID="upCompañia">
                                            <ContentTemplate>
                                                <asp:Panel runat="server" ID="pnlCompañia" Width="100%" Height="100px" ScrollBars="Both">
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

                  <div class="clear padding5"></div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="cuadro-subtitulo">
                                <input type="image" src="../Images/contraer_mini.png" id="coVentana3" class="contraer"  />
                                <input type="image" src="../Images/expander_mini.png"   id="exVentana3" class="expandir"  />
                                Póliza
                            </div>
                            <div class="panel-subcontenido ventana3">
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
                                <input type="image" src="../Images/contraer_mini.png" id="coVentana4" class="contraer"  />
                                <input type="image" src="../Images/expander_mini.png"   id="exVentana4" class="expandir"  />
                                Ramo Contable
                            </div>
                            <div class="panel-subcontenido ventana4">
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
                    </div>

    <div class="clear padding10"></div>
       <div class="cuadro-titulo panel-encabezado">
            <input type="image" src="../Images/contraer_mini_inv.png" id="coVentana7" class="contraer"  />
            <input type="image" src="../Images/expander_mini_inv.png"   id="exVentana7" class="expandir"  />
            Filtros Contratos
        </div>

        <div class="panel-contenido ventana7" >
                <asp:UpdatePanel runat="server" ID="UpdatePanel1">
                    <ContentTemplate>
                        <div class="row">
                            <div class="col-md-6">
                                <asp:Label runat="server" class="col-md-1 etiqueta-control" Width="150px">Escriba el Contrato: </asp:Label>
                                <asp:TextBox runat="server" ID="txt_Contrato" CssClass="estandar-control" Width="110px" ></asp:TextBox>
                            </div>
                        </div>
                        <div class="clear padding5"></div>

                       <div class="row">
                           <div class="clear padding5"></div>
                           <div class="col-md-3">
                                <asp:label runat="server" class="col-md-1 etiqueta-control" Width="100px">* Inicio Vig.</asp:label>
                                <asp:TextBox runat="server" ID="txtFecIni" CssClass="estandar-control Fecha Centro" Width="110px" ></asp:TextBox>
                            </div>
                            <div class="col-sm-1">
                                <asp:label runat="server" class="etiqueta-control" Width="100px">* Fin Vig.</asp:label>
                            </div>
                            <div class="col-md-2">
                                <asp:TextBox runat="server" ID="txtFecFin" CssClass="estandar-control Fecha Centro" Width="110px" ></asp:TextBox>
                            </div>

                             <div class="col-md-4">
                                <asp:label runat="server" class="col-md-1 etiqueta-control" Width="100px">* Ejercicio:</asp:label>
                                <asp:DropDownList runat="server" ID="ddlEjercicio" CssClass="estandar-control" Width="200px" OnSelectedIndexChanged="ddlEjercicio_SelectedIndexChanged" AutoPostBack="true">
                                    <asp:ListItem Value="2000" Text="2000" ></asp:ListItem>
                                    <asp:ListItem Value="2001" Text="2001" ></asp:ListItem>
                                    <asp:ListItem Value="2002" Text="2002" ></asp:ListItem>
                                    <asp:ListItem Value="2003" Text="2003" ></asp:ListItem>
                                    <asp:ListItem Value="2004" Text="2004" ></asp:ListItem>
                                    <asp:ListItem Value="2005" Text="2005" ></asp:ListItem>
                                    <asp:ListItem Value="2006" Text="2006" ></asp:ListItem>
                                    <asp:ListItem Value="2007" Text="2007" ></asp:ListItem>
                                    <asp:ListItem Value="2008" Text="2008" ></asp:ListItem>
                                    <asp:ListItem Value="2009" Text="2009" ></asp:ListItem>
                                    <asp:ListItem Value="2010" Text="2010" ></asp:ListItem>
                                    <asp:ListItem Value="2011" Text="2011" ></asp:ListItem>
                                    <asp:ListItem Value="2012" Text="2012" ></asp:ListItem>
                                    <asp:ListItem Value="2013" Text="2013" ></asp:ListItem>
                                    <asp:ListItem Value="2014" Text="2014" ></asp:ListItem>
                                    <asp:ListItem Value="2015" Text="2015" ></asp:ListItem>
                                    <asp:ListItem Value="2016" Text="2016" ></asp:ListItem>
                                    <asp:ListItem Value="2017" Text="2017" Selected="True"></asp:ListItem>
                                    <asp:ListItem Value="2018" Text="2018" ></asp:ListItem>

                                </asp:DropDownList>
                                 <asp:hiddenfield runat="server" ID="hidEjercicio" Value="false" ></asp:hiddenfield>
                            </div>
                    
                        </div> 
                    </ContentTemplate>
                </asp:UpdatePanel>


                    <div class="clear padding5"></div>
                     <div class="row">
                        <div class="col-md-6">
                            <div class="cuadro-subtitulo">
                                <input type="image" src="../Images/contraer_mini.png" id="coVentana5" class="contraer"  />
                                <input type="image" src="../Images/expander_mini.png"   id="exVentana5" class="expandir"  />
                                Contrato
                            </div>
                            <div class="panel-subcontenido ventana5">
                                    <asp:UpdatePanel runat="server" ID="updPanelContrato">
                                        <ContentTemplate>
                                            <asp:Panel runat="server" ID="pnlContrato" Width="100%" Height="100px" ScrollBars="Both">
                                                    <asp:GridView runat="server" ID="gvdContrato" AutoGenerateColumns="false" 
                                                                    CssClass="grid-view" HeaderStyle-CssClass="header" AlternatingRowStyle-CssClass="altern"
                                                                    GridLines="Horizontal"  ShowHeaderWhenEmpty="true" >
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="">
                                                                <ItemTemplate>
                                                                        <asp:HiddenField runat="server" ID="chk_SelCto" value="false"/>
                                                                </ItemTemplate>
                                                            </asp:TemplateField >
                                                            <asp:TemplateField HeaderText="Clave">
                                                                <ItemTemplate>
                                                                    <asp:Label runat="server" ID="lbl_ClaveCto" Text='<%# Eval("Clave") %>' Width="50px"></asp:Label>
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
                                                    <asp:LinkButton id="btn_AddCto" runat="server" class="btn botones AgregaContrato" data-toggle="modal" data-target="#EsperaModal">
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
                                    <input type="image" src="../Images/contraer_mini.png" id="coVentana6" class="contraer"  />
                                    <input type="image" src="../Images/expander_mini.png"   id="exVentana6" class="expandir"  />
                                    Contrato Local
                                </div>
                                <div class="panel-subcontenido ventana6">
                                        <asp:UpdatePanel runat="server" ID="updPnlCtoLocal">
                                            <ContentTemplate>
                                                <asp:Panel runat="server" ID="pnlCtoLocal" Width="100%" Height="100px" ScrollBars="Both">
                                                        <asp:GridView runat="server" ID="gvdCtoLocal" AutoGenerateColumns="false" 
                                                                        CssClass="grid-view" HeaderStyle-CssClass="header" AlternatingRowStyle-CssClass="altern"
                                                                        GridLines="Horizontal"  ShowHeaderWhenEmpty="true">
                                                            <Columns>
                                                                <asp:TemplateField HeaderText="" ItemStyle-CssClass="SelCia">
                                                                    <ItemTemplate>
                                                                        <asp:HiddenField runat="server" ID="chk_SelCtoL" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Clave" ItemStyle-CssClass="ClaveCia">
                                                                    <ItemTemplate>
                                                                        <asp:Label runat="server" ID="lbl_ClaveCtoL" Text='<%# Eval("Clave") %>' Width="50px" ></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Descripción" ItemStyle-CssClass="DescripcionCia">
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
                                                        <asp:LinkButton id="btn_AddCtoL" runat="server" class="btn botones AgregaCtoL" data-toggle="modal" data-target="#EsperaModal">
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


                    <div class="clear padding10"></div>


                </ContentTemplate>
            </asp:UpdatePanel>
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
  

    <div class="clear padding100"></div> 

</asp:Content>

