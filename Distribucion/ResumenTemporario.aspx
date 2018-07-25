<%@ Page Title="" Language="VB" MasterPageFile="~/Pages/SiteMaster.master" AutoEventWireup="false" CodeFile="ResumenTemporario.aspx.vb" Inherits="Distribucion_ResumenTemporario" %>
<%@ MasterType VirtualPath="~/Pages/SiteMaster.master" %>


<asp:Content ID="Content2" ContentPlaceHolderID="cph_principal" Runat="Server">
    <asp:HiddenField runat="server" ID="hid_Ventanas" Value="0|0|0|0|0" />
    <script src="../Scripts/FirmasElectronicas.js"></script>
    <div class="zona-principal" style="overflow-x:hidden;overflow-y:hidden">
        <div class="cuadro-titulo panel-encabezado">
            <input type="image" src="../Images/contraer_mini_inv.png" id="coVentana4" class="contraer"  />
            <input type="image" src="../Images/expander_mini_inv.png"   id="exVentana4" class="expandir"  />
            <strong>Configuración de Agrupación</strong>
        </div>
        <div class="panel-contenido ventana4">
            <div class="row">
                <div class="col-md-6">
                    <div id="div_temporarios" class="modal-fija">
                        <asp:UpdatePanel runat="server" ID="upTemporarios">
                            <ContentTemplate>
                                <div class="cuadro-subtitulo">
                                    <input type="image" src="../Images/uparrow.png" id="coVentana0" class="contraer"  />
                                    <input type="image" src="../Images/downarrow.png"   id="exVentana0" class="expandir"  />
                                    Temporarios
                                </div>

                                <div id="ventana0" class="panel-subcontenido ventana0">
                                    <asp:Panel runat="server" ID="pnlTemporarios" Width="100%" Height="200px" ScrollBars="Both">
                                        <asp:GridView runat="server" ID="gvd_Temporarios" AutoGenerateColumns="false" 
                                                      CssClass ="grid-view" HeaderStyle-CssClass="header" AlternatingRowStyle-CssClass="altern"
                                                      GridLines="Horizontal"  ShowHeaderWhenEmpty="true" >
                                            <Columns>
                                                <asp:TemplateField HeaderText="">
                                                    <ItemTemplate>
                                                        <asp:CheckBox runat="server" ID="chk_Sel" Checked='<%# Eval("sn_sel") %>' AutoPostBack="true" OnCheckedChanged="chk_Sel_CheckedChanged" />
                                                    </ItemTemplate>
                                                </asp:TemplateField >
                                                <asp:TemplateField HeaderText="Temporario">
                                                    <ItemTemplate>
                                                        <asp:textbox runat="server" ID="txt_Nro" CssClass="estandar-control Tablero Monto Centro" AutoPostBack="true" OnTextChanged="txt_Nro_TextChanged" Text='<%# Eval("nro_temporario") %>' Width="80px"></asp:textbox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="">
                                                    <ItemTemplate>
                                                        <asp:ImageButton runat="server" ID="btn_Reporte" CommandName="Reporte" ImageUrl="~/Images/guardar_azulmini.png" ToolTip="Guardar Reporte"/>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Sucursal">
                                                    <ItemTemplate>
                                                        <asp:textbox runat="server" ID="txt_Sucursal" CssClass="estandar-control Tablero" Enabled="false" Text='<%# Eval("sucursal") %>' Width="130px"></asp:textbox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Ramo">
                                                    <ItemTemplate>
                                                        <asp:textbox runat="server" ID="txt_Ramo" CssClass="estandar-control Tablero" Enabled="false" Text='<%# Eval("ramo") %>' Width="150px"></asp:textbox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Movimiento">
                                                    <ItemTemplate>
                                                        <asp:textbox runat="server" ID="txt_Movimiento" CssClass="estandar-control Tablero" Enabled="false" Text='<%# Eval("grupo_endoso") %>' Width="100px"></asp:textbox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Póliza">
                                                    <ItemTemplate>
                                                        <asp:textbox runat="server" ID="txt_Poliza" CssClass="estandar-control Tablero Centro" Enabled="false" Text='<%# Eval("nro_pol") %>' Width="60px"></asp:textbox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Asegurado">
                                                    <ItemTemplate>
                                                        <asp:textbox runat="server" ID="txt_Asegurado" CssClass="estandar-control Tablero" Enabled="false" Text='<%# Eval("asegurado") %>' Width="250px"></asp:textbox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </asp:Panel>
                                    <div style="width:100%;  text-align:right">
                                        <asp:LinkButton id="btn_AddTemporario" runat="server" class="btn botones">
                                            <span>
                                                <img class="btn-añadir"/>
                                                Añadir
                                            </span>
                                        </asp:LinkButton>
                                    </div>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
                <div class="col-md-3">
                    <div id="div_generales" class="modal-fija">
                        <asp:UpdatePanel runat="server" ID="upGenerales">
                            <ContentTemplate>
                                <div class="cuadro-subtitulo">
                                    <input type="image" src="../Images/uparrow.png" id="coVentana1" class="contraer"  />
                                    <input type="image" src="../Images/downarrow.png"   id="exVentana1" class="expandir"  />
                                    Campos Generales
                                </div>
               

                                <div id="ventana1" class="panel-subcontenido ventana1">
                                    <asp:Panel runat="server" ID="pnlGenerales" Width="100%" Height="230px" ScrollBars="Both">
                                        <asp:GridView runat="server" ID="gvd_Generales" AutoGenerateColumns="false" 
                                                      CssClass ="grid-view" HeaderStyle-CssClass="header" AlternatingRowStyle-CssClass="altern"
                                                      GridLines="Horizontal"  ShowHeaderWhenEmpty="true" DataKeyNames="Clave,Descripcion,OcultaCampo1" >
                                            <Columns>
                                                <asp:TemplateField HeaderText="">
                                                    <ItemTemplate>
                                                        <asp:CheckBox runat="server" ID="chk_Sel" AutoPostBack="true" OnCheckedChanged="chk_Sel_CheckedChanged"/>
                                                    </ItemTemplate>
                                                </asp:TemplateField >
                                                <asp:TemplateField HeaderText="">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_Clave" CssClass="Tablero" Text='<%# Eval("Clave") %>' Width="30px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Descripción">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_Desc" CssClass="Tablero" Text='<%# Eval("Descripcion") %>' Width="200px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </asp:Panel>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
                <div class="col-md-3">
                    <div id="div_montos" class="modal-fija">
                        <asp:UpdatePanel runat="server" ID="upMontos">
                            <ContentTemplate>
                                <div class="cuadro-subtitulo">
                                    <input type="image" src="../Images/uparrow.png" id="coVentana2" class="contraer"  />
                                    <input type="image" src="../Images/downarrow.png"   id="exVentana2" class="expandir"  />
                                    Montos
                                </div>
               

                                <div id="ventana2" class="panel-subcontenido ventana2">
                                    <asp:Panel runat="server" ID="pnlMontos" Width="100%" Height="230px" ScrollBars="Both">
                                        <asp:GridView runat="server" ID="gvd_Montos" AutoGenerateColumns="false" 
                                                      CssClass ="grid-view" HeaderStyle-CssClass="header" AlternatingRowStyle-CssClass="altern"
                                                      GridLines="Horizontal"  ShowHeaderWhenEmpty="true" DataKeyNames="Clave,Descripcion,OcultaCampo1" >
                                                <Columns>
                                                    <asp:TemplateField HeaderText="">
                                                        <ItemTemplate>
                                                            <asp:CheckBox runat="server" ID="chk_Sel" Checked="true" AutoPostBack="true" OnCheckedChanged="chk_Sel_CheckedChanged"/>
                                                        </ItemTemplate>
                                                    </asp:TemplateField >
                                                    <asp:TemplateField HeaderText="">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" ID="lbl_Clave" CssClass="Tablero" Text='<%# Eval("Clave") %>' Width="30px"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Descripción">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" ID="lbl_Desc" CssClass="Tablero" Text='<%# Eval("Descripcion") %>' Width="200px"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </asp:Panel>
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
                    <asp:LinkButton id="btn_Reporte" runat="server" class="btn botones">
                        <span>
                            <img class="btn-refresh"/>
                            Actualizar
                        </span>
                    </asp:LinkButton>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>

        <div class="clear padding5"></div>

        <div class="cuadro-titulo panel-encabezado">
            <input type="image" src="../Images/contraer_mini_inv.png" id="coVentana3" class="contraer"  />
            <input type="image" src="../Images/expander_mini_inv.png"   id="exVentana3" class="expandir"  />
            <strong>Detalle de Temporario(s)</strong>
        </div>
        <div class="panel-contenido ventana3" >
            <asp:UpdatePanel runat="server" ID="upDetalleTemporario">
                <ContentTemplate>
                    <div class="row">
                        <div class="col-md-3">
                            <asp:label runat="server" class="col-md-1 etiqueta-control" Width="40%">Suma Ase.</asp:label>
                            <asp:TextBox runat="server" ID="txt_SumaAsegurada" CssClass="estandar-control Monto Tablero" Enabled="false" Width="58%"></asp:TextBox>
                        </div>
                        <div class="col-md-3">
                            <asp:label runat="server" class="col-md-1 etiqueta-control" Width="40%">Prima</asp:label>
                            <asp:TextBox runat="server" ID="txt_Prima" CssClass="estandar-control Monto Tablero" Enabled="false" Width="58%"></asp:TextBox>
                        </div>
                        <div class="col-md-3">
                            <asp:label runat="server" class="col-md-1 etiqueta-control" Width="40%">Comisión</asp:label>
                            <asp:TextBox runat="server" ID="txt_Comision" CssClass="estandar-control Monto Tablero" Enabled="false" Width="58%"></asp:TextBox>
                        </div>
                        <div class="col-md-3">
                            <asp:label runat="server" class="col-md-1 etiqueta-control" Width="40%">Prima Neta</asp:label>
                            <asp:TextBox runat="server" ID="txt_PrimaNeta" CssClass="estandar-control Monto Tablero" Enabled="false" Width="58%"></asp:TextBox>
                        </div>
                    </div>
                    <div class="clear padding5"></div>
                    <asp:HiddenField runat="server" ID="hid_Filtro" Value="0" />
                    <asp:HiddenField runat="server" ID="hid_OrdenFiltrado" Value="-1" />
                    <asp:HiddenField runat="server" ID="hid_Capa" Value="" />
                    <asp:HiddenField runat="server" ID="hid_Linea" Value="" />
                    <asp:HiddenField runat="server" ID="hid_IdContrato" Value="" />
                    <asp:HiddenField runat="server" ID="hid_Broker" Value="" />
                    <asp:HiddenField runat="server" ID="hid_Compañia" Value="" />
                    <asp:Panel runat="server" ID="pnl_DetalleTemporario" Width="100%" ScrollBars="Horizontal">
                        <asp:GridView runat="server" ID="gvd_DetalleTemporario" AutoGenerateColumns="false" 
                                        CssClass="grid-view" HeaderStyle-CssClass="header" AlternatingRowStyle-CssClass="altern" 
                                        GridLines="Horizontal"  ShowHeaderWhenEmpty="true" >
                            <Columns>
                                <asp:TemplateField HeaderText="Temporario" HeaderStyle-CssClass="Centro">
                                    <ItemTemplate>
                                        <asp:TextBox runat="server" ID="txt_Temporario" Text='<%# Eval("NRO_TEMPORARIO") %>' Font-Bold="true" Enabled="false" CssClass="estandar-control Tablero Centro" Width="60px"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Capa" HeaderStyle-CssClass="Centro">
                                    <HeaderTemplate>
                                        <div style="width:50px;text-align:center;">
                                            <asp:label runat="server" Text="Capa"></asp:label>
                                            <asp:ImageButton runat="server" ID="btn_Capa" AlternateText="NRO_LAYER|Capa|0" OnClick="DespliegaFiltro" CssClass="btn-filtro"/>
                                        </div>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:TextBox runat="server" ID="txt_Capa" Text='<%# Eval("NRO_LAYER") %>' Enabled="false" CssClass="estandar-control Tablero Centro" Width="50px"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Id Linea" HeaderStyle-CssClass="Centro">
                                    <ItemTemplate>
                                        <asp:TextBox runat="server" ID="txt_IdLinea" Text='<%# Eval("ID_LINEA") %>' Enabled="false" CssClass="estandar-control Tablero Centro" Width="50px"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Linea" HeaderStyle-CssClass="Centro">
                                    <HeaderTemplate>
                                        <div style="width:150px;text-align:center;">
                                            <asp:label runat="server" Text="Linea"></asp:label>
                                            <asp:ImageButton runat="server" ID="btn_Linea" AlternateText="LINEA|Linea|1" OnClick="DespliegaFiltro" CssClass="btn-filtro"/>
                                        </div>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:TextBox runat="server" ID="txt_Linea" Text='<%# Eval("LINEA") %>' Enabled="false" CssClass="estandar-control Tablero" Width="150px"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Id Contrato" HeaderStyle-CssClass="Centro">
                                    <HeaderTemplate>
                                        <div style="width:90px;text-align:center;">
                                            <asp:label runat="server" Text="Id Contrato"></asp:label>
                                            <asp:ImageButton runat="server" ID="btn_IdContrato" AlternateText="ID_CONTRATO|Id Contrato|2" OnClick="DespliegaFiltro" CssClass="btn-filtro"/>
                                        </div>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:TextBox runat="server" ID="txt_IdContrato" Text='<%# Eval("ID_CONTRATO") %>' Enabled="false"  CssClass="estandar-control Tablero Centro" Width="90px"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Contrato" HeaderStyle-CssClass="Centro">
                                    <ItemTemplate>
                                        <asp:TextBox runat="server" ID="txt_Contrato" Text='<%# Eval("CONTRATO") %>' Enabled="false" CssClass="estandar-control Tablero" Width="100px"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Tipo Contrato" HeaderStyle-CssClass="Centro">
                                    <ItemTemplate>
                                        <asp:TextBox runat="server" ID="txt_TipoContrato" Text='<%# Eval("TIPO_CONTRATO") %>' Enabled="false" CssClass="estandar-control Tablero" Width="100px"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Cod Broker" HeaderStyle-CssClass="Centro">
                                    <ItemTemplate>
                                        <asp:TextBox runat="server" ID="txt_CodBroker" Text='<%# Eval("COD_BROKER") %>' Enabled="false" CssClass="estandar-control Tablero Centro" Width="60px"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Broker" HeaderStyle-CssClass="Centro">
                                    <HeaderTemplate>
                                        <div style="width:180px;text-align:center;">
                                            <asp:label runat="server" Text="Broker"></asp:label>
                                            <asp:ImageButton runat="server" ID="btn_Broker" AlternateText="BROKER|Broker|3" OnClick="DespliegaFiltro" CssClass="btn-filtro"/>
                                        </div>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:TextBox runat="server" ID="txt_Broker" Text='<%# Eval("BROKER") %>' Enabled="false" CssClass="estandar-control Tablero" Width="180px"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Cod Cia" HeaderStyle-CssClass="Centro">
                                    <ItemTemplate>
                                        <asp:TextBox runat="server" ID="txt_CodCia" Text='<%# Eval("COD_CIA") %>' Enabled="false" CssClass="estandar-control Tablero Centro" Width="50px"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Compañia" HeaderStyle-CssClass="Centro">
                                    <HeaderTemplate>
                                        <div style="width:180px;text-align:center;">
                                            <asp:label runat="server" Text="Compañia"></asp:label>
                                            <asp:ImageButton runat="server" ID="btn_Compañia" AlternateText="COMPAÑIA|Compañia|4" OnClick="DespliegaFiltro" CssClass="btn-filtro"/>
                                        </div>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:TextBox runat="server" ID="txt_Compañia" Text='<%# Eval("COMPAÑIA") %>' Enabled="false" CssClass="estandar-control Tablero" Width="180px"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Suma Asegurada" HeaderStyle-CssClass="Centro">
                                    <ItemTemplate>
                                        <asp:TextBox runat="server" ID="txt_SumaAsegurada" Text='<%# String.Format("{0:#,#0.00}", CDbl(IIf(IsDBNull(Eval("SUMA_ASEGURADA")), 0, Eval("SUMA_ASEGURADA"))))%>' CssClass="estandar-control Tablero Monto" Enabled="false" Width="100px"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="(%) Suma" HeaderStyle-CssClass="Centro">
                                    <ItemTemplate>
                                        <asp:TextBox runat="server" ID="txt_PjeSuma" Text='<%# String.Format("{0:#,#0.00}", CDbl(IIf(IsDBNull(Eval("PJE_SUMA")), 0, Eval("PJE_SUMA"))))%>' CssClass="estandar-control Tablero Monto" Enabled="false" Width="100px"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Prima" HeaderStyle-CssClass="Centro">
                                    <ItemTemplate>
                                        <asp:TextBox runat="server" ID="txt_Prima" Text='<%# String.Format("{0:#,#0.00}", CDbl(IIf(IsDBNull(Eval("PRIMA")), 0, Eval("PRIMA"))))%>' CssClass="estandar-control Tablero Monto" Enabled="false" Width="100px"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="(%) Prima" HeaderStyle-CssClass="Centro">
                                    <ItemTemplate>
                                        <asp:TextBox runat="server" ID="txt_PjePrima" Text='<%# String.Format("{0:#,#0.00}", CDbl(IIf(IsDBNull(Eval("PJE_PRIMA")), 0, Eval("PJE_PRIMA"))))%>' CssClass="estandar-control Tablero Monto" Enabled="false" Width="100px"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="(%) Comision" HeaderStyle-CssClass="Centro">
                                    <ItemTemplate>
                                        <asp:TextBox runat="server" ID="txt_PjeComision" Text='<%# String.Format("{0:#,#0.00}", CDbl(IIf(IsDBNull(Eval("PJE_COMISION")), 0, Eval("PJE_COMISION"))))%>' CssClass="estandar-control Tablero Monto" Enabled="false" Width="100px"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Comisión" HeaderStyle-CssClass="Centro">
                                    <ItemTemplate>
                                        <asp:TextBox runat="server" ID="txt_Comision" Text='<%# String.Format("{0:#,#0.00}", CDbl(IIf(IsDBNull(Eval("COMISION")), 0, Eval("COMISION"))))%>'  CssClass="estandar-control Tablero Monto" Enabled="false" Width="100px"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Prima Neta" HeaderStyle-CssClass="Centro">
                                    <ItemTemplate>
                                        <asp:TextBox runat="server" ID="txt_PrimaNeta" Text='<%# String.Format("{0:#,#0.00}", CDbl(IIf(IsDBNull(Eval("PRIMA_NETA")), 0, Eval("PRIMA_NETA"))))%>'  CssClass="estandar-control Tablero Monto" Enabled="false" Width="100px"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </asp:Panel>

                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div class="clear padding100"></div>

    </div>

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
</asp:Content>

