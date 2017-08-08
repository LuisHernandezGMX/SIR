<%@ Page Title="" Language="VB" MasterPageFile="~/Pages/SiteMaster.master" AutoEventWireup="false" CodeFile="Reporteador.aspx.vb" Inherits="Reportes_Reporteador" %>
<%@ MasterType VirtualPath="~/Pages/SiteMaster.master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="cph_principal" Runat="Server">
    <script src="../Scripts/Reporteador.js"></script>
    <asp:HiddenField runat="server" ID="hid_Ventanas" Value="1|1|1|1|1|1|1|1|1|1|1|1|1|" />
    
    <div style="width:1000px; min-width:1000px; overflow-x:hidden;">
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
                                <asp:Panel runat="server" ID="pnlGenerales" Width="100%" Height="200px" ScrollBars="Both">
                                    <asp:GridView runat="server" ID="gvd_Generales" AutoGenerateColumns="false" 
                                                  CssClass ="grid-view" HeaderStyle-CssClass="header" AlternatingRowStyle-CssClass="altern"
                                                  GridLines="Horizontal"  ShowHeaderWhenEmpty="true" >
                                            <Columns>
                                                <asp:TemplateField HeaderText="">
                                                    <ItemTemplate>
                                                            <asp:CheckBox runat="server" ID="chk_SelGen"/>
                                                    </ItemTemplate>
                                                </asp:TemplateField >
                                                <asp:TemplateField HeaderText="">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_ClaveGen" Text='<%# Eval("Clave") %>' Width="50px"></asp:Label>
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
                                            <input type="image" src="../Images/select_mini.png"  />
                                            <input type="image" src="../Images/unselect_mini.png"  />
                                        </div>
                                        <div class="col-md-6">
                                            <div style="width:100%;  text-align:right">
                                                <input type="image" src="../Images/expander_mini.png" class="AgregaGenerales" data-toggle="modal" data-target="#EsperaModal"  />
                                                <input type="image" src="../Images/contraer_mini.png"  />
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
                                <asp:Panel runat="server" ID="pnlReaseguro" Width="100%" Height="200px" ScrollBars="Both">
                                    <asp:GridView runat="server" ID="gvd_Reaseguro" AutoGenerateColumns="false" 
                                                  CssClass ="grid-view" HeaderStyle-CssClass="header" AlternatingRowStyle-CssClass="altern"
                                                  GridLines="Horizontal"  ShowHeaderWhenEmpty="true" >
                                            <Columns>
                                                <asp:TemplateField HeaderText="">
                                                    <ItemTemplate>
                                                            <asp:CheckBox runat="server" ID="chk_SelRea"/>
                                                    </ItemTemplate>
                                                </asp:TemplateField >
                                                <asp:TemplateField HeaderText="">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_ClaveRea" Text='<%# Eval("Clave") %>' Width="50px"></asp:Label>
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
                                            <input type="image" src="../Images/select_mini.png"  />
                                            <input type="image" src="../Images/unselect_mini.png"  />
                                        </div>
                                        <div class="col-md-6">
                                            <div style="width:100%;  text-align:right">
                                                <input type="image" src="../Images/expander_mini.png" class="AgregaReaseguro" data-toggle="modal" data-target="#EsperaModal" />
                                                <input type="image" src="../Images/contraer_mini.png"  />
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
                                <asp:Panel runat="server" ID="pnl_Siniestros" Width="100%" Height="200px" ScrollBars="Both">
                                    <asp:GridView runat="server" ID="gvd_Siniestros" AutoGenerateColumns="false" 
                                                  CssClass ="grid-view" HeaderStyle-CssClass="header" AlternatingRowStyle-CssClass="altern"
                                                  GridLines="Horizontal"  ShowHeaderWhenEmpty="true" >
                                            <Columns>
                                                <asp:TemplateField HeaderText="">
                                                    <ItemTemplate>
                                                            <asp:CheckBox runat="server" ID="chk_SelSin"/>
                                                    </ItemTemplate>
                                                </asp:TemplateField >
                                                <asp:TemplateField HeaderText="">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_ClaveSin" Text='<%# Eval("Clave") %>' Width="50px"></asp:Label>
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
                                            <input type="image" src="../Images/select_mini.png"  />
                                            <input type="image" src="../Images/unselect_mini.png"  />
                                        </div>
                                        <div class="col-md-6">
                                            <div style="width:100%;  text-align:right">
                                                <input type="image" src="../Images/expander_mini.png" class="AgregaSiniestros" data-toggle="modal" data-target="#EsperaModal" />
                                                <input type="image" src="../Images/contraer_mini.png"  />
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
                                <asp:Panel runat="server" ID="pnlCumulos" Width="100%" Height="200px" ScrollBars="Both">
                                    <asp:GridView runat="server" ID="gvd_Cumulos" AutoGenerateColumns="false" 
                                                  CssClass ="grid-view" HeaderStyle-CssClass="header" AlternatingRowStyle-CssClass="altern"
                                                  GridLines="Horizontal"  ShowHeaderWhenEmpty="true" >
                                            <Columns>
                                                <asp:TemplateField HeaderText="">
                                                    <ItemTemplate>
                                                            <asp:CheckBox runat="server" ID="chk_SelCum"/>
                                                    </ItemTemplate>
                                                </asp:TemplateField >
                                                <asp:TemplateField HeaderText="">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_ClaveCum" Text='<%# Eval("Clave") %>' Width="50px"></asp:Label>
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
                                            <input type="image" src="../Images/select_mini.png"  />
                                            <input type="image" src="../Images/unselect_mini.png"  />
                                        </div>
                                        <div class="col-md-6">
                                            <div style="width:100%;  text-align:right">
                                                <input type="image" src="../Images/expander_mini.png" class="AgregaCumulos" data-toggle="modal" data-target="#EsperaModal" />
                                                <input type="image" src="../Images/contraer_mini.png"  />
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
                                <asp:Panel runat="server" ID="pnlCobranzas" Width="100%" Height="200px" ScrollBars="Both">
                                    <asp:GridView runat="server" ID="gvd_Cobranzas" AutoGenerateColumns="false" 
                                                  CssClass ="grid-view" HeaderStyle-CssClass="header" AlternatingRowStyle-CssClass="altern"
                                                  GridLines="Horizontal"  ShowHeaderWhenEmpty="true" >
                                            <Columns>
                                                <asp:TemplateField HeaderText="">
                                                    <ItemTemplate>
                                                            <asp:CheckBox runat="server" ID="chk_SelCob"/>
                                                    </ItemTemplate>
                                                </asp:TemplateField >
                                                <asp:TemplateField HeaderText="">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_ClaveCob" Text='<%# Eval("Clave") %>' Width="50px"></asp:Label>
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
                                            <input type="image" src="../Images/select_mini.png"  />
                                            <input type="image" src="../Images/unselect_mini.png"  />
                                        </div>
                                        <div class="col-md-6">
                                            <div style="width:100%;  text-align:right">
                                                <input type="image" src="../Images/expander_mini.png" class="AgregaCobranzas" data-toggle="modal" data-target="#EsperaModal" />
                                                <input type="image" src="../Images/contraer_mini.png"  />
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
                                <asp:Panel runat="server" ID="pnlContabilidad" Width="100%" Height="200px" ScrollBars="Both">
                                    <asp:GridView runat="server" ID="gvd_Contabilidad" AutoGenerateColumns="false" 
                                                  CssClass ="grid-view" HeaderStyle-CssClass="header" AlternatingRowStyle-CssClass="altern"
                                                  GridLines="Horizontal"  ShowHeaderWhenEmpty="true" >
                                            <Columns>
                                                <asp:TemplateField HeaderText="">
                                                    <ItemTemplate>
                                                            <asp:CheckBox runat="server" ID="chk_SelCon"/>
                                                    </ItemTemplate>
                                                </asp:TemplateField >
                                                <asp:TemplateField HeaderText="">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_ClaveCon"  Text='<%# Eval("Clave") %>' Width="50px"></asp:Label>
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
                                            <input type="image" src="../Images/select_mini.png"  />
                                            <input type="image" src="../Images/unselect_mini.png"  />
                                        </div>
                                        <div class="col-md-6">
                                            <div style="width:100%;  text-align:right">
                                                <input type="image" src="../Images/expander_mini.png" class="AgregaContabilidad" data-toggle="modal" data-target="#EsperaModal" />
                                                <input type="image" src="../Images/contraer_mini.png"  />
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
                                                            <asp:CheckBox runat="server" ID="chk_SelPol"/>
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
                                            <input type="image" src="../Images/select_mini.png"  />
                                            <input type="image" src="../Images/unselect_mini.png"  />
                                        </div>
                                        <div class="col-md-6">
                                            <div style="width:100%;  text-align:right">
                                                <asp:ImageButton runat="server" ID="btn_AddPol" ImageUrl="../Images/expander_mini.png"/>
                                                <input type="image" src="../Images/contraer_mini.png"  />
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
                                                            <asp:CheckBox runat="server" ID="chk_SelBro"/>
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
                                            <input type="image" src="../Images/select_mini.png"  />
                                            <input type="image" src="../Images/unselect_mini.png"  />
                                        </div>
                                        <div class="col-md-6">
                                            <div style="width:100%;  text-align:right">
                                                <input type="image" src="../Images/expander_mini.png" class="AgregaBroker" data-toggle="modal" data-target="#EsperaModal"  />
                                                <input type="image" src="../Images/contraer_mini.png"  />
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
                                                            <asp:CheckBox runat="server" ID="chk_SelCia"/>
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
                                            <input type="image" src="../Images/select_mini.png"  />
                                            <input type="image" src="../Images/unselect_mini.png"  />
                                        </div>
                                        <div class="col-md-6">
                                            <div style="width:100%;  text-align:right">
                                                <input type="image" src="../Images/expander_mini.png" class="AgregaCia" data-toggle="modal" data-target="#EsperaModal" />
                                                <input type="image" src="../Images/contraer_mini.png"  />
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
                                                            <asp:CheckBox runat="server" ID="chk_SelRac"/>
                                                    </ItemTemplate>
                                                </asp:TemplateField >
                                                <asp:TemplateField HeaderText="">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_ClaveRac" Text='<%# Eval("Clave") %>' Width="50px"></asp:Label>
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
                                            <input type="image" src="../Images/select_mini.png"  />
                                            <input type="image" src="../Images/unselect_mini.png"  />
                                        </div>
                                        <div class="col-md-6">
                                            <div style="width:100%;  text-align:right">
                                                <input type="image" src="../Images/expander_mini.png" class="AgregaRamoCont" data-toggle="modal" data-target="#EsperaModal"  />
                                                <input type="image" src="../Images/contraer_mini.png"  />
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
                                                            <asp:CheckBox runat="server" ID="chk_SelPro"/>
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
                                            <input type="image" src="../Images/select_mini.png"  />
                                            <input type="image" src="../Images/unselect_mini.png"  />
                                        </div>
                                        <div class="col-md-6">
                                            <div style="width:100%;  text-align:right">
                                                <input type="image" src="../Images/expander_mini.png" class="AgregaProducto" data-toggle="modal" data-target="#EsperaModal"  />
                                                <input type="image" src="../Images/contraer_mini.png"  />
                                            </div>
                                        </div>
                                    </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>

                <div id="hid_adicionales" class="modal-flotante adicionales NoDisplay"></div>
                <div id="div_adicionales" class="modal-flotante adicionales">
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
                                
                                    <div class="row">
                                        <div class="col-md-6">
                                            <input type="image" src="../Images/select_mini.png"  />
                                            <input type="image" src="../Images/unselect_mini.png"  />
                                        </div>
                                        <div class="col-md-6">
                                            <div style="width:100%;  text-align:right">
                                                <input type="image" src="../Images/expander_mini.png"  />
                                                <input type="image" src="../Images/contraer_mini.png"  />
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

</asp:Content>

