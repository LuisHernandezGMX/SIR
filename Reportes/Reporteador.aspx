<%@ Page Title="" Language="VB" MasterPageFile="~/Pages/SiteMaster.master" AutoEventWireup="false" CodeFile="Reporteador.aspx.vb" Inherits="Reportes_Reporteador" %>
<%@ MasterType VirtualPath="~/Pages/SiteMaster.master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="cph_principal" Runat="Server">
    <script src="../Scripts/Reporteador.js"></script>
    <asp:HiddenField runat="server" ID="hid_Ventanas" Value="1|1|1|1|1|1|1|1|1|1|1|1|1|" />
    
    <div style="width:1000px; min-width:1050px; overflow-x:hidden;">
        <div class="cuadro-titulo panel-encabezado">
            Configuración del Reporte
        </div>

        <div class="clear padding5"></div> 

        <div class="row">
            <div class="col-md-6">
                <div id="hid_generales" class="modal-flotante generales NoDisplay"></div>
                <div id="div_generales" class="modal-flotante generales">
                    <asp:UpdatePanel runat="server" ID="upGenerales">
                        <ContentTemplate>
                            <div class="cuadro-subtitulo-flotante">
                                <div class="row">
                                    <div class="col-md-10">
                                        <input type="image" src="../Images/uparrow.png" id="coVentana0" class="contraer"  />
                                        <input type="image" src="../Images/downarrow.png"   id="exVentana0" class="expandir"  />
                                        Campos Generales
                                    </div>
                                    <div class="col-md-2">
                                        <asp:ImageButton runat="server" ID="btn_float0" ImageUrl="../Images/float_mini.png" AlternateText="#div_generales" OnClick="Flotante_Click" />
                                        <asp:ImageButton runat="server" ID="btn_hide0" ImageUrl="../Images/autohide_mini.png" AlternateText="#div_generales" OnClick="Esconde_Click" />
                                    </div>
                                </div>
                            </div>
               

                            <div id="ventana0" class="panel-subcontenido ventana0">
                                <asp:Panel runat="server" ID="pnlGenerales" Width="100%" Height="250px" ScrollBars="Both">
                                    <asp:GridView runat="server" ID="gvd_Generales" AutoGenerateColumns="false" 
                                                  CssClass ="grid-view" HeaderStyle-CssClass="header" AlternatingRowStyle-CssClass="altern"
                                                  GridLines="Horizontal"  ShowHeaderWhenEmpty="true" DataKeyNames="Clave,Descripcion,OcultaCampo1" >
                                            <Columns>
                                                <asp:TemplateField HeaderText="">
                                                    <ItemTemplate>
                                                        <asp:CheckBox runat="server" ID="chk_Sel"/>
                                                    </ItemTemplate>
                                                </asp:TemplateField >
                                                <asp:TemplateField HeaderText="">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_ClaveGen" Text='<%# Eval("Clave") %>' Width="50px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Descripción">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_Desc" Text='<%# Eval("Descripcion") %>' Width="290px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="">
                                                    <HeaderTemplate>
                                                        <asp:Image runat="server" CssClass="btn-filtro" />
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                            <asp:CheckBox runat="server" ID="chk_Filtro" AutoPostBack="true" OnCheckedChanged="FiltraCampo"/>
                                                    </ItemTemplate>
                                                </asp:TemplateField >
                                            </Columns>
                                        </asp:GridView>
                                    </asp:Panel>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <input type="image" src="../Images/select_mini.png" onclick="fn_PreSeleccion('[id$=gvd_Generales]', true, 'chk_Sel')"  />
                                            <input type="image" src="../Images/unselect_mini.png" onclick="fn_PreSeleccion('[id$=gvd_Generales]', false, 'chk_Sel')" />
                                        </div>
                                        <div class="col-md-6">
                                            <div style="width:100%;  text-align:right; padding-right:10px;">
                                                <asp:LinkButton runat="server" class="btn botones boton-chico AgregaGenerales" data-toggle="modal" data-target="#EsperaModal" >
                                                    <span>
                                                        <img class="btn-añadir"/>
                                                    </span>
                                                </asp:LinkButton>

                                                <button id="btn_Generales" class="btn botones boton-chico" onserverclick="QuitaElementos" runat="server">
                                                    <span>
                                                        <img class="btn-quitar"/>
                                                    </span>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                
                <div id="hid_reaseguro" class="modal-flotante reaseguro NoDisplay"></div>
                <div id="div_reaseguro" class="modal-flotante reaseguro">
                    <asp:UpdatePanel runat="server" ID="upReaseguro">
                        <ContentTemplate>
                            <div class="cuadro-subtitulo-flotante">
                                <div class="row">
                                    <div class="col-md-10">
                                        <input type="image" src="../Images/uparrow.png" id="coVentana1" class="contraer"  />
                                        <input type="image" src="../Images/downarrow.png"   id="exVentana1" class="expandir"  />
                                        Campos Reaseguro
                                    </div>
                                    <div class="col-md-2">
                                        <asp:ImageButton runat="server" ID="btn_float1" ImageUrl="../Images/float_mini.png" AlternateText="#div_reaseguro" OnClick="Flotante_Click" />
                                        <asp:ImageButton runat="server" ID="btn_hide1" ImageUrl="../Images/autohide_mini.png" AlternateText="#div_reaseguro" OnClick="Esconde_Click" />
                                    </div>
                                </div>
                            </div>
                
                            <div id="ventana1" class="panel-subcontenido ventana1">
                                <asp:Panel runat="server" ID="pnlReaseguro" Width="100%" Height="250px" ScrollBars="Both">
                                    <asp:GridView runat="server" ID="gvd_Reaseguro" AutoGenerateColumns="false" 
                                                  CssClass ="grid-view" HeaderStyle-CssClass="header" AlternatingRowStyle-CssClass="altern"
                                                  GridLines="Horizontal"  ShowHeaderWhenEmpty="true" DataKeyNames="Clave,Descripcion,OcultaCampo1">
                                            <Columns>
                                                <asp:TemplateField HeaderText="">
                                                    <ItemTemplate>
                                                            <asp:CheckBox runat="server" ID="chk_Sel"/>
                                                    </ItemTemplate>
                                                </asp:TemplateField >
                                                <asp:TemplateField HeaderText="">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_ClaveRea" Text='<%# Eval("Clave") %>' Width="50px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Descripción">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_Desc" Text='<%# Eval("Descripcion") %>' Width="290px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="">
                                                    <HeaderTemplate>
                                                        <asp:Image runat="server" CssClass="btn-filtro" />
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                            <asp:CheckBox runat="server" ID="chk_Filtro" AutoPostBack="true" OnCheckedChanged="FiltraCampo"/>
                                                    </ItemTemplate>
                                                </asp:TemplateField >
                                            </Columns>
                                        </asp:GridView>
                                    </asp:Panel>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <input type="image" src="../Images/select_mini.png" onclick="fn_PreSeleccion('[id$=gvd_Reaseguro]', true, 'chk_Sel')"  />
                                            <input type="image" src="../Images/unselect_mini.png" onclick="fn_PreSeleccion('[id$=gvd_Reaseguro]', false, 'chk_Sel')" />
                                        </div>
                                        <div class="col-md-6">
                                            <div style="width:100%;  text-align:right; padding-right:10px;">
                                                <asp:LinkButton runat="server" class="btn botones boton-chico AgregaReaseguro" data-toggle="modal" data-target="#EsperaModal" >
                                                    <span>
                                                        <img class="btn-añadir"/>
                                                    </span>
                                                </asp:LinkButton>

                                                <button id="btn_Reaseguro" class="btn botones boton-chico" onserverclick="QuitaElementos" runat="server">
                                                    <span>
                                                        <img class="btn-quitar"/>
                                                    </span>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>

                <div id="hid_siniestros" class="modal-flotante siniestros NoDisplay"></div>
                <div id="div_siniestros" class="modal-flotante siniestros">
                    <asp:UpdatePanel runat="server" ID="upSiniestros">
                        <ContentTemplate>
                            <div class="cuadro-subtitulo-flotante">
                                <div class="row">
                                    <div class="col-md-10">
                                        <input type="image" src="../Images/uparrow.png" id="coVentana2" class="contraer"  />
                                        <input type="image" src="../Images/downarrow.png"   id="exVentana2" class="expandir"  />
                                        Campos Siniestros
                                    </div>
                                    <div class="col-md-2">
                                        <asp:ImageButton runat="server" ID="btn_float2" ImageUrl="../Images/float_mini.png" AlternateText="#div_siniestros" OnClick="Flotante_Click" />
                                        <asp:ImageButton runat="server" ID="btn_hide2" ImageUrl="../Images/autohide_mini.png" AlternateText="#div_siniestros" OnClick="Esconde_Click" />
                                    </div>
                                </div>
                            </div>
               

                            <div id="ventana2" class="panel-subcontenido ventana2">
                                <asp:Panel runat="server" ID="pnl_Siniestros" Width="100%" Height="250px" ScrollBars="Both">
                                    <asp:GridView runat="server" ID="gvd_Siniestros" AutoGenerateColumns="false" 
                                                  CssClass ="grid-view" HeaderStyle-CssClass="header" AlternatingRowStyle-CssClass="altern"
                                                  GridLines="Horizontal"  ShowHeaderWhenEmpty="true" DataKeyNames="Clave,Descripcion,OcultaCampo1">
                                            <Columns>
                                                <asp:TemplateField HeaderText="">
                                                    <ItemTemplate>
                                                            <asp:CheckBox runat="server" ID="chk_Sel"/>
                                                    </ItemTemplate>
                                                </asp:TemplateField >
                                                <asp:TemplateField HeaderText="">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_ClaveSin" Text='<%# Eval("Clave") %>' Width="50px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Descripción">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_Desc" Text='<%# Eval("Descripcion") %>' Width="290px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="">
                                                    <HeaderTemplate>
                                                        <asp:Image runat="server" CssClass="btn-filtro" />
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                            <asp:CheckBox runat="server" ID="chk_Filtro" AutoPostBack="true" OnCheckedChanged="FiltraCampo"/>
                                                    </ItemTemplate>
                                                </asp:TemplateField >
                                            </Columns>
                                        </asp:GridView>
                                    </asp:Panel>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <input type="image" src="../Images/select_mini.png" onclick="fn_PreSeleccion('[id$=gvd_Siniestros]', true, 'chk_Sel')"  />
                                            <input type="image" src="../Images/unselect_mini.png" onclick="fn_PreSeleccion('[id$=gvd_Siniestros]', false, 'chk_Sel')" />
                                        </div>
                                        <div class="col-md-6">
                                            <div style="width:100%;  text-align:right; padding-right:10px;">
                                                <asp:LinkButton runat="server" class="btn botones boton-chico AgregaSiniestros" data-toggle="modal" data-target="#EsperaModal" >
                                                    <span>
                                                        <img class="btn-añadir"/>
                                                    </span>
                                                </asp:LinkButton>

                                                <button id="btn_Siniestros" class="btn botones boton-chico" onserverclick="QuitaElementos" runat="server">
                                                    <span>
                                                        <img class="btn-quitar"/>
                                                    </span>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>

                <div id="hid_cumulos" class="modal-flotante cumulos NoDisplay"></div>
                <div id="div_cumulos" class="modal-flotante cumulos">
                    <asp:UpdatePanel runat="server" ID="upCumulos">
                        <ContentTemplate>
                            <div class="cuadro-subtitulo-flotante">
                                <div class="row">
                                    <div class="col-md-10">
                                        <input type="image" src="../Images/uparrow.png" id="coVentana3" class="contraer"  />
                                        <input type="image" src="../Images/downarrow.png"   id="exVentana3" class="expandir"  />
                                        Campos Cúmulos
                                    </div>
                                    <div class="col-md-2">
                                        <asp:ImageButton runat="server" ID="btn_float3" ImageUrl="../Images/float_mini.png" AlternateText="#div_cumulos" OnClick="Flotante_Click" />
                                        <asp:ImageButton runat="server" ID="btn_hide3" ImageUrl="../Images/autohide_mini.png" AlternateText="#div_cumulos" OnClick="Esconde_Click" />
                                    </div>
                                </div>
                            </div>
               

                            <div id="ventana3" class="panel-subcontenido ventana3">
                                <asp:Panel runat="server" ID="pnlCumulos" Width="100%" Height="250px" ScrollBars="Both">
                                    <asp:GridView runat="server" ID="gvd_Cumulos" AutoGenerateColumns="false" 
                                                  CssClass ="grid-view" HeaderStyle-CssClass="header" AlternatingRowStyle-CssClass="altern"
                                                  GridLines="Horizontal"  ShowHeaderWhenEmpty="true" DataKeyNames="Clave,Descripcion,OcultaCampo1">
                                            <Columns>
                                                <asp:TemplateField HeaderText="">
                                                    <ItemTemplate>
                                                            <asp:CheckBox runat="server" ID="chk_Sel"/>
                                                    </ItemTemplate>
                                                </asp:TemplateField >
                                                <asp:TemplateField HeaderText="">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_ClaveCum" Text='<%# Eval("Clave") %>' Width="50px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Descripción">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_Desc" Text='<%# Eval("Descripcion") %>' Width="290px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="">
                                                    <HeaderTemplate>
                                                        <asp:Image runat="server" CssClass="btn-filtro" />
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                            <asp:CheckBox runat="server" ID="chk_Filtro" AutoPostBack="true" OnCheckedChanged="FiltraCampo"/>
                                                    </ItemTemplate>
                                                </asp:TemplateField >
                                            </Columns>
                                        </asp:GridView>
                                    </asp:Panel>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <input type="image" src="../Images/select_mini.png" onclick="fn_PreSeleccion('[id$=gvd_Cumulos]', true, 'chk_Sel')"  />
                                            <input type="image" src="../Images/unselect_mini.png" onclick="fn_PreSeleccion('[id$=gvd_Cumulos]', false, 'chk_Sel')" />
                                        </div>
                                        <div class="col-md-6">
                                            <div style="width:100%;  text-align:right; padding-right:10px;">
                                                <asp:LinkButton runat="server" class="btn botones boton-chico AgregaCumulos" data-toggle="modal" data-target="#EsperaModal" >
                                                    <span>
                                                        <img class="btn-añadir"/>
                                                    </span>
                                                </asp:LinkButton>

                                                <button id="btn_Cumulos" class="btn botones boton-chico" onserverclick="QuitaElementos" runat="server">
                                                    <span>
                                                        <img class="btn-quitar"/>
                                                    </span>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>

                <div id="hid_cobranzas" class="modal-flotante cobranzas NoDisplay"></div>
                <div id="div_cobranzas" class="modal-flotante cobranzas">
                    <asp:UpdatePanel runat="server" ID="upCobranzas">
                        <ContentTemplate>
                            <div class="cuadro-subtitulo-flotante">
                                <div class="row">
                                    <div class="col-md-10">
                                        <input type="image" src="../Images/uparrow.png" id="coVentana4" class="contraer"  />
                                        <input type="image" src="../Images/downarrow.png"   id="exVentana4" class="expandir"  />
                                        Campos Cobranzas
                                    </div>
                                    <div class="col-md-2">
                                        <asp:ImageButton runat="server" ID="btn_float4" ImageUrl="../Images/float_mini.png" AlternateText="#div_cobranzas" OnClick="Flotante_Click" />
                                        <asp:ImageButton runat="server" ID="btn_hide4" ImageUrl="../Images/autohide_mini.png" AlternateText="#div_cobranzas" OnClick="Esconde_Click" />
                                    </div>
                                </div>
                            </div>
               

                            <div id="ventana4" class="panel-subcontenido ventana4">
                                <asp:Panel runat="server" ID="pnlCobranzas" Width="100%" Height="250px" ScrollBars="Both">
                                    <asp:GridView runat="server" ID="gvd_Cobranzas" AutoGenerateColumns="false" 
                                                  CssClass ="grid-view" HeaderStyle-CssClass="header" AlternatingRowStyle-CssClass="altern"
                                                  GridLines="Horizontal"  ShowHeaderWhenEmpty="true" DataKeyNames="Clave,Descripcion,OcultaCampo1">
                                            <Columns>
                                                <asp:TemplateField HeaderText="">
                                                    <ItemTemplate>
                                                            <asp:CheckBox runat="server" ID="chk_Sel"/>
                                                    </ItemTemplate>
                                                </asp:TemplateField >
                                                <asp:TemplateField HeaderText="">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_ClaveCob" Text='<%# Eval("Clave") %>' Width="50px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Descripción">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_Desc" Text='<%# Eval("Descripcion") %>' Width="290px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="">
                                                    <HeaderTemplate>
                                                        <asp:Image runat="server" CssClass="btn-filtro" />
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                            <asp:CheckBox runat="server" ID="chk_Filtro" AutoPostBack="true" OnCheckedChanged="FiltraCampo"/>
                                                    </ItemTemplate>
                                                </asp:TemplateField >
                                            </Columns>
                                        </asp:GridView>
                                    </asp:Panel>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <input type="image" src="../Images/select_mini.png" onclick="fn_PreSeleccion('[id$=gvd_Cobranzas]', true, 'chk_Sel')"  />
                                            <input type="image" src="../Images/unselect_mini.png" onclick="fn_PreSeleccion('[id$=gvd_Cobranzas]', false, 'chk_Sel')" />
                                        </div>
                                        <div class="col-md-6">
                                            <div style="width:100%;  text-align:right; padding-right:10px;">
                                                <asp:LinkButton runat="server" class="btn botones boton-chico AgregaCobranzas" data-toggle="modal" data-target="#EsperaModal" >
                                                    <span>
                                                        <img class="btn-añadir"/>
                                                    </span>
                                                </asp:LinkButton>

                                                <button id="btn_Cobranzas" class="btn botones boton-chico" onserverclick="QuitaElementos" runat="server">
                                                    <span>
                                                        <img class="btn-quitar"/>
                                                    </span>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>

                <div id="hid_contabilidad" class="modal-flotante contabilidad NoDisplay"></div>
                <div id="div_contabilidad" class="modal-flotante contabilidad">
                    <asp:UpdatePanel runat="server" ID="upContabilidad">
                        <ContentTemplate>
                            <div class="cuadro-subtitulo-flotante">
                                <div class="row">
                                    <div class="col-md-10">
                                        <input type="image" src="../Images/uparrow.png" id="coVentana5" class="contraer"  />
                                        <input type="image" src="../Images/downarrow.png"   id="exVentana5" class="expandir"  />
                                        Campos Contabilidad
                                    </div>
                                    <div class="col-md-2">
                                        <asp:ImageButton runat="server" ID="btn_float5" ImageUrl="../Images/float_mini.png" AlternateText="#div_contabilidad" OnClick="Flotante_Click" />
                                        <asp:ImageButton runat="server" ID="btn_hide5" ImageUrl="../Images/autohide_mini.png" AlternateText="#div_contabilidad" OnClick="Esconde_Click" />
                                    </div>
                                </div>
                            </div>
               

                            <div id="ventana5" class="panel-subcontenido ventana5">
                                <asp:Panel runat="server" ID="pnlContabilidad" Width="100%" Height="250px" ScrollBars="Both">
                                    <asp:GridView runat="server" ID="gvd_Contabilidad" AutoGenerateColumns="false" 
                                                  CssClass ="grid-view" HeaderStyle-CssClass="header" AlternatingRowStyle-CssClass="altern"
                                                  GridLines="Horizontal"  ShowHeaderWhenEmpty="true" DataKeyNames="Clave,Descripcion,OcultaCampo1">
                                            <Columns>
                                                <asp:TemplateField HeaderText="">
                                                    <ItemTemplate>
                                                            <asp:CheckBox runat="server" ID="chk_Sel"/>
                                                    </ItemTemplate>
                                                </asp:TemplateField >
                                                <asp:TemplateField HeaderText="">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_ClaveCon"  Text='<%# Eval("Clave") %>' Width="50px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Descripción">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_Desc" Text='<%# Eval("Descripcion") %>' Width="290px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="">
                                                    <HeaderTemplate>
                                                        <asp:Image runat="server" CssClass="btn-filtro" />
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                            <asp:CheckBox runat="server" ID="chk_Filtro" AutoPostBack="true" OnCheckedChanged="FiltraCampo"/>
                                                    </ItemTemplate>
                                                </asp:TemplateField >
                                            </Columns>
                                        </asp:GridView>
                                    </asp:Panel>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <input type="image" src="../Images/select_mini.png" onclick="fn_PreSeleccion('[id$=gvd_Contabilidad]', true, 'chk_Sel')"  />
                                            <input type="image" src="../Images/unselect_mini.png" onclick="fn_PreSeleccion('[id$=gvd_Contabilidad]', false, 'chk_Sel')" />
                                        </div>
                                        <div class="col-md-6">
                                            <div style="width:100%;  text-align:right; padding-right:10px;">
                                                <asp:LinkButton runat="server" class="btn botones boton-chico AgregaContabilidad" data-toggle="modal" data-target="#EsperaModal" >
                                                    <span>
                                                        <img class="btn-añadir"/>
                                                    </span>
                                                </asp:LinkButton>

                                                <button id="btn_Contabilidad" class="btn botones boton-chico" onserverclick="QuitaElementos" runat="server">
                                                    <span>
                                                        <img class="btn-quitar"/>
                                                    </span>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>

            <div id="hid_poliza" class="modal-flotante poliza NoDisplay"></div>
            <div class="col-md-6">
                <div id="div_poliza" class="modal-flotante poliza">
                    <asp:UpdatePanel runat="server" ID="upPoliza">
                        <ContentTemplate>
                            <div class="cuadro-subtitulo-flotante">
                                <div class="row">
                                    <div class="col-md-10">
                                        <input type="image" src="../Images/uparrow.png" id="coVentana6" class="contraer"  />
                                        <input type="image" src="../Images/downarrow.png"   id="exVentana6" class="expandir"  />
                                        Filtro por Póliza
                                    </div>
                                    <div class="col-md-2">
                                        <asp:ImageButton runat="server" ID="btn_float6" ImageUrl="../Images/float_mini.png" AlternateText="#div_poliza" OnClick="Flotante_Click" />
                                        <asp:ImageButton runat="server" ID="btn_hide6" ImageUrl="../Images/autohide_mini.png" AlternateText="#div_poliza" OnClick="Esconde_Click" />
                                    </div>
                                </div>
                            </div>
               

                            <div id="ventana6" class="panel-subcontenido ventana6">
                                <asp:Panel runat="server" ID="pnlPoliza" Width="100%" Height="200px" ScrollBars="Both">
                                    <asp:GridView runat="server" ID="gvd_Poliza" AutoGenerateColumns="false" 
                                                  CssClass ="grid-view" HeaderStyle-CssClass="header" AlternatingRowStyle-CssClass="altern"
                                                  GridLines="Horizontal"  ShowHeaderWhenEmpty="true" >
                                            <Columns>
                                                <asp:TemplateField HeaderText="">
                                                    <ItemTemplate>
                                                            <asp:CheckBox runat="server" ID="chk_Sel"/>
                                                    </ItemTemplate>
                                                </asp:TemplateField >
                                                <asp:TemplateField HeaderText="">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_ClavePol" Text='<%# Eval("Clave") %>' Width="90px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Descripción">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_DescripcionPol" Text='<%# Eval("Descripcion") %>' Width="260px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </asp:Panel>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <input type="image" src="../Images/select_mini.png" onclick="fn_PreSeleccion('[id$=gvd_Poliza]', true, 'chk_Sel')"  />
                                            <input type="image" src="../Images/unselect_mini.png" onclick="fn_PreSeleccion('[id$=gvd_Poliza]', false, 'chk_Sel')" />
                                        </div>
                                        <div class="col-md-6">
                                            <div style="width:100%;  text-align:right; padding-right:10px;">
                                                <button id="btn_AddPol" class="btn botones boton-chico" runat="server">
                                                    <span>
                                                        <img class="btn-añadir"/>
                                                    </span>
                                                </button>
                                                <button id="btn_Poliza" class="btn botones boton-chico" onserverclick="QuitaElementos" runat="server">
                                                    <span>
                                                        <img class="btn-quitar"/>
                                                    </span>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>

                <div id="hid_broker" class="modal-flotante broker NoDisplay"></div>
                <div id="div_broker" class="modal-flotante broker">
                    <asp:UpdatePanel runat="server" ID="upBroker">
                        <ContentTemplate>
                            <div class="cuadro-subtitulo-flotante">
                                <div class="row">
                                    <div class="col-md-10">
                                        <input type="image" src="../Images/uparrow.png" id="coVentana7" class="contraer"  />
                                        <input type="image" src="../Images/downarrow.png"   id="exVentana7" class="expandir"  />
                                        Filtro por Broker
                                    </div>
                                    <div class="col-md-2">
                                        <asp:ImageButton runat="server" ID="btn_float7" ImageUrl="../Images/float_mini.png" AlternateText="#div_broker" OnClick="Flotante_Click" />
                                        <asp:ImageButton runat="server" ID="btn_hide7" ImageUrl="../Images/autohide_mini.png" AlternateText="#div_broker" OnClick="Esconde_Click" />
                                    </div>
                                </div>
                            </div>
               

                            <div id="ventana7" class="panel-subcontenido ventana7">
                                <asp:Panel runat="server" ID="pnlBroker" Width="100%" Height="200px" ScrollBars="Both">
                                    <asp:GridView runat="server" ID="gvd_Broker" AutoGenerateColumns="false" 
                                                  CssClass ="grid-view" HeaderStyle-CssClass="header" AlternatingRowStyle-CssClass="altern"
                                                  GridLines="Horizontal"  ShowHeaderWhenEmpty="true" >
                                            <Columns>
                                                <asp:TemplateField HeaderText="">
                                                    <ItemTemplate>
                                                            <asp:CheckBox runat="server" ID="chk_Sel"/>
                                                    </ItemTemplate>
                                                </asp:TemplateField >
                                                <asp:TemplateField HeaderText="">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_ClaveBro" Text='<%# Eval("Clave") %>' Width="50px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Descripción">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_Desc" Text='<%# Eval("Descripcion") %>' Width="300px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </asp:Panel>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <input type="image" src="../Images/select_mini.png" onclick="fn_PreSeleccion('[id$=gvd_Broker]', true, 'chk_Sel')"  />
                                            <input type="image" src="../Images/unselect_mini.png" onclick="fn_PreSeleccion('[id$=gvd_Broker]', false, 'chk_Sel')" />
                                        </div>
                                        <div class="col-md-6">
                                            <div style="width:100%;  text-align:right; padding-right:10px;">
                                                <asp:LinkButton runat="server" class="btn botones boton-chico AgregaBroker" data-toggle="modal" data-target="#EsperaModal" >
                                                    <span>
                                                        <img class="btn-añadir"/>
                                                    </span>
                                                </asp:LinkButton>

                                                <button id="btn_Broker" class="btn botones boton-chico" onserverclick="QuitaElementos" runat="server">
                                                    <span>
                                                        <img class="btn-quitar"/>
                                                    </span>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>

                <div id="hid_compañia" class="modal-flotante compañia NoDisplay"></div>
                <div id="div_compañia" class="modal-flotante compañia">
                    <asp:UpdatePanel runat="server" ID="upCompañia">
                        <ContentTemplate>
                            <div class="cuadro-subtitulo-flotante">
                                <div class="row">
                                    <div class="col-md-10">
                                        <input type="image" src="../Images/uparrow.png" id="coVentana8" class="contraer"  />
                                        <input type="image" src="../Images/downarrow.png"   id="exVentana8" class="expandir"  />
                                        Filtro por Compañia
                                    </div>
                                    <div class="col-md-2">
                                        <asp:ImageButton runat="server" ID="btn_float8" ImageUrl="../Images/float_mini.png" AlternateText="#div_compañia" OnClick="Flotante_Click" />
                                        <asp:ImageButton runat="server" ID="btn_hide8" ImageUrl="../Images/autohide_mini.png" AlternateText="#div_compañia" OnClick="Esconde_Click" />
                                    </div>
                                </div>
                            </div>
               

                            <div id="ventana8" class="panel-subcontenido ventana8">
                                <asp:Panel runat="server" ID="pnlCompañia" Width="100%" Height="200px" ScrollBars="Both">
                                    <asp:GridView runat="server" ID="gvd_Compañia" AutoGenerateColumns="false" 
                                                  CssClass ="grid-view" HeaderStyle-CssClass="header" AlternatingRowStyle-CssClass="altern"
                                                  GridLines="Horizontal"  ShowHeaderWhenEmpty="true" >
                                            <Columns>
                                                <asp:TemplateField HeaderText="">
                                                    <ItemTemplate>
                                                            <asp:CheckBox runat="server" ID="chk_Sel"/>
                                                    </ItemTemplate>
                                                </asp:TemplateField >
                                                <asp:TemplateField HeaderText="">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_ClaveCia" Text='<%# Eval("Clave") %>' Width="50px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Descripción">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_Desc" Text='<%# Eval("Descripcion") %>' Width="300px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </asp:Panel>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <input type="image" src="../Images/select_mini.png" onclick="fn_PreSeleccion('[id$=gvd_Compañia]', true, 'chk_Sel')"  />
                                            <input type="image" src="../Images/unselect_mini.png" onclick="fn_PreSeleccion('[id$=gvd_Compañia]', false, 'chk_Sel')" />
                                        </div>
                                        <div class="col-md-6">
                                            <div style="width:100%;  text-align:right; padding-right:10px;">
                                                <asp:LinkButton runat="server" class="btn botones boton-chico AgregaCia" data-toggle="modal" data-target="#EsperaModal" >
                                                    <span>
                                                        <img class="btn-añadir"/>
                                                    </span>
                                                </asp:LinkButton>

                                                <button id="btn_Compañia" class="btn botones boton-chico" onserverclick="QuitaElementos" runat="server">
                                                    <span>
                                                        <img class="btn-quitar"/>
                                                    </span>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>

                <div id="hid_ramo_contable" class="modal-flotante ramo_contable NoDisplay"></div>
                <div id="div_ramo_contable" class="modal-flotante ramo_contable">
                    <asp:UpdatePanel runat="server" ID="upRamoContable">
                        <ContentTemplate>
                            <div class="cuadro-subtitulo-flotante">
                                <div class="row">
                                    <div class="col-md-10">
                                        <input type="image" src="../Images/uparrow.png" id="coVentana9" class="contraer"  />
                                        <input type="image" src="../Images/downarrow.png"   id="exVentana9" class="expandir"  />
                                        Filtro por Ramo Contable
                                    </div>
                                    <div class="col-md-2">
                                        <asp:ImageButton runat="server" ID="btn_float9" ImageUrl="../Images/float_mini.png" AlternateText="#div_ramo_contable" OnClick="Flotante_Click" />
                                        <asp:ImageButton runat="server" ID="btn_hide9" ImageUrl="../Images/autohide_mini.png" AlternateText="#div_ramo_contable" OnClick="Esconde_Click" />
                                    </div>
                                </div>
                            </div>
               

                            <div id="ventana9" class="panel-subcontenido ventana9">
                                <asp:Panel runat="server" ID="pnlRamoContable" Width="100%" Height="200px" ScrollBars="Both">
                                    <asp:GridView runat="server" ID="gvd_RamoContable" AutoGenerateColumns="false" 
                                                  CssClass ="grid-view" HeaderStyle-CssClass="header" AlternatingRowStyle-CssClass="altern"
                                                  GridLines="Horizontal"  ShowHeaderWhenEmpty="true" >
                                            <Columns>
                                                <asp:TemplateField HeaderText="">
                                                    <ItemTemplate>
                                                            <asp:CheckBox runat="server" ID="chk_Sel"/>
                                                    </ItemTemplate>
                                                </asp:TemplateField >
                                                <asp:TemplateField HeaderText="">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_ClaveRamC" Text='<%# Eval("Clave") %>' Width="50px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Descripción">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_Desc" Text='<%# Eval("Descripcion") %>' Width="300px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </asp:Panel>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <input type="image" src="../Images/select_mini.png" onclick="fn_PreSeleccion('[id$=gvd_RamoContable]', true, 'chk_Sel')"  />
                                            <input type="image" src="../Images/unselect_mini.png" onclick="fn_PreSeleccion('[id$=gvd_RamoContable]', false, 'chk_Sel')" />
                                        </div>
                                        <div class="col-md-6">
                                            <div style="width:100%;  text-align:right; padding-right:10px;">
                                                <asp:LinkButton runat="server" class="btn botones boton-chico AgregaRamoCont" data-toggle="modal" data-target="#EsperaModal" >
                                                    <span>
                                                        <img class="btn-añadir"/>
                                                    </span>
                                                </asp:LinkButton>

                                                <button id="btn_RamoContable" class="btn botones boton-chico" onserverclick="QuitaElementos" runat="server">
                                                    <span>
                                                        <img class="btn-quitar"/>
                                                    </span>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>

                <div id="hid_producto" class="modal-flotante producto NoDisplay"></div>
                <div id="div_producto" class="modal-flotante producto">
                    <asp:UpdatePanel runat="server" ID="upProducto">
                        <ContentTemplate>
                            <div class="cuadro-subtitulo-flotante">
                                <div class="row">
                                    <div class="col-md-10">
                                        <input type="image" src="../Images/uparrow.png" id="coVentana10" class="contraer"  />
                                        <input type="image" src="../Images/downarrow.png"   id="exVentana10" class="expandir"  />
                                        Filtro por Producto
                                    </div>
                                    <div class="col-md-2">
                                        <asp:ImageButton runat="server" ID="btn_float10" ImageUrl="../Images/float_mini.png" AlternateText="#div_producto" OnClick="Flotante_Click" />
                                        <asp:ImageButton runat="server" ID="btn_hide10" ImageUrl="../Images/autohide_mini.png" AlternateText="#div_producto" OnClick="Esconde_Click" />
                                    </div>
                                </div>
                            </div>
               

                            <div id="ventana10" class="panel-subcontenido ventana10">
                                <asp:Panel runat="server" ID="pnlProducto" Width="100%" Height="200px" ScrollBars="Both">
                                    <asp:GridView runat="server" ID="gvd_Producto" AutoGenerateColumns="false" 
                                                  CssClass ="grid-view" HeaderStyle-CssClass="header" AlternatingRowStyle-CssClass="altern"
                                                  GridLines="Horizontal"  ShowHeaderWhenEmpty="true" >
                                            <Columns>
                                                <asp:TemplateField HeaderText="">
                                                    <ItemTemplate>
                                                            <asp:CheckBox runat="server" ID="chk_Sel"/>
                                                    </ItemTemplate>
                                                </asp:TemplateField >
                                                <asp:TemplateField HeaderText="">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_ClavePro" Text='<%# Eval("Clave") %>' Width="50px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Descripción">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_Desc" Text='<%# Eval("Descripcion") %>' Width="300px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </asp:Panel>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <input type="image" src="../Images/select_mini.png" onclick="fn_PreSeleccion('[id$=gvd_Producto]', true, 'chk_Sel')"  />
                                            <input type="image" src="../Images/unselect_mini.png" onclick="fn_PreSeleccion('[id$=gvd_Producto]', false, 'chk_Sel')" />
                                        </div>
                                        <div class="col-md-6">
                                            <div style="width:100%;  text-align:right; padding-right:10px;">
                                                <asp:LinkButton runat="server" class="btn botones boton-chico AgregaProducto" data-toggle="modal" data-target="#EsperaModal" >
                                                    <span>
                                                        <img class="btn-añadir"/>
                                                    </span>
                                                </asp:LinkButton>

                                                <button id="btn_Producto" class="btn botones boton-chico" onserverclick="QuitaElementos" runat="server">
                                                    <span>
                                                        <img class="btn-quitar"/>
                                                    </span>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>

                <div id="hid_adicionales" class="modal-flotante adicionales NoDisplay"></div>
                <div id="div_adicionales" style="width:600px;" class="modal-flotante adicionales">
                    <asp:UpdatePanel runat="server" ID="upAdicionales">
                        <ContentTemplate>
                            <div class="cuadro-subtitulo-flotante">
                                <div class="row">
                                    <div class="col-md-10">
                                        <input type="image" src="../Images/uparrow.png" id="coVentana11" class="contraer"  />
                                        <input type="image" src="../Images/downarrow.png"   id="exVentana11" class="expandir"  />
                                        Filtros Adicionales
                                    </div>
                                    <div class="col-md-2">
                                        <asp:ImageButton runat="server" ID="btn_float11" ImageUrl="../Images/float_mini.png" AlternateText="#div_adicionales" OnClick="Flotante_Click" />
                                        <asp:ImageButton runat="server" ID="btn_hide11" ImageUrl="../Images/autohide_mini.png" AlternateText="#div_adicionales" OnClick="Esconde_Click" />
                                    </div>
                                </div>
                            </div>
               

                            <div id="ventana11" class="panel-subcontenido ventana11">
                                
                                    <asp:Panel runat="server" ID="pnlAdicionales" Width="100%" Height="200px" ScrollBars="Both">
                                        <asp:GridView runat="server" ID="gvd_Adicionales" AutoGenerateColumns="false" 
                                                      CssClass="grid-view" HeaderStyle-CssClass="header" AlternatingRowStyle-CssClass="altern"
                                                      GridLines="Horizontal"  ShowHeaderWhenEmpty="true" >
                                            <Columns>
                                                <asp:TemplateField HeaderText="">
                                                    <ItemTemplate>
                                                            <asp:CheckBox runat="server" ID="chk_Sel"/>
                                                    </ItemTemplate>
                                                </asp:TemplateField >

                                                <asp:TemplateField HeaderText="">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_Where" CssClass="estandar-control" Width="70px" Text="EN DONDE: " Visible="false" ></asp:Label>
                                                        <asp:DropDownList ID="ddl_Union" CssClass="estandar-control" Width="70px" runat="server"  Visible="true" >
                                                            <asp:ListItem Text="Y" Value="AND" ></asp:ListItem>
                                                            <asp:ListItem Text="O" Value="OR"></asp:ListItem>
                                                        </asp:DropDownList>
                                                        <asp:HiddenField runat="server" ID="hid_Union" Value='<%# Split(Eval("OcultaCampo2"), ";")(0)  %>' />
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_ClaveAdi" Text='<%# Eval("Clave") %>' Width="15px"></asp:Label>
                                                        <asp:HiddenField runat="server" ID="hid_seccion" Value='<%# Eval("OcultaCampo1") %>' />
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Campo">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_Desc" Text='<%# Eval("Descripcion") %>' Width="120px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="">
                                                    <ItemTemplate>
                                                        <asp:DropDownList ID="ddl_Operador" CssClass="estandar-control" Width="115px" runat="server"  >
                                                            <asp:ListItem Text="IGUAL A" Value="="></asp:ListItem>
                                                            <asp:ListItem Text="MENOR A" Value="<"></asp:ListItem>
                                                            <asp:ListItem Text="MAYOR A" Value=">"></asp:ListItem>
                                                            <asp:ListItem Text="MENOR O IGUAL A" Value="<="></asp:ListItem>
                                                            <asp:ListItem Text="MAYOR O IGUAL A" Value=">="></asp:ListItem>
                                                            <asp:ListItem Text="DIFERENTE A" Value="<>"></asp:ListItem>
                                                            <asp:ListItem Text="COMIENCE CON.." Value="LIKE @%"></asp:ListItem>
                                                            <asp:ListItem Text="TERMINE CON..." Value="LIKE %@"></asp:ListItem>
                                                            <asp:ListItem Text="CONTENGA..." Value="LIKE %@%"></asp:ListItem>
                                                            <asp:ListItem Text="NO CONTENGA..." Value="NOT LIKE %@%"></asp:ListItem>
                                                            <asp:ListItem Text="DENTRO DE" Value="IN(@)"></asp:ListItem>
                                                            <asp:ListItem Text="NO DENTRO DE" Value="NOT IN(@)"></asp:ListItem>
                                                        </asp:DropDownList>
                                                        <asp:HiddenField runat="server" ID="hid_Operador" Value='<%# Split(Eval("OcultaCampo2"), ";")(1) %>' />
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Condición">
                                                    <ItemTemplate>
                                                        <table>
                                                            <tr>
                                                                <td>
                                                                    <asp:TextBox CssClass="estandar-control" runat="server" ID="txt_Condicion" Text='<%# Eval("OcultaCampo3") %>' Width="220px"></asp:TextBox>
                                                                </td>
                                                                <td>
                                                                    <asp:LinkButton id="btn_Multiples" CommandName="ValoresMultiples" runat="server" class="btn botones boton-chico ValoresMultiples">
                                                                        <span>
                                                                            <img class="btn-modificar"/>
                                                                        </span>
                                                                    </asp:LinkButton>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </asp:Panel>

                                    <div class="row">
                                        <div class="col-md-6">
                                            <input type="image" src="../Images/select_mini.png" onclick="fn_PreSeleccion('[id$=gvd_Adicionales]', true, 'chk_Sel')"  />
                                            <input type="image" src="../Images/unselect_mini.png" onclick="fn_PreSeleccion('[id$=gvd_Adicionales]', false, 'chk_Sel')" />
                                        </div>
                                        <div class="col-md-6">
                                            <div style="width:100%;  text-align:right; padding-right:10px;">
                                                <asp:LinkButton runat="server" class="btn botones boton-chico AgregaAdicional" data-toggle="modal" data-target="#EsperaModal" >
                                                    <span>
                                                        <img class="btn-añadir"/>
                                                    </span>
                                                </asp:LinkButton>

                                                <button id="btn_Adicionales" class="btn botones boton-chico" onserverclick="QuitaElementos" runat="server">
                                                    <span>
                                                        <img class="btn-quitar"/>
                                                    </span>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
    </div>

    <div id="Multivalores" style="width:300px; height:350px"  class="modal-catalogo">
        <asp:UpdatePanel runat="server" ID="upMultivalores" >
            <ContentTemplate>
                <div class="cuadro-titulo" style="height:30px">
                    <button type="button" class="close"  data-dismiss="modal">&times;</button>
                    <div class="titulo-modal"><label>Valores Multiples</label></div>
                </div>

                <div class="modal-body" style="height:308px">
                    <asp:HiddenField runat="server" ID="hid_RowCondicion" Value="-1" />
                    <asp:HiddenField runat="server" ID="hid_Todos" Value="0" />
                             
                    <div style="height:220px; overflow-y:scroll; overflow-x:hidden;">
                        <asp:GridView runat="server" ID="gvd_Multiples" ShowHeader="false" AutoGenerateColumns="false" 
                                      CssClass="grid-view" HeaderStyle-CssClass="header" AlternatingRowStyle-CssClass="altern"
                                      GridLines="Horizontal"  ShowHeaderWhenEmpty="true" >
                            <Columns>
                                <asp:TemplateField HeaderText="">
                                    <ItemTemplate>
                                        <asp:CheckBox runat="server" ID="chk_SelCol" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Valor">
                                    <ItemTemplate>
                                        <asp:textbox runat="server" ID="txt_Valor" CssClass="estandar-control" Text='<%# Eval("Valor") %>' Width="235px"></asp:textbox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>   

                    <div class="clear padding5"></div>
                    
                    <div style="width:100%; text-align:right;">
                        <asp:LinkButton id="btn_AñadirValor" runat="server" class="btn botones boton-chico">
                            <span>
                                <img class="btn-añadir"/>
                            </span>
                        </asp:LinkButton>

                        <asp:LinkButton id="btn_QuitarValor" runat="server" class="btn botones boton-chico">
                            <span>
                                <img class="btn-quitar"/>
                            </span>
                        </asp:LinkButton>
                    </div>

                    <div class="clear padding5"></div>
                    
                    <div style="width:100%; text-align:right; border-top:inset;border-top-width:1px; padding-top:3px;">
                        <asp:LinkButton id="btn_AplicaValores" runat="server" class="btn botones">
                            <span>
                                <img class="btn-aceptar"/>
                                Aceptar
                            </span>
                        </asp:LinkButton>

                        <asp:LinkButton id="btn_CancelaValores" runat="server" data-dismiss="modal" class="btn botones">
                            <span>
                                <img class="btn-cancelar"/>
                                Cerrar
                            </span>
                        </asp:LinkButton>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>

</asp:Content>

