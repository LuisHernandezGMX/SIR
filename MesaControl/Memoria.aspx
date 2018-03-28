<%@ Page Title="" Language="VB" MasterPageFile="~/Pages/SiteMaster.master" AutoEventWireup="false" CodeFile="Memoria.aspx.vb" Inherits="MesaControl_Memoria" %>

<asp:Content ID="Content2" ContentPlaceHolderID="cph_principal" Runat="Server">
    <asp:HiddenField runat="server" ID="hid_Ventanas" Value="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|1|0|" />
    <script src="../Scripts/Memoria.js"></script>

    <script type="text/javascript"> 
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(PageLoadMemoria);
    </script> 

    <div class="zona-principal">



        <table>
            <tr>
                <td>
                    <div class="panel-seccion-fija Encabezado">
                        <div class="ventana0">
                                <asp:UpdatePanel runat="server" ID="upGenerales">
                                    <ContentTemplate>
                                        <asp:HiddenField runat="server" ID="hid_Operacion" Value="0" />
                                        <div class="cuadro-titulo">
                                            Datos Generales
                                        </div>
                                        <div class="clear padding4"></div>
                                        <div class="row">
                                            <div class="col-md-9">
                                                <asp:label runat="server" class="col-md-1  etiqueta-control" Width="16%">Prospecto</asp:label>
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
                                            <div class="col-md-12">
                                                <asp:label runat="server" class="col-md-1  etiqueta-control" Width="12%">Domicilio Fiscal</asp:label>
                                                <asp:TextBox runat="server" ID="txt_DomicilioFiscal" CssClass="estandar-control Seleccion Tablero" PlaceHolder="Domicilio Fiscal Prospecto" Width="87.5%"></asp:TextBox> 
                                            </div>                                        
                                        </div>
                                        <div class="clear padding4"></div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <asp:label runat="server" class="col-md-1  etiqueta-control" Width="12%">Ubicación Riesgo</asp:label>
                                                <asp:TextBox runat="server" ID="txt_DomicilioRiesgo" CssClass="estandar-control Seleccion Tablero" PlaceHolder="Domicilio del Riesgo" Width="87.5%"></asp:TextBox> 
                                            </div>
                                        </div>
                                        <div class="clear padding4"></div>
