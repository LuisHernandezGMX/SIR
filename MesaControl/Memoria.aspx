<%@ Page Title="" Language="VB" MasterPageFile="~/Pages/SiteMaster.master" AutoEventWireup="false" CodeFile="Memoria.aspx.vb" Inherits="MesaControl_Memoria" %>

<asp:Content ID="Content2" ContentPlaceHolderID="cph_principal" Runat="Server">
    <script src="../Scripts/Memoria.js"></script>
    <script type="text/javascript"> 
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(PageLoadMemoria);
    </script> 

    <asp:HiddenField runat="server" ID="hid_Ventanas" Value="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|1|0|" />
    <div class="zona-principal">
        <div class="cuadro-titulo">
             Memoria de Cálculo
        </div>
        <div class="clear padding4"></div>

              <asp:UpdatePanel runat="server" ID="upDatosRiesgo">
                <ContentTemplate>

                    <table>
                        <tr>
                            <td>
                                <div class="panel-seccion-fija Encabezado">
                                    <div class="ventana15">
                                            <asp:UpdatePanel runat="server" ID="upGenerales">
                                                <ContentTemplate>
                                                    <asp:HiddenField runat="server" ID="hid_Operacion" Value="0" />
                                                    <div class="cuadro-titulo">
                                                        Datos Generales
                                                    </div>
                                                    <div class="clear padding4"></div>
                                                    <div class="row">
                                                        <div class="col-md-9">
                                                            <asp:label runat="server" class="col-md-1  etiqueta-control" Width="16%">Asegurado</asp:label>
                                                            <asp:TextBox runat="server" ID="txt_ClaveAseg" CssClass="NoDisplay"></asp:TextBox>
                                                            <asp:TextBox runat="server" ID="txt_AsegCorto" CssClass="col-md-1 estandar-control Tablero Seleccion" PlaceHolder="Nombre Corto" Width="25%"></asp:TextBox> 
                                                            <asp:TextBox runat="server" ID="txt_SearchAse" CssClass="col-md-1 estandar-control Tablero Seleccion" PlaceHolder="Nombre" Width="56%"></asp:TextBox> 
                                                            <asp:ImageButton runat="server" ID="btn_buscaPol" ImageUrl="~/Images/buscar_mini_inv.png" Height="17" Width="17" />
                                                        </div>
                                                        <div class="col-md-3">
                                                            <asp:label runat="server" class="col-md-1  etiqueta-control" Width="40%">RFC</asp:label>
                                                            <asp:TextBox runat="server" ID="txt_RFC" CssClass="estandar-control Seleccion Tablero" PlaceHolder="RFC" Width="58%"></asp:TextBox>
                                                        </div>    
                                                    </div>
                                                    <div class="clear padding4"></div>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <asp:label runat="server" class="col-md-1  etiqueta-control" Width="24.5%">Domicilio Fiscal</asp:label>
                                                            <asp:TextBox runat="server" ID="txt_DomicilioFiscal" CssClass="estandar-control Seleccion Tablero" PlaceHolder="Domicilio Fiscal del Asegurado" Width="75.5%"></asp:TextBox> 
                                                        </div>
                                                        <div class="col-md-6">
                                                            <asp:label runat="server" class="col-md-1  etiqueta-control" Width="25%">Domicilio Riesgo</asp:label>
                                                            <asp:TextBox runat="server" ID="txt_DomicilioRiesgo" CssClass="estandar-control Seleccion Tablero" PlaceHolder="Domicilio del Riesgo" Width="74%"></asp:TextBox> 
                                                        </div>
                                                    </div>
                                                    <div class="clear padding4"></div>
                                                    <div class="row">
                                                        <div class="col-md-3">
                                                            <asp:label runat="server" class="col-md-1 etiqueta-control" Width="52%">Moneda</asp:label>
                                                            <asp:DropDownList runat="server" ID="ddl_Moneda" CssClass="estandar-control Tablero Moneda" Width="48%"></asp:DropDownList>
                                                        </div>
                                                        <div class="col-md-3">
                                                            <asp:label runat="server" class="col-md-1  etiqueta-control" Width="48%">Inicio Vigencia</asp:label>
                                                            <asp:TextBox runat="server" ID="txt_VigIni" CssClass="estandar-control Tablero Fecha Seleccion Derecha" PlaceHolder="dia/mes/año"  TextMode="Date" Width="52%"></asp:TextBox>
                                                        </div>
                                                        <div class="col-md-3">
                                                            <asp:label runat="server" class="col-md-1  etiqueta-control" Width="53%">Fin Vigencia</asp:label>
                                                            <asp:TextBox runat="server" ID="txt_VigFin" CssClass="estandar-control Tablero Fecha Seleccion Derecha" PlaceHolder="dia/mes/año" TextMode="Date" Width="47%"></asp:TextBox>
                                                        </div>
                                                        <div class="col-md-3">
                                                            <asp:label runat="server" class="col-md-1  etiqueta-control" Width="40%">Emision</asp:label>
                                                            <asp:TextBox runat="server" ID="txt_FecEmision" CssClass="estandar-control Tablero Fecha Seleccion Derecha" PlaceHolder="dia/mes/año" TextMode="Date" Width="58%"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="clear padding4"></div>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                    </div>
                                    <div class="ventana16">
                                            <asp:UpdatePanel runat="server" ID="upEncabezado">
                                                <ContentTemplate>
                                                    <div class="cuadro-titulo">
                                                        [Detalle de Colocación]
                                                    </div>
                                                    <div class="cuadro-subtitulo-grid">
                                                        DISTRIBUCIÓN DE REASEGURO
                                                    </div>     
                                                    <div class="clear padding2"></div>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div style="width:100%;  text-align:right">
                                                                <asp:label runat="server" class="col-md-1  etiqueta-control Tablero" Width="15%">FECHA</asp:label>
                                                                <asp:TextBox runat="server" ID="txt_Fecha" CssClass="estandar-control Tablero" Enabled="false" Width="85%"></asp:TextBox> 
                                                            </div>
                                                        </div>    
                                                    </div>
                                                    <div class="clear padding2"></div>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div style="width:100%;  text-align:right">
                                                                <asp:label runat="server" class="col-md-1  etiqueta-control Tablero" Width="15%">FOLIO</asp:label>
                                                                <asp:TextBox runat="server" ID="txt_Folio" CssClass="estandar-control Tablero" Enabled="false" Width="85%"></asp:TextBox> 
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="clear padding2"></div>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div style="width:100%;  text-align:right">
                                                                <asp:label runat="server" class="col-md-1  etiqueta-control Tablero" Width="15%">CONF.</asp:label>
                                                                <asp:TextBox runat="server" ID="txt_Conf" CssClass="estandar-control Tablero" Enabled="false" Width="85%"></asp:TextBox> 
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="clear padding2"></div>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </table>

                    <div class="panel-seccion">
                        <div class="cuadro-titulo">
                            <input type="image" src="../Images/contraer_mini_inv.png" id="coVentana3" class="contraer"  />
                            <input type="image" src="../Images/expander_mini_inv.png"   id="exVentana3" class="expandir"  />
                            <asp:Label runat="server" Text="Datos del Riesgo" Width="65%"></asp:Label>                  
                        </div>
                        <div class="ventana3">
                            <asp:HiddenField runat="server" ID="hid_Tamaño" Value="200|200|200|200" />
                            <asp:HiddenField runat="server" ID="hid_Ajuste" Value="0|0|0|0" />
                            <div style="width:100%;">
                                <asp:GridView runat="server"  ID="gvd_Riesgo" AutoGenerateColumns="false"
                                            GridLines="Horizontal"  ShowHeaderWhenEmpty="true" CssClass="grid-view" DataKeyNames="cod_inciso,sn_adicional,sn_facultativo"
                                            HeaderStyle-CssClass="header" >
                                    <Columns>
                                        
                                        <asp:TemplateField HeaderText ="" HeaderStyle-CssClass="Centro" ItemStyle-CssClass="Centrado">
                                            <HeaderTemplate>
                                                <asp:CheckBox runat="server" ID="chk_RiesgoAll" Width="20px" onclick="fn_SeleccionTodos('gvd_Riesgo', this, 'chk_Riesgo')" /> 
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:CheckBox runat="server" ID="chk_Riesgo" CssClass="Select" Checked='<%# Eval("sn_seleccionado") %>' Width="20px" /> 
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="#">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="lbl_Inciso" CssClass="Centro" Text='<%# Eval("cod_inciso") %>' Width="20px" ></asp:Label>
                                                <asp:TextBox runat="server" ID="txt_Inciso" Text='<%# Eval("cod_inciso") %>' CssClass="NoDisplay"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="">
                                            <HeaderTemplate>
                                                <div>
                                                        <asp:ImageButton runat="server" ID="btn_SearchRamo" AlternateText="0" OnClick="AjusteTamaño" ImageUrl="~/Images/quitar_mini.png" data-toggle="tooltip" data-placement="right" title="Ramo"/>
                                                        <asp:Label runat="server" ID="lbl_SearchRamo"  Text="Ramo" Width="60px"></asp:Label>
                                                </div>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:TextBox runat="server" ID="txt_ClaveRamo" Text='<%# Eval("cod_ramo") %>'  CssClass="NoDisplay ClaveRamo"></asp:TextBox>
                                                <asp:TextBox runat="server" ID="txt_ClaveRamo_Aux" Text='<%# Eval("cod_ramo") %>' CssClass="NoDisplay ClaveRamoAux"></asp:TextBox>
                                                <asp:TextBox runat="server" ID="txt_SearchRamo" Text='<%# Eval("ramo_desc") %>' CssClass="estandar-control Tablero Ramo Seleccion" Enabled="false" data-toggle="tooltip" data-placement="right" Width="200px"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="">
                                            <HeaderTemplate>
                                                <div>
                                                        <asp:ImageButton runat="server" ID="btn_SearchSubramo" AlternateText="1" OnClick="AjusteTamaño" ImageUrl="~/Images/quitar_mini.png" data-toggle="tooltip" data-placement="right" title="Subramo"/>
                                                        <asp:Label runat="server" ID="lbl_SearchSubramo"  Text="Subramo" Width="60px"></asp:Label>
                                                </div>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:TextBox runat="server" ID="txt_ClaveSubramo" Text='<%# Eval("cod_subramo") %>' CssClass="NoDisplay ClaveSubramo"></asp:TextBox>
                                                <asp:TextBox runat="server" ID="txt_ClaveSubramoAux" Text='<%# Eval("cod_subramo") %>' CssClass="NoDisplay ClaveSubramoAux"></asp:TextBox>
                                                <asp:TextBox runat="server" ID="txt_SearchSubramo" Text='<%# Eval("subramo_desc") %>' CssClass="estandar-control Tablero Subramo Seleccion" Enabled="false" data-toggle="tooltip" data-placement="right" Width="200px"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Sección">
                                            <HeaderTemplate>
                                                <div>
                                                        <asp:ImageButton runat="server" ID="btn_SearchSeccion" AlternateText="2" OnClick="AjusteTamaño" ImageUrl="~/Images/quitar_mini.png" data-toggle="tooltip" data-placement="right" title="Sección"/>
                                                        <asp:Label runat="server" ID="lbl_SearchSeccion" Text="Sección" Width="60px"></asp:Label>
                                                </div>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:TextBox runat="server" ID="txt_ClaveSeccion" Text='<%# Eval("cod_riesgo") %>' CssClass="NoDisplay ClaveRiesgo"></asp:TextBox>
                                                <asp:TextBox runat="server" ID="txt_ClaveSeccionAux" Text='<%# Eval("cod_riesgo") %>' CssClass="NoDisplay ClaveRiesgoAux"></asp:TextBox>
                                                <asp:TextBox runat="server" ID="txt_SearchSeccion" Text='<%# Eval("riesgo_desc") %>' CssClass="estandar-control Tablero Riesgo Seleccion" data-toggle="tooltip" data-placement="right" Width="200px"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Cobertura">
                                            <HeaderTemplate>
                                                <div>
                                                    <asp:ImageButton runat="server" ID="btn_SearchCobertura" AlternateText="3" OnClick="AjusteTamaño" ImageUrl="~/Images/quitar_mini.png" data-toggle="tooltip" data-placement="right" title="Cobertura"/>
                                                    <asp:Label runat="server" ID="lbl_SearchCobertura" Text="Cobertura" Width="60px"></asp:Label>
                                                </div>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:TextBox runat="server" ID="txt_ClaveCobertura" Text='<%# Eval("cod_ind_cob") %>' CssClass="NoDisplay ClaveCobertura"></asp:TextBox>
                                                <asp:TextBox runat="server" ID="txt_SearchCobertura" Text='<%# Eval("cobertura_desc") %>' CssClass="estandar-control Tablero Cobertura Seleccion" data-toggle="tooltip" data-placement="right" Width="200px"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Facultativo" HeaderStyle-CssClass="Centro">
                                            <ItemTemplate>
                                                <asp:RadioButtonList runat="server" ID="opt_Facultativo" CssClass="Centro" RepeatDirection="Horizontal" Width="90px">
                                                    <asp:ListItem Text="Si" Selected="True" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="No" Selected="False" Value="0" ></asp:ListItem>
                                                </asp:RadioButtonList>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Acumula" HeaderStyle-CssClass="Centro">
                                            <ItemTemplate>
                                                <asp:RadioButtonList runat="server" ID="opt_Adicional" CssClass="Centro" RepeatDirection="Horizontal" Width="80px">
                                                    <asp:ListItem Text="Si" Selected="True" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="No" Selected="False" Value="0" ></asp:ListItem>
                                                </asp:RadioButtonList>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="1er Riesgo" HeaderStyle-CssClass="Centro">
                                            <ItemTemplate>
                                                <asp:TextBox runat="server" ID="txt_1erRiesgo" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("1erRiesgo")))%>' CssClass="estandar-control Tablero Seleccion Monto ValoresTotales" Width="100px"></asp:TextBox>
                                                <asp:TextBox runat="server" ID="txt_1erRiesgoAux" Text='<%# Eval("1erRiesgo") %>' CssClass="NoDisplay"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Valores Totales" HeaderStyle-CssClass="Centro">
                                            <ItemTemplate>
                                                <asp:TextBox runat="server" ID="txt_ValoresTotales" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("valores_totales")))%>' CssClass="estandar-control Tablero Seleccion Monto ValoresTotales" Width="100px"></asp:TextBox>
                                                <asp:TextBox runat="server" ID="txt_ValoresTotalesAux" Text='<%# Eval("valores_totales") %>' CssClass="NoDisplay"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Lím. Max. Resp" HeaderStyle-CssClass="Centro">
                                            <ItemTemplate>
                                                <asp:TextBox runat="server" ID="txt_LimResp" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("suma_asegurada")))%>' CssClass="estandar-control Tablero Seleccion Monto SumaAsegurada" Width="100px"></asp:TextBox>
                                                <asp:TextBox runat="server" ID="txt_LimRespAux" Text='<%# Eval("suma_asegurada") %>' CssClass="NoDisplay"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Prima Neta" HeaderStyle-CssClass="Centro">
                                            <ItemTemplate>
                                                <asp:TextBox runat="server" ID="txt_PrimaNeta" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("prima_neta")))%>' CssClass="estandar-control Tablero Seleccion Monto PrimaNeta" Enabled="false" Width="100px"></asp:TextBox>
                                                <asp:TextBox runat="server" ID="txt_PrimaNetaAux" Text='<%# Eval("prima_neta") %>' CssClass="NoDisplay"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Tasa Base" HeaderStyle-CssClass="Centro">
                                            <ItemTemplate>
                                                <asp:TextBox runat="server" ID="txt_TasaBase" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("tasa_base")))%>' CssClass="estandar-control Tablero Seleccion Monto ValoresTotales" Width="100px"></asp:TextBox>
                                                <asp:TextBox runat="server" ID="txt_TasaBaseAux" Text='<%# Eval("tasa_base") %>' CssClass="NoDisplay"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Descuento" HeaderStyle-CssClass="Centro">
                                            <ItemTemplate>
                                                <asp:TextBox runat="server" ID="txt_Descuento" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("descuento")))%>' CssClass="estandar-control Tablero Seleccion Monto ValoresTotales" Width="100px"></asp:TextBox>
                                                <asp:TextBox runat="server" ID="txt_DescuentoAux" Text='<%# Eval("descuento") %>' CssClass="NoDisplay"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Recargo" HeaderStyle-CssClass="Centro">
                                            <ItemTemplate>
                                                <asp:TextBox runat="server" ID="txt_Recargo" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("recargo")))%>' CssClass="estandar-control Tablero Seleccion Monto ValoresTotales" Width="100px"></asp:TextBox>
                                                <asp:TextBox runat="server" ID="txt_RecargoAux" Text='<%# Eval("recargo") %>' CssClass="NoDisplay"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Prima INC" HeaderStyle-CssClass="Centro">
                                            <ItemTemplate>
                                                <asp:TextBox runat="server" ID="txt_PrimaINC" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("prima_inc")))%>' CssClass="estandar-control Tablero Seleccion Monto PrimaINC"  Width="100px"></asp:TextBox>
                                                <asp:TextBox runat="server" ID="txt_PrimaINCAux" Text='<%# Eval("prima_inc") %>' CssClass="NoDisplay"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Prima FHM" HeaderStyle-CssClass="columna-scroll Centro">
                                            <ItemTemplate>
                                                <asp:TextBox runat="server" ID="txt_PrimaFHM" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("prima_fhm")))%>' CssClass="estandar-control Tablero Seleccion Monto PrimaFHM"  Width="100px"></asp:TextBox>
                                                <asp:TextBox runat="server" ID="txt_PrimaFHMAux" Text='<%# Eval("prima_fhm") %>' CssClass="NoDisplay"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Prima TEV" HeaderStyle-CssClass="Centro">
                                            <ItemTemplate>
                                                <asp:TextBox runat="server" ID="txt_PrimaTEV" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("prima_tev")))%>' CssClass="estandar-control Tablero Seleccion Monto PrimaTEV" Width="100px"></asp:TextBox>
                                                <asp:TextBox runat="server" ID="txt_PrimaTEVAux" Text='<%# Eval("prima_tev") %>' CssClass="NoDisplay"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Prima RC" HeaderStyle-CssClass="Centro">
                                            <ItemTemplate>
                                                <asp:TextBox runat="server" ID="txt_PrimaRC" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("prima_rc")))%>' CssClass="estandar-control Tablero Seleccion Monto PrimaRC"  Width="100px"></asp:TextBox>
                                                <asp:TextBox runat="server" ID="txt_PrimaRCAux" Text='<%# Eval("prima_rc") %>' CssClass="NoDisplay"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Prima Casco" HeaderStyle-CssClass="columna-scroll Centro">
                                            <ItemTemplate>
                                                <asp:TextBox runat="server" ID="txt_PrimaCSC" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("prima_casco")))%>' CssClass="estandar-control Tablero Seleccion Monto PrimaCSC"  Width="100px"></asp:TextBox>
                                                <asp:TextBox runat="server" ID="txt_PrimaCSCAux" Text='<%# Eval("prima_casco") %>' CssClass="NoDisplay"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Prima Guerra" HeaderStyle-CssClass="Centro">
                                            <ItemTemplate>
                                                <asp:TextBox runat="server" ID="txt_PrimaGRA" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("prima_guerra")))%>' CssClass="estandar-control Tablero Seleccion Monto PrimaGRA" Width="100px"></asp:TextBox>
                                                <asp:TextBox runat="server" ID="txt_PrimaGRAAux" Text='<%# Eval("prima_guerra") %>' CssClass="NoDisplay"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="% Com. Age." HeaderStyle-CssClass="Centro">
                                            <ItemTemplate>
                                                <asp:TextBox runat="server" ID="txt_PrcComAge" Text='<%# String.Format("{0:#,#0.0000}", CDbl(Eval("prc_com_age")))%>' CssClass="estandar-control Tablero Seleccion Monto PrcComAge" Width="100px"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Com. Agente" HeaderStyle-CssClass="Centro">
                                            <ItemTemplate>
                                                <asp:TextBox runat="server" ID="txt_ComAge" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("com_agente")))%>' CssClass="estandar-control Tablero Seleccion Monto ComAge" Width="100px"></asp:TextBox>
                                                <asp:TextBox runat="server" ID="txt_ComAgeAux" Text='<%# Eval("com_agente") %>' CssClass="NoDisplay"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="% Com. Adi. Age." HeaderStyle-CssClass="Centro">
                                            <ItemTemplate>
                                                <asp:TextBox runat="server" ID="txt_PrcComAdiAge" Text='<%# String.Format("{0:#,#0.0000}", CDbl(Eval("prc_com_adi_age")))%>' CssClass="estandar-control Tablero Seleccion Monto PrcComAdiAge" Width="90px"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Com. Adi. Age." HeaderStyle-CssClass="Centro">
                                            <ItemTemplate>
                                                <asp:TextBox runat="server" ID="txt_ComAdiAge" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("com_adi_agente")))%>' CssClass="estandar-control Tablero Seleccion Monto ComAdiAge" Width="100px"></asp:TextBox>
                                                <asp:TextBox runat="server" ID="txt_ComAdiAgeAux" Text='<%# Eval("com_adi_agente") %>' CssClass="NoDisplay"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Cuota" HeaderStyle-CssClass="Centro">
                                            <ItemTemplate>
                                                <asp:TextBox runat="server" ID="txt_Cuota" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("cuota")))%>' Font-Bold="true" Enabled="false" BackColor="LightGray" CssClass="estandar-control Tablero Monto Cuota" Width="90px"></asp:TextBox>
                                                <asp:TextBox runat="server" ID="txt_CuotaAux" Text='<%# Eval("cuota") %>' CssClass="NoDisplay"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="% Costo GMX" HeaderStyle-CssClass="Centro">
                                            <ItemTemplate>
                                                <asp:TextBox runat="server" ID="txt_PrcFeeGMX" Text='<%# String.Format("{0:#,#0.0000}", CDbl(Eval("prc_FeeGMX")))%>' CssClass="estandar-control Tablero Seleccion Monto PrcFeeGMX" Width="100px"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Costo GMX" HeaderStyle-CssClass="Centro">
                                            <ItemTemplate>
                                                <asp:TextBox runat="server" ID="txt_FeeGMX" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("mnt_FeeGMX")))%>' CssClass="estandar-control Tablero Seleccion Monto FeeGMX" Width="100px"></asp:TextBox>
                                                <asp:TextBox runat="server" ID="txt_FeeGMXAux" Text='<%# Eval("mnt_FeeGMX") %>' CssClass="NoDisplay"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="% Com. Fac." HeaderStyle-CssClass="Centro">
                                            <ItemTemplate>
                                                <asp:TextBox runat="server" ID="txt_PrcComFac" Text='<%# String.Format("{0:#,#0.0000}", CDbl(Eval("prc_ComFac")))%>'  CssClass="estandar-control Tablero Seleccion Monto PrcComFac" Enabled="false" Width="100px"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Com. Fac." HeaderStyle-CssClass="Centro">
                                            <ItemTemplate> 
                                                <asp:TextBox runat="server" ID="txt_ComFac" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("mnt_ComFac")))%>' CssClass="estandar-control Tablero Seleccion Monto ComFac" Enabled="false" Width="100px"></asp:TextBox>
                                                <asp:TextBox runat="server" ID="txt_ComFacAux" Text='<%# Eval("mnt_ComFac") %>' CssClass="NoDisplay"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <HeaderStyle CssClass="GridviewScrollHeader" /> 
                                    <RowStyle CssClass="GridviewScrollItem" /> 
                                </asp:GridView>
                            </div> 

                            <div style="width:100%;  text-align:right">
                                <asp:LinkButton id="btn_AddRiesgo" runat="server" class="btn botones" data-toggle="modal" data-target="#Riesgos">
                                    <span>
                                        <img class="btn-añadir"/>
                                        Añadir
                                    </span>
                                </asp:LinkButton>

                                <asp:LinkButton id="btn_RemoveRiesgo" runat="server" class="btn botones">
                                    <span>
                                        <img class="btn-quitar"/>
                                        Quitar
                                    </span>
                                </asp:LinkButton>
                            </div>

                        </div>
                    </div>
                </ContentTemplate>
              </asp:UpdatePanel>          
    </div>

    <div id="Riesgos" style="width:90%;" class="modal-poliza" >
            <asp:UpdatePanel runat="server" ID="upRiesgos" >
                <ContentTemplate>
                    <div class="cuadro-titulo" style="height:30px">
                        <div class="row" >
                            <div class="col-md-1">
                                <input type="image" src="../Images/contraer_mini_inv.png" id="coVentana4" class="contraer"  />
                                <input type="image" src="../Images/expander_mini_inv.png"   id="exVentana4" class="expandir"  />
                            </div>
                            <div class="col-md-10">
                                Selección de Riesgos
                            </div>
                            <div class="col-md-1">
                                <button type="button" class="close"  data-dismiss="modal">&times;</button>
                            </div>
                        </div>
                    </div>


                    <div class="panel-subcontenido ventana4" style="height:500px; overflow-x:hidden;">
                        <div class="clear padding5"></div>
                        <div class="row">
                            <div class="col-md-5"> 
                                <div class="cuadro-subtitulo-grid">
                                    RAMOS - SUBRAMOS
                                </div>                
                                <asp:HiddenField runat="server" ID="hid_Ramo" Value="0" />
                                <asp:HiddenField runat="server" ID="hid_SelRam" Value=""/>
                                <asp:Panel runat="server" ID="pnl_RamoSbr" Width="100%" ScrollBars="None">
                                    <asp:GridView runat="server" ID="gvd_RamoSbr" AutoGenerateColumns="false" 
                                                CssClass="grid-view" ShowHeader="false" BackColor="White"
                                                GridLines="None"  ShowHeaderWhenEmpty="true">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Ramo - Subramo">
                                                <ItemTemplate>
                                                    <asp:TextBox runat="server" ID="txt_SelRam" CssClass="NoDisplay" Text="0"></asp:TextBox>
                                                    <div id="div_Ramos" class="cuadro-postit-detalle Seleccion">
                                                        <table>
                                                            <tr>
                                                                <td><asp:Label runat="server" ID="lbl_ClaveRamo" Text='<%# Eval("Clave") %>' Width="40px"  CssClass="Centro Tablero" ></asp:Label></td>
                                                                <td><asp:Label runat="server" ID="lbl_DescRamo" Text='<%# Eval("Descripcion") %>' Width="240px"  CssClass="Tablero Descripcion" ></asp:Label></td>
                                                                <td><asp:Label runat="server" ID="lbl_ClaveSubramo" Text='<%# Eval("OcultaCampo1") %>'  Width="40px"   CssClass="Centro Tablero" ></asp:Label></td>
                                                                <td><asp:Label runat="server" ID="lbl_DescSubramo" Text='<%# Eval("OcultaCampo2") %>' Width="130px"   CssClass="Tablero Descripcion" ></asp:Label></td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                    <div class="clear padding3"></div>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <div id="div_Seccion" class="Detalle NoDisplay">
                                                        <asp:ImageButton ID="btn_Detalle" runat="server" ImageUrl="~/Images/blue_arrow_mini.png" CommandName="Seccion" />
                                                    </div>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </asp:Panel>
                            </div>
                            <div class="col-md-3"> 
                                <div class="cuadro-subtitulo-grid">
                                    SECCIONES
                                </div>        
                                <asp:HiddenField runat="server" ID="hid_Seccion" Value="0" /> 
                                <asp:HiddenField runat="server" ID="hid_SelRie" Value=""/>            
                                <asp:Panel runat="server" ID="pnlSeccion" Width="100%" ScrollBars="None">
                                    <asp:GridView runat="server" ID="gvd_Seccion" AutoGenerateColumns="false" 
                                                CssClass="grid-view" ShowHeader="false" BackColor="White"
                                                GridLines="None"  ShowHeaderWhenEmpty="true">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Seccion">
                                                <ItemTemplate>
                                                    <asp:TextBox runat="server" ID="txt_SelRie" CssClass="NoDisplay" Text="0"></asp:TextBox>
                                                    <div id="div_Seccion" runat="server" class="cuadro-postit-detalle Seleccion" style="width:100%">
                                                        <table>
                                                            <tr>
                                                                <td><asp:Label runat="server" ID="lbl_Clave" Text='<%# Eval("Clave") %>' Width="40px" CssClass="Centro Tablero" ></asp:Label></td>
                                                                <td><asp:Label runat="server" ID="lbl_Descripcion" Text='<%# Eval("Descripcion") %>' Width="220px" CssClass="Tablero" ></asp:Label></td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                    <div class="clear padding1"></div>
                                                    <div class="clear padding1"></div>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <div id="div_Cobertura" runat="server" class="Detalle NoDisplay">
                                                        <asp:ImageButton ID="btn_Detalle" runat="server" ImageUrl="~/Images/blue_arrow_mini.png" CommandName="Cobertura" />
                                                    </div>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </asp:Panel>
                            </div>
                            <div class="col-md-4"> 
                                <div class="cuadro-subtitulo-grid">
                                    COBERTURAS
                                </div>  
                                <asp:HiddenField runat="server" ID="hid_SelCob" Value=""/>                           
                                <asp:Panel runat="server" ID="pnlCobertura" Width="100%" Height="420px" ScrollBars="Vertical">
                                    <asp:GridView runat="server" ID="gvd_Cobertura" AutoGenerateColumns="false" 
                                                CssClass="grid-view" ShowHeader="false" BackColor="White"
                                                GridLines="None"  ShowHeaderWhenEmpty="true">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Cobertura">
                                                <ItemTemplate>
                                                    <asp:TextBox runat="server" ID="txt_SelCob" CssClass="NoDisplay" Text="0"></asp:TextBox>
                                                    <div id="div_Cobertura" class="cuadro-postit-detalle Seleccion" style="width:100%">
                                                        <table>
                                                            <tr>
                                                                <td><asp:Label runat="server" ID="lbl_Clave" Text='<%# Eval("Clave") %>' Width="40px" CssClass="Centro Tablero" ></asp:Label></td>
                                                                <td><asp:Label runat="server" ID="lbl_Descripcion" Text='<%# Eval("Descripcion") %>' Width="340px" CssClass="Tablero" ></asp:Label></td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                    <div class="clear padding1"></div>
                                                    <div class="clear padding1"></div>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </asp:Panel>
                            </div>
                        </div>
                           
                        <div class="clear padding5"></div>

                        <div style="width:98.5%;  text-align:right; border:2px solid gray; border-width: 1px 0 0 0;">
                            <asp:LinkButton id="btn_AgregaFila" runat="server" class="btn botones">
                                <span>
                                    <img class="btn-añadir"/>
                                    Agregar
                                </span>
                            </asp:LinkButton>
                        </div> 
                        <div class="clear padding3"></div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
</asp:Content>

