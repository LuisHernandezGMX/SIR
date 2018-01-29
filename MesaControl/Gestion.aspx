<%@ Page Title="" Language="VB" MasterPageFile="~/Pages/SiteMaster.master" AutoEventWireup="false" CodeFile="Gestion.aspx.vb" Inherits="MesaControl_Gestion" %>
<%@ MasterType VirtualPath="~/Pages/SiteMaster.master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="cph_principal" Runat="Server" >
    <asp:HiddenField runat="server" ID="hid_Ventanas" Value="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|1|0|" />
    <script src="../Scripts/MesaControl.js"></script>

     <script type="text/javascript"> 
         Sys.WebForms.PageRequestManager.getInstance().add_endRequest(PageLoadMesaControl);
    </script> 

    <div class="zona-principal">

        

        <table>
            <tr>
                <td>
                    <div class="panel-seccion-fija Encabezado">
                        <div class="ventana15">
                                <asp:UpdatePanel runat="server" ID="upGenerales">
                                    <ContentTemplate>
                                        <asp:HiddenField runat="server" ID="hid_Operacion" Value="0" />
                                        <div class="cuadro-titulo">
                                            Datos Generales del Negocio / Cliente
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
                        <ul class="nav nav-tabs">
                            <li class="active"><a data-toggle="tab" href="#menu1" class="Generales">Datos Generales</a></li>
                            <li><a data-toggle="tab" href="#menu2" class="Colocacion">Colocación</a></li>
                            <li><a data-toggle="tab" href="#menu3" class="Resumen">Resumen</a></li>
                            <asp:HiddenField runat="server" ID="hid_Pestaña" Value="0" />
                        </ul>
                    </div>
                </td>
            </tr>
        </table>
        