<%--                                        <div class="row">
                                            <div class="col-md-12">
                                                <asp:label runat="server" class="col-md-1  etiqueta-control" Width="12%">Giro</asp:label>
                                                <asp:TextBox runat="server" ID="txt_ClaveGiro" CssClass="NoDisplay"></asp:TextBox>
                                                <asp:TextBox runat="server" ID="txt_SearchGiro" CssClass="estandar-control Tablero Seleccion" PlaceHolder="Giro GMX" Width="87.5%"></asp:TextBox> 
                                            </div>
                                        </div>
                                        <div class="clear padding4"></div>--%>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <asp:label runat="server" class="col-md-1  etiqueta-control" Width="12%">Giro</asp:label>
                                                <asp:TextBox runat="server" ID="txt_GiroAsegurado" CssClass="estandar-control Tablero Seleccion" PlaceHolder="Giro Especifico Prospecto" Width="87.5%"></asp:TextBox> 
                                            </div>
                                        </div>
                                        <div class="clear padding4"></div>
                                        <div class="row">
                                            <div class="col-md-4">
                                                <asp:label runat="server" class="col-md-1 etiqueta-control" Width="38%">Moneda</asp:label>
                                                <asp:DropDownList runat="server" ID="ddl_Moneda" CssClass="estandar-control Tablero Moneda" Width="58%"></asp:DropDownList>
                                            </div>
                                            <div class="col-md-4">
                                                <asp:label runat="server" class="col-md-1  etiqueta-control" Width="38%">Tipo End.</asp:label>
                                                <asp:TextBox runat="server" ID="txt_ClaveGre" CssClass="NoDisplay"></asp:TextBox>
                                                <asp:TextBox runat="server" ID="txt_ClaveGreAux" CssClass="NoDisplay"></asp:TextBox>
                                                <asp:TextBox runat="server" ID="txt_SearchGre" CssClass="estandar-control Tablero Seleccion" PlaceHolder="Tipo de Endoso" Width="58%"></asp:TextBox>
                                            </div>
                                            <div class="col-md-4">
                                                <asp:label runat="server" class="col-md-1 etiqueta-control" Width="38%">Descripción</asp:label>
                                                <asp:TextBox runat="server" ID="txt_ClaveTte" CssClass="NoDisplay"></asp:TextBox>
                                                <asp:TextBox runat="server" ID="txt_SearchTte" CssClass="estandar-control Tablero Seleccion" PlaceHolder="Descripción del Endoso" Width="60%"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="clear padding4"></div>
                                        <div class="row">
                                            <div class="col-md-4">
                                                <asp:label runat="server" class="col-md-1  etiqueta-control" Width="38%">Inicio Vig. Orig.</asp:label>
                                                <asp:TextBox runat="server" ID="txt_VigIniOri" CssClass="estandar-control Tablero Fecha Seleccion Derecha" PlaceHolder="dia/mes/año"  TextMode="Date" Width="58%"></asp:TextBox>
                                            </div>
                                            <div class="col-md-4">
                                                <asp:label runat="server" class="col-md-1  etiqueta-control" Width="38%">Fin Vig. Orig.</asp:label>
                                                <asp:TextBox runat="server" ID="txt_VigFinOri" CssClass="estandar-control Tablero Fecha Seleccion Derecha" PlaceHolder="dia/mes/año" TextMode="Date" Width="58%"></asp:TextBox>
                                            </div>
                                            <div class="col-md-4">
                                                <asp:label runat="server" class="col-md-1  etiqueta-control" Width="38%">Dias Vigencia</asp:label>
                                                <asp:TextBox runat="server" ID="txt_DiasVigOri" CssClass="estandar-control Tablero Seleccion Derecha" Width="60%"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="clear padding4"></div>
                                        <div class="row">
                                            <div class="col-md-4">
                                                <asp:label runat="server" class="col-md-1  etiqueta-control" Width="38%">Inicio Vig. Mov.</asp:label>
                                                <asp:TextBox runat="server" ID="txt_VigIniMov" CssClass="estandar-control Tablero Fecha Seleccion Derecha" PlaceHolder="dia/mes/año"  TextMode="Date" Width="58%"></asp:TextBox>
                                            </div>
                                            <div class="col-md-4">
                                                <asp:label runat="server" class="col-md-1  etiqueta-control" Width="38%">Fin Vig. Mov.</asp:label>
                                                <asp:TextBox runat="server" ID="txt_VigFinMov" CssClass="estandar-control Tablero Fecha Seleccion Derecha" PlaceHolder="dia/mes/año" TextMode="Date" Width="58%"></asp:TextBox>
                                            </div>
                                            <div class="col-md-4">
                                                <asp:label runat="server" class="col-md-1  etiqueta-control" Width="38%">Dias Vigencia</asp:label>
                                                <asp:TextBox runat="server" ID="txt_DiasVigMov" CssClass="estandar-control Tablero Seleccion Derecha" Width="60%"></asp:TextBox>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>

                                <div class="clear padding4"></div>

                                <asp:UpdatePanel runat="server" ID="upPoliza">
                                    <ContentTemplate>
                                        <div class="panel-seccion">
                                            <div class="cuadro-titulo">
                                            </div>
                                            <div class="ventana2">
                                                <div class="clear padding4"></div>
                                                <div class="row">
                                                    <div class="col-md-4">
                                                        <asp:label runat="server" class="col-md-1  etiqueta-control" Width="30%">Regional</asp:label>
                                                        <asp:TextBox runat="server" ID="txt_ClaveOfi" CssClass="col-md-1 estandar-control Tablero Seleccion cod Centro"  PlaceHolder="Id" Width="15%"></asp:TextBox>
                                                        <asp:TextBox runat="server" ID="txt_SearchOfi" CssClass="estandar-control Tablero Seleccion" PlaceHolder="Oficina Regional" Width="52.5%"></asp:TextBox>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <asp:label runat="server" class="col-md-1 etiqueta-control" Width="30%">Tipo Age.</asp:label>
                                                        <asp:TextBox runat="server" ID="txt_ClaveTag" CssClass="col-md-1 estandar-control Tablero Seleccion cod Centro" Enabled="false" PlaceHolder="Id" Width="15%"></asp:TextBox>
                                                        <asp:TextBox runat="server" ID="txt_ClaveTagAux" CssClass="NoDisplay"></asp:TextBox>
                                                        <asp:TextBox runat="server" ID="txt_SearchTag" CssClass="estandar-control Tablero Seleccion" PlaceHolder="Tipo de Agente" Width="55%"></asp:TextBox>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <asp:label runat="server" class="col-md-1  etiqueta-control" Width="30%">Agente</asp:label>
                                                        <asp:TextBox runat="server" ID="txt_ClaveAge" CssClass="col-md-1 estandar-control Tablero Seleccion cod Centro" Enabled="false" PlaceHolder="Id" Width="20%"></asp:TextBox>
                                                        <asp:TextBox runat="server" ID="txt_SearchAge" CssClass="estandar-control Tablero Seleccion" PlaceHolder="Nombre Agente" Width="48%"></asp:TextBox> 
                                                    </div>
                                                </div>
                                                <div class="clear padding4"></div>
                                                <div class="row">
                                                    <div class="col-md-4">
                                                        <asp:label runat="server" class="col-md-1 etiqueta-control" Width="30%">Suscriptor</asp:label>
                                                        <asp:TextBox runat="server" ID="txt_ClaveSusc" CssClass="col-md-1 estandar-control Tablero Seleccion Centro" PlaceHolder="Id" Enabled="false" Width="15%"></asp:TextBox>
                                                        <asp:TextBox runat="server" ID="txt_SearchSusc" CssClass="estandar-control Tablero Seleccion" PlaceHolder="Nombre Suscriptor" Width="52.5%"></asp:TextBox>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <asp:label runat="server" class="col-md-1 etiqueta-control" Width="30%">Forma de Pago</asp:label>
                                                        <asp:DropDownList runat="server" ID="ddl_FormaPago" CssClass="estandar-control Tablero Moneda" Width="70%"></asp:DropDownList>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <asp:label runat="server" class="col-md-1 etiqueta-control" Width="30%">Ubicaciones</asp:label>
                                                        <asp:TextBox runat="server" ID="txt_Ubicaciones" CssClass="estandar-control Tablero Monto"  Width="68%" PlaceHolder="Número de Ubicaciones"></asp:TextBox>  
                                                    </div>
                                                </div>
                                                <div class="clear padding2"></div>
                                                <div class="row">
                                                    <div class="col-md-4">
                                                        <div style="border-right:inset;border-bottom:inset;border-top:inset;border-color:#003A5D;border-width:1px;">
                                                            <div class="clear padding2"></div>
                                                            <asp:label runat="server" class="col-md-1  etiqueta-control" Width="30%">Sucursal</asp:label>
                                                            <asp:TextBox runat="server" ID="txt_ClaveSuc" CssClass="col-md-1 estandar-control Tablero cod Seleccion"  Width="15%" PlaceHolder="Id"></asp:TextBox>
                                                            <asp:TextBox runat="server" ID="txt_SearchSuc" CssClass="estandar-control Tablero Seleccion" Width="52.5%" PlaceHolder="Sucursal de la Poliza"></asp:TextBox>
                                                            <div class="clear padding4"></div>
                                                            <asp:label runat="server" class="col-md-1  etiqueta-control" Width="30%">Producto</asp:label>
                                                            <asp:TextBox runat="server" ID="txt_ClaveRam" CssClass="col-md-1 estandar-control Tablero Centro cod Seleccion" Width="15%" PlaceHolder="Id"></asp:TextBox>    
                                                            <asp:TextBox runat="server" ID="txt_SearchRam" CssClass="estandar-control Tablero Seleccion" Width="52.5%" PlaceHolder="Ramo de la Póliza"></asp:TextBox>   
                                                            <div class="clear padding4"></div>
                                                            <asp:label runat="server" class="col-md-1  etiqueta-control" Width="30%" ToolTip="Número de Póliza - Sufijo - Endoso">Poliza</asp:label>
                                                            <asp:TextBox runat="server" ID="txt_NroPoliza" CssClass="col-md-1 estandar-control Tablero Centro nro_pol Seleccion"  Width="25%" ToolTip="Número de Póliza" PlaceHolder="No. Poliza"></asp:TextBox>       
                                                            <asp:TextBox runat="server" ID="txt_Sufijo" CssClass="col-md-1 estandar-control Tablero Centro cod Seleccion"  Width="18%" ToolTip="Sufijo" PlaceHolder="Sufijo"></asp:TextBox>       
                                                            <asp:TextBox runat="server" ID="txt_Endoso" CssClass="col-md-1 estandar-control Tablero Centro cod Seleccion"  Width="20%" ToolTip="Número de Endoso" PlaceHolder="Endoso"></asp:TextBox>
                                                            <asp:ImageButton runat="server" ID="btn_InfoRiesgos"  ImageUrl="~/Images/buscar_mini_inv.png" Height="17" Width="17" />
                                                        </div>    
                                                    </div>                                
                                                    <div class="col-md-8">
                                                        
                                                    </div>
                                                    <div class="col-md-8">
                                                        <div class="clear padding4"></div>
                                                        
                                                    </div>
                                                    <div class="col-md-8">
                                                        <asp:label runat="server" class="col-md-1  etiqueta-control" Width="14.5%">Observaciones</asp:label>
                                                        <asp:TextBox runat="server" ID="txt_Notas" CssClass="estandar-control Tablero Seleccion ObservacionesGral" Width="84.5%" Height="65px" TextMode="MultiLine" PlaceHolder="Observaciones"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>      
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                        </div>
                    </div>
                </td>
            </tr>
        </table>
      
        <div class="clear padding4"></div>
        
        <div class="cuadro-titulo">
            <asp:Label runat="server" Text="Datos del Riesgo" Width="65%"></asp:Label>                  
        </div>

        <div class="tab-memoria">
            <asp:UpdatePanel runat="server" ID="upRiesgo">
                <ContentTemplate>
                    <div class="panel-seccion">
                        
                        <div class="ventana1">
                            <asp:HiddenField runat="server" ID="hid_Tamaño" Value="200|200|200|200" />
                            <asp:HiddenField runat="server" ID="hid_Ajuste" Value="0|0|0|0" />
                            <div style="width:100%;overflow-x:scroll;">
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
                                                <asp:RadioButtonList runat="server" ID="opt_1erRiesgo" CssClass="Centro" RepeatDirection="Horizontal" Width="80px">
                                                    <asp:ListItem Text="Si" Selected="True" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="No" Selected="False" Value="0" ></asp:ListItem>
                                                </asp:RadioButtonList>
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
                    <div class="clear padding50"></div>
                </ContentTemplate>
            </asp:UpdatePanel>          
        </div>
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

        <div id="PolizasAsegurado" style="width:90%;" class="modal-poliza" >
            <asp:UpdatePanel runat="server" ID="upPolizas" >
                <ContentTemplate>
                    <div class="cuadro-titulo-flotante" style="height:30px">
                        <div class="row" >
                            <div class="col-md-1">
                                <input type="image" src="../Images/contraer_mini_inv.png" id="coVentana13" class="contraer"  />
                                <input type="image" src="../Images/expander_mini_inv.png"   id="exVentana13" class="expandir"  />
                            </div>
                            <div class="col-md-9">
                                <asp:label runat="server">[Pólizas del Asegurado]</asp:label>
                            </div>
                        </div>
                    </div>
                    <div class="panel-subcontenido ventana13">
                        <asp:Panel runat="server" ID="pnl_PolizasAsegurado" Width="100%" Height="300px" ScrollBars="Both">
                            <asp:GridView runat="server" ID="gvd_AsegPolizas" AutoGenerateColumns="false" AllowPaging="true" PageSize="50"
                                        CssClass="grid-view" HeaderStyle-CssClass="header" AlternatingRowStyle-CssClass="altern"
                                        GridLines="Horizontal"  ShowHeaderWhenEmpty="true" DataKeyNames="id_pv">
                                <Columns>
                                    <asp:TemplateField  HeaderStyle-CssClass="Centro">
                                        <ItemTemplate>
                                            <asp:CheckBox runat="server" ID="chk_Sel" CssClass="Select" onclick="fn_CambioSeleccion('gvd_AsegPolizas',this,'Unica','chk_Sel')" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="" HeaderStyle-CssClass="Centro">
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="txt_codSuc" Text='<%# Eval("cod_suc") %>' CssClass="estandar-control Tablero Centro" Enabled="false" Width="30px"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Sucursal" HeaderStyle-CssClass="Centro">
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="txt_Sucursal" Text='<%# Eval("sucursal") %>' CssClass="estandar-control Tablero" Enabled="false" Width="120px"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="" HeaderStyle-CssClass="Centro">
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="txt_codRamo" Text='<%# Eval("cod_ramo") %>' CssClass="estandar-control Tablero Centro" Enabled="false" Width="40px"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Ramo" HeaderStyle-CssClass="Centro">
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="txt_Ramo" Text='<%# Eval("ramo") %>' CssClass="estandar-control Tablero" Enabled="false" Width="200px"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Número" HeaderStyle-CssClass="Centro">
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="txt_nroPol" Text='<%# Eval("nro_pol") %>' CssClass="estandar-control Tablero Centro" Enabled="false" Width="50px"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Sufijo" HeaderStyle-CssClass="Centro">
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="txt_Sufijo" Text='<%# Eval("aaaa_endoso") %>' CssClass="estandar-control Tablero Centro" Enabled="false" Width="50px"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Asegurado" HeaderStyle-CssClass="Centro">
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="txt_Asegurado" Text='<%# Eval("asegurado") %>' CssClass="estandar-control Tablero" Enabled="false" Width="350px"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Tipo Endoso" HeaderStyle-CssClass="Centro">
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="txt_TipoEndoso" Text='<%# Eval("grupo_endoso") %>' CssClass="estandar-control Tablero" Enabled="false" Width="200px"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Descripción" HeaderStyle-CssClass="Centro">
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="txt_Descripcion" Text='<%# Eval("tipo_endoso") %>' CssClass="estandar-control Tablero" Enabled="false" Width="200px"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Vigencia Desde" HeaderStyle-CssClass="Centro">
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="txt_IniVig" Text='<%# Eval("fec_vig_desde") %>' CssClass="estandar-control Tablero Centro" Enabled="false" Width="60px"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Vigencia Hasta" HeaderStyle-CssClass="Centro">
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="txt_FinVig" Text='<%# Eval("fec_vig_hasta") %>' CssClass="estandar-control Tablero Centro" Enabled="false" Width="60px"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Emisión" HeaderStyle-CssClass="Centro">
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="txt_Emision" Text='<%# Eval("fec_emi") %>' CssClass="estandar-control Tablero Centro" Enabled="false" Width="60px"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </asp:Panel>
                        <div style="width:100%;  text-align:right">
                            <asp:LinkButton id="btn_AceptarPol" runat="server" class="btn botones">
                                <span>
                                    <img class="btn-añadir"/>
                                    Aceptar
                                </span>
                            </asp:LinkButton>
                            <asp:LinkButton id="btn_CerraPol" runat="server" class="btn botones">
                                <span>
                                    <img class="btn-cancelar"/>
                                    Cerrar
                                </span>
                            </asp:LinkButton>
                        </div>
                        <div class="clear padding5"></div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>

        <div id="RiesgosPoliza" style="width:90%;" class="modal-poliza">
            <asp:UpdatePanel runat="server" ID="upRiesgosPoliza" >
                <ContentTemplate>
                    <div class="cuadro-titulo-flotante" style="height:30px">
                                <input type="image" src="../Images/contraer_mini_inv.png" id="coVentana14" class="contraer"  />
                                <input type="image" src="../Images/expander_mini_inv.png"   id="exVentana14" class="expandir"  />
                                <asp:label runat="server">[Riesgos de la Póliza]</asp:label>
                                <asp:label runat="server" ID="lbl_RiesgoPoliza"></asp:label>
                    </div>
                    <div class="panel-subcontenido ventana14">
                        <asp:Panel runat="server" ID="pnlRiesgosPoliza" Width="100%" Height="500px" ScrollBars="Both">
                            <asp:GridView runat="server" ID="gvd_RiesgosPoliza" AutoGenerateColumns="false" AllowPaging="true" PageSize="50"
                                        CssClass="grid-view" HeaderStyle-CssClass="header" AlternatingRowStyle-CssClass="altern"
                                        GridLines="Horizontal"  ShowHeaderWhenEmpty="true" DataKeyNames="id">
                                <Columns>
                                    <asp:TemplateField HeaderText="" HeaderStyle-CssClass="Centro" ItemStyle-CssClass="Centrado">
                                        <HeaderTemplate>
                                            <asp:CheckBox runat="server" ID="chk_SelAll" Width="20px" onclick="fn_SeleccionTodos('gvd_RiesgosPoliza', this, 'chk_Sel')" /> 
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox runat="server" ID="chk_Sel" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Poliza" HeaderStyle-CssClass="Centro">
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="txt_Poliza" Text='<%# Eval("poliza") %>' Enabled="false" CssClass="estandar-control Tablero Centro" Width="90px"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Inciso" HeaderStyle-CssClass="Centrado Centro">
                                        <HeaderTemplate>
                                            <asp:label runat="server" class="col-md-1" Width="65px">Inciso</asp:label>
                                            <asp:DropDownList runat="server" ID="ddl_Ubicacion" CssClass="estandar-control Tablero Centro" AutoPostBack="true" OnSelectedIndexChanged="ddl_Ubicacion_SelectedIndexChanged" Width="45px"></asp:DropDownList>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="txt_Ubicacion" Text='<%# Eval("cod_item") %>' Enabled="false" CssClass="estandar-control Tablero Centro" Width="110px"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Ubicación" HeaderStyle-CssClass="Centro">
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="txt_SearchUbicacion" Text='<%# Eval("ubicacion") %>' CssClass="estandar-control Tablero" Enabled="false" Width="200px"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="cod" HeaderStyle-CssClass="Centro">
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="txt_ClaveRamo" Text='<%# Eval("cod_ramo") %>' Enabled="false" CssClass="estandar-control Tablero Centro" Width="50px"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Ramo" HeaderStyle-CssClass="Centro">
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="txt_SearchRamo" Text='<%# Eval("ramo_desc") %>' CssClass="estandar-control Tablero" Enabled="false" Width="200px"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="cod" HeaderStyle-CssClass="Centro">
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="txt_ClaveSubRamo" Text='<%# Eval("cod_subramo") %>' Enabled="false" CssClass="estandar-control Tablero Centro" Width="40px"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Subramo" HeaderStyle-CssClass="Centro">
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="txt_SearchSubramo" Text='<%# Eval("subramo_desc") %>' CssClass="estandar-control Tablero" Enabled="false" Width="150px"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="cod" HeaderStyle-CssClass="Centro">
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="txt_ClaveSeccion" Text='<%# Eval("cod_riesgo") %>' Enabled="false" CssClass="estandar-control Tablero Centro" Width="40px"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Sección" HeaderStyle-CssClass="Centro">
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="txt_SearchSeccion" Text='<%# Eval("riesgo_desc") %>' CssClass="estandar-control Tablero" Enabled="false" Width="200px"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="cod" HeaderStyle-CssClass="Centro">
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="txt_ClaveCobertura" Text='<%# Eval("cod_ind_cob") %>' Enabled="false" CssClass="estandar-control Tablero Centro" Width="50px"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Cobertura" HeaderStyle-CssClass="Centro">
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="txt_SearchCobertura" Text='<%# Eval("cobertura_desc") %>' CssClass="estandar-control Tablero" Enabled="false" Width="200px"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Acumula Suma" HeaderStyle-CssClass="Centro" ItemStyle-CssClass="Centro">
                                        <ItemTemplate>
                                            <asp:CheckBox runat="server" ID="chk_AdicionalSuma" Checked='<%# Eval("sn_adicional_suma") %>' Enabled="false" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Lím. Max. Resp" HeaderStyle-CssClass="Centro">
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="txt_LimResp" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("suma_asegurada")))%>' CssClass="estandar-control Tablero Monto" Enabled="false" Width="100px"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Acumula Prima" HeaderStyle-CssClass="Centro" ItemStyle-CssClass="Centro">
                                        <ItemTemplate>
                                            <asp:CheckBox runat="server" ID="chk_AdicionalPrima" Checked='<%# Eval("sn_adicional_prima") %>' Enabled="false" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Prima Neta" HeaderStyle-CssClass="Centro">
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="txt_PrimaNeta" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("prima_neta")))%>' CssClass="estandar-control Tablero Monto" Enabled="false" Width="100px"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="% Factor" HeaderStyle-CssClass="Centro">
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="txt_PrcFactor" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("pje_factor")))%>' CssClass="estandar-control Tablero Monto" Enabled="false" Width="100px"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="% Tasa" HeaderStyle-CssClass="Centro">
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="txt_PrcTasa" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("pje_tasa")))%>' CssClass="estandar-control Tablero Monto" Enabled="false" Width="100px"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Prima INC" HeaderStyle-CssClass="Centro">
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="txt_PrimaINC" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("prima_inc")))%>' Enabled="false" CssClass="estandar-control Tablero Monto" Width="100px"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Prima FHM" HeaderStyle-CssClass="Centro">
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="txt_PrimaFHM" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("prima_fhm")))%>' Enabled="false" CssClass="estandar-control Tablero Monto" Width="100px"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Prima TEV" HeaderStyle-CssClass="Centro">
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="txt_PrimaTEV" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("prima_tev")))%>' Enabled="false" CssClass="estandar-control Tablero Monto" Width="100px"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Prima RC" HeaderStyle-CssClass="Centro">
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="txt_PrimaRC" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("prima_rc")))%>' Enabled="false"  CssClass="estandar-control Tablero Monto"  Width="100px"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Prima Casco" HeaderStyle-CssClass="Centro">
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="txt_PrimaCSC" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("prima_casco")))%>' Enabled="false"  CssClass="estandar-control Tablero Monto"  Width="100px"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Prima Guerra" HeaderStyle-CssClass="Centro">
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="txt_PrimaGRA" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("prima_guerra")))%>' Enabled="false"  CssClass="estandar-control Tablero Monto" Width="100px"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </asp:Panel>
                        <div style="width:100%;  text-align:right">
                            <asp:LinkButton id="btn_AceptarRie" runat="server" class="btn botones ModalEspera">
                                <span>
                                    <img class="btn-añadir"/>
                                    Aceptar
                                </span>
                            </asp:LinkButton>
                            <asp:LinkButton id="btn_CerrarRie" runat="server" class="btn botones">
                                <span>
                                    <img class="btn-cancelar"/>
                                    Cerrar
                                </span>
                            </asp:LinkButton>
                        </div>
                        <div class="clear padding5"></div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
</asp:Content>

