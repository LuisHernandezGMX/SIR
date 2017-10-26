<%@ Page Title="" Language="VB" MasterPageFile="~/Pages/SiteMaster.master" AutoEventWireup="false" CodeFile="Gestion.aspx.vb" Inherits="MesaControl_Gestion" %>
<%@ MasterType VirtualPath="~/Pages/SiteMaster.master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="cph_principal" Runat="Server" >
    <asp:HiddenField runat="server" ID="hid_Ventanas" Value="0|0|0|0|0|0|0|0|0|0|" />
    <script src="../Scripts/MesaControl.js"></script>

     <script type="text/javascript"> 
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(PageLoadMesaControl);
    </script> 

    <div style="width:1100px; min-width:1100px; overflow-x:hidden">
        <asp:HiddenField runat="server" ID="hid_Operacion" Value="0" />
        <div class="row">
            <asp:UpdatePanel runat="server" ID="upIdentificacion">
               <ContentTemplate>
                    <div class="col-md-12">
                        <div class="panel-seccion">
                            <div class="cuadro-titulo">
                                Identificación
                            </div>
                            <div class="clear padding5"></div>
                            <div class="row">
                                <div class="col-md-4">
                                    <asp:label runat="server" class="col-md-1 etiqueta-control" Width="110px">ID</asp:label>
                                    <asp:TextBox runat="server" ID="txt_ID" CssClass="estandar-control" Enabled="false" Width="200px"></asp:TextBox>
                                </div>
                                <div class="col-md-4">
                                    <asp:label runat="server" class="col-md-1  etiqueta-control" Width="110px">Folio</asp:label>
                                    <asp:TextBox runat="server" ID="txt_Folio" CssClass="estandar-control cod Centro Seleccion" Width="100px"></asp:TextBox>
                                </div>
                                <div class="col-md-4">
                                    <asp:label runat="server" class="col-md-1  etiqueta-control" Width="110px">F. Recibido</asp:label>
                                    <asp:TextBox runat="server" ID="txt_FRecibido" CssClass="estandar-control Fecha Centro Seleccion" Width="110px" TextMode="Date"></asp:TextBox>

                                    <asp:label runat="server" class="col-md-1 etiqueta-control" Visible="false" Width="140px">Fecha Hoy</asp:label>
                                    <asp:TextBox runat="server" ID="txt_FechaHoy" Enabled="false" Visible="false" CssClass="estandar-control Derecha" Width="170px"></asp:TextBox>   
                                </div>
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>

        <div class="clear padding10"></div>

        <ul class="nav nav-tabs">
          <li class="active"><a data-toggle="tab" href="#menu1">Negocio</a></li>
          <li><a data-toggle="tab" href="#menu2">Colocación</a></li>
          <li><a data-toggle="tab" href="#menu3">Resumén</a></li>
        </ul>

        <div class="tab-content">
          <div id="menu1" class="tab-pane fade in active">
            <div class="clear padding5"></div>
            
            <div class="row">
               <asp:UpdatePanel runat="server" ID="upSucursal">
                <ContentTemplate>
                    <div class="col-md-4">
                        <asp:label runat="server" class="col-md-1  etiqueta-control" Width="105px">Sucursal</asp:label>
                        <asp:TextBox runat="server" ID="txt_ClaveOfi" CssClass="NoDisplay"></asp:TextBox>
                        <asp:TextBox runat="server" ID="txt_SearchOfi" CssClass="col-md-1 estandar-control Seleccion" Width="200px"></asp:TextBox>
                        <button type="button" id="btn_SelOficina" runat="server" class="btn botones boton-chico AgregaOficina" data-toggle="modal" data-target="#EsperaModal">...</button>
                    </div>
                    <div class="col-md-4">
                        <asp:label runat="server" class="col-md-1 etiqueta-control" Width="105px">Ramo</asp:label>
                        <asp:TextBox runat="server" ID="txt_ClaveRamC" CssClass="NoDisplay"></asp:TextBox>
                        <asp:TextBox runat="server" ID="txt_SearchRamC" CssClass="col-md-1 estandar-control Seleccion" Width="200px"></asp:TextBox>
                        <button type="button" id="btn_SelAnteRamo" runat="server" class="btn botones boton-chico AgregaRamoCont" data-toggle="modal" data-target="#EsperaModal">...</button>
                    </div>
                    <div class="col-md-4">
                        <asp:label runat="server" class="col-md-1  etiqueta-control" Width="105px">Cobertura</asp:label>
                        <asp:TextBox runat="server" ID="txt_ClaveCob" CssClass="NoDisplay"></asp:TextBox>
                        <asp:TextBox runat="server" ID="txt_SearchCob" CssClass="col-md-1 estandar-control Seleccion" Width="200px"></asp:TextBox>
                        <button type="button" id="btn_SelCobertura" runat="server" class="btn botones boton-chico AgregaCobertura" data-toggle="modal" data-target="#EsperaModal">...</button>
                    </div>
                </ContentTemplate>
              </asp:UpdatePanel>
            </div>

            <div class="clear padding5"></div>

            <div class="row">
                <asp:UpdatePanel runat="server" ID="upAsegurado">
                    <ContentTemplate>
                        <div class="col-md-8">
                            <asp:label runat="server" class="col-md-1  etiqueta-control" Width="105px">Asegurado</asp:label>
                            <asp:TextBox runat="server" ID="txt_ClaveAseg" CssClass="NoDisplay"></asp:TextBox>
                            <asp:TextBox runat="server" ID="txt_SearchAse" CssClass="estandar-control Seleccion" Width="615px"></asp:TextBox> 
                        </div>
                        <div class="col-md-4">
                            <asp:label runat="server" class="col-md-1 etiqueta-control" Width="105px">Moneda</asp:label>
                            <asp:DropDownList runat="server" ID="ddl_Moneda" CssClass="estandar-control Moneda" Width="240px"></asp:DropDownList>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>

            <div class="clear padding5"></div>

            <div class="row">
                <asp:UpdatePanel runat="server" ID="upGiro">
                    <ContentTemplate>
                        <div class="col-md-8">
                            <asp:label runat="server" class="col-md-1  etiqueta-control" Width="105px">Giro Aseg.</asp:label>
                            <asp:TextBox runat="server" ID="txt_GiroAsegurado" CssClass="estandar-control Seleccion" Width="615px"></asp:TextBox> 
                        </div>
                        <div class="col-md-4">
                            <asp:label runat="server" class="col-md-1  etiqueta-control" Width="105px">Giro Interno</asp:label>
                            <asp:TextBox runat="server" ID="txt_ClaveGiro" CssClass="NoDisplay"></asp:TextBox>
                            <asp:TextBox runat="server" ID="txt_SearchGiro" CssClass="estandar-control Seleccion" Width="240px"></asp:TextBox> 
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>

            <div class="clear padding5"></div>

            <div class="row">
                <asp:UpdatePanel runat="server" ID="upMovimiento">
                    <ContentTemplate>
                        <div class="col-md-4">
                           <div class="panel-seccion">
                                <div class="cuadro-titulo">
                                    <input type="image" src="../Images/contraer_mini_inv.png" id="coVentana0" class="contraer"  />
                                    <input type="image" src="../Images/expander_mini_inv.png"   id="exVentana0" class="expandir"  />
                                    Movimiento
                                </div>
                                <div class="ventana0">
                                    <div class="clear padding5"></div>
                                    <asp:label runat="server" class="col-md-1  etiqueta-control" Width="105px">Tipo</asp:label>
                                    <asp:DropDownList runat="server" ID="ddl_TipoMov" CssClass="estandar-control TipoMov" Width="235px">
                                        <asp:ListItem Text="Póliza Nueva" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="Renovación" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="Endoso A" Value="3"></asp:ListItem>
                                        <asp:ListItem Text="Endoso B" Value="4"></asp:ListItem>
                                        <asp:ListItem Text="Endoso D" Value="5"></asp:ListItem>
                                    </asp:DropDownList>
                                    <div class="clear padding5"></div>
                                    <asp:label runat="server" class="col-md-1 etiqueta-control" Width="105px">Descripción</asp:label>
                                    <asp:TextBox runat="server" ID="txt_DescMov" CssClass="estandar-control Seleccion" Width="235px"></asp:TextBox>
                                    <div class="clear padding5"></div>
                                    <asp:label runat="server" class="col-md-1 etiqueta-control" Width="105px">Aclaraciones</asp:label>
                                    <asp:TextBox runat="server" ID="txt_Aclaraciones" CssClass="estandar-control Seleccion" Width="235px"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <asp:label runat="server" class="col-md-1 etiqueta-control" Width="105px">Suscriptor</asp:label>
                            <asp:TextBox runat="server" ID="txt_ClaveSusc" CssClass="NoDisplay"></asp:TextBox>
                            <asp:TextBox runat="server" ID="txt_SearchSusc" CssClass="col-md-1 estandar-control Seleccion" Width="200px"></asp:TextBox>
                            <button type="button" id="btn_SelSuscriptor" runat="server" class="btn botones boton-chico AgregaSuscriptor" data-toggle="modal" data-target="#EsperaModal">...</button>           
                            <div class="clear padding5"></div>
                            <div class="panel-seccion">
                                <div class="cuadro-titulo">
                                    <input type="image" src="../Images/contraer_mini_inv.png" id="coVentana1" class="contraer"  />
                                    <input type="image" src="../Images/expander_mini_inv.png"   id="exVentana1" class="expandir"  />
                                    Agente
                                </div>
                                <div class="ventana1">
                                    <div class="clear padding5"></div>
                                    <asp:label runat="server" class="col-md-1  etiqueta-control" Width="105px">Nombre</asp:label>
                                    <asp:TextBox runat="server" ID="txt_ClaveAge" CssClass="NoDisplay"></asp:TextBox>
                                    <asp:TextBox runat="server" ID="txt_SearchAge" CssClass="estandar-control Seleccion" Width="235px"></asp:TextBox> 
                                    <div class="clear padding5"></div>
                                    <asp:label runat="server" class="col-md-1  etiqueta-control" Width="105px">(%) Comisión</asp:label>
                                    <asp:TextBox runat="server" ID="txt_ComAgente" Text="0.00" CssClass="estandar-control Monto Seleccion" Width="235px"></asp:TextBox> 
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="panel-seccion">
                                <div class="cuadro-titulo">
                                    <input type="image" src="../Images/contraer_mini_inv.png" id="coVentana2" class="contraer"  />
                                    <input type="image" src="../Images/expander_mini_inv.png"   id="exVentana2" class="expandir"  />
                                    Datos Póliza
                                </div>
                                <div class="ventana2">
                                    <div class="clear padding5"></div>
                                    <asp:label runat="server" class="col-md-1  etiqueta-control" Width="105px">Sucursal</asp:label>
                                    <asp:TextBox runat="server" ID="txt_ClaveSuc" CssClass="NoDisplay"></asp:TextBox>
                                    <asp:TextBox runat="server" ID="txt_SearchSuc" CssClass="col-md-1 estandar-control Seleccion" Width="195px"></asp:TextBox>
                                    <button type="button" id="btn_SelSucursal" runat="server" class="btn botones boton-chico AgregaOficina" data-toggle="modal" data-target="#EsperaModal">...</button>
                                    <div class="clear padding5"></div>
                                    <asp:label runat="server" class="col-md-1  etiqueta-control" Width="105px">Ramo</asp:label>
                                    <asp:TextBox runat="server" ID="txt_ClaveRam" CssClass="NoDisplay"></asp:TextBox>
                                    <asp:TextBox runat="server" ID="txt_SearchRam" CssClass="col-md-1 estandar-control Seleccion" Width="195px"></asp:TextBox>
                                    <button type="button" id="btn_SelProducto" runat="server" class="btn botones boton-chico AgregaProducto" data-toggle="modal" data-target="#EsperaModal">...</button>
                                    <div class="clear padding5"></div>
                                    <asp:label runat="server" class="col-md-1  etiqueta-control" Width="105px">Poliza</asp:label>
                                    <asp:TextBox runat="server" ID="txt_NroPoliza" CssClass="col-md-1 estandar-control Centro cod Seleccion" Width="100px"></asp:TextBox>       
                                    <asp:label runat="server" class="col-md-1  etiqueta-control" Width="85px">Sufijo</asp:label>
                                    <asp:TextBox runat="server" ID="txt_Sufijo" CssClass="estandar-control Centro cod Seleccion" Width="50px"></asp:TextBox>       
                                </div>
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>

            <div class="clear padding10"></div>

            <div class="row">
                <asp:UpdatePanel runat="server" ID="upVigencia">
                    <ContentTemplate>
                        <div class="col-md-4">
                            <div class="panel-seccion">
                                <div class="cuadro-titulo">
                                    <input type="image" src="../Images/contraer_mini_inv.png" id="coVentana3" class="contraer"  />
                                    <input type="image" src="../Images/expander_mini_inv.png"   id="exVentana3" class="expandir"  />
                                    Vigencia
                                </div>
                                <div class="ventana3">
                                    <div class="clear padding5"></div>
                                    <asp:label runat="server" class="col-md-1  etiqueta-control" Width="105px">Fecha Inicio</asp:label>
                                    <asp:TextBox runat="server" ID="txt_VigIni" CssClass="estandar-control Fecha Derecha Seleccion"  TextMode="Date" AutoPostBack="true" Width="235px"></asp:TextBox>
                                    <div class="clear padding5"></div>
                                    <asp:label runat="server" class="col-md-1 etiqueta-control" Width="105px">(#) Dias Riesgo</asp:label>
                                    <asp:TextBox runat="server" ID="txt_DiasVig" CssClass="estandar-control Derecha Seleccion" TextMode="Number" AutoPostBack="true" Width="235px"></asp:TextBox>
                                    <div class="clear padding5"></div>
                                    <asp:label runat="server" class="col-md-1 etiqueta-control" Width="105px">Fecha Fin</asp:label>
                                    <asp:TextBox runat="server" ID="txt_VigFin" CssClass="estandar-control Fecha Derecha Seleccion" TextMode="Date" AutoPostBack="true" Width="235px"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="panel-seccion">
                                <div class="cuadro-titulo">
                                    <input type="image" src="../Images/contraer_mini_inv.png" id="coVentana4" class="contraer"  />
                                    <input type="image" src="../Images/expander_mini_inv.png"  id="exVentana4" class="expandir"  />
                                    Montos
                                </div>
                                <div class="ventana4">
                                    <div class="clear padding5"></div>
                                    <asp:label runat="server" class="col-md-1 etiqueta-control" Width="105px">Limite Resp.</asp:label>
                                    <asp:TextBox runat="server" ID="txt_SumaAseg" Text="0.00" CssClass="estandar-control Monto Seleccion" Width="235px"></asp:TextBox>
                                    <div class="clear padding5"></div>
                                    <asp:label runat="server" class="col-md-1 etiqueta-control" Width="105px">Prima Neta</asp:label>
                                    <asp:TextBox runat="server" ID="txt_Prima" Text="0.00" CssClass="estandar-control Monto Seleccion" Width="235px"></asp:TextBox>
                                    <div class="clear padding5"></div>
                                    <asp:label runat="server" class="col-md-1 etiqueta-control" Width="105px">Cuota</asp:label>
                                    <asp:TextBox runat="server" ID="txt_Cuota" Text="0.00" CssClass="col-md-1 estandar-control Monto Seleccion" Width="115px"></asp:TextBox>
                                    <asp:label runat="server" class="col-md-1 etiqueta-control" Width="105px">Prima Target</asp:label>
                                    <asp:CheckBox runat="server" ID="chk_Target" />
                                    
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="panel-seccion">
                                <div class="cuadro-titulo">
                                    <input type="image" src="../Images/contraer_mini_inv.png" id="coVentana5" class="contraer"  />
                                    <input type="image" src="../Images/expander_mini_inv.png"  id="exVentana5" class="expandir"  />
                                    Notas
                                </div>
                                <div class="ventana5">
                                    <asp:TextBox runat="server" ID="txt_Notas" CssClass="estandar-control Seleccion" Height="88px" TextMode="MultiLine" Width="345px"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>

          </div>


          <div id="menu2" class="tab-pane fade">
            <div class="clear padding5"></div>
            
            <div class="row">
                 <asp:UpdatePanel runat="server" ID="upColocador">
                    <ContentTemplate>
                        <div class="col-md-4"> 
                            <asp:label runat="server" class="col-md-1  etiqueta-control" Width="105px">Colocador</asp:label>
                            <asp:TextBox runat="server" ID="txt_ClaveResp" CssClass="NoDisplay"></asp:TextBox>
                            <asp:TextBox runat="server" ID="txt_SearchResp" CssClass="col-md-1 estandar-control Seleccion" Width="200px"></asp:TextBox>
                            <button type="button" id="btn_SelResponsable" runat="server" class="btn botones boton-chico AgregaResponsable" data-toggle="modal" data-target="#EsperaModal">...</button>
                        </div>
                        <div class="col-md-4"> 
                            <asp:label runat="server" class="col-md-1 etiqueta-control" Width="105px">Esquema</asp:label>
                            <asp:DropDownList runat="server" ID="ddl_Esquema" CssClass="estandar-control Esquema" Width="240px">
                                <asp:ListItem Value="0" Text="Proporcional"></asp:ListItem>
                                <asp:ListItem Value="1" Text="No Proporcional"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="col-md-4"> 
                            <asp:label runat="server" class="col-md-1 etiqueta-control" Width="105px">Estado</asp:label>
                            <asp:DropDownList runat="server" ID="ddl_Estado" CssClass="estandar-control Estado" Width="240px">
                                <asp:ListItem Text="Pendiente" Value="0"></asp:ListItem>
                                <asp:ListItem Text="Confirmado" Value="1"></asp:ListItem>
                                <asp:ListItem Text="Cancelado" Value="2"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            
            <div class="clear padding5"></div>

            <div class="row">
               <asp:UpdatePanel runat="server" ID="upDistribucion">
                   <ContentTemplate>
                       <div class="col-md-4"> 
                         <div class="panel-seccion">
                            <div class="cuadro-titulo">
                                Brokers
                            </div>
                            <div class="ventana6">
                                <div class="clear padding5"></div>

                                <asp:HiddenField runat="server" ID="hid_Indice" Value="-1" />
                                <asp:ListBox runat="server" CssClass="estandar-control" ID="lst_Brokers" AutoPostBack="true" Height="155px" Width="100%">
                                </asp:ListBox>
                               
                                <div class="row">
                                    <div class="col-md-6"> 
                                        <button type="button" id="btn_Subjetividad" runat="server" class="btn botones boton-chico dropdown-toggle" data-toggle="dropdown">
                                            <span>
                                                <img class="btn-abajo"/>
                                            </span>
                                        </button>
                                        <div class="dropdown-menu" style="left: 250px; top: 475px; position: fixed;">
                                            <asp:label runat="server" id="lbl_Intermediario" class="etiqueta-simple"></asp:label>
                                            <div class="clear padding3"></div>
                                        
                                            <table>
                                                <tr>
                                                    <td>
                                                            <asp:TextBox runat="server" ID="txt_Subjetividad1" CssClass="estandar-control Seleccion" Width="400px"></asp:TextBox>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox runat="server" ID="txt_FecSubjetividad1" TextMode="Date" CssClass="estandar-control Fecha Seleccion" Width="70px"></asp:TextBox>
                                                    </td>
                                                    <td>
                                                        <asp:CheckBox runat="server" ID="chk_Subjetividad1"/>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                            <asp:TextBox runat="server" ID="txt_Subjetividad2" CssClass="estandar-control Seleccion" Width="400px"></asp:TextBox>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox runat="server" ID="txt_FecSubjetividad2"  TextMode="Date" CssClass="estandar-control Fecha Seleccion" Width="70px"></asp:TextBox>
                                                    </td>
                                                    <td>
                                                        <asp:CheckBox runat="server" ID="chk_Subjetividad2"/>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                            <asp:TextBox runat="server" ID="txt_Subjetividad3" CssClass="estandar-control Seleccion" Width="400px"></asp:TextBox>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox runat="server" ID="txt_FecSubjetividad3" TextMode="Date" CssClass="estandar-control Fecha Seleccion" Width="70px"></asp:TextBox>
                                                    </td>
                                                    <td>
                                                        <asp:CheckBox runat="server" ID="chk_Subjetividad3"/>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                            <asp:TextBox runat="server" ID="txt_Subjetividad4" CssClass="estandar-control Seleccion" Width="400px"></asp:TextBox>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox runat="server" ID="txt_FecSubjetividad4" TextMode="Date" CssClass="estandar-control Fecha Seleccion" Width="70px"></asp:TextBox>
                                                    </td>
                                                    <td>
                                                        <asp:CheckBox runat="server" ID="chk_Subjetividad4"/>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                            <asp:TextBox runat="server" ID="txt_Subjetividad5" CssClass="estandar-control Seleccion" Width="400px"></asp:TextBox>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox runat="server" ID="txt_FecSubjetividad5" TextMode="Date" CssClass="estandar-control Fecha Seleccion" Width="70px"></asp:TextBox>
                                                    </td>
                                                    <td>
                                                        <asp:CheckBox runat="server" ID="chk_Subjetividad5"/>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="col-md-6"> 
                                        <div style="width:100%;  text-align:right">
                                            <asp:LinkButton id="btn_AddBroker" runat="server" class="btn botones AgregaBroker" data-toggle="modal" data-target="#EsperaModal">
                                                <span>
                                                    <img class="btn-añadir"/>
                                                    Añadir
                                                </span>
                                            </asp:LinkButton>
                                        </div> 
                                    </div>
                                </div> 
                            </div>
                         </div>
                     </div>
                     <div class="col-md-8"> 
                         <div class="panel-seccion">
                            <div class="cuadro-titulo">
                                Reaseguradores
                            </div>
                            <div class="ventana7">
                                <asp:Panel runat="server" ID="pnlCompañia" Width="100%" Height="190px" ScrollBars="Vertical">
                                    <asp:GridView runat="server" ID="gvd_Compañia" AutoGenerateColumns="false" 
                                                  CssClass="grid-view" HeaderStyle-CssClass="header" AlternatingRowStyle-CssClass="altern"
                                                  GridLines="Horizontal"  ShowHeaderWhenEmpty="true" DataKeyNames="OcultaCampo1,OcultaCampo2,OcultaCampo3">
                                        <Columns>
                                           <asp:TemplateField HeaderText="">
                                                <ItemTemplate>
                                                    <asp:HiddenField runat="server" ID="chk_SelCia" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="lbl_ClaveCia" Text='<%# Eval("Clave") %>' Width="30px" ></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Descripción">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="lbl_Desc" Text='<%# Eval("Descripcion") %>' CssClass="Intermediario1" Width="300px"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="">
                                                <ItemTemplate>
                                                    <button type="button" id="btn_Subjetividad" runat="server" class="btn botones boton-chico dropdown-toggle" data-toggle="dropdown">
                                                        <span>
                                                            <img class="btn-abajo"/>
                                                        </span>
                                                    </button>
                                                    
                                                    <div class="dropdown-menu" style="left:960px; top:310px; position: fixed;">
                                                        <asp:label runat="server" class="etiqueta-simple Intermediario2"></asp:label>
                                                        <div class="clear padding3"></div>
                                                        <asp:CheckBox runat="server" ID="lbl_Oculta1"  class="col-md-1" />
                                                        <asp:TextBox runat="server" ID="lbl_Oculta4"  CssClass="col-md-1 estandar-control Seleccion" Width="350px"></asp:TextBox>
                                                        <asp:TextBox runat="server" ID="lbl_Oculta5" TextMode="Date" CssClass="estandar-control Fecha Seleccion" Width="70px"></asp:TextBox>
                                                        <asp:CheckBox runat="server" ID="lbl_Oculta6"  class="col-md-1" />
                                                        <asp:TextBox runat="server" ID="lbl_Oculta7" CssClass="col-md-1 estandar-control Seleccion" Width="350px"></asp:TextBox>
                                                        <asp:TextBox runat="server" ID="lbl_Oculta8" TextMode="Date"  CssClass="estandar-control Fecha Seleccion" Width="70px"></asp:TextBox>
                                                        <asp:CheckBox runat="server" ID="lbl_Oculta9"  class="col-md-1" />
                                                        <asp:TextBox runat="server" ID="lbl_Oculta10"  CssClass="col-md-1 estandar-control Seleccion" Width="350px"></asp:TextBox>
                                                        <asp:TextBox runat="server" ID="lbl_Oculta11" TextMode="Date" CssClass="estandar-control Fecha Seleccion" Width="70px"></asp:TextBox>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="% Part.">
                                                <ItemTemplate>
                                                    <asp:textbox runat="server" ID="lbl_Oculta2" CssClass="estandar-control Prc Seleccion" Text='<%# Eval("OcultaCampo2") %>' Width="50px"></asp:textbox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Fecha Oferta">
                                                <ItemTemplate>
                                                    <asp:textbox runat="server" ID="lbl_Oculta3" CssClass="estandar-control Fecha Centro Seleccion"  Width="80px"></asp:textbox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Estatus">
                                                <ItemTemplate>
                                                    <asp:DropDownList runat="server" ID="lbl_Oculta12" CssClass="estandar-control Estado" Width="100px">
                                                        <asp:ListItem Text="En Firme" Value="0"></asp:ListItem>
                                                        <asp:ListItem Text="Proyecto" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Cancelado" Value="2"></asp:ListItem>
                                                    </asp:DropDownList>
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
                            </div>
                         </div>
                     </div>
                   </ContentTemplate>
               </asp:UpdatePanel>
            </div>

            <div class="clear padding10"></div>

            <div class="row">
                <asp:UpdatePanel runat="server" ID="upNotas">
                    <ContentTemplate>
                        <div class="col-md-12"> 
                            <div class="panel-seccion">
                                <div class="cuadro-titulo">
                                    Notas
                                </div>
                                <div class="ventana8">
                                    <asp:TextBox runat="server" ID="txt_NotasColocacion" CssClass="estandar-control Seleccion" Height="50px" TextMode="MultiLine" Width="100%"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
          </div>

          <div id="menu3" class="tab-pane fade">
              <div class="clear padding5"></div>
              <div class="row">
                  <asp:UpdatePanel runat="server" ID="upCuadroSoporte">
                      <ContentTemplate>
                         <div class="col-md-12"> 
                             <div class="panel-seccion">
                                <div class="cuadro-titulo">
                                    Cuadro Final de Soporte
                                </div>
                                <div class="ventana8">
                                    <asp:Panel runat="server" ID="pnl_Soporte" Width="100%" Height="200px" ScrollBars="None">
                                        <asp:GridView runat="server" ID="gvd_CuadroSoporte" AutoGenerateColumns="false" 
                                                  CssClass="grid-view" HeaderStyle-CssClass="header" AlternatingRowStyle-CssClass="altern"
                                                  GridLines="Horizontal"  ShowHeaderWhenEmpty="true">
                                            <Columns>
                                                <asp:TemplateField HeaderText="">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_ClaveBro" Text='<%# Eval("cod_broker") %>' Width="30px" ></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Intermediario">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_Broker" Text='<%# Eval("broker") %>' Width="300px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_ClaveCia" Text='<%# Eval("cod_ciar") %>' Width="30px" ></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Intermediario">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_reasegurador" Text='<%# Eval("reasegurador") %>' Width="300px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="% Part.">
                                                    <ItemTemplate>
                                                        <asp:textbox runat="server" ID="lbl_Prc" CssClass="estandar-control Prc" Text='<%# Eval("Prc") %>' Width="50px"></asp:textbox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </asp:Panel>
                                </div>
                             </div>
                         </div>
                      </ContentTemplate>
                  </asp:UpdatePanel>
              </div>
              <div class="clear padding10"></div>
              <div class="row">
                  <asp:UpdatePanel runat="server" ID="upIndicadores">
                      <ContentTemplate>
                          <div class="col-md-7">
                            <div class="panel-seccion">
                                    <div class="cuadro-titulo">
                                        Indicadores de Tiempos
                                    </div>
                                    <div class="ventana9">
                                        <div class="clear padding5"></div>
                                        <asp:label runat="server" class="col-md-1  etiqueta-control" Width="170px">Solicitud de Suscripción</asp:label>
                                        <asp:TextBox runat="server" ID="txt_Solicitud" CssClass="col-md-1 estandar-control Fecha Derecha Seleccion" Width="120px"></asp:TextBox>

                                        <asp:label runat="server" class="col-md-1 etiqueta-control" Width="170px">Orden en Firme</asp:label>
                                        <asp:TextBox runat="server" ID="txt_OrdenFirme" CssClass="estandar-control Fecha Derecha Seleccion" Width="120px"></asp:TextBox>

                                        <div class="clear padding5"></div>

                                        <asp:label runat="server" class="col-md-1 etiqueta-control" Width="170px">Ofrecimiento de Reaseguro</asp:label>
                                        <asp:TextBox runat="server" ID="txt_Ofrecimiento" CssClass="col-md-1 estandar-control Fecha Derecha Seleccion" Width="120px"></asp:TextBox>

                                        <asp:label runat="server" class="col-md-1 etiqueta-control" Width="170px">Confirmación de Soporte</asp:label>
                                        <asp:TextBox runat="server" ID="txt_Confirmacion" CssClass="estandar-control Fecha Derecha Seleccion" Width="120px"></asp:TextBox>


                                        <div class="clear padding5"></div>
                                        <asp:label runat="server" class="col-md-1 etiqueta-control" Width="170px">Integración de Propuesta</asp:label>
                                        <asp:TextBox runat="server" ID="txt_Integracion" CssClass="col-md-1 estandar-control Fecha Derecha Seleccion" Width="120px"></asp:TextBox>

                                        <asp:label runat="server" class="col-md-1 etiqueta-control" Width="170px">Conclusión de Colocación</asp:label>
                                        <asp:TextBox runat="server" ID="txt_Conclusion" CssClass="estandar-control Fecha Derecha Seleccion" Width="120px"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-5">
                               <div class="panel-seccion">
                                    <div class="cuadro-titulo">
                                        Notas Generales
                                    </div>
                                    <div class="ventana10">
                                        <asp:TextBox runat="server" ID="txt_NotasGenerales" CssClass="estandar-control Seleccion" Height="90px" TextMode="MultiLine" Width="100%"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                      </ContentTemplate>
                  </asp:UpdatePanel>
              </div>
          </div>
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


        <div id="Reaseguradores" style="width:500px;" class="modal-simple" >
            <asp:UpdatePanel runat="server" ID="upReaseguradores" >
                <ContentTemplate>
                    <div class="cuadro-titulo" style="height:30px">
                        <div class="row" >
                            <div class="col-md-1">
                                <input type="image" src="../Images/contraer_mini_inv.png" id="coVentana9" class="contraer"  />
                                <input type="image" src="../Images/expander_mini_inv.png"   id="exVentana9" class="expandir"  />
                            </div>
                            <div class="col-md-10">
                                Reaseguradores
                            </div>
                            <div class="col-md-1">
                                <button type="button" class="close" onclick="fn_CerrarModalSimple('#Reaseguradores');">&times;</button>
                            </div>
                        </div>
                    </div>


                    <div class="panel-subcontenido ventana9">
                        

                        <div class="clear padding5"></div>
                    
                        

                        <div class="clear padding5"></div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>

    </div>



   
</asp:Content>