<%--        <div class="clear padding100"></div>
        <div class="clear padding30"></div>
        <div class="clear padding5"></div>
        <div class="clear padding3"></div>--%>

        <div class="tab-content">
          <div id="menu1" class="tab-pane fade in active">
              <asp:UpdatePanel runat="server" ID="upPoliza">
                <ContentTemplate>
                    <div class="panel-seccion">
                        <div class="cuadro-titulo">
                            <input type="image" src="../Images/contraer_mini_inv.png" id="coVentana2" class="contraer"  />
                            <input type="image" src="../Images/expander_mini_inv.png"   id="exVentana2" class="expandir"  />
                            Datos de la Póliza
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
                                      <asp:label runat="server" class="col-md-1  etiqueta-control" Width="30%">Tipo End.</asp:label>
                                      <asp:TextBox runat="server" ID="txt_ClaveGre" CssClass="NoDisplay"></asp:TextBox>
                                      <asp:TextBox runat="server" ID="txt_ClaveGreAux" CssClass="NoDisplay"></asp:TextBox>
                                      <asp:TextBox runat="server" ID="txt_SearchGre" CssClass="estandar-control Tablero Seleccion" PlaceHolder="Tipo de Endoso" Width="70%"></asp:TextBox>
                                 </div>
                                 <div class="col-md-4">
                                     <asp:label runat="server" class="col-md-1 etiqueta-control" Width="30%">Descripción</asp:label>
                                     <asp:TextBox runat="server" ID="txt_ClaveTte" CssClass="NoDisplay"></asp:TextBox>
                                     <asp:TextBox runat="server" ID="txt_SearchTte" CssClass="estandar-control Tablero Seleccion" PlaceHolder="Descripción del Endoso" Width="68%"></asp:TextBox>
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
                                    <asp:label runat="server" class="col-md-1  etiqueta-control" Width="14.5%">Giro</asp:label>
                                    <asp:TextBox runat="server" ID="txt_ClaveGiro" CssClass="NoDisplay"></asp:TextBox>
                                    <asp:TextBox runat="server" ID="txt_SearchGiro" CssClass="estandar-control Tablero Seleccion" PlaceHolder="Giro GMX" Width="84.5%"></asp:TextBox> 
                                </div>
                                <div class="col-md-8">
                                    <div class="clear padding4"></div>
                                    <asp:label runat="server" class="col-md-1  etiqueta-control" Width="14.5%">Giro Espec.</asp:label>
                                    <asp:TextBox runat="server" ID="txt_GiroAsegurado" CssClass="estandar-control Tablero Seleccion" PlaceHolder="Giro Especifico del Asegurado" Width="84.5%"></asp:TextBox> 
                                </div>
                                <div class="col-md-8">
                                    <div class="clear padding4"></div>
                                    <asp:label runat="server" class="col-md-1  etiqueta-control" Width="14.5%">Observaciones</asp:label>
                                    <asp:TextBox runat="server" ID="txt_Notas" CssClass="estandar-control Tablero Seleccion ObservacionesGral" Width="84.5%" TextMode="MultiLine" PlaceHolder="Observaciones"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
              </asp:UpdatePanel>    
              
              <div class="clear padding10"></div>

              <asp:UpdatePanel runat="server" ID="upDatosRiesgo">
                <ContentTemplate>
                    <div class="panel-seccion">
                        <div class="cuadro-titulo">
                            <input type="image" src="../Images/contraer_mini_inv.png" id="coVentana3" class="contraer"  />
                            <input type="image" src="../Images/expander_mini_inv.png"   id="exVentana3" class="expandir"  />
                            <asp:Label runat="server" Text="Datos del Riesgo" Width="65%"></asp:Label>

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

                            <asp:LinkButton id="btn_AgrupaRiesgo" runat="server" class="btn botones AgruparRiesgo" >
                                <span>
                                    <img class="btn-todos"/>
                                    Agrupar
                                </span>
                            </asp:LinkButton>

                            <asp:LinkButton id="btn_AjustePantalla" runat="server" class="btn" ToolTip="Activar desplazamiento en cuadro de Riesgos">
                                <span>
                                    <img class="btn-ninguno"/>
                                </span>
                            </asp:LinkButton>                        </div>
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
                        </div>
                    </div>
                </ContentTemplate>
              </asp:UpdatePanel>          
          </div>


          <div id="menu2" class="tab-pane fade">
            <div class="row">
                <asp:UpdatePanel runat="server" ID="upAgrupacion">
                    <ContentTemplate>
                        <div class="col-md-6"> 
                            <div class="cuadro-titulo">
                                <input type="image" src="../Images/contraer_mini_inv.png" id="coVentana11" class="contraer"  />
                                <input type="image" src="../Images/expander_mini_inv.png"   id="exVentana11" class="expandir"  />
                                [Facultativo]
                            </div>
                            <div class="panel-subcontenido ventana11">
                                <asp:HiddenField runat="server" ID="hid_IndiceGrupo" Value="-1" />
                                <asp:HiddenField runat="server" ID="hid_IndiceGrupoDet" Value="-1" />
                                <asp:Panel runat="server" ID="pnlAgrupacion" Width="100%" Height="150px" ScrollBars="Vertical">
                                    <asp:GridView runat="server" ID="gvd_Agrupacion" AutoGenerateColumns="false" 
                                                    CssClass="grid-view" HeaderStyle-CssClass="header" AlternatingRowStyle-CssClass="altern"
                                                    GridLines="Horizontal"  ShowHeaderWhenEmpty="true" DataKeyNames="cod_grupo,cod_agrupador,incisos" >
                                        <Columns>
                                            <asp:TemplateField HeaderText="" HeaderStyle-CssClass="Centro" ItemStyle-CssClass="Centrado">
                                                <HeaderTemplate>
                                                    <asp:CheckBox runat="server" ID="chk_SelAll" Width="20px" onclick="fn_SeleccionTodos('gvd_Agrupacion', this, 'chk_Sel')" /> 
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:CheckBox runat="server" ID="chk_Sel" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Grupo" HeaderStyle-CssClass="Centro">
                                                <ItemTemplate>
                                                    <asp:LinkButton runat="server" ID="lnk_Descripcion" CommandName="Descripcion" Text='<%# Eval("Descripcion") %>' CssClass="estandar-control Tablero" Width="150px"></asp:LinkButton>
                                                    <asp:TextBox runat="server" ID="txt_Clave" Text='<%# Eval("cod_grupo") %>' CssClass="NoDisplay Clave"></asp:TextBox>
                                                    <asp:TextBox runat="server" ID="txt_Incisos" Text='<%# Eval("incisos") %>' CssClass="NoDisplay Incisos"></asp:TextBox>
                                                    <asp:TextBox runat="server" ID="txt_Ramos" Text='<%# Eval("ramos") %>' CssClass="NoDisplay Ramos"></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="" HeaderStyle-CssClass="Centro" ControlStyle-CssClass="Espacio">
                                                <ItemTemplate>
                                                    <asp:ImageButton runat="server" ID="btn_Inicisos" ToolTip="Riesgos Agrupados (Listado de Riesgos que conforman la Agrupación)" CommandName="Incisos" ImageUrl="~/Images/selectall_mini.png"/>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Lím. Max. Resp" HeaderStyle-CssClass="Centro">
                                                <ItemTemplate>
                                                    <asp:TextBox runat="server" ID="txt_LimResp" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("suma_asegurada")))%>' Font-Bold="true" Enabled="false" CssClass="estandar-control Tablero Monto SumaAsegurada" Width="100px"></asp:TextBox>
                                                    <asp:TextBox runat="server" ID="txt_LimRespAux" Text='<%# Eval("suma_asegurada") %>' CssClass="NoDisplay"></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Prima Neta" HeaderStyle-CssClass="Centro">
                                                <ItemTemplate>
                                                    <asp:TextBox runat="server" ID="txt_PrimaNeta" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("prima_neta")))%>' Font-Bold="true" Enabled="false" CssClass="estandar-control Tablero Seleccion Monto PrimaNeta" Width="100px"></asp:TextBox>
                                                    <asp:TextBox runat="server" ID="txt_PrimaNetaAux" Text='<%# Eval("prima_neta") %>' CssClass="NoDisplay"></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Prima INC" HeaderStyle-CssClass="Centro">
                                                <ItemTemplate>
                                                    <asp:TextBox runat="server" ID="txt_PrimaINC" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("prima_inc")))%>' Font-Bold="true" Enabled="false" CssClass="estandar-control Tablero Seleccion Monto PrimaINC" Width="100px"></asp:TextBox>
                                                    <asp:TextBox runat="server" ID="txt_PrimaINCAux" Text='<%# Eval("prima_inc") %>' CssClass="NoDisplay"></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Prima FHM" HeaderStyle-CssClass="Centro">
                                                <ItemTemplate>
                                                    <asp:TextBox runat="server" ID="txt_PrimaFHM" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("prima_fhm")))%>' Font-Bold="true" Enabled="false" CssClass="estandar-control Tablero Seleccion Monto PrimaFHM" Width="100px"></asp:TextBox>
                                                    <asp:TextBox runat="server" ID="txt_PrimaFHMAux" Text='<%# Eval("prima_fhm") %>' CssClass="NoDisplay"></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Prima TEV" HeaderStyle-CssClass="Centro">
                                                <ItemTemplate>
                                                    <asp:TextBox runat="server" ID="txt_PrimaTEV" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("prima_tev")))%>' Font-Bold="true" Enabled="false" CssClass="estandar-control Tablero Seleccion Monto PrimaTEV" Width="100px"></asp:TextBox>
                                                    <asp:TextBox runat="server" ID="txt_PrimaTEVAux" Text='<%# Eval("prima_tev") %>' CssClass="NoDisplay"></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Prima RC" HeaderStyle-CssClass="Centro">
                                                <ItemTemplate>
                                                    <asp:TextBox runat="server" ID="txt_PrimaRC" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("prima_rc")))%>' Font-Bold="true" Enabled="false"  CssClass="estandar-control Tablero Seleccion Monto PrimaRC"  Width="100px"></asp:TextBox>
                                                    <asp:TextBox runat="server" ID="txt_PrimaRCAux" Text='<%# Eval("prima_rc") %>' CssClass="NoDisplay"></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Prima Casco" HeaderStyle-CssClass="Centro">
                                                <ItemTemplate>
                                                    <asp:TextBox runat="server" ID="txt_PrimaCSC" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("prima_casco")))%>' Font-Bold="true" Enabled="false"  CssClass="estandar-control Tablero Seleccion Monto PrimaCSC"  Width="100px"></asp:TextBox>
                                                    <asp:TextBox runat="server" ID="txt_PrimaCSCAux" Text='<%# Eval("prima_casco") %>' CssClass="NoDisplay"></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Prima Guerra" HeaderStyle-CssClass="Centro">
                                                <ItemTemplate>
                                                    <asp:TextBox runat="server" ID="txt_PrimaGRA" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("prima_guerra")))%>' Font-Bold="true" Enabled="false"  CssClass="estandar-control Tablero Seleccion Monto PrimaGRA" Width="100px"></asp:TextBox>
                                                    <asp:TextBox runat="server" ID="txt_PrimaGRAAux" Text='<%# Eval("prima_guerra") %>' CssClass="NoDisplay"></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="" HeaderStyle-CssClass="Centro" ControlStyle-CssClass="Espacio">
                                                <ItemTemplate>
                                                    <asp:ImageButton runat="server" ID="btn_Agregar" ToolTip="Agregar Riesgos" CommandName="Agregar" ImageUrl="~/Images/añadir_azul_mini.png"/>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </asp:Panel>
                                <div style="width:100%;  text-align:right">
                                    <asp:LinkButton id="btn_RemoveGrupo" runat="server" class="btn botones">
                                        <span>
                                            <img class="btn-quitar"/>
                                            Quitar
                                        </span>
                                    </asp:LinkButton>
                                </div>
                                <div class="clear padding4"></div>
                                <div class="cuadro-titulo">
                                    <asp:CheckBox runat="server" ID="chk_Proporcional" AutoPostBack="true" />
                                    [No Proporcional]
                                    <asp:label runat="server" ID="lbl_Capas"></asp:label>
                                </div>
                                <asp:Panel runat="server" ID="pnlCapas" Width="100%" Height="180px" ScrollBars="Horizontal">
                                    <asp:GridView runat="server" ID="gvd_Capas" AutoGenerateColumns="false" 
                                                    CssClass="grid-view" HeaderStyle-CssClass="header" AlternatingRowStyle-CssClass="altern"
                                                    GridLines="Horizontal"  ShowHeaderWhenEmpty="true" DataKeyNames="cod_grupo,cod_capa" >
                                        <Columns>
                                            <asp:TemplateField HeaderText="" HeaderStyle-CssClass="Centro" ItemStyle-CssClass="Centrado">
                                                <ItemTemplate>
                                                    <asp:CheckBox runat="server" ID="chk_Sel"/>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Capa" ItemStyle-CssClass="Centrado">
                                                <ItemTemplate>
                                                    <asp:TextBox runat="server" ID="txt_Capa" Text='<%# Eval("cod_capa") %>'  Enabled="false" CssClass="estandar-control Tablero Centro" Width="30px"></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                             <asp:TemplateField HeaderText="">
                                                <ItemTemplate>
                                                    <div style="width:65px">
                                                         <asp:TextBox ID="txt_Retencion" runat="server" CssClass="estandar-control Tablero" Enabled="false" Width="65px" >RETENCIÓN</asp:TextBox>
                                                         <asp:TextBox ID="txt_Facultativo" runat="server" CssClass="estandar-control Tablero" Enabled="false" Width="65px" >FACULTATIVO</asp:TextBox>
                                                    </div>                                          
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Sob/Coas" HeaderStyle-CssClass="Centro">
                                                <ItemTemplate>
                                                    <div style="width:75px">
                                                        <asp:TextBox runat="server" ID="txt_PrcPartRET" Text='<%# String.Format("{0:#,#0.0000}", CDbl(Eval("prc_part_ret")))%>' CssClass="estandar-control Tablero Seleccion Monto PrcPartRET" Enabled="false" Width="75px"></asp:TextBox>
                                                        <asp:TextBox runat="server" ID="txt_PrcPartRETAux"  Text='<%# Eval("prc_part_ret") %>' CssClass="NoDisplay"></asp:TextBox>
                                                        <asp:TextBox runat="server" ID="txt_PrcPart" Text='<%# String.Format("{0:#,#0.0000}", CDbl(Eval("prc_part")))%>' CssClass="estandar-control Tablero Seleccion Monto PrcPart" Enabled="false" Width="75px"></asp:TextBox>
                                                        <asp:TextBox runat="server" ID="txt_PrcPartAux"  Text='<%# Eval("prc_part") %>' CssClass="NoDisplay"></asp:TextBox>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Sob/100%" HeaderStyle-CssClass="Centro">
                                                <ItemTemplate>
                                                    <div style="width:75px">
                                                        <asp:TextBox runat="server" ID="txt_PrcPartGMXRET" Text='<%# String.Format("{0:#,#0.0000}", CDbl(Eval("prc_partGMX_ret")))%>' CssClass="estandar-control col-md-1 Tablero Seleccion Monto PrcPartGMXRET" Width="75px"></asp:TextBox>
                                                        <asp:TextBox runat="server" ID="txt_PrcPartGMXRETAux" Text='<%# Eval("prc_partGMX_ret") %>' CssClass="NoDisplay"></asp:TextBox>
                                                        <asp:TextBox runat="server" ID="txt_PrcPartGMX" Text='<%# String.Format("{0:#,#0.0000}", CDbl(Eval("prc_partGMX")))%>' CssClass="estandar-control col-md-1 Tablero Seleccion Monto PrcPartGMX" Width="75px"></asp:TextBox>
                                                        <asp:TextBox runat="server" ID="txt_PrcPartGMXAux" Text='<%# Eval("prc_partGMX") %>' CssClass="NoDisplay"></asp:TextBox>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Lím. Max. Resp" HeaderStyle-CssClass="Centro">
                                                <ItemTemplate>
                                                    <div style="width:100px">
                                                        <asp:TextBox runat="server" ID="txt_LimRespRET" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("suma_asegurada_ret")))%>'  Enabled="false" CssClass="estandar-control Tablero Monto SumaAseguradaRET" Width="100px"></asp:TextBox>
                                                        <asp:TextBox runat="server" ID="txt_LimRespRETAux" Text='<%# Eval("suma_asegurada_ret") %>' CssClass="NoDisplay"></asp:TextBox>
                                                        <asp:TextBox runat="server" ID="txt_LimResp" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("suma_asegurada")))%>'  Enabled="false" CssClass="estandar-control Tablero Monto SumaAsegurada" Width="100px"></asp:TextBox>
                                                        <asp:TextBox runat="server" ID="txt_LimRespAux" Text='<%# Eval("suma_asegurada") %>' CssClass="NoDisplay"></asp:TextBox>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Prima Neta" HeaderStyle-CssClass="Centro">
                                                <ItemTemplate>
                                                    <div style="width:100px">
                                                        <asp:TextBox runat="server" ID="txt_PrimaNetaRET" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("prima_neta_ret")))%>' Enabled="false" CssClass="estandar-control Tablero Seleccion Monto PrimaNetaRET" Width="100px"></asp:TextBox>
                                                        <asp:TextBox runat="server" ID="txt_PrimaNetaRETAux" Text='<%# Eval("prima_neta_ret") %>' CssClass="NoDisplay"></asp:TextBox>
                                                        <asp:TextBox runat="server" ID="txt_PrimaNeta" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("prima_neta")))%>' Enabled="false" CssClass="estandar-control Tablero Seleccion Monto PrimaNeta" Width="100px"></asp:TextBox>
                                                        <asp:TextBox runat="server" ID="txt_PrimaNetaAux" Text='<%# Eval("prima_neta") %>' CssClass="NoDisplay"></asp:TextBox>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Prima INC" HeaderStyle-CssClass="Centro">
                                                <ItemTemplate>
                                                    <div style="width:100px">
                                                        <asp:TextBox runat="server" ID="txt_PrimaINCRET" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("prima_inc_ret")))%>'  Enabled="false" CssClass="estandar-control Tablero Seleccion Monto PrimaINCRET" Width="100px"></asp:TextBox>
                                                        <asp:TextBox runat="server" ID="txt_PrimaINCRETAux" Text='<%# Eval("prima_inc_ret") %>' CssClass="NoDisplay"></asp:TextBox>
                                                        <asp:TextBox runat="server" ID="txt_PrimaINC" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("prima_inc")))%>'  Enabled="false" CssClass="estandar-control Tablero Seleccion Monto PrimaINC" Width="100px"></asp:TextBox>
                                                        <asp:TextBox runat="server" ID="txt_PrimaINCAux" Text='<%# Eval("prima_inc") %>' CssClass="NoDisplay"></asp:TextBox>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Prima FHM" HeaderStyle-CssClass="columna-scroll Centro">
                                                <ItemTemplate>
                                                    <div style="width:100px">
                                                        <asp:TextBox runat="server" ID="txt_PrimaFHMRET" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("prima_fhm_ret")))%>' Enabled="false" CssClass="estandar-control Tablero Seleccion Monto PrimaFHMRET" Width="100px"></asp:TextBox>
                                                        <asp:TextBox runat="server" ID="txt_PrimaFHMRETAux" Text='<%# Eval("prima_fhm_ret") %>' CssClass="NoDisplay"></asp:TextBox>
                                                        <asp:TextBox runat="server" ID="txt_PrimaFHM" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("prima_fhm")))%>' Enabled="false" CssClass="estandar-control Tablero Seleccion Monto PrimaFHM" Width="100px"></asp:TextBox>
                                                        <asp:TextBox runat="server" ID="txt_PrimaFHMAux" Text='<%# Eval("prima_fhm") %>' CssClass="NoDisplay"></asp:TextBox>
                                                    </div>                                                   
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Prima TEV" HeaderStyle-CssClass="Centro">
                                                <ItemTemplate>
                                                    <div style="width:100px">
                                                        <asp:TextBox runat="server" ID="txt_PrimaTEVRET" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("prima_tev_ret")))%>' Enabled="false" CssClass="estandar-control Tablero Seleccion Monto PrimaTEVRET" Width="100px"></asp:TextBox>
                                                        <asp:TextBox runat="server" ID="txt_PrimaTEVRETAux" Text='<%# Eval("prima_tev_ret") %>' CssClass="NoDisplay"></asp:TextBox>
                                                        <asp:TextBox runat="server" ID="txt_PrimaTEV" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("prima_tev")))%>' Enabled="false" CssClass="estandar-control Tablero Seleccion Monto PrimaTEV" Width="100px"></asp:TextBox>
                                                        <asp:TextBox runat="server" ID="txt_PrimaTEVAux" Text='<%# Eval("prima_tev") %>' CssClass="NoDisplay"></asp:TextBox>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Prima RC" HeaderStyle-CssClass="Centro">
                                                <ItemTemplate>
                                                    <div style="width:100px">
                                                        <asp:TextBox runat="server" ID="txt_PrimaRCRET" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("prima_rc_ret")))%>' Enabled="false"  CssClass="estandar-control Tablero Seleccion Monto PrimaRCRET"  Width="100px"></asp:TextBox>
                                                        <asp:TextBox runat="server" ID="txt_PrimaRCRETAux" Text='<%# Eval("prima_rc_ret") %>' CssClass="NoDisplay"></asp:TextBox>
                                                        <asp:TextBox runat="server" ID="txt_PrimaRC" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("prima_rc")))%>' Enabled="false"  CssClass="estandar-control Tablero Seleccion Monto PrimaRC"  Width="100px"></asp:TextBox>
                                                        <asp:TextBox runat="server" ID="txt_PrimaRCAux" Text='<%# Eval("prima_rc") %>' CssClass="NoDisplay"></asp:TextBox>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Prima Casco" HeaderStyle-CssClass="Centro">
                                                <ItemTemplate>
                                                    <div style="width:100px">
                                                        <asp:TextBox runat="server" ID="txt_PrimaCSCRET" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("prima_casco_ret")))%>' Enabled="false"  CssClass="estandar-control Tablero Seleccion Monto PrimaCSCRET"  Width="100px"></asp:TextBox>
                                                        <asp:TextBox runat="server" ID="txt_PrimaCSCRETAux" Text='<%# Eval("prima_casco_ret") %>' CssClass="NoDisplay"></asp:TextBox>
                                                        <asp:TextBox runat="server" ID="txt_PrimaCSC" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("prima_casco")))%>' Enabled="false"  CssClass="estandar-control Tablero Seleccion Monto PrimaCSC"  Width="100px"></asp:TextBox>
                                                        <asp:TextBox runat="server" ID="txt_PrimaCSCAux" Text='<%# Eval("prima_casco") %>' CssClass="NoDisplay"></asp:TextBox>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Prima Guerra" HeaderStyle-CssClass="Centro">
                                                <ItemTemplate>
                                                    <div style="width:100px">
                                                        <asp:TextBox runat="server" ID="txt_PrimaGRARET" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("prima_guerra_ret")))%>' Enabled="false"  CssClass="estandar-control Tablero Seleccion Monto PrimaGRARET" Width="100px"></asp:TextBox>
                                                        <asp:TextBox runat="server" ID="txt_PrimaGRARETAux" Text='<%# Eval("prima_guerra_ret") %>' CssClass="NoDisplay"></asp:TextBox>
                                                        <asp:TextBox runat="server" ID="txt_PrimaGRA" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("prima_guerra")))%>' Enabled="false"  CssClass="estandar-control Tablero Seleccion Monto PrimaGRA" Width="100px"></asp:TextBox>
                                                        <asp:TextBox runat="server" ID="txt_PrimaGRAAux" Text='<%# Eval("prima_guerra") %>' CssClass="NoDisplay"></asp:TextBox>
                                                    </div>                                           
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </asp:Panel>
                                <div style="width:100%;  text-align:right">
                                    <asp:LinkButton id="btn_AddCapa" runat="server" class="btn botones AgregaCapa" data-toggle="modal" data-target="#ProgramaCapas">
                                        <span>
                                            <img class="btn-añadir"/>
                                            Añadir
                                        </span>
                                    </asp:LinkButton>
                                    <asp:LinkButton id="btn_RemoveCapa" runat="server" class="btn botones">
                                        <span>
                                            <img class="btn-quitar"/>
                                            Quitar
                                        </span>
                                    </asp:LinkButton>
                                </div> 
                            </div>
                        </div>
                        <div class="col-md-6"> 
                            <div class="cuadro-titulo">
                                <input type="image" src="../Images/contraer_mini_inv.png" id="coVentana12" class="contraer"  />
                                <input type="image" src="../Images/expander_mini_inv.png"   id="exVentana12" class="expandir"  />
                                <asp:label runat="server">[Distribución]</asp:label>
                                <asp:label runat="server" ID="lbl_Distribucion"></asp:label>
                            </div>
                            <div class="panel-subcontenido ventana12">
                                <asp:Panel runat="server" ID="pnlReparto" Width="100%" Height="150px" ScrollBars="Horizontal">
                                    <asp:GridView runat="server" ID="gvd_Reparto" AutoGenerateColumns="false" 
                                                    CssClass="grid-view" HeaderStyle-CssClass="header" AlternatingRowStyle-CssClass="altern"
                                                    GridLines="Horizontal"  ShowHeaderWhenEmpty="true" DataKeyNames="cod_grupo,cod_reparto" >
                                        <Columns>
                                            <asp:TemplateField HeaderText="" HeaderStyle-CssClass="Centro" ItemStyle-CssClass="Centrado">
                                                <ItemTemplate>
                                                    <asp:CheckBox runat="server" ID="chk_Sel" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="">
                                                <ItemTemplate>
                                                    <asp:TextBox runat="server" ID="txt_Descripcion" Text='<%# Eval("Descripcion") %>'  Enabled="false" CssClass="estandar-control Tablero" Width="120px"></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="(%) Part." HeaderStyle-CssClass="Centro">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="lbl_ClaveCoa" Text='<%# Eval("cod_reparto") %>' CssClass="NoDisplay"></asp:Label>
                                                    <asp:TextBox runat="server" ID="txt_PrcPart" Text='<%# String.Format("{0:#,#0.0000}", CDbl(Eval("prc_part")))%>' CssClass="estandar-control  Tablero Seleccion Monto PrcPart" Width="75px"></asp:TextBox>
                                                    <asp:TextBox runat="server" ID="txt_PrcPartAux"  Text='<%# Eval("prc_part") %>' CssClass="NoDisplay"></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                             <asp:TemplateField HeaderText="Lider" HeaderStyle-CssClass="Centro" ItemStyle-CssClass="Centrado">
                                                <ItemTemplate>
                                                    <asp:CheckBox runat="server" ID="chk_Lider" Checked='<%# Eval("sn_lider") %>' CssClass="Select" onclick="fn_CambioSeleccion('gvd_Reparto',this,'Unica','chk_Lider')" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Lím. Max. Resp" HeaderStyle-CssClass="Centro">
                                                <ItemTemplate>
                                                    <asp:TextBox runat="server" ID="txt_LimResp" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("suma_asegurada")))%>'  Enabled="false" CssClass="estandar-control Tablero Monto SumaAsegurada" Width="100px"></asp:TextBox>
                                                    <asp:TextBox runat="server" ID="txt_LimRespAux" Text='<%# Eval("suma_asegurada") %>' CssClass="NoDisplay"></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Prima Neta" HeaderStyle-CssClass="Centro">
                                                <ItemTemplate>
                                                    <asp:TextBox runat="server" ID="txt_PrimaNeta" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("prima_neta")))%>' Enabled="false" CssClass="estandar-control Tablero Seleccion Monto PrimaNeta" Width="100px"></asp:TextBox>
                                                    <asp:TextBox runat="server" ID="txt_PrimaNetaAux" Text='<%# Eval("prima_neta") %>' CssClass="NoDisplay"></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Prima INC" HeaderStyle-CssClass="Centro">
                                                <ItemTemplate>
                                                    <asp:TextBox runat="server" ID="txt_PrimaINC" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("prima_inc")))%>'  Enabled="false" CssClass="estandar-control Tablero Seleccion Monto PrimaINC" Width="100px"></asp:TextBox>
                                                    <asp:TextBox runat="server" ID="txt_PrimaINCAux" Text='<%# Eval("prima_inc") %>' CssClass="NoDisplay"></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Prima FHM" HeaderStyle-CssClass="columna-scroll Centro">
                                                <ItemTemplate>
                                                    <asp:TextBox runat="server" ID="txt_PrimaFHM" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("prima_fhm")))%>' Enabled="false" CssClass="estandar-control Tablero Seleccion Monto PrimaFHM" Width="100px"></asp:TextBox>
                                                    <asp:TextBox runat="server" ID="txt_PrimaFHMAux" Text='<%# Eval("prima_fhm") %>' CssClass="NoDisplay"></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Prima TEV" HeaderStyle-CssClass="Centro">
                                                <ItemTemplate>
                                                    <asp:TextBox runat="server" ID="txt_PrimaTEV" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("prima_tev")))%>' Enabled="false" CssClass="estandar-control Tablero Seleccion Monto PrimaTEV" Width="100px"></asp:TextBox>
                                                    <asp:TextBox runat="server" ID="txt_PrimaTEVAux" Text='<%# Eval("prima_tev") %>' CssClass="NoDisplay"></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Prima RC" HeaderStyle-CssClass="Centro">
                                                <ItemTemplate>
                                                    <asp:TextBox runat="server" ID="txt_PrimaRC" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("prima_rc")))%>' Enabled="false"  CssClass="estandar-control Tablero Seleccion Monto PrimaRC"  Width="100px"></asp:TextBox>
                                                    <asp:TextBox runat="server" ID="txt_PrimaRCAux" Text='<%# Eval("prima_rc") %>' CssClass="NoDisplay"></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Prima Casco" HeaderStyle-CssClass="Centro">
                                                <ItemTemplate>
                                                    <asp:TextBox runat="server" ID="txt_PrimaCSC" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("prima_casco")))%>' Enabled="false"  CssClass="estandar-control Tablero Seleccion Monto PrimaCSC"  Width="100px"></asp:TextBox>
                                                    <asp:TextBox runat="server" ID="txt_PrimaCSCAux" Text='<%# Eval("prima_casco") %>' CssClass="NoDisplay"></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Prima Guerra" HeaderStyle-CssClass="Centro">
                                                <ItemTemplate>
                                                    <asp:TextBox runat="server" ID="txt_PrimaGRA" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("prima_guerra")))%>' Enabled="false"  CssClass="estandar-control Tablero Seleccion Monto PrimaGRA" Width="100px"></asp:TextBox>
                                                    <asp:TextBox runat="server" ID="txt_PrimaGRAAux" Text='<%# Eval("prima_guerra") %>' CssClass="NoDisplay"></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </asp:Panel>
                                <div style="width:100%;  text-align:right">
                                    <asp:LinkButton id="btn_AddReparto" runat="server" class="btn botones AgregaCoa" data-toggle="modal" data-target="#EsperaModal">
                                        <span>
                                            <img class="btn-añadir"/>
                                            Añadir
                                        </span>
                                    </asp:LinkButton>
                                    <asp:LinkButton id="btn_RemoveReparto" runat="server" class="btn botones">
                                        <span>
                                            <img class="btn-quitar"/>
                                            Quitar
                                        </span>
                                    </asp:LinkButton>
                                </div> 
                                <div class="clear padding4"></div>
                                <div class="cuadro-titulo">
                                    [Tipo de Contrato]
                                </div>
                                <asp:Panel runat="server" ID="pnlDistribucion" Width="100%" Height="180px" ScrollBars="Horizontal">
                                    <asp:GridView runat="server" ID="gvd_Distribucion" AutoGenerateColumns="false" 
                                                    CssClass="grid-view" HeaderStyle-CssClass="header" AlternatingRowStyle-CssClass="altern"
                                                    GridLines="Horizontal"  ShowHeaderWhenEmpty="true" DataKeyNames="cod_grupo,cod_distribucion" >
                                        <Columns>
                                            <asp:TemplateField HeaderText="" HeaderStyle-CssClass="Centro" ItemStyle-CssClass="Centrado">
                                                <ItemTemplate>
                                                    <asp:CheckBox runat="server" ID="chk_Sel" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="">
                                                <ItemTemplate>
                                                    <asp:TextBox runat="server" ID="txt_Descripcion" Text='<%# Eval("Descripcion") %>'  Enabled="false" CssClass="estandar-control Tablero" Width="120px"></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Sob/Coas" HeaderStyle-CssClass="Centro">
                                                <ItemTemplate>
                                                    <asp:TextBox runat="server" ID="txt_PrcPart" Text='<%# String.Format("{0:#,#0.0000}", CDbl(Eval("prc_part")))%>' CssClass="estandar-control Tablero Seleccion Monto PrcPart" Enabled="false" Width="75px"></asp:TextBox>
                                                    <asp:TextBox runat="server" ID="txt_PrcPartAux"  Text='<%# Eval("prc_part") %>' CssClass="NoDisplay"></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Sob/100%" HeaderStyle-CssClass="Centro">
                                                <ItemTemplate>
                                                    <asp:TextBox runat="server" ID="txt_PrcPartGMX" Text='<%# String.Format("{0:#,#0.0000}", CDbl(Eval("prc_partGMX")))%>' CssClass="estandar-control Tablero Seleccion Monto PrcPartGMX" Width="75px"></asp:TextBox>
                                                    <asp:TextBox runat="server" ID="txt_PrcPartGMXAux" Text='<%# Eval("prc_partGMX") %>' CssClass="NoDisplay"></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Lím. Max. Resp" HeaderStyle-CssClass="Centro">
                                                <ItemTemplate>
                                                    <asp:TextBox runat="server" ID="txt_LimResp" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("suma_asegurada")))%>'  Enabled="false" CssClass="estandar-control Tablero Monto SumaAsegurada" Width="100px"></asp:TextBox>
                                                    <asp:TextBox runat="server" ID="txt_LimRespAux" Text='<%# Eval("suma_asegurada") %>' CssClass="NoDisplay"></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Prima Neta" HeaderStyle-CssClass="Centro">
                                                <ItemTemplate>
                                                    <asp:TextBox runat="server" ID="txt_PrimaNeta" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("prima_neta")))%>' Enabled="false" CssClass="estandar-control Tablero Seleccion Monto PrimaNeta" Width="100px"></asp:TextBox>
                                                    <asp:TextBox runat="server" ID="txt_PrimaNetaAux" Text='<%# Eval("prima_neta") %>' CssClass="NoDisplay"></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Prima INC" HeaderStyle-CssClass="Centro">
                                                <ItemTemplate>
                                                    <asp:TextBox runat="server" ID="txt_PrimaINC" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("prima_inc")))%>'  Enabled="false" CssClass="estandar-control Tablero Seleccion Monto PrimaINC" Width="100px"></asp:TextBox>
                                                    <asp:TextBox runat="server" ID="txt_PrimaINCAux" Text='<%# Eval("prima_inc") %>' CssClass="NoDisplay"></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Prima FHM" HeaderStyle-CssClass="columna-scroll Centro">
                                                <ItemTemplate>
                                                    <asp:TextBox runat="server" ID="txt_PrimaFHM" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("prima_fhm")))%>' Enabled="false" CssClass="estandar-control Tablero Seleccion Monto PrimaFHM" Width="100px"></asp:TextBox>
                                                    <asp:TextBox runat="server" ID="txt_PrimaFHMAux" Text='<%# Eval("prima_fhm") %>' CssClass="NoDisplay"></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Prima TEV" HeaderStyle-CssClass="Centro">
                                                <ItemTemplate>
                                                    <asp:TextBox runat="server" ID="txt_PrimaTEV" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("prima_tev")))%>' Enabled="false" CssClass="estandar-control Tablero Seleccion Monto PrimaTEV" Width="100px"></asp:TextBox>
                                                    <asp:TextBox runat="server" ID="txt_PrimaTEVAux" Text='<%# Eval("prima_tev") %>' CssClass="NoDisplay"></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Prima RC" HeaderStyle-CssClass="Centro">
                                                <ItemTemplate>
                                                    <asp:TextBox runat="server" ID="txt_PrimaRC" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("prima_rc")))%>' Enabled="false"  CssClass="estandar-control Tablero Seleccion Monto PrimaRC"  Width="100px"></asp:TextBox>
                                                    <asp:TextBox runat="server" ID="txt_PrimaRCAux" Text='<%# Eval("prima_rc") %>' CssClass="NoDisplay"></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Prima Casco" HeaderStyle-CssClass="Centro">
                                                <ItemTemplate>
                                                    <asp:TextBox runat="server" ID="txt_PrimaCSC" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("prima_casco")))%>' Enabled="false"  CssClass="estandar-control Tablero Seleccion Monto PrimaCSC"  Width="100px"></asp:TextBox>
                                                    <asp:TextBox runat="server" ID="txt_PrimaCSCAux" Text='<%# Eval("prima_casco") %>' CssClass="NoDisplay"></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Prima Guerra" HeaderStyle-CssClass="Centro">
                                                <ItemTemplate>
                                                    <asp:TextBox runat="server" ID="txt_PrimaGRA" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("prima_guerra")))%>' Enabled="false"  CssClass="estandar-control Tablero Seleccion Monto PrimaGRA" Width="100px"></asp:TextBox>
                                                    <asp:TextBox runat="server" ID="txt_PrimaGRAAux" Text='<%# Eval("prima_guerra") %>' CssClass="NoDisplay"></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </asp:Panel>
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>

            <div class="clear padding5"></div>

            <div>
                <asp:UpdatePanel runat="server" ID="upDistribucion">
                   <ContentTemplate>
                       <div class="row">
                           <div class="col-md-12">
                               <div class="cuadro-titulo">
                                    <input type="image" src="../Images/contraer_mini_inv.png" id="coVentana9" class="contraer"  />
                                    <input type="image" src="../Images/expander_mini_inv.png"   id="exVentana9" class="expandir"  />
                                    <asp:label runat="server">[Intermediarios]</asp:label>
                                    <asp:label runat="server" ID="lbl_Intermediarios"></asp:label>
                               </div>
                               <div class="panel-subcontenido ventana9">
                                   <asp:HiddenField runat="server" ID="hid_IndiceBroker" Value="-1" />
                                   <asp:Panel runat="server" ID="pnlBrokers" Width="100%" Height="150px" ScrollBars="Vertical">
                                        <asp:GridView runat="server" ID="gvd_Intermediario" AutoGenerateColumns="false" 
                                                        CssClass="grid-view" HeaderStyle-CssClass="header" AlternatingRowStyle-CssClass="altern"
                                                        GridLines="Horizontal"  ShowHeaderWhenEmpty="true" DataKeyNames="cod_grupo,cod_broker,Estatus" >
                                            <Columns>
                                                <asp:TemplateField HeaderText="" HeaderStyle-CssClass="Centro" ItemStyle-CssClass="Centrado">
                                                    <HeaderTemplate>
                                                        <asp:CheckBox runat="server" ID="chk_SelAll" Width="20px" onclick="fn_SeleccionTodos('gvd_Intermediario', this, 'chk_Sel')" /> 
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:CheckBox runat="server" ID="chk_Sel" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Clave" HeaderStyle-CssClass="Centro">
                                                    <ItemTemplate>
                                                        <asp:LinkButton runat="server" ID="lnk_Clave" CommandName="Reasegurador" Text='<%# Eval("cod_broker") %>' CssClass="estandar-control Tablero Centro Clave" Width="50px"></asp:LinkButton>
                                                        <asp:Label runat="server" ID="lbl_ClaveBro" Text='<%# Eval("cod_broker") %>' CssClass="NoDisplay"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Descripción" HeaderStyle-CssClass="Centro">
                                                    <ItemTemplate>
                                                        <asp:textbox runat="server" ID="txt_Descripcion" Text='<%# Eval("Descripcion") %>' Enabled="false" CssClass="estandar-control Tablero" Width="200px"></asp:textbox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="(%) S/Coas" HeaderStyle-CssClass="Centro">
                                                    <ItemTemplate>
                                                        <asp:TextBox runat="server" ID="txt_PrcPartCoas" Text='<%# String.Format("{0:#,#0.0000}", CDbl(Eval("prc_partCoas")))%>' Enabled="false" CssClass="estandar-control Tablero Monto PrcPartCoas" Width="70px"></asp:TextBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="(%) S/100%" HeaderStyle-CssClass="Centro">
                                                    <ItemTemplate>
                                                        <asp:TextBox runat="server" ID="txt_PrcPart"  Text='<%# String.Format("{0:#,#0.0000}", CDbl(Eval("prc_part")))%>' CssClass="estandar-control Tablero Seleccion Monto PrcPart" Width="70px"></asp:TextBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Lím. Max. Resp" HeaderStyle-CssClass="Centro">
                                                    <ItemTemplate>
                                                        <asp:TextBox runat="server" ID="txt_LimResp" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("suma_asegurada")))%>' CssClass="estandar-control Tablero Monto SumaAsegurada" Enabled="false" Width="100px"></asp:TextBox>
                                                        <asp:TextBox runat="server" ID="txt_LimRespAux" Text='<%# Eval("suma_asegurada") %>' CssClass="NoDisplay"></asp:TextBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Prima Neta" HeaderStyle-CssClass="Centro">
                                                    <ItemTemplate>
                                                        <asp:TextBox runat="server" ID="txt_PrimaNeta" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("prima_neta")))%>' CssClass="estandar-control Tablero Seleccion Monto PrimaNeta" Enabled="false" Width="100px"></asp:TextBox>
                                                        <asp:TextBox runat="server" ID="txt_PrimaNetaAux" Text='<%# Eval("prima_neta") %>' CssClass="NoDisplay"></asp:TextBox>
                                                
                                                        <asp:TextBox runat="server" ID="txt_PrcComNeta" Text='<%# Eval("prc_com") %>' CssClass="NoDisplay"></asp:TextBox>
                                                        <asp:TextBox runat="server" ID="txt_ComNeta" Text='<%# Eval("comision") %>' CssClass="NoDisplay"></asp:TextBox>
                                                        <asp:TextBox runat="server" ID="txt_PnrNeta" Text='<%# Eval("pnr") %>' CssClass="NoDisplay"></asp:TextBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Prima INC" HeaderStyle-CssClass="Centro">
                                                    <ItemTemplate>
                                                        <asp:TextBox runat="server" ID="txt_PrimaINC" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("prima_inc")))%>'  Enabled="false" CssClass="estandar-control Tablero Seleccion Monto PrimaINC" Width="100px"></asp:TextBox>
                                                        <asp:TextBox runat="server" ID="txt_PrimaINCAux" Text='<%# Eval("prima_inc") %>' CssClass="NoDisplay"></asp:TextBox>

                                                        <asp:TextBox runat="server" ID="txt_PrcComINC" Text='<%# Eval("prc_com_inc") %>' CssClass="NoDisplay"></asp:TextBox>
                                                        <asp:TextBox runat="server" ID="txt_ComINC" Text='<%# Eval("com_inc") %>' CssClass="NoDisplay"></asp:TextBox>
                                                        <asp:TextBox runat="server" ID="txt_PnrINC" Text='<%# Eval("pnr_inc") %>' CssClass="NoDisplay"></asp:TextBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Prima FHM" HeaderStyle-CssClass="columna-scroll Centro">
                                                    <ItemTemplate>
                                                        <asp:TextBox runat="server" ID="txt_PrimaFHM" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("prima_fhm")))%>' Enabled="false" CssClass="estandar-control Tablero Seleccion Monto PrimaFHM" Width="100px"></asp:TextBox>
                                                        <asp:TextBox runat="server" ID="txt_PrimaFHMAux" Text='<%# Eval("prima_fhm") %>' CssClass="NoDisplay"></asp:TextBox>

                                                        <asp:TextBox runat="server" ID="txt_PrcComFHM" Text='<%# Eval("prc_com_fhm") %>' CssClass="NoDisplay"></asp:TextBox>
                                                        <asp:TextBox runat="server" ID="txt_ComFHM" Text='<%# Eval("com_fhm") %>' CssClass="NoDisplay"></asp:TextBox>
                                                        <asp:TextBox runat="server" ID="txt_PnrFHM" Text='<%# Eval("pnr_fhm") %>' CssClass="NoDisplay "></asp:TextBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Prima TEV" HeaderStyle-CssClass="Centro">
                                                    <ItemTemplate>
                                                        <asp:TextBox runat="server" ID="txt_PrimaTEV" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("prima_tev")))%>' Enabled="false" CssClass="estandar-control Tablero Seleccion Monto PrimaTEV" Width="100px"></asp:TextBox>
                                                        <asp:TextBox runat="server" ID="txt_PrimaTEVAux" Text='<%# Eval("prima_tev") %>' CssClass="NoDisplay"></asp:TextBox>

                                                        <asp:TextBox runat="server" ID="txt_PrcComTEV" Text='<%# Eval("prc_com_tev") %>' CssClass="NoDisplay"></asp:TextBox>
                                                        <asp:TextBox runat="server" ID="txt_ComTEV" Text='<%# Eval("com_tev") %>' CssClass="NoDisplay"></asp:TextBox>
                                                        <asp:TextBox runat="server" ID="txt_PnrTEV" Text='<%# Eval("pnr_tev") %>' CssClass="NoDisplay"></asp:TextBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Prima RC" HeaderStyle-CssClass="Centro">
                                                <ItemTemplate>
                                                        <asp:TextBox runat="server" ID="txt_PrimaRC" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("prima_rc")))%>' Enabled="false"  CssClass="estandar-control Tablero Seleccion Monto PrimaRC"  Width="100px"></asp:TextBox>
                                                        <asp:TextBox runat="server" ID="txt_PrimaRCAux" Text='<%# Eval("prima_rc") %>' CssClass="NoDisplay"></asp:TextBox>
                                            
                                                        <asp:TextBox runat="server" ID="txt_PrcComRC" Text='<%# Eval("prc_com_rc") %>' CssClass="NoDisplay"></asp:TextBox>
                                                        <asp:TextBox runat="server" ID="txt_ComRC" Text='<%# Eval("com_rc") %>' CssClass="NoDisplay"></asp:TextBox>
                                                        <asp:TextBox runat="server" ID="txt_PnrRC" Text='<%# Eval("pnr_rc") %>' CssClass="NoDisplay"></asp:TextBox>
                                                </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Prima Casco" HeaderStyle-CssClass="Centro">
                                                    <ItemTemplate>
                                                        <asp:TextBox runat="server" ID="txt_PrimaCSC" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("prima_casco")))%>' Enabled="false"  CssClass="estandar-control Tablero Seleccion Monto PrimaCSC"  Width="100px"></asp:TextBox>
                                                        <asp:TextBox runat="server" ID="txt_PrimaCSCAux" Text='<%# Eval("prima_casco") %>' CssClass="NoDisplay"></asp:TextBox>

                                                        <asp:TextBox runat="server" ID="txt_PrcComCSC" Text='<%# Eval("prc_com_casco") %>' CssClass="NoDisplay"></asp:TextBox>
                                                        <asp:TextBox runat="server" ID="txt_ComCSC" Text='<%# Eval("com_casco") %>' CssClass="NoDisplay"></asp:TextBox>
                                                        <asp:TextBox runat="server" ID="txt_PnrCSC" Text='<%# Eval("pnr_casco") %>' CssClass="NoDisplay"></asp:TextBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Prima Guerra" HeaderStyle-CssClass="Centro">
                                                    <ItemTemplate>
                                                        <asp:TextBox runat="server" ID="txt_PrimaGRA" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("prima_guerra")))%>' Enabled="false"  CssClass="estandar-control Tablero Seleccion Monto PrimaGRA" Width="100px"></asp:TextBox>
                                                        <asp:TextBox runat="server" ID="txt_PrimaGRAAux" Text='<%# Eval("prima_guerra") %>' CssClass="NoDisplay"></asp:TextBox>

                                                        <asp:TextBox runat="server" ID="txt_PrcComGRA" Text='<%# Eval("prc_com_guerra") %>' CssClass="NoDisplay"></asp:TextBox>
                                                        <asp:TextBox runat="server" ID="txt_ComGRA" Text='<%# Eval("com_guerra") %>' CssClass="NoDisplay"></asp:TextBox>
                                                        <asp:TextBox runat="server" ID="txt_PnrGRA" Text='<%# Eval("pnr_guerra") %>' CssClass="NoDisplay"></asp:TextBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="% Corretaje" HeaderStyle-CssClass="Centro">
                                                    <ItemTemplate>
                                                        <asp:TextBox runat="server" ID="txt_PrcCorretaje" Text='<%# String.Format("{0:#,#0.0000}", CDbl(Eval("prc_corretaje")))%>' CssClass="estandar-control Tablero Seleccion Monto PrcCorretaje" Width="60px"></asp:TextBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Corretaje" HeaderStyle-CssClass="Centro">
                                                    <ItemTemplate>
                                                        <asp:TextBox runat="server" ID="txt_Corretaje" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("corretaje")))%>' CssClass="estandar-control Tablero Seleccion Monto Corretaje" Width="100px"></asp:TextBox>
                                                        <asp:TextBox runat="server" ID="txt_CorretajeAux" Text='<%# Eval("corretaje") %>' CssClass="NoDisplay"></asp:TextBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Estatus" HeaderStyle-CssClass="Centro">
                                                    <ItemTemplate>
                                                        <asp:DropDownList runat="server" ID="ddl_Estatus" CssClass="estandar-control Tablero Estatus" Width="70px" AutoPostBack="true" OnSelectedIndexChanged="ddl_Estatus_SelectedIndexChanged">
                                                            <asp:ListItem Text="Proyecto" Value="0"></asp:ListItem>
                                                            <asp:ListItem Text="Firme" Value="1"></asp:ListItem>
                                                            <asp:ListItem Text="Cancelado" Value="2"></asp:ListItem>
                                                        </asp:DropDownList>
                                                        <asp:TextBox runat="server" ID="txt_Observaciones" Text='<%# Eval("observaciones") %>' CssClass="NoDisplay Observaciones"></asp:TextBox>
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
                                        <asp:LinkButton id="btn_RemoveBroker" runat="server" class="btn botones">
                                            <span>
                                                <img class="btn-quitar"/>
                                                Quitar
                                            </span>
                                        </asp:LinkButton>
                                    </div> 
                               </div> 
                           </div>
                       </div>
                       
                       <div class="clear padding5"></div>

                       <div class="row">
                           <div class="col-md-12"> 
                               <div class="cuadro-titulo">
                                    <input type="image" src="../Images/contraer_mini_inv.png" id="coVentana10" class="contraer"  />
                                    <input type="image" src="../Images/expander_mini_inv.png"   id="exVentana10" class="expandir"  />
                                    <asp:label runat="server">[Reaseguradores]</asp:label>
                                    <asp:label runat="server" ID="lbl_Reaseguradores"></asp:label>
                               </div>
                               <div class="panel-subcontenido ventana10">
                                   <asp:HiddenField runat="server" ID="hid_IndiceReas" Value="-1" />
                                   <asp:Panel runat="server" ID="pnlCompañia" Width="100%" Height="150px" ScrollBars="Vertical">
                                        <asp:GridView runat="server" ID="gvd_Reasegurador" AutoGenerateColumns="false" 
                                                        CssClass="grid-view" HeaderStyle-CssClass="header" AlternatingRowStyle-CssClass="altern"
                                                        GridLines="Horizontal"  ShowHeaderWhenEmpty="true" DataKeyNames="cod_grupo,cod_broker,cod_cia,Estatus">
                                            <Columns>
                                                <asp:TemplateField HeaderText="" HeaderStyle-CssClass="Centro" ItemStyle-CssClass="Centrado">
                                                    <HeaderTemplate>
                                                        <asp:CheckBox runat="server" ID="chk_SelAll" Width="20px" onclick="fn_SeleccionTodos('gvd_Reasegurador', this, 'chk_Sel')" /> 
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:CheckBox runat="server" ID="chk_Sel" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Clave" HeaderStyle-CssClass="Centro">
                                                    <ItemTemplate>
                                                        <asp:LinkButton runat="server" ID="lnk_Clave" CommandName="Subjetividad" Text='<%# Eval("cod_cia") %>' CssClass="estandar-control Tablero Centro Clave" Width="50px"></asp:LinkButton>
                                                        <asp:Label runat="server" ID="lbl_ClaveCia" Text='<%# Eval("cod_cia") %>' CssClass="NoDisplay"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Descripción" HeaderStyle-CssClass="Centro">
                                                    <ItemTemplate>
                                                        <asp:textbox runat="server" ID="txt_Descripcion" Text='<%# Eval("Descripcion") %>' Enabled="false" CssClass="estandar-control Tablero" Width="200px"></asp:textbox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="RGRE" HeaderStyle-CssClass="Centro">
                                                    <ItemTemplate>
                                                        <asp:textbox runat="server" ID="txt_RGRE" Text='<%# Eval("cod_naic") %>' Enabled="false" CssClass="estandar-control Tablero" Width="100px"></asp:textbox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Calif." HeaderStyle-CssClass="Centro">
                                                    <ItemTemplate>
                                                        <asp:textbox runat="server" ID="txt_Calif" Text='<%# Eval("calif") %>' Enabled="false" CssClass="estandar-control Tablero Centro" Width="40px"></asp:textbox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Agencia" HeaderStyle-CssClass="Centro">
                                                    <ItemTemplate>
                                                        <asp:textbox runat="server" ID="txt_Agencia" Text='<%# Eval("age_Calif") %>' Enabled="false" CssClass="estandar-control Tablero" Width="90px"></asp:textbox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="(%) S/100%" HeaderStyle-CssClass="Centro">
                                                    <ItemTemplate>
                                                        <asp:TextBox runat="server" ID="txt_PrcPart100" Text='<%# String.Format("{0:#,#0.0000}", CDbl(Eval("prc_part100")))%>' Enabled="false" CssClass="estandar-control Tablero Seleccion Monto PrcPart100" Width="60px"></asp:TextBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="% Part." HeaderStyle-CssClass="Centro">
                                                    <ItemTemplate>
                                                        <asp:TextBox runat="server" ID="txt_PrcPart" Text='<%# String.Format("{0:#,#0.0000}", CDbl(Eval("prc_part")))%>' CssClass="estandar-control Tablero Seleccion Monto PrcPart" Width="50px"></asp:TextBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Lím. Max. Resp" HeaderStyle-CssClass="Centro">
                                                    <ItemTemplate>
                                                        <asp:TextBox runat="server" ID="txt_LimResp" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("suma_asegurada")))%>' CssClass="estandar-control Tablero Monto SumaAsegurada" Enabled="false" Width="100px"></asp:TextBox>
                                                        <asp:TextBox runat="server" ID="txt_LimRespAux" Text='<%# Eval("suma_asegurada") %>' CssClass="NoDisplay"></asp:TextBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Prima Neta" HeaderStyle-CssClass="Centro">
                                                    <ItemTemplate>
                                                        <asp:TextBox runat="server" ID="txt_PrimaNeta" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("prima_neta")))%>' CssClass="estandar-control Tablero Seleccion Monto PrimaNeta" Enabled="false" Width="100px"></asp:TextBox>
                                                        <asp:TextBox runat="server" ID="txt_PrimaNetaAux" Text='<%# Eval("prima_neta") %>' CssClass="NoDisplay"></asp:TextBox>

                                                        <asp:TextBox runat="server" ID="txt_PrcComNeta" Text='<%# Eval("prc_com") %>' CssClass="NoDisplay"></asp:TextBox>
                                                        <asp:TextBox runat="server" ID="txt_ComNeta" Text='<%# Eval("comision") %>' CssClass="NoDisplay"></asp:TextBox>
                                                        <asp:TextBox runat="server" ID="txt_PnrNeta" Text='<%# Eval("pnr") %>' CssClass="NoDisplay"></asp:TextBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Prima INC" HeaderStyle-CssClass="Centro">
                                                    <ItemTemplate>
                                                        <asp:TextBox runat="server" ID="txt_PrimaINC" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("prima_inc")))%>'  Enabled="false" CssClass="estandar-control Tablero Seleccion Monto PrimaINC" Width="100px"></asp:TextBox>
                                                        <asp:TextBox runat="server" ID="txt_PrimaINCAux" Text='<%# Eval("prima_inc") %>' CssClass="NoDisplay"></asp:TextBox>

                                                        <asp:TextBox runat="server" ID="txt_PrcComINC" Text='<%# Eval("prc_com_inc") %>' CssClass="NoDisplay"></asp:TextBox>
                                                        <asp:TextBox runat="server" ID="txt_ComINC" Text='<%# Eval("com_inc") %>' CssClass="NoDisplay"></asp:TextBox>
                                                        <asp:TextBox runat="server" ID="txt_PnrINC" Text='<%# Eval("pnr_inc") %>' CssClass="NoDisplay"></asp:TextBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Prima FHM" HeaderStyle-CssClass="columna-scroll Centro">
                                                    <ItemTemplate>
                                                        <asp:TextBox runat="server" ID="txt_PrimaFHM" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("prima_fhm")))%>' Enabled="false" CssClass="estandar-control Tablero Seleccion Monto PrimaFHM" Width="100px"></asp:TextBox>
                                                        <asp:TextBox runat="server" ID="txt_PrimaFHMAux" Text='<%# Eval("prima_fhm") %>' CssClass="NoDisplay"></asp:TextBox>

                                                        <asp:TextBox runat="server" ID="txt_PrcComFHM" Text='<%# Eval("prc_com_fhm") %>' CssClass="NoDisplay"></asp:TextBox>
                                                        <asp:TextBox runat="server" ID="txt_ComFHM" Text='<%# Eval("com_fhm") %>' CssClass="NoDisplay"></asp:TextBox>
                                                        <asp:TextBox runat="server" ID="txt_PnrFHM" Text='<%# Eval("pnr_fhm") %>' CssClass="NoDisplay"></asp:TextBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Prima TEV" HeaderStyle-CssClass="Centro">
                                                    <ItemTemplate>
                                                        <asp:TextBox runat="server" ID="txt_PrimaTEV" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("prima_tev")))%>' Enabled="false" CssClass="estandar-control Tablero Seleccion Monto PrimaTEV" Width="100px"></asp:TextBox>
                                                        <asp:TextBox runat="server" ID="txt_PrimaTEVAux" Text='<%# Eval("prima_tev") %>' CssClass="NoDisplay"></asp:TextBox>

                                                        <asp:TextBox runat="server" ID="txt_PrcComTEV" Text='<%# Eval("prc_com_tev") %>' CssClass="NoDisplay"></asp:TextBox>
                                                        <asp:TextBox runat="server" ID="txt_ComTEV" Text='<%# Eval("com_tev") %>' CssClass="NoDisplay"></asp:TextBox>
                                                        <asp:TextBox runat="server" ID="txt_PnrTEV" Text='<%# Eval("pnr_tev") %>' CssClass="NoDisplay"></asp:TextBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Prima RC" HeaderStyle-CssClass="Centro">
                                                <ItemTemplate>
                                                        <asp:TextBox runat="server" ID="txt_PrimaRC" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("prima_rc")))%>' Enabled="false"  CssClass="estandar-control Tablero Seleccion Monto PrimaRC"  Width="100px"></asp:TextBox>
                                                        <asp:TextBox runat="server" ID="txt_PrimaRCAux" Text='<%# Eval("prima_rc") %>' CssClass="NoDisplay"></asp:TextBox>
                                            
                                                        <asp:TextBox runat="server" ID="txt_PrcComRC" Text='<%# Eval("prc_com_rc") %>' CssClass="NoDisplay"></asp:TextBox>
                                                        <asp:TextBox runat="server" ID="txt_ComRC" Text='<%# Eval("com_rc") %>' CssClass="NoDisplay"></asp:TextBox>
                                                        <asp:TextBox runat="server" ID="txt_PnrRC" Text='<%# Eval("pnr_rc") %>' CssClass="NoDisplay"></asp:TextBox>
                                                </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Prima Casco" HeaderStyle-CssClass="Centro">
                                                    <ItemTemplate>
                                                        <asp:TextBox runat="server" ID="txt_PrimaCSC" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("prima_casco")))%>' Enabled="false"  CssClass="estandar-control Tablero Seleccion Monto PrimaCSC"  Width="100px"></asp:TextBox>
                                                        <asp:TextBox runat="server" ID="txt_PrimaCSCAux" Text='<%# Eval("prima_casco") %>' CssClass="NoDisplay"></asp:TextBox>

                                                        <asp:TextBox runat="server" ID="txt_PrcComCSC" Text='<%# Eval("prc_com_casco") %>' CssClass="NoDisplay"></asp:TextBox>
                                                        <asp:TextBox runat="server" ID="txt_ComCSC" Text='<%# Eval("com_casco") %>' CssClass="NoDisplay"></asp:TextBox>
                                                        <asp:TextBox runat="server" ID="txt_PnrCSC" Text='<%# Eval("pnr_casco") %>' CssClass="NoDisplay"></asp:TextBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Prima Guerra" HeaderStyle-CssClass="Centro">
                                                    <ItemTemplate>
                                                        <asp:TextBox runat="server" ID="txt_PrimaGRA" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("prima_guerra")))%>' Enabled="false"  CssClass="estandar-control Tablero Seleccion Monto PrimaGRA" Width="100px"></asp:TextBox>
                                                        <asp:TextBox runat="server" ID="txt_PrimaGRAAux" Text='<%# Eval("prima_guerra") %>' CssClass="NoDisplay"></asp:TextBox>

                                                        <asp:TextBox runat="server" ID="txt_PrcComGRA" Text='<%# Eval("prc_com_guerra") %>' CssClass="NoDisplay"></asp:TextBox>
                                                        <asp:TextBox runat="server" ID="txt_ComGRA" Text='<%# Eval("com_guerra") %>' CssClass="NoDisplay"></asp:TextBox>
                                                        <asp:TextBox runat="server" ID="txt_PnrGRA" Text='<%# Eval("pnr_guerra") %>' CssClass="NoDisplay"></asp:TextBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Estatus" HeaderStyle-CssClass="Centro">
                                                    <ItemTemplate>
                                                        <asp:DropDownList runat="server" ID="ddl_Estatus" CssClass="estandar-control Tablero Estatus" AutoPostBack="true" OnSelectedIndexChanged="ddl_Estatus_SelectedIndexChanged" Width="70px">
                                                            <asp:ListItem Text="Proyecto" Value="0"></asp:ListItem>
                                                            <asp:ListItem Text="Firme" Value="1"></asp:ListItem>
                                                            <asp:ListItem Text="Cancelado" Value="2"></asp:ListItem>
                                                        </asp:DropDownList>
                                                        <asp:TextBox runat="server" ID="txt_Observaciones" Text='<%# Eval("observaciones") %>' CssClass="NoDisplay Observaciones"></asp:TextBox>
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
                                        <asp:LinkButton id="btn_RemoveCia" runat="server" class="btn botones">
                                            <span>
                                                <img class="btn-quitar"/>
                                                Quitar
                                            </span>
                                        </asp:LinkButton>
                                   </div> 
                               </div> 
                           </div>
                       </div>
                       
                   </ContentTemplate>
                </asp:UpdatePanel>
            </div>

            <div class="clear padding10"></div>
          </div>

          <div id="menu3" class="tab-pane fade">
              <div class="clear padding5"></div>
                  <asp:UpdatePanel runat="server" ID="upResumen">
                      <ContentTemplate>
                        <div class="panel-seccion" >
                            <div class="clear padding4"></div>
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:label runat="server" class="col-md-1  etiqueta-control Tablero"  Width="20%">ASEGURADO</asp:label>
                                    <asp:textbox runat="server" ID="lbl_Asegurado" CssClass="estandar-control Tablero" Enabled="false" Width="75%"></asp:textbox>                      
                                </div>
                                <div class="col-md-6" style="border-left:inset;border-width:1px;">
                                    <asp:label runat="server" class="col-md-1  etiqueta-control Tablero" Width="20%">POLIZA</asp:label>
                                    <asp:textbox runat="server" ID="lbl_Poliza" CssClass="estandar-control Tablero Derecha" Enabled="false" Width="75%"></asp:textbox>            
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">

                                </div>
                                <div class="col-md-6" style="border-left:inset;border-width:1px;">
                                    <asp:label runat="server" class="col-md-1  etiqueta-control Tablero" Width="20%">ENDOSO</asp:label>
                                    <asp:textbox runat="server" ID="lbl_Endoso" CssClass="estandar-control Tablero Derecha" Enabled="false" Width="75%"></asp:textbox>  
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">

                                </div>
                                <div class="col-md-6" style="border-left:inset;border-width:1px;">
                                    <asp:label runat="server" class="col-md-1  etiqueta-control Tablero" Width="20%">RENOVACION</asp:label>
                                    <asp:textbox runat="server" ID="lbl_Renovacion" CssClass="estandar-control Tablero Derecha" Enabled="false" Width="75%"></asp:textbox>  
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:label runat="server" class="col-md-1  etiqueta-control Tablero" Width="20%">RAMO</asp:label>
                                    <asp:DropDownList runat="server" ID="ddl_Ramo" CssClass="estandar-control Tablero" Width="75%"></asp:DropDownList>                      
                                </div>
                                <div class="col-md-6" style="border-left:inset;border-width:1px;">
                                    <asp:label runat="server" class="col-md-1  etiqueta-control Tablero" Width="20%">VIG. INI.</asp:label>
                                    <asp:textbox runat="server" ID="txt_VigenciaIni" CssClass="estandar-control Tablero Derecha" Enabled="false" Width="75%"></asp:textbox>            
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:label runat="server" class="col-md-1  etiqueta-control Tablero" Width="20%">SUBRAMO</asp:label>
                                    <asp:DropDownList runat="server" ID="ddl_Subramo" CssClass="estandar-control Tablero" Width="75%"></asp:DropDownList>                      
                                </div>
                                <div class="col-md-6" style="border-left:inset;border-width:1px;">
                                    <asp:label runat="server" class="col-md-1  etiqueta-control Tablero" Width="20%">VIG. FIN.</asp:label>
                                    <asp:textbox runat="server" ID="txt_VigenciaFin" CssClass="estandar-control Tablero Derecha"  Enabled="false" Width="75%"></asp:textbox>            
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:label runat="server" class="col-md-1  etiqueta-control Tablero" Width="20%">MONEDA</asp:label>
                                    <asp:textbox runat="server" ID="txt_Moneda" CssClass="estandar-control Tablero" Enabled="false" Width="75%"></asp:textbox>                      
                                </div>
                                <div class="col-md-6" style="border-left:inset;border-width:1px;">
                                    <asp:label runat="server" class="col-md-1  etiqueta-control Tablero" Width="20%">FEC. EMISION</asp:label>
                                    <asp:textbox runat="server" ID="txt_FechaEmision" CssClass="estandar-control Tablero Derecha" Enabled="false" Width="75%"></asp:textbox>            
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    
                                </div>
                                <div class="col-md-6" style="border-left:inset;border-width:1px;">
                                    <asp:label runat="server" class="col-md-1  etiqueta-control Tablero" Width="20%">SUSCRIPTOR</asp:label>
                                    <asp:textbox runat="server" ID="txt_Suscriptor" CssClass="estandar-control Tablero Derecha" Enabled="false" Width="75%"></asp:textbox>            
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:label runat="server" class="col-md-1  etiqueta-control Tablero" Width="20%">MOVIMIENTO</asp:label>
                                    <asp:textbox runat="server" ID="txt_Movimiento" CssClass="estandar-control Tablero" Enabled="false" Width="75%"></asp:textbox>            
                                </div>
                                <div class="col-md-6" style="border-left:inset;border-width:1px;">
                                    <asp:label runat="server" class="col-md-1  etiqueta-control Tablero" Width="20%">FEC INICIO</asp:label>
                                    <asp:textbox runat="server" ID="txt_FecIniColoc" CssClass="estandar-control Tablero Derecha" Enabled="false" Width="75%"></asp:textbox>            
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                     <asp:label runat="server" class="col-md-1  etiqueta-control Tablero" Width="20%">COBERTURAS</asp:label>
                                    <asp:textbox runat="server" ID="txt_Coberturas" CssClass="estandar-control Tablero" Enabled="false" Width="75%"></asp:textbox>            
                                </div>
                                <div class="col-md-6" style="border-left:inset;border-width:1px;">
                                    <asp:label runat="server" class="col-md-1  etiqueta-control Tablero" Width="20%">FECHA FIN</asp:label>
                                    <asp:textbox runat="server" ID="txt_FecFinColoc" CssClass="estandar-control Tablero Derecha" Enabled="false" Width="75%"></asp:textbox>            
                                </div>
                            </div>
                        </div>
                        <div class="clear padding4"></div>
                        <div class="panel-seccion" >
                            <div class="row">
                                <div class="col-md-8">
                                    <asp:Panel runat="server" ID="pnlRepartoResumen" Width="100%" Height="250px" ScrollBars="Horizontal">
                                        <asp:GridView runat="server" ID="gvd_RepartoResumen" AutoGenerateColumns="false" 
                                                        CssClass="grid-view" HeaderStyle-CssClass="header" AlternatingRowStyle-CssClass="altern"
                                                        GridLines="Horizontal"  ShowHeaderWhenEmpty="true" >
                                            <Columns>
                                                <asp:TemplateField HeaderText="">
                                                    <ItemTemplate>
                                                        <asp:TextBox runat="server" ID="txt_Concepto" Text='<%# Eval("Concepto") %>'  Enabled="false" CssClass="estandar-control Tablero" Width="80px"></asp:TextBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="">
                                                    <ItemTemplate>
                                                        <asp:TextBox runat="server" ID="txt_Descripcion" Text='<%# Eval("Descripcion") %>'  Enabled="false" CssClass="estandar-control Tablero" Width="120px"></asp:TextBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="(%) Part." HeaderStyle-CssClass="Centro">
                                                    <ItemTemplate>
                                                        <asp:TextBox runat="server" ID="txt_PrcPart" Text='<%# Eval("prc_part") %>' CssClass="estandar-control Tablero Monto" Enabled="false" Width="75px"></asp:TextBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Lím. Max. Resp" HeaderStyle-CssClass="Centro">
                                                    <ItemTemplate>
                                                        <asp:TextBox runat="server" ID="txt_LimResp" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("suma_asegurada")))%>'  Enabled="false" CssClass="estandar-control Tablero Monto" Width="100px"></asp:TextBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Prima Neta" HeaderStyle-CssClass="Centro">
                                                    <ItemTemplate>
                                                        <asp:TextBox runat="server" ID="txt_PrimaNeta" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("prima_neta")))%>' Enabled="false" CssClass="estandar-control Tablero Monto" Width="100px"></asp:TextBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Prima INC" HeaderStyle-CssClass="Centro">
                                                    <ItemTemplate>
                                                        <asp:TextBox runat="server" ID="txt_PrimaINC" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("prima_inc")))%>'  Enabled="false" CssClass="estandar-control Tablero Monto" Width="100px"></asp:TextBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Prima FHM" HeaderStyle-CssClass="columna-scroll Centro">
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
                                </div>
                                <div class="col-md-4">
                                    <div class="cuadro-subtitulo-grid">
                                            COMISIÓN AGENTE
                                    </div>    
                                    <asp:Panel runat="server" ID="pnlComisionResumen" Width="100%" Height="160px" ScrollBars="Horizontal">
                                        <asp:GridView runat="server" ID="gvd_ComisionResumen" AutoGenerateColumns="false" 
                                                        CssClass="grid-view" HeaderStyle-CssClass="header" AlternatingRowStyle-CssClass="altern"
                                                        GridLines="Horizontal"  ShowHeaderWhenEmpty="true" >
                                            <Columns>
                                                 <asp:TemplateField HeaderText="Ramo" HeaderStyle-CssClass="Centro">
                                                    <ItemTemplate>
                                                        <asp:textbox runat="server" ID="txt_Ramo" Text='<%# Eval("ramo") %>' Enabled="false" CssClass="estandar-control Tablero" Width="150px"></asp:textbox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="% Com" HeaderStyle-CssClass="Centro">
                                                    <ItemTemplate>
                                                        <asp:TextBox runat="server" ID="txt_PrcCom" Text='<%# String.Format("{0:#,#0.0000}", CDbl(Eval("prc_com")))%>' Enabled="false" CssClass="estandar-control Tablero Monto" Width="60px"></asp:TextBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Comisión" HeaderStyle-CssClass="Centro">
                                                    <ItemTemplate>
                                                        <asp:TextBox runat="server" ID="txt_Comision" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("comision")))%>' CssClass="estandar-control Tablero Monto" Enabled="false" Width="80px"></asp:TextBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </asp:Panel>
                                    <div class="clear padding10"></div>
                                    <div class="cuadro-subtitulo-grid">
                                            COMISIÓN FACULTATIVO %
                                    </div>    
                                    <div style="width:100%;  text-align:left">
                                        <asp:label runat="server" class="col-md-1  etiqueta-control Tablero" Width="30%">COM. FAC. %</asp:label>
                                        <asp:TextBox runat="server" ID="txt_prcComFac" CssClass="estandar-control Tablero" Enabled="false" Width="70%"></asp:TextBox> 
                                    </div>
                                    <div class="clear padding2"></div>
                                    <div style="width:100%;  text-align:left">
                                        <asp:label runat="server" class="col-md-1  etiqueta-control Tablero" Width="30%">COMISIÓN</asp:label>
                                        <asp:TextBox runat="server" ID="txtComisionFac" CssClass="estandar-control Monto Tablero" Enabled="false" Width="70%"></asp:TextBox> 
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="clear padding4"></div>
                        <div class="panel-seccion" >
                            <div class="row">
                                <div class="col-md-12">
                                    <asp:label runat="server" class="etiqueta-control Tablero">REPARTO FACULTATIVO</asp:label>
                                    <div class="clear padding2"></div>
                                    <asp:Panel runat="server" ID="plnDistribucionResumen" Width="99.9%" Height="250px" ScrollBars="Vertical">
                                        <asp:GridView runat="server" ID="gvd_DistribucionResumen" AutoGenerateColumns="false" 
                                                        CssClass="grid-view" HeaderStyle-CssClass="header" AlternatingRowStyle-CssClass="altern"
                                                        GridLines="Horizontal"  ShowHeaderWhenEmpty="true" >
                                            <Columns>
                                                <asp:TemplateField HeaderText="Reasegurador" HeaderStyle-CssClass="Centro">
                                                    <ItemTemplate>
                                                        <asp:textbox runat="server" ID="txt_Reasegurador" Text='<%# Eval("Reasegurador") %>' Enabled="false" CssClass="estandar-control Tablero" Width="200px"></asp:textbox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Corredor" HeaderStyle-CssClass="Centro">
                                                    <ItemTemplate>
                                                        <asp:textbox runat="server" ID="txt_Corredor" Text='<%# Eval("Corredor") %>' Enabled="false" CssClass="estandar-control Tablero" Width="200px"></asp:textbox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="REG. CNSF" HeaderStyle-CssClass="Centro">
                                                    <ItemTemplate>
                                                        <asp:textbox runat="server" ID="txt_CNSF" Text='<%# Eval("reg_cnsf") %>' Enabled="false" CssClass="estandar-control Tablero" Width="100px"></asp:textbox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="(%) Part." HeaderStyle-CssClass="Centro">
                                                    <ItemTemplate>
                                                        <asp:TextBox runat="server" ID="txt_PrcPart"  Text='<%# String.Format("{0:#,#0.0000}", CDbl(Eval("prc_part")))%>'  Enabled="false" CssClass="estandar-control Tablero Monto" Width="70px"></asp:TextBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Lím. Max. Resp" HeaderStyle-CssClass="Centro">
                                                    <ItemTemplate>
                                                        <asp:TextBox runat="server" ID="txt_LimResp" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("suma_asegurada")))%>' CssClass="estandar-control Tablero Monto" Enabled="false" Width="100px"></asp:TextBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Prima Neta" HeaderStyle-CssClass="Centro">
                                                    <ItemTemplate>
                                                        <asp:TextBox runat="server" ID="txt_PrimaNeta" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("prima_neta")))%>' CssClass="estandar-control Tablero Monto" Enabled="false" Width="100px"></asp:TextBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Prima INC" HeaderStyle-CssClass="Centro">
                                                    <ItemTemplate>
                                                        <asp:TextBox runat="server" ID="txt_PrimaINC" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("prima_inc")))%>'  Enabled="false" CssClass="estandar-control Tablero Monto" Width="100px"></asp:TextBox>
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
                                                <asp:TemplateField HeaderText="% Corretaje" HeaderStyle-CssClass="Centro">
                                                    <ItemTemplate>
                                                        <asp:TextBox runat="server" ID="txt_PrcCorretaje" Text='<%# String.Format("{0:#,#0.0000}", CDbl(Eval("prc_corretaje")))%>' Enabled="false" CssClass="estandar-control Tablero Monto" Width="70px"></asp:TextBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Corretaje" HeaderStyle-CssClass="Centro">
                                                    <ItemTemplate>
                                                        <asp:TextBox runat="server" ID="txt_Corretaje" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("corretaje")))%>' CssClass="estandar-control Tablero Monto" Enabled="false" Width="100px"></asp:TextBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="% Com. INC" HeaderStyle-CssClass="Centro">
                                                    <ItemTemplate>
                                                        <asp:TextBox runat="server" ID="txt_PrcComINC"  Text='<%# String.Format("{0:#,#0.0000}", CDbl(Eval("prc_com_inc")))%>' Enabled="false" CssClass="estandar-control Tablero Monto" Width="75px"></asp:TextBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="% Com. FHM" HeaderStyle-CssClass="Centro">
                                                    <ItemTemplate>
                                                        <asp:TextBox runat="server" ID="txt_PrcComFHM"  Text='<%# String.Format("{0:#,#0.0000}", CDbl(Eval("prc_com_fhm")))%>' Enabled="false" CssClass="estandar-control Tablero Monto" Width="75px"></asp:TextBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="% Com. TEV" HeaderStyle-CssClass="Centro">
                                                    <ItemTemplate>
                                                        <asp:TextBox runat="server" ID="txt_PrcComTEV"  Text='<%# String.Format("{0:#,#0.0000}", CDbl(Eval("prc_com_tev")))%>' Enabled="false" CssClass="estandar-control Tablero Monto" Width="75px"></asp:TextBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="% Com. RC" HeaderStyle-CssClass="Centro">
                                                    <ItemTemplate>
                                                        <asp:TextBox runat="server" ID="txt_PrcComRC"  Text='<%# String.Format("{0:#,#0.0000}", CDbl(Eval("prc_com_rc")))%>' Enabled="false" CssClass="estandar-control Tablero Monto" Width="75px"></asp:TextBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="% Com. Casco" HeaderStyle-CssClass="Centro">
                                                    <ItemTemplate>
                                                        <asp:TextBox runat="server" ID="txt_PrcComCSC"  Text='<%# String.Format("{0:#,#0.0000}", CDbl(Eval("prc_com_casco")))%>' Enabled="false" CssClass="estandar-control Tablero Monto" Width="75px"></asp:TextBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="% Com. Guerra" HeaderStyle-CssClass="Centro">
                                                    <ItemTemplate>
                                                        <asp:TextBox runat="server" ID="txt_PrcComGRA"  Text='<%# String.Format("{0:#,#0.0000}", CDbl(Eval("prc_com_guerra")))%>' Enabled="false" CssClass="estandar-control Tablero Monto" Width="75px"></asp:TextBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Prima Neta Reas." HeaderStyle-CssClass="Centro">
                                                    <ItemTemplate>
                                                        <asp:TextBox runat="server" ID="txt_PNR" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("pnr")))%>' CssClass="estandar-control Tablero Monto" Enabled="false" Width="100px"></asp:TextBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </asp:Panel>
                                </div>
                            </div>
                        </div>
                        <div class="clear padding4"></div>
                        <div class="panel-seccion" >
                             <div class="row">
                                <div class="col-md-12">
                                    <asp:label runat="server" class="etiqueta-control Tablero">OBSERVACIONES</asp:label>
                                    <div class="clear padding2"></div>
                                    <asp:TextBox runat="server" ID="txt_ObservacionesResumen" CssClass="estandar-control" TextMode ="MultiLine" Width="99.9%" Height="100px"></asp:TextBox>
                                </div>
                             </div>
                        </div>
                        <div class="clear padding4"></div>
                        <div class="panel-seccion" >
                             <div class="row">
                                <div class="col-md-12">
                                    <asp:label runat="server" class="etiqueta-control Tablero">GARANTIAS DE PAGO</asp:label>
                                    <div class="clear padding2"></div>
                                    <asp:TextBox runat="server" ID="txt_GarantiasPago" CssClass="estandar-control" TextMode ="MultiLine" Width="99.9%" Height="70px"></asp:TextBox>
                                </div>
                             </div>
                        </div>
                        <div class="clear padding4"></div>
                        <div class="panel-seccion" >
                             <asp:label runat="server" class="etiqueta-control Tablero">RESPONSABLE DE LA INFORMACIÓN</asp:label>
                             <div class="clear padding2"></div>
                             <div class="row">
                                <div class="col-md-5">
                                    <asp:label runat="server" class="col-md-1 etiqueta-control" Width="15%">Usuario</asp:label>
                                    <asp:TextBox runat="server" ID="txt_ClaveResp" CssClass="col-md-1 estandar-control Tablero Seleccion Centro" PlaceHolder="Id" Enabled="false" Width="20%"></asp:TextBox>
                                    <asp:TextBox runat="server" ID="txt_SearchResp" CssClass="estandar-control Tablero Seleccion" PlaceHolder="Nombre" Enabled="false" Width="65%"></asp:TextBox>
                                </div>
                                <div class="col-md-4">
                                      <asp:label runat="server" class="col-md-1  etiqueta-control" Width="30%">Departamento</asp:label>
                                      <asp:TextBox runat="server" ID="txt_Departamento" Enabled="false" CssClass="estandar-control Tablero" PlaceHolder="Departamento" Width="70%"></asp:TextBox>
                                 </div>
                                 <div class="col-md-3">
                                      <asp:label runat="server" class="col-md-1  etiqueta-control" Width="25%">Avance</asp:label>
                                      <asp:DropDownList runat="server" ID="ddl_Avance" CssClass="estandar-control Tablero" Width="74.5%">
                                          <asp:ListItem Text="Pendiente" Value="0"></asp:ListItem>
                                          <asp:ListItem Text="Confirmado" Value="1"></asp:ListItem>
                                          <asp:ListItem Text="Cancelado" Value="2"></asp:ListItem>
                                      </asp:DropDownList>
                                 </div>
                             </div>
                        </div>
                      </ContentTemplate>
                  </asp:UpdatePanel>
              </div>
              <div class="clear padding10"></div>
        </div>

        <div class="clear padding10"></div>

        <div class="row" style="border:2px solid gray; border-width: 1px 0 0 0;">
            <asp:UpdatePanel runat="server" ID="upOperacion">
                <ContentTemplate>
                        <div class="col-md-8">
                            <div style="width:100%; text-align:left; padding: 0 0 0 10px;">
                          
                                        <asp:LinkButton id="btn_Nuevo" runat="server" class="btn botones">
                                            <span>
                                                <img class="btn-añadir"/>
                                                Nuevo
                                            </span>
                                        </asp:LinkButton>
                                        <asp:LinkButton id="btn_Modificar" runat="server" class="btn botones">
                                            <span>
                                                <img class="btn-modificar"/>
                                                Modificar
                                            </span>
                                        </asp:LinkButton>
                                        <asp:LinkButton id="btn_Consultar" runat="server" class="btn botones">
                                            <span>
                                                <img class="btn-buscar"/>
                                                Consultar
                                            </span>
                                        </asp:LinkButton>
                                        <asp:LinkButton id="btn_Anular" runat="server" class="btn botones">
                                            <span>
                                                <img class="btn-eliminar"/>
                                                Anular
                                            </span>
                                        </asp:LinkButton>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div style="width:100%; text-align:right; padding: 0 10px 0 0;">
                                <asp:LinkButton id="btn_Guardar" runat="server" class="btn botones">
                                    <span>
                                        <img class="btn-guardar"/>
                                        Guardar
                                    </span>
                                </asp:LinkButton>
                                <asp:LinkButton id="btn_Cancelar" runat="server" class="btn botones">
                                    <span>
                                        <img class="btn-cancelar"/>
                                        Cancelar
                                    </span>
                                </asp:LinkButton>
                            </div>
                        </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>

        <div id="Notas" style="width:22%;" class="modal-simple" >
            <asp:UpdatePanel runat="server" ID="upNotasTablero" >
                <ContentTemplate>
                    <div class="cuadro-titulo-flotante" style="height:30px">
                        <div class="row" >
                            <div class="col-md-1">
                                <input type="image" src="../Images/contraer_mini_inv.png" id="coVentana5" class="contraer"  />
                                <input type="image" src="../Images/expander_mini_inv.png"   id="exVentana5" class="expandir"  />
                            </div>
                            <div class="col-md-9">
                                Notas de Avance
                            </div>
                            <div class="col-md-1">
                                <button type="button" class="close" onclick="fn_CerrarModalSimple('#Notas');">&times;</button>
                            </div>
                        </div>
                    </div>
                    <div class="panel-subcontenido ventana5">
                        <asp:HiddenField runat="server" ID="hid_IndiceNota" Value="-1"/>
                        <asp:TextBox runat="server" ID="txt_Proceso" CssClass="estandar-control NombreProceso" Enabled="false" Width="99%"></asp:TextBox>
                        <asp:TextBox runat="server" ID="txt_NotaProceso" CssClass="estandar-control NotaProceso" TextMode="MultiLine" Width="99%" Height="80px"></asp:TextBox>
                        <div class="clear padding5"></div>
                        <%--<div style="width:99%;  text-align:right; border:2px solid gray; border-width: 1px 0 0 0;">
                            <asp:LinkButton id="btn_AplicaNota" runat="server" class="btn botones">
                                <span>
                                    <img class="btn-aceptar"/>
                                    Aplicar
                                </span>
                            </asp:LinkButton>
                        </div> 
                        <div class="clear padding3"></div>--%>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>

        <div id="Subjetividad" style="width:60%;" class="modal-simple" >
            <asp:UpdatePanel runat="server" ID="upSubjetividad" >
                <ContentTemplate>
                    <div class="cuadro-titulo-flotante" style="height:30px">
                        <div class="row" >
                            <div class="col-md-1">
                                <input type="image" src="../Images/contraer_mini_inv.png" id="coVentana7" class="contraer"  />
                                <input type="image" src="../Images/expander_mini_inv.png"   id="exVentana7" class="expandir"  />
                            </div>
                            <div class="col-md-9">
                                <asp:label runat="server">[Subjetividades y Observaciones]</asp:label>
                                <asp:label runat="server" ID="lbl_Subjetividades"></asp:label>
                            </div>
                            <div class="col-md-1">
                                <button type="button" class="close" onclick="fn_CerrarModalSimple('#Subjetividad');">&times;</button>
                            </div>
                        </div>
                    </div>
                    <div class="panel-subcontenido ventana7">
                        <div class="cuadro-subtitulo-grid">
                            Subjetividad
                        </div>
                        <asp:Panel runat="server" ID="pnlSubJetividad" Width="100%" Height="180px" ScrollBars="Both">
                            <asp:GridView runat="server" ID="gvd_Subjetividad" AutoGenerateColumns="false" 
                                        CssClass="grid-view" HeaderStyle-CssClass="header" AlternatingRowStyle-CssClass="altern"
                                        GridLines="Horizontal"  ShowHeaderWhenEmpty="true" DataKeyNames="cod_grupo,cod_broker,cod_cia,Num">
                                <Columns>
                                    <asp:TemplateField  HeaderStyle-CssClass="Centro" ItemStyle-CssClass="Centrado">
                                        <HeaderTemplate>
                                            <asp:CheckBox runat="server" ID="chk_SelAll" Width="20px" onclick="fn_SeleccionTodos('gvd_Subjetividad', this, 'chk_Sel')" /> 
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox runat="server" ID="chk_Sel" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Fecha Original" HeaderStyle-CssClass="Centro">
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="txt_Fecha" Text='<%# Eval("Fecha") %>' CssClass="estandar-control Tablero Fecha Centro Original" TextMode="Date" PlaceHolder="dia/mes/año" Width="85px"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Fecha Cumplim." HeaderStyle-CssClass="Centro" >
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="txt_FechaReal" Text='<%# Eval("FechaReal") %>' CssClass="estandar-control Tablero Fecha Centro Cumplimiento" TextMode="Date" PlaceHolder="dia/mes/año" Width="85px"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Estatus"  HeaderStyle-CssClass="Centro" ItemStyle-CssClass="Centrado">
                                        <ItemTemplate>
                                            <asp:CheckBox runat="server" ID="chk_Subjetividad" Checked='<%# Eval("sn_Subjetividad") %>' CssClass="chk_Subjetividad" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Descripción" HeaderStyle-CssClass="Centro">
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="txt_Subjetividad" Text='<%# Eval("Subjetividad") %>' CssClass="estandar-control Tablero Subjetividad" TextMode="MultiLine" Width="700px"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </asp:Panel>
                        <div style="width:100%;  text-align:right">
                            <asp:LinkButton id="btn_AddSubjetividad" runat="server" class="btn botones">
                                <span>
                                    <img class="btn-añadir"/>
                                    Añadir
                                </span>
                            </asp:LinkButton>
                            <asp:LinkButton id="btn_RemoveSubjetividad" runat="server" class="btn botones">
                                <span>
                                    <img class="btn-quitar"/>
                                    Quitar
                                </span>
                            </asp:LinkButton>
                        </div>
                        <div class="clear padding5"></div>
                        <div class="cuadro-subtitulo-grid">
                            Observaciones
                        </div>
                        <asp:Panel runat="server" ID="pnlObservaciones" Width="100%" Height="50px" ScrollBars="Vertical">
                            <asp:TextBox runat="server" ID="txt_Observaciones" CssClass="estandar-control Tablero Observaciones" Height="50px" TextMode="MultiLine" Width="100%"></asp:TextBox>
                        </asp:Panel> 
                        <div class="clear padding5"></div>
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

        <div id="Incisos" style="width:90%;" class="modal-poliza" >
            <asp:UpdatePanel runat="server" ID="upIncisos" >
                <ContentTemplate>
                    <div class="cuadro-titulo" style="height:30px">
                        <div class="row" >
                            <div class="col-md-1">
                                <input type="image" src="../Images/contraer_mini_inv.png" id="coVentana6" class="contraer"  />
                                <input type="image" src="../Images/expander_mini_inv.png"   id="exVentana6" class="expandir"  />
                            </div>
                            <div class="col-md-9">
                                Riesgos Agrupados
                            </div>
                            <div class="col-md-1">
                                <button type="button" class="close"  data-dismiss="modal">&times;</button>
                            </div>
                        </div>
                    </div>
                    <div class="panel-subcontenido ventana6">
                        <asp:Panel runat="server" ID="pnlRiesgosGrupo" Width="100%" Height="250px" ScrollBars="Both">
                            <asp:GridView runat="server" ID="gvd_RiesgosGrupo" AutoGenerateColumns="false" 
                                        CssClass="grid-view" HeaderStyle-CssClass="header" AlternatingRowStyle-CssClass="altern"
                                        GridLines="Horizontal"  ShowHeaderWhenEmpty="true" DataKeyNames="cod_inciso,cod_ramo">
                                <Columns>
                                    <asp:TemplateField HeaderText="" HeaderStyle-CssClass="Centro" ItemStyle-CssClass="Centrado">
                                        <HeaderTemplate>
                                            <asp:CheckBox runat="server" ID="chk_SelAll" Width="20px" onclick="fn_SeleccionTodos('gvd_RiesgosGrupo', this, 'chk_Sel')" /> 
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox runat="server" ID="chk_Sel" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="#">
                                        <ItemTemplate>
                                            <asp:label runat="server" ID="lbl_Inciso" CssClass="Centro" Text='<%# Eval("cod_inciso") %>' Width="20px" ></asp:label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Ramo" HeaderStyle-CssClass="Centro">
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="txt_ClaveRamo" Text='<%# Eval("cod_ramo") %>' CssClass="NoDisplay"></asp:TextBox>
                                            <asp:TextBox runat="server" ID="txt_SearchRamo" Text='<%# Eval("Ramo") %>' CssClass="estandar-control Tablero" Enabled="false" Width="200px"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Subramo" HeaderStyle-CssClass="Centro">
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="txt_SearchSubramo" Text='<%# Eval("Subramo") %>' CssClass="estandar-control Tablero" Enabled="false" Width="200px"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Sección" HeaderStyle-CssClass="Centro">
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="txt_SearchSeccion" Text='<%# Eval("Seccion") %>' CssClass="estandar-control Tablero" Enabled="false" Width="200px"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Cobertura" HeaderStyle-CssClass="Centro">
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="txt_SearchCobertura" Text='<%# Eval("Cobertura") %>' CssClass="estandar-control Tablero" Enabled="false" Width="200px"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Acumula" HeaderStyle-CssClass="Centro" ItemStyle-CssClass="Centro">
                                        <ItemTemplate>
                                            <asp:CheckBox runat="server" ID="chk_Adicional" Checked='<%# Eval("sn_adicional") %>' Enabled="false" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Valores Totales" HeaderStyle-CssClass="Centro">
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="txt_ValoresTotales" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("valores_totales")))%>' CssClass="estandar-control Tablero Monto" Enabled="false" Width="100px"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Lím. Max. Resp" HeaderStyle-CssClass="Centro">
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="txt_LimResp" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("suma_asegurada")))%>' CssClass="estandar-control Tablero Monto" Enabled="false" Width="100px"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Prima Neta" HeaderStyle-CssClass="Centro">
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="txt_PrimaNeta" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("prima_neta")))%>' CssClass="estandar-control Tablero Monto" Enabled="false" Width="100px"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Prima INC" HeaderStyle-CssClass="Centro">
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="txt_PrimaINC"  Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("prima_inc")))%>' CssClass="estandar-control Tablero Monto" Enabled="false" Width="100px"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Prima FHM" HeaderStyle-CssClass="Centro">
                                        <ItemTemplate>
                                            <asp:TextBox runat="server"  ID="txt_PrimaFHM" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("prima_fhm")))%>' CssClass="estandar-control Tablero Monto" Enabled="false" Width="100px"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Prima TEV" HeaderStyle-CssClass="Centro">
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="txt_PrimaTEV" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("prima_tev")))%>' CssClass="estandar-control Tablero Monto" Enabled="false" Width="100px"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Prima RC" HeaderStyle-CssClass="Centro">
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="txt_PrimaRC" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("prima_rc")))%>' CssClass="estandar-control Tablero Monto" Enabled="false"  Width="100px"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Prima Casco" HeaderStyle-CssClass="columna-scroll Centro">
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="txt_PrimaCSC" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("prima_casco")))%>' CssClass="estandar-control Tablero Monto" Enabled="false"  Width="100px"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Prima Guerra" HeaderStyle-CssClass="Centro">
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="txt_PrimaGRA" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("prima_guerra")))%>' CssClass="estandar-control Tablero Monto" Enabled="false" Width="100px"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </asp:Panel>
                        <div style="width:100%;  text-align:right">
                            <asp:LinkButton id="btn_AddRiesgoGrupo" runat="server" class="btn botones ModalEspera">
                                <span>
                                    <img class="btn-añadir"/>
                                    Agregar
                                </span>
                            </asp:LinkButton>
                            <asp:LinkButton id="btn_RemoveRiesgoGrupo" runat="server" class="btn botones ModalEspera">
                                <span>
                                    <img class="btn-quitar"/>
                                    Quitar
                                </span>
                            </asp:LinkButton>
                        </div> 
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>

        <div id="Comisiones" style="width:25%;" class="modal-simple" >
            <asp:UpdatePanel runat="server" ID="upComisiones" >
                <ContentTemplate>
                    <div class="cuadro-titulo-flotante" style="height:30px">
                        <div class="row" >
                            <div class="col-md-1">
                                <input type="image" src="../Images/contraer_mini_inv.png" id="coVentana8" class="contraer"  />
                                <input type="image" src="../Images/expander_mini_inv.png"   id="exVentana8" class="expandir"  />
                            </div>
                            <div class="col-md-9">
                                <asp:label runat="server">[Comisión]</asp:label>
                                <asp:label runat="server" ID="lbl_Comisiones"></asp:label>
                            </div>
                            <div class="col-md-1">
                                <button type="button" class="close" onclick="fn_CerrarModalSimple('#Comisiones');">&times;</button>
                            </div>
                        </div>
                    </div>
                    <div class="panel-subcontenido ventana8">
                        <div class="clear padding3"></div>
                        <div runat="server" id="div_total" class="row">
                            <div class="cuadro-subtitulo-grid">
                                COMISIÓN TOTAL
                            </div>
                            <div class="clear padding3"></div>
                            <table>
                                <tr>
                                    <td>
                                        <asp:label runat="server" class="col-md-1 etiqueta-control" Width="40px">(%)</asp:label>
                                    </td>
                                    <td>
                                        <asp:TextBox runat="server" ID="txt_PrcComNeta" Text="0.0000" CssClass="estandar-control Tablero Seleccion Monto PrcComNeta" Width="50px"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:label runat="server" class="col-md-1 etiqueta-control" Width="70px">Comision</asp:label>
                                    </td>
                                    <td>
                                        <asp:TextBox runat="server" ID="txt_ComNeta" Text="0.00" CssClass="estandar-control Tablero Seleccion Monto ComNeta" Width="70px"></asp:TextBox>
                                        <asp:TextBox runat="server" ID="txt_ComNetaAux" Text="0.00" CssClass="NoDisplay"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:label runat="server" class="col-md-1 etiqueta-control" Width="45px">PNR</asp:label>
                                    </td>
                                    <td>
                                        <asp:TextBox runat="server" ID="txt_PnrNeta" Text="0.00" CssClass="estandar-control Tablero Seleccion Monto PnrNeta" Width="70px"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="clear padding3"></div>
                        <div runat="server" id="div_incendio" class="row">
                            <div class="cuadro-subtitulo-grid">
                                INCENDIO
                            </div>
                            <div class="clear padding3"></div>
                            <table>
                                <tr>
                                    <td>
                                        <asp:label runat="server" class="col-md-1 etiqueta-control" Width="40px">(%)</asp:label>
                                    </td>
                                    <td>
                                        <asp:TextBox runat="server" ID="txt_PrcComINC" Text="0.0000" CssClass="estandar-control Tablero Seleccion Monto PrcComINC" Width="50px"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:label runat="server" class="col-md-1 etiqueta-control" Width="70px">Comision</asp:label>
                                    </td>
                                    <td>
                                        <asp:TextBox runat="server" ID="txt_ComINC" Text="0.00" CssClass="estandar-control Tablero Seleccion Monto ComINC" Width="70px"></asp:TextBox>
                                        <asp:TextBox runat="server" ID="txt_ComINCAux" Text="0.00" CssClass="NoDisplay"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:label runat="server" class="col-md-1 etiqueta-control" Width="45px">PNR</asp:label>
                                    </td>
                                    <td>
                                        <asp:TextBox runat="server" ID="txt_PnrINC" Text="0.00" CssClass="estandar-control Tablero Seleccion Monto PnrINC" Width="70px"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="clear padding3"></div>
                        <div runat="server" id="div_fhm" class="row">
                            <div class="cuadro-subtitulo-grid">
                                FHM
                            </div>
                            <div class="clear padding3"></div>
                            <table>
                                <tr>
                                    <td>
                                        <asp:label runat="server" class="col-md-1 etiqueta-control" Width="40px">(%)</asp:label>
                                    </td>
                                    <td>
                                        <asp:TextBox runat="server" ID="txt_PrcComFHM" Text="0.0000" CssClass="estandar-control Tablero Seleccion Monto PrcComFHM" Width="50px"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:label runat="server" class="col-md-1 etiqueta-control" Width="70px">Comision</asp:label>
                                    </td>
                                    <td>
                                        <asp:TextBox runat="server" ID="txt_ComFHM" Text="0.00" CssClass="estandar-control Tablero Seleccion Monto ComFHM" Width="70px"></asp:TextBox>
                                        <asp:TextBox runat="server" ID="txt_ComFHMAux" Text="0.00" CssClass="NoDisplay"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:label runat="server" class="col-md-1 etiqueta-control" Width="45px">PNR</asp:label>
                                    </td>
                                    <td>
                                        <asp:TextBox runat="server" ID="txt_PnrFHM" Text="0.00" CssClass="estandar-control Tablero Seleccion Monto PnrFHM" Width="70px"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="clear padding3"></div>
                        <div runat="server" id="div_tev" class="row">
                            <div class="cuadro-subtitulo-grid">
                                TEV
                            </div>
                            <div class="clear padding3"></div>
                            <table>
                                <tr>
                                    <td>
                                        <asp:label runat="server" class="col-md-1 etiqueta-control" Width="40px">(%)</asp:label>
                                    </td>
                                    <td>
                                        <asp:TextBox runat="server" ID="txt_PrcComTEV" Text="0.0000" CssClass="estandar-control Tablero Seleccion Monto PrcComTEV" Width="50px"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:label runat="server" class="col-md-1 etiqueta-control" Width="70px">Comision</asp:label>
                                    </td>
                                    <td>
                                        <asp:TextBox runat="server" ID="txt_ComTEV" Text="0.00" CssClass="estandar-control Tablero Seleccion Monto ComTEV" Width="70px"></asp:TextBox>
                                        <asp:TextBox runat="server" ID="txt_ComTEVAux" Text="0.00" CssClass="NoDisplay"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:label runat="server" class="col-md-1 etiqueta-control" Width="45px">PNR</asp:label>
                                    </td>
                                    <td>
                                        <asp:TextBox runat="server" ID="txt_PnrTEV" Text="0.00" CssClass="estandar-control Tablero Seleccion Monto PnrTEV" Width="70px"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="clear padding3"></div>
                        <div runat="server" id="div_rc" class="row">
                            <div class="cuadro-subtitulo-grid">
                                RC
                            </div>
                            <div class="clear padding3"></div>
                            <table>
                                <tr>
                                    <td>
                                        <asp:label runat="server" class="col-md-1 etiqueta-control" Width="40px">(%)</asp:label>
                                    </td>
                                    <td>
                                        <asp:TextBox runat="server" ID="txt_PrcComRC" Text="0.0000" CssClass="estandar-control Tablero Seleccion Monto PrcComRC" Width="50px"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:label runat="server" class="col-md-1 etiqueta-control" Width="70px">Comision</asp:label>
                                    </td>
                                    <td>
                                        <asp:TextBox runat="server" ID="txt_ComRC" Text="0.00" CssClass="estandar-control Tablero Seleccion Monto ComRC" Width="70px"></asp:TextBox>
                                        <asp:TextBox runat="server" ID="txt_ComRCAux" Text="0.00" CssClass="NoDisplay"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:label runat="server" class="col-md-1 etiqueta-control" Width="45px">PNR</asp:label>
                                    </td>
                                    <td>
                                        <asp:TextBox runat="server" ID="txt_PnrRC" Text="0.00" CssClass="estandar-control Tablero Seleccion Monto PnrRC" Width="70px"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="clear padding3"></div>
                        <div runat="server" id="div_casco" class="row">
                            <div class="cuadro-subtitulo-grid">
                                CASCO
                            </div>
                            <div class="clear padding3"></div>
                            <table>
                                <tr>
                                    <td>
                                        <asp:label runat="server" class="col-md-1 etiqueta-control" Width="40px">(%)</asp:label>
                                    </td>
                                    <td>
                                        <asp:TextBox runat="server" ID="txt_PrcComCSC" Text="0.0000" CssClass="estandar-control Tablero Seleccion Monto PrcComCSC" Width="50px"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:label runat="server" class="col-md-1 etiqueta-control" Width="70px">Comision</asp:label>
                                    </td>
                                    <td>
                                        <asp:TextBox runat="server" ID="txt_ComCSC" Text="0.00" CssClass="estandar-control Tablero Seleccion Monto ComCSC" Width="70px"></asp:TextBox>
                                        <asp:TextBox runat="server" ID="txt_ComCSCAux" Text="0.00" CssClass="NoDisplay"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:label runat="server" class="col-md-1 etiqueta-control" Width="45px">PNR</asp:label>
                                    </td>
                                    <td>
                                        <asp:TextBox runat="server" ID="txt_PnrCSC" Text="0.00" CssClass="estandar-control Tablero Seleccion Monto PnrCSC" Width="70px"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="clear padding3"></div>
                        <div runat="server" id="div_guerra" class="row">
                            <div class="cuadro-subtitulo-grid">
                                GUERRA
                            </div>
                            <div class="clear padding3"></div>
                            <table>
                                <tr>
                                    <td>
                                        <asp:label runat="server" class="col-md-1 etiqueta-control" Width="40px">(%)</asp:label>
                                    </td>
                                    <td>
                                        <asp:TextBox runat="server" ID="txt_PrcComGRA" Text="0.0000" CssClass="estandar-control Tablero Seleccion Monto PrcComGRA" Width="50px"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:label runat="server" class="col-md-1 etiqueta-control" Width="70px">Comision</asp:label>
                                    </td>
                                    <td>
                                        <asp:TextBox runat="server" ID="txt_ComGRA" Text="0.00" CssClass="estandar-control Tablero Seleccion Monto ComGRA" Width="70px"></asp:TextBox>
                                        <asp:TextBox runat="server" ID="txt_ComGRAAux" Text="0.00" CssClass="NoDisplay"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:label runat="server" class="col-md-1 etiqueta-control" Width="45px">PNR</asp:label>
                                    </td>
                                    <td>
                                        <asp:TextBox runat="server" ID="txt_PnrGRA" Text="0.00" CssClass="estandar-control Tablero Seleccion Monto PnrGRA" Width="70px"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
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
                                        GridLines="Horizontal"  ShowHeaderWhenEmpty="true" DataKeyNames="id,cuota,prc_com_age,com_agente,prc_com_adi_age,com_adi_agente">
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
                                    <asp:TemplateField HeaderText="Ubicación" HeaderStyle-CssClass="Centrado Centro">
                                        <HeaderTemplate>
                                            <asp:label runat="server" class="col-md-1" Width="65px">Ubicación</asp:label>
                                            <asp:DropDownList runat="server" ID="ddl_Ubicacion" CssClass="estandar-control Tablero Centro" AutoPostBack="true" OnSelectedIndexChanged="ddl_Ubicacion_SelectedIndexChanged" Width="45px"></asp:DropDownList>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="txt_Ubicacion" Text='<%# Eval("cod_item") %>' Enabled="false" CssClass="estandar-control Tablero Centro" Width="110px"></asp:TextBox>
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
                                    <asp:TemplateField HeaderText="Facultativo" HeaderStyle-CssClass="Centro" ItemStyle-CssClass="Centro">
                                        <ItemTemplate>
                                            <asp:CheckBox runat="server" ID="chk_Facultativo" Checked='<%# Eval("sn_facultativo") %>' Enabled="false" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Acumula" HeaderStyle-CssClass="Centro" ItemStyle-CssClass="Centro">
                                        <ItemTemplate>
                                            <asp:CheckBox runat="server" ID="chk_Adicional" Checked='<%# Eval("sn_adicional") %>' Enabled="false" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Lím. Max. Resp" HeaderStyle-CssClass="Centro">
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="txt_LimResp" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("suma_asegurada")))%>' CssClass="estandar-control Tablero Monto" Enabled="false" Width="100px"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Prima Neta" HeaderStyle-CssClass="Centro">
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="txt_PrimaNeta" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("prima_neta")))%>' CssClass="estandar-control Tablero Monto" Enabled="false" Width="100px"></asp:TextBox>
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

        <div id="Agrupadores" style="width:25%;" class="modal-catalogo" >
            <asp:UpdatePanel runat="server" ID="upAgrupadores" >
                <ContentTemplate>
                    <div class="cuadro-titulo-flotante" style="height:30px">
                        <asp:label runat="server">[Agrupadores de Negocio]</asp:label>
                    </div>
                    <div class="panel-subcontenido">
                        <asp:label runat="server" class="col-md-1 etiqueta-control" Width="20%">Agrupador</asp:label>
                        <asp:DropDownList runat="server" ID="ddl_Agrupador" CssClass="estandar-control Centro" Width="79%"></asp:DropDownList>
                        <div class="clear padding4"></div>
                    </div>
                    <div style="width:99%;  text-align:right">
                        <asp:LinkButton id="btn_ConfirmaGrupo" runat="server" class="btn botones ModalEspera">
                            <span>
                                <img class="btn-añadir"/>
                                Aceptar
                            </span>
                        </asp:LinkButton>
                        <asp:LinkButton id="btn_CerrarGrupo" runat="server" OnClientClick="fn_CerrarModal('#Agrupadores');" class="btn botones">
                            <span>
                                <img class="btn-cancelar"/>
                                Cerrar
                            </span>
                        </asp:LinkButton>
                    </div>
                    <div class="clear padding5"></div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>

        <div id="ProgramaCapas" style="width:90%;" class="modal-poliza">
            <asp:UpdatePanel runat="server" ID="upProgramaCapas" >
                <ContentTemplate>
                    <div class="cuadro-titulo-flotante" style="height:30px">
                        <input type="image" src="../Images/contraer_mini_inv.png" id="coVentana17" class="contraer"  />
                        <input type="image" src="../Images/expander_mini_inv.png"   id="exVentana17" class="expandir"  />
                        <asp:label runat="server">[DIstribución de Capas]</asp:label>
                        <asp:label runat="server" ID="lbl_DistCapas"></asp:label>
                    </div>
                    <div class="panel-subcontenido ventana17">
                        <div class="row">
                            <div class="col-md-4">
                                <asp:Panel runat="server" ID="pnlProgramaCapas" Width="100%" Height="200px" ScrollBars="Vertical">
                                    <asp:GridView runat="server" ID="gvd_ProgramaCapas" AutoGenerateColumns="false" 
                                                            CssClass="grid-view" HeaderStyle-CssClass="header" AlternatingRowStyle-CssClass="altern"
                                                            GridLines="Horizontal"  ShowHeaderWhenEmpty="true" DataKeyNames="cod_grupo,cod_capa" >
                                        <Columns>
                                            <asp:TemplateField HeaderText="" HeaderStyle-CssClass="Centro" ItemStyle-CssClass="Centrado">
                                                <ItemTemplate>
                                                    <asp:CheckBox runat="server" ID="chk_Sel"/>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Capa" ItemStyle-CssClass="Centrado">
                                                <ItemTemplate>
                                                    <asp:TextBox runat="server" ID="txt_Capa" Text='<%# Eval("cod_capa") %>'  Enabled="false" CssClass="estandar-control Tablero Centro" Width="40px"></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Valor Capa" HeaderStyle-CssClass="Centro">
                                                <ItemTemplate>
                                                    <asp:TextBox runat="server" ID="txt_ValorCapa" Text='<%# String.Format("{0:#,#0.0000}", CDbl(Eval("valor_capa")))%>' CssClass="estandar-control Tablero Seleccion Monto ValorCapa" Width="110px"></asp:TextBox>
                                                    <asp:TextBox runat="server" ID="txt_ValorCapaAux"  Text='<%# Eval("valor_capa") %>' CssClass="NoDisplay"></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="En Exceso" HeaderStyle-CssClass="Centro">
                                                <ItemTemplate>
                                                    <asp:TextBox runat="server" ID="txt_ExcesoCapa" Text='<%# String.Format("{0:#,#0.0000}", CDbl(Eval("exceso_capa")))%>' CssClass="estandar-control Tablero Seleccion Monto ExcesoCapa" Width="110px"></asp:TextBox>
                                                    <asp:TextBox runat="server" ID="txt_ExcesoCapaAux"  Text='<%# Eval("exceso_capa") %>' CssClass="NoDisplay"></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Participación" HeaderStyle-CssClass="Centro">
                                                <ItemTemplate>
                                                    <asp:TextBox runat="server" ID="txt_PrcPart" Text='<%# String.Format("{0:#,#0.0000}", CDbl(Eval("prc_part")))%>' CssClass="estandar-control Tablero Seleccion Monto PrcPart" Width="75px"></asp:TextBox>
                                                    <asp:TextBox runat="server" ID="txt_PrcPartAux" Text='<%# Eval("prc_part") %>' CssClass="NoDisplay"></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </asp:Panel>
                            </div>
                            <div class="col-md-8">
                                <div runat="server" id="div_Capas" style="width:80%;height:500px;">

                                </div>
                            </div>
                        </div>
                        <div style="width:100%;  text-align:right">
                            <asp:LinkButton id="btn_ConfirmaPrograma" runat="server" class="btn botones">
                                <span>
                                    <img class="btn-añadir"/>
                                    Aceptar
                                </span>
                            </asp:LinkButton>
                            <asp:LinkButton id="btn_CerrarPrograma" runat="server" class="btn botones">
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


    </div>
</asp:Content>


