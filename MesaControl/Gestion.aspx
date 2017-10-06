<%@ Page Title="" Language="VB" MasterPageFile="~/Pages/SiteMaster.master" AutoEventWireup="false" CodeFile="Gestion.aspx.vb" Inherits="MesaControl_Gestion" %>
<%@ MasterType VirtualPath="~/Pages/SiteMaster.master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="cph_principal" Runat="Server" >
    <asp:HiddenField runat="server" ID="hid_Ventanas" Value="0|0|0|0|0|0|0|0|0|0|" />
    <script src="../Scripts/MesaControl.js"></script>

     <script type="text/javascript"> 
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(PageLoadMesaControl);
    </script> 

    <div style="width:1100px; min-width:1100px; overflow-x:hidden">

        <div class="panel-contenido">
            <asp:UpdatePanel runat="server" ID="upGenerales">
                <ContentTemplate>

                    <asp:HiddenField runat="server" ID="hid_Operacion" Value="0" />

                    <div class="row">
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
                                        <asp:TextBox runat="server" ID="txt_Folio" CssClass="estandar-control cod Centro" Width="100px"></asp:TextBox>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:label runat="server" class="col-md-1  etiqueta-control" Width="110px">F. Recibido</asp:label>
                                        <asp:TextBox runat="server" ID="txt_FRecibido" CssClass="estandar-control Fecha Centro" Width="110px"></asp:TextBox>

                                        <asp:label runat="server" class="col-md-1 etiqueta-control" Visible="false" Width="140px">Fecha Hoy</asp:label>
                                        <asp:TextBox runat="server" ID="txt_FechaHoy" Enabled="false" Visible="false" CssClass="estandar-control Derecha" Width="170px"></asp:TextBox>   
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                     <div class="clear padding10"></div>

                    <div class="row">
                        <%--Seccion 1--%>
                        <div class="col-md-4"> 
                            
                            <div class="panel-seccion">
                                <div class="cuadro-titulo">
                                    <input type="image" src="../Images/contraer_mini_inv.png" id="coVentana0" class="contraer"  />
                                    <input type="image" src="../Images/expander_mini_inv.png"   id="exVentana0" class="expandir"  />
                                    Responsable / Oficina / Suscriptor
                                </div>
                                
                                <div class="ventana0">
                                    <div class="clear padding5"></div>
                                    <asp:label runat="server" class="col-md-1  etiqueta-control" Width="110px">Responsable</asp:label>
                                    <table>
                                        <tr>
                                            <td><asp:TextBox runat="server" ID="txt_ClaveResp" CssClass="NoDisplay"></asp:TextBox>
                                                <asp:TextBox runat="server" ID="txt_SearchResp" CssClass="estandar-control" Width="160px"></asp:TextBox></td>
                                            <td>
                                                <asp:LinkButton id="btn_SelResponsable" runat="server" class="btn botones boton-chico AgregaResponsable" data-toggle="modal" data-target="#EsperaModal">
                                                    <span>
                                                        <img class="btn-buscar"/>
                                                    </span>
                                                </asp:LinkButton>
                                            </td>
                                        </tr>
                                    </table>
                                   
                                    <div class="clear padding5"></div>

                                    <asp:label runat="server" class="col-md-1  etiqueta-control" Width="110px">Oficina</asp:label>

                                    <table>
                                        <tr>
                                            <td><asp:TextBox runat="server" ID="txt_ClaveOfi" CssClass="NoDisplay"></asp:TextBox>
                                                <asp:TextBox runat="server" ID="txt_SearchOfi" CssClass="estandar-control" Width="160px"></asp:TextBox></td>
                                            <td>
                                                <asp:LinkButton id="btn_SelOficina" runat="server" class="btn botones boton-chico AgregaOficina" data-toggle="modal" data-target="#EsperaModal">
                                                    <span>
                                                        <img class="btn-buscar"/>
                                                    </span>
                                                </asp:LinkButton>
                                            </td>
                                        </tr>
                                    </table>

                                    <div class="clear padding5"></div>

                                    <asp:label runat="server" class="col-md-1  etiqueta-control" Width="110px">Suscriptor</asp:label>

                                    <table>
                                        <tr>
                                            <td><asp:TextBox runat="server" ID="txt_ClaveSusc" CssClass="NoDisplay"></asp:TextBox>
                                                <asp:TextBox runat="server" ID="txt_SearchSusc" CssClass="estandar-control" Width="160px"></asp:TextBox></td>
                                            <td>
                                                <asp:LinkButton id="btn_SelSuscriptor" runat="server" class="btn botones boton-chico AgregaSuscriptor" data-toggle="modal" data-target="#EsperaModal">
                                                    <span>
                                                        <img class="btn-buscar"/>
                                                    </span>
                                                </asp:LinkButton>
                                            </td>
                                        </tr>
                                    </table>
                                    
                                </div>
                            </div>
                            <div class="clear padding10"></div>
                            <div class="panel-seccion">
                                <div class="cuadro-titulo">
                                    <input type="image" src="../Images/contraer_mini_inv.png" id="coVentana1" class="contraer"  />
                                    <input type="image" src="../Images/expander_mini_inv.png"   id="exVentana1" class="expandir"  />
                                    Movimiento / Intermediario
                                </div>
                                <div class="ventana1">
                                    <div class="clear padding5"></div>
                                    <asp:label runat="server" class="col-md-1  etiqueta-control" Width="110px">Tipo Mov.</asp:label>
                                    <asp:DropDownList runat="server" ID="ddl_TipoMov" CssClass="estandar-control TipoMov" Width="200px">
                                        <asp:ListItem Text="Póliza Nueva" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="Renovación" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="Endoso A" Value="3"></asp:ListItem>
                                        <asp:ListItem Text="Endoso B" Value="4"></asp:ListItem>
                                        <asp:ListItem Text="Endoso D" Value="5"></asp:ListItem>
                                    </asp:DropDownList>
                                    <div class="clear padding5"></div>
                                    <asp:label runat="server" class="col-md-1 etiqueta-control" Width="110px">Desc. Mov.</asp:label>
                                    <asp:TextBox runat="server" ID="txt_DescMov" CssClass="estandar-control" Width="200px"></asp:TextBox>
                                    <div class="clear padding5"></div>
                                    <asp:label runat="server" class="col-md-1 etiqueta-control" Width="110px">Intermediario</asp:label>
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:TextBox runat="server" ID="txt_ClaveBro" CssClass="NoDisplay"></asp:TextBox>
                                                <asp:TextBox runat="server" ID="txt_SearchBro" CssClass="estandar-control" Width="160px"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:LinkButton id="btn_SelBroker" runat="server" class="btn botones boton-chico AgregaBroker" data-toggle="modal" data-target="#EsperaModal">
                                                    <span>
                                                        <img class="btn-buscar"/>
                                                    </span>
                                                </asp:LinkButton>
                                            </td>
                                        </tr>
                                    </table>
                                    <div class="clear padding5"></div>
                                    <asp:label runat="server" class="col-md-1 etiqueta-control" Width="110px">Reaseguradores</asp:label>
                                    <asp:LinkButton id="btn_SelReasegurador" runat="server" class="btn botones boton-chico VerReaseguradores">
                                        <span>
                                            <img class="btn-buscar"/>
                                        </span>
                                    </asp:LinkButton>
                                </div>
                            </div>
                            <div class="clear padding10"></div>
                            <div class="panel-seccion">
                                <div class="cuadro-titulo">
                                    <input type="image" src="../Images/contraer_mini_inv.png" id="coVentana6" class="contraer"  />
                                    <input type="image" src="../Images/expander_mini_inv.png"   id="exVentana6" class="expandir"  />
                                    Fechas
                                </div>
                                <div class="ventana6">
                                    <div class="clear padding5"></div>
                                    <asp:label runat="server" class="col-md-1  etiqueta-control" Width="140px">Vigencia Inicial</asp:label>
                                    <asp:TextBox runat="server" ID="txt_VigIni" CssClass="estandar-control Fecha Derecha" Width="170px"></asp:TextBox>
                                    <div class="clear padding5"></div>
                                    <asp:label runat="server" class="col-md-1 etiqueta-control" Width="140px">Vigencia Final</asp:label>
                                    <asp:TextBox runat="server" ID="txt_VigFin" CssClass="estandar-control Fecha Derecha" Width="170px"></asp:TextBox>
                                    <div class="clear padding5"></div>
                                    <asp:label runat="server" class="col-md-1 etiqueta-control" Width="140px">Ofrecimiento</asp:label>
                                    <asp:TextBox runat="server" ID="txt_FecOfrecimiento" CssClass="estandar-control Fecha Derecha" Width="170px"></asp:TextBox>
                                    <div class="clear padding5"></div>
                                    <asp:label runat="server" class="col-md-1  etiqueta-control" Width="140px">Confirmación</asp:label>
                                    <asp:TextBox runat="server" ID="txt_FecConfirmacion" CssClass="estandar-control Fecha Derecha" Width="170px"></asp:TextBox> 
                                </div>
                            </div>
                            
                        </div>

                         <%--Seccion 2--%>
                        <div class="col-md-4">
                            <div class="panel-seccion">
                                <div class="cuadro-titulo">
                                    <input type="image" src="../Images/contraer_mini_inv.png" id="coVentana2" class="contraer"  />
                                    <input type="image" src="../Images/expander_mini_inv.png"   id="exVentana2" class="expandir"  />
                                    Asegurado / Ramos
                                </div>
                                <div class="ventana2">
                                    <div class="clear padding5"></div>
                                    <asp:label runat="server" class="col-md-1  etiqueta-control" Width="110px">Asegurado</asp:label>
                                    <asp:TextBox runat="server" ID="txt_ClaveAseg" CssClass="NoDisplay"></asp:TextBox>
                                    <asp:TextBox runat="server" ID="txt_SearchAse" CssClass="estandar-control" Width="200px"></asp:TextBox> 
                                    <div class="clear padding5"></div>
                                    <asp:label runat="server" class="col-md-1 etiqueta-control" Width="110px">Agrupador</asp:label>
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:TextBox runat="server" ID="txt_ClaveRamC" CssClass="NoDisplay"></asp:TextBox>
                                                <asp:TextBox runat="server" ID="txt_SearchRamC" CssClass="estandar-control" Width="160px"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:LinkButton id="btn_SelAnteRamo" runat="server" class="btn botones boton-chico AgregaRamoCont" data-toggle="modal" data-target="#EsperaModal">
                                                    <span>
                                                        <img class="btn-buscar"/>
                                                    </span>
                                                </asp:LinkButton>
                                            </td>
                                        </tr>
                                    </table>
                                    <div class="clear padding5"></div>
                                    <asp:label runat="server" class="col-md-1  etiqueta-control" Width="110px">Ramo</asp:label>
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:TextBox runat="server" ID="txt_ClaveRam" Width="40px" CssClass="estandar-control cod"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:TextBox runat="server" ID="txt_SearchRam" CssClass="estandar-control" Width="160px"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                    <div class="clear padding5"></div> 
                                    <asp:label runat="server" class="col-md-1 etiqueta-control" Width="110px">Giro Interno</asp:label>
                                    <asp:TextBox runat="server" ID="txt_ClaveGiro" CssClass="NoDisplay"></asp:TextBox>
                                    <asp:TextBox runat="server" ID="txt_SearchGiro" CssClass="estandar-control" Width="200px"></asp:TextBox> 
                                    <div class="clear padding5"></div>
                                    <asp:label runat="server" class="col-md-1 etiqueta-control" Width="110px">Giro Asegurado</asp:label>
                                    <asp:TextBox runat="server" ID="txt_GiroAsegurado" CssClass="estandar-control" Width="200px"></asp:TextBox>     
                                </div>
                            </div>
                            <div class="clear padding10"></div>
                            <div class="panel-seccion">
                                <div class="cuadro-titulo">
                                    <input type="image" src="../Images/contraer_mini_inv.png" id="coVentana3" class="contraer"  />
                                    <input type="image" src="../Images/expander_mini_inv.png"   id="exVentana3" class="expandir"  />
                                    Colocación / Estado
                                </div>
                                <div class="ventana3">
                                    <div class="clear padding5"></div>
                                    <asp:label runat="server" class="col-md-1  etiqueta-control" Width="110px">Tipo Coloca.</asp:label>
                                    <asp:DropDownList runat="server" ID="ddl_TipoColoca" CssClass="estandar-control TipoColoca" Width="200px">
                                        <asp:ListItem Text="En Firme" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="Proyecto" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="Cancelado" Value="2"></asp:ListItem>
                                    </asp:DropDownList>
                                    <div class="clear padding5"></div> 
                                    <asp:label runat="server" class="col-md-1 etiqueta-control" Width="110px">Estado</asp:label>
                                    <asp:DropDownList runat="server" ID="ddl_Estado" CssClass="estandar-control Estado" Width="200px">
                                        <asp:ListItem Text="Pendiente" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="Confirmado" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="Cancelado" Value="2"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="clear padding10"></div>
                            <div class="panel-seccion">
                                <div class="cuadro-titulo">
                                    <input type="image" src="../Images/contraer_mini_inv.png" id="coVentana7" class="contraer"  />
                                    <input type="image" src="../Images/expander_mini_inv.png"   id="exVentana7" class="expandir"  />
                                    Indicadores (Dias Transcurridos)
                                </div>
                                <div class="ventana6">
                                    <div class="clear padding5"></div>
                                    <asp:label runat="server" class="col-md-1  etiqueta-control" Width="200px">Recibido a Ofrecimiento</asp:label>
                                    <asp:TextBox runat="server" ID="txt_RecibAOfrec" CssClass="estandar-control Derecha" Enabled="false" Width="110px"></asp:TextBox>
                                    <div class="clear padding5"></div>
                                    <asp:label runat="server" class="col-md-1 etiqueta-control" Width="200px">Recibido a Confirmacion</asp:label>
                                    <asp:TextBox runat="server" ID="txt_RecibAConf" CssClass="estandar-control Derecha" Enabled="false" Width="110px"></asp:TextBox>
                                    <div class="clear padding5"></div>
                                    <asp:label runat="server" class="col-md-1 etiqueta-control" Width="200px">Recibido a Dia Corriente</asp:label>
                                    <asp:TextBox runat="server" ID="txt_RecibADia" CssClass="estandar-control Derecha" Enabled="false" Width="110px"></asp:TextBox>
                                    <div class="clear padding5"></div>
                                    <asp:label runat="server" class="col-md-1  etiqueta-control" Width="200px">Ofrecimiento a Confirmación </asp:label>
                                    <asp:TextBox runat="server" ID="txt_OfrecAConf" CssClass="estandar-control Derecha" Enabled="false" Width="110px"></asp:TextBox> 
                                </div>
                            </div>
                        </div>

                         <%--Seccion 3--%>
                        <div class="col-md-4">
                            <div class="panel-seccion">
                                <div class="cuadro-titulo">
                                    <input type="image" src="../Images/contraer_mini_inv.png" id="coVentana4" class="contraer"  />
                                    <input type="image" src="../Images/expander_mini_inv.png"   id="exVentana4" class="expandir"  />
                                    Moneda / Montos
                                </div>
                                <div class="ventana4">
                                    <div class="clear padding5"></div>
                                    <asp:label runat="server" class="col-md-1 etiqueta-control" Width="110px">Moneda</asp:label>
                                    <asp:DropDownList runat="server" ID="ddl_Moneda" CssClass="estandar-control Moneda" Width="200px"></asp:DropDownList>
                                    <div class="clear padding5"></div> 
                                    <asp:label runat="server" class="col-md-1 etiqueta-control" Width="110px">Suma Aseg.</asp:label>
                                    <asp:TextBox runat="server" ID="txt_SumaAseg" Text="0.00" CssClass="estandar-control Monto" Width="200px"></asp:TextBox>
                                    <div class="clear padding5"></div> 
                                    <asp:label runat="server" class="col-md-1 etiqueta-control" Width="110px">Prima Neta</asp:label>
                                    <asp:TextBox runat="server" ID="txt_Prima" Text="0.00" CssClass="estandar-control Monto" Width="200px"></asp:TextBox>
                                </div>
                            </div>
                            <div class="clear padding10"></div>
                            <div class="panel-seccion">
                                <div class="cuadro-titulo">
                                    <input type="image" src="../Images/contraer_mini_inv.png" id="coVentana5" class="contraer"  />
                                    <input type="image" src="../Images/expander_mini_inv.png"   id="exVentana5" class="expandir"  />
                                    Observaciones
                                </div>
                                <div class="ventana5">
                                    <div class="clear padding5"></div>
                                    <asp:label runat="server" class="col-md-1 etiqueta-control" Width="110px">Obs. Suscrip.</asp:label>
                                    <asp:TextBox runat="server" ID="txt_ObsSuscriptor" CssClass="estandar-control" Width="200px"></asp:TextBox>
                                    <div class="clear padding5"></div> 
                                    <asp:label runat="server" class="col-md-1 etiqueta-control" Width="110px">Obs. Conducto</asp:label>
                                    <asp:TextBox runat="server" ID="txt_ObsConducto" CssClass="estandar-control" Width="200px"></asp:TextBox>
                                    <div class="clear padding5"></div> 
                                    <asp:label runat="server" class="col-md-1 etiqueta-control" Width="110px">Ofna-Suscriptor</asp:label>
                                    <asp:TextBox runat="server" ID="txt_OfiSuscriptor" Enabled="false" CssClass="estandar-control" Width="200px"></asp:TextBox>
                                </div>
                            </div>
                            <div class="clear padding10"></div>
                            <div class="panel-seccion">
                                <div class="cuadro-titulo">
                                    <input type="image" src="../Images/contraer_mini_inv.png" id="coVentana8" class="contraer"  />
                                    <input type="image" src="../Images/expander_mini_inv.png"   id="exVentana8" class="expandir"  />
                                    Estatus
                                </div>
                                <div class="ventana8">
                                    <div class="clear padding5"></div>
                                    <asp:label runat="server" class="col-md-1 etiqueta-control" Width="150px">Pendiente Suscriptor</asp:label>
                                    <asp:CheckBox runat="server" ID="chk_Suscriptor" Text="" />
                                    <div class="clear padding5"></div> 
                                    <asp:label runat="server" class="col-md-1 etiqueta-control" Width="150px">Pendiente Reaseguro</asp:label>
                                    <asp:CheckBox runat="server" ID="chk_Reaseguro" Text="" />
                                    <div class="clear padding5"></div> 
                                    <asp:label runat="server" class="col-md-1 etiqueta-control" Width="150px">Pendiente Conducto</asp:label>
                                    <asp:CheckBox runat="server" ID="chk_Conducto" Text="" />
                                    <div class="clear padding5"></div>
                                    <asp:label runat="server" class="col-md-1  etiqueta-control" Width="110px">Estatus Poliza</asp:label>
                                    <asp:DropDownList runat="server" ID="ddl_EstatusPol" CssClass="estandar-control EstatusPoliza" Width="200px">
                                        <asp:ListItem Text="Liberada" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="Pendiente" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="No Emitida" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="No Liberada / Facultada" Value="4"></asp:ListItem>
                                    </asp:DropDownList>
                                    <div class="clear padding5"></div> 
                                    <asp:label runat="server" class="col-md-1 etiqueta-control EstatusDSV"  Width="110px">Estatus DSV</asp:label>
                                    <asp:DropDownList runat="server" ID="ddl_EstatusDSV" CssClass="estandar-control" Width="200px">
                                        <asp:ListItem Text="Cargada" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="No Cargada" Value="1"></asp:ListItem>
                                    </asp:DropDownList>
                                    <div class="clear padding5"></div>
                                </div>
                            </div>
                            
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>

            <div class="clear padding5"></div>

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
                        <asp:Panel runat="server" ID="pnlCompañia" Width="100%" Height="220px" ScrollBars="Vertical">
                            <asp:GridView runat="server" ID="gvd_Compañia" AutoGenerateColumns="false" 
                                          CssClass="grid-view" HeaderStyle-CssClass="header" AlternatingRowStyle-CssClass="altern"
                                          GridLines="Horizontal"  ShowHeaderWhenEmpty="true">
                                <Columns>
                                   <asp:TemplateField HeaderText="">
                                        <ItemTemplate>
                                            <asp:HiddenField runat="server" ID="chk_SelCia" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Clave">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lbl_ClaveCia" Text='<%# Eval("Clave") %>' Width="40px" ></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Descripción">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lbl_Desc" Text='<%# Eval("Descripcion") %>' Width="330px"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="% Part.">
                                        <ItemTemplate>
                                            <asp:textbox runat="server" ID="txt_Porc" CssClass="estandar-control Prc" Text='<%# Eval("OcultaCampo1") %>' Width="50px"></asp:textbox>
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

                        <div class="clear padding5"></div>
                    
                        <div style="width:100%;  text-align:right">
                            <asp:LinkButton id="btn_AddCia" runat="server" class="btn botones AgregaCia" data-toggle="modal" data-target="#EsperaModal">
                                <span>
                                    <img class="btn-añadir"/>
                                    Añadir
                                </span>
                            </asp:LinkButton>
                        </div>

                        <div class="clear padding5"></div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>

    </div>



    <div class="clear padding100"></div> 
</asp:Content>


