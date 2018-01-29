<%@ Page Title="" Language="VB" MasterPageFile="~/Pages/SiteMaster.master" AutoEventWireup="false" CodeFile="DetalleSiniestros.aspx.vb" Inherits="Recordatorios_DetalleSiniestros" %>
<%@ MasterType VirtualPath="~/Pages/SiteMaster.master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="cph_principal" Runat="Server">
    <script src="../Scripts/Recordatorios.js"></script>

            <div class="cuadro-titulo panel-encabezado">
                Consulta de Siniestros
                 <asp:HiddenField runat="server" ID="hid_Ventanas" Value="0|0|0|" />
                 <asp:HiddenField runat="server" ID="hid_Clave" Value="" />
            </div>
            <div class="clear padding20"></div>
            <div style="width:1000px; min-width:1000px; overflow-x:hidden">
                 <div class="row">
                       <asp:UpdatePanel runat="server" ID="upd_Opc">
                         <ContentTemplate>
                            <div class="col-md-6">
                                <asp:Label runat="server" class="col-md-1 etiqueta-control" Width="150px">Tipo de Consulta: </asp:Label>
                                <asp:RadioButton runat="server" ID="opcFac" CssClass="etiqueta-control" Text=" Facultativos" Checked="true" OnCheckedChanged="opcFac_CheckedChanged" AutoPostBack ="true" />
                                <asp:RadioButton runat="server" ID="opcEsp" CssClass="etiqueta-control" Text=" Especiales" OnCheckedChanged="opcEsp_CheckedChanged" AutoPostBack ="true" />
                            </div>
                            <div class="col-md-6 Derecha">
                              <asp:Label runat="server" id="lbl_FechaGen" class="col-md-1 etiqueta-control" Width="250px"> </asp:Label> 
                            </div>
                      </ContentTemplate>
                     </asp:UpdatePanel>
                </div>
                <div class="clear padding10"></div>
                  <div class="cuadro-subtitulo">
                            Datos Generales
                  </div>
                <div class="clear padding20"></div>
                 <div class="row" >
                    <div class="col-md-12"> 
                        <asp:UpdatePanel runat="server" ID="upSiniestros">
                            <ContentTemplate>
                                 <asp:Panel runat="server" ID="pnlSiniestros" Width="100%"  ScrollBars="Both">
                                        <asp:GridView runat="server" ID="gvd_Siniestros" AutoGenerateColumns="false" CssClass="grid-view" HeaderStyle-CssClass="header" 
                                            AlternatingRowStyle-CssClass="altern" GridLines="Horizontal"  ShowHeaderWhenEmpty="false" AllowPaging="true" PageSize="10"
                                            DataKeyNames="SINIESTRO">
                                            <Columns>
                                                <asp:TemplateField HeaderText="">
                                                    <ItemTemplate>
                                                        <asp:HiddenField runat="server" ID="chk_SelSin" value="false"/>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                 <asp:TemplateField  HeaderText="Sel">
                                                    <HeaderTemplate>
                                                        <asp:Checkbox runat="server" ID="chkAll" Width="30px" Font-Size="12px" Visible="false"></asp:Checkbox>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:Checkbox runat="server" ID="chkSeguir" Width="30px" Font-Size="10px"></asp:Checkbox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Siniestro">
                                                    <ItemTemplate>
                                                        <asp:LinkButton runat="server" ID="lbl_Siniestro" CommandName="MuestraDetalle" CommandArgument='<%# Container.DataItemIndex%>' Text='<%# Eval("SINIESTRO") %>' Width="70px" Font-Size="10px"></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Sub">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_Subsiniestro" Text='<%# Eval("SUBSINIESTRO") %>' Width="30px" Font-Size="10px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                 <asp:TemplateField HeaderText="Sucursal">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_Sucursal" Text='<%# Eval("SUCURSAL") %>' Width="160px" Font-Size="10px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                 <asp:TemplateField HeaderText="Ramo">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_Ramo" Text='<%# Eval("RAMO") %>' Width="220px" Font-Size="10px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                 <asp:TemplateField HeaderText="Poliza">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_Poliza" Text='<%# Eval("POLIZA") %>' Width="70px" Font-Size="10px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                 <asp:TemplateField HeaderText="Sufijo">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_Sufijo" Text='<%# Eval("SUFIJO") %>' Width="50px" Font-Size="10px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                 <asp:TemplateField HeaderText="Endoso">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_Endoso" Text='<%# Eval("ENDOSO") %>' Width="50px" Font-Size="10px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                 <asp:TemplateField HeaderText="Ubicación">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="Label1" Text='<%# Eval("UBICACION") %>' Width="60px" Font-Size="10px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                 <asp:TemplateField HeaderText="Evento">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="Label2" Text='<%# Eval("EVENTO_CAT") %>' Width="60px" Font-Size="10px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                 <asp:TemplateField HeaderText ="Rechazar">
                                                            <ItemTemplate>
                                                                <asp:imagebutton ImageUrl="~/Images/delete_rojo.png" CommandName="Delete" Height="26" runat="server" CssClass="btn Delete" />
                                                            </ItemTemplate>
                                                  </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Justif. Rechazo">
                                                    <ItemTemplate>
                                                        <asp:Textbox runat="server" ID="txt_Justifica" CssClass="Justifica"  Width="100px" Font-Size="10px"></asp:Textbox>
                                                        <asp:Button runat="server" CommandName="Justifica" ID="btn_Justifica" CssClass="NoDisplay BtnJustifica" />
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
            </div>
                <div class="clear padding10"></div>
                  <div class="cuadro-subtitulo">
                          Detalle de Movimientos 
                          
                  </div>
                <div class="clear padding10"></div>
                 <div class="row" >
                    <div class="col-md-12"> 
                        <asp:UpdatePanel runat="server" ID="updDetalleSin">
                            <ContentTemplate>
                                 <asp:Label runat="server" Id="NumSin" class="cuadro-subtitulo"></asp:Label>
                                 <asp:Panel runat="server" ID="pnl_Detalle" Width="100%"  ScrollBars="Both">
                                      <asp:HiddenField runat="server" ID="hid_hora" />
                                        <asp:GridView runat="server" ID="gvd_Detalle" AutoGenerateColumns="false" CssClass="grid-view" HeaderStyle-CssClass="header" 
                                            AlternatingRowStyle-CssClass="altern" GridLines="Horizontal"  ShowHeaderWhenEmpty="false" AllowPaging="true" PageSize="10"
                                            DataKeyNames="SINIESTRO, ID_PV">
                                            <Columns>
                                                <asp:TemplateField HeaderText="">
                                                    <ItemTemplate>
                                                        <asp:HiddenField runat="server" ID="chk_SelSin" value="false"/>
                                                    </ItemTemplate>
                                                </asp:TemplateField >
                                                <asp:TemplateField>
                                                       <ItemTemplate>
                                                            <asp:imagebutton ImageUrl="~/Images/guardar_azulmini.png" CommandName="GuardarAJ" Height="26" runat="server" CssClass="btn Delete" tooltip="Guardar Ajuste" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Siniestro">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_Siniestro" Text='<%# Eval("SINIESTRO") %>' Width="70px" Font-Size="10px" ></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                 <asp:TemplateField HeaderText="Fecha Mov">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="Label3" Text='<%# Eval("FEC_MOV") %>' Width="70px" Font-Size="10px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Contrato">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="Label6" Text='<%# Eval("CONTRATO") %>' Width="60px" Font-Size="10px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                  <asp:TemplateField HeaderText="Movimiento">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="Label11" Text='<%# Eval("MOVIMIENTO") %>' Width="100px" Font-Size="10px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                 <asp:TemplateField HeaderText="Moneda">
                                                    <ItemTemplate>
                                                        <div class="row" style="width:100px">
                                                            <div class="col-md-6">
                                                                <asp:Label runat="server" ID="lbl_Moneda" Text='<%# Eval("MONEDA") %>' Width="80px" Font-Size="10px"></asp:Label>
                                                            </div>
                                                         <%--    <div class="col-md-6">
                                                                <asp:Button runat="server" ID="btn_Moneda" Text="..." CssClass ="btn botones boton-mini btnMoneda" Height="25px"/>
                                                            </div>--%>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                 <asp:TemplateField HeaderText="Ramo Contable">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" CssClass ="Centro" ID="Label5" Text='<%# Eval("COD_RAMO_CONTABLE") %>' Width="50px" Font-Size="10px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                 
                                                 <asp:TemplateField HeaderText="Descripción">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="Label7" Text='<%# Eval("DESCRIP_CONTRATO") %>' Width="260px" Font-Size="10px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                 <asp:TemplateField HeaderText="Reasegurador">
                                                    <ItemTemplate>
                                                        <div class="row" style="width:400px">
                                                            <div class="col-md-6">
                                                                 <asp:Label runat="server" ID="lbl_Reasegurador"  Text='<%# Eval("REASEGURADOR") %>' Width="300px" Font-Size="10px"></asp:Label>
                                                            </div>
<%--                                                             <div class="col-md-6">
                                                                <asp:Button runat="server" ID="btn_Reaseg" Text="..." CssClass ="btn botones boton-mini btnReasegurador" Height="25px"/>
                                                            </div>--%>
                                                            
                                                        </div>
                                                       
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                 <asp:TemplateField HeaderText="Corredor">
                                                    <ItemTemplate>
                                                       <div class="row" style="width:450px">
                                                            <div class="col-md-6">
                                                                 <asp:Label runat="server" ID="lbl_Broker" Text='<%# Eval("CORREDOR") %>' Width="350px" Font-Size="10px"></asp:Label>
                                                            </div>
<%--                                                             <div class="col-md-6">
                                                                <asp:Button runat="server" ID="btn_Broker" Text="..." CssClass ="btn botones boton-mini btnBroker" Height="25px"/>
                                                            </div>--%>
                                                            
                                                        </div>
                                                        
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                 <asp:TemplateField HeaderText="Estimación">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="Label10" Text='<%# Eval("ESTIMACION") %>' Width="200px" Font-Size="10px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                               
                                                 <asp:TemplateField HeaderText="Solicitud">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="Label12" Text='<%# Eval("SOLICITUD_PAGO") %>' Width="50px" Font-Size="10px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                 <asp:TemplateField HeaderText="Monto Mov">
                                                    <ItemTemplate>
                                                        <asp:Textbox runat="server" ID="txt_montomov" CssClass="Derecha estandar-control" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("MONTO_MOVIMIENTO"))) %>' Width="80px" Font-Size="10px"></asp:Textbox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                 <asp:TemplateField HeaderText="Monto Rea">
                                                    <ItemTemplate>
                                                        <asp:Textbox runat="server" ID="Label14" CssClass="Derecha estandar-control" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("MONTO_REASEGURO"))) %>' Width="80px" Font-Size="10px"></asp:Textbox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Monto Ret">
                                                    <ItemTemplate>
                                                        <asp:Textbox runat="server" ID="Label14" CssClass="Derecha estandar-control" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("MONTO_RETENIDA"))) %>' Width="80px" Font-Size="10px"></asp:Textbox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                 <asp:TemplateField HeaderText="Monto MovEQ">
                                                    <ItemTemplate>
                                                        <asp:label runat="server" ID="Label15" CssClass="Derecha " Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("MONTO_MOVIMIENTO_EQ"))) %>' Width="80px" Font-Size="10px"></asp:label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="Monto ReaEQ">
                                                    <ItemTemplate>
                                                        <asp:label runat="server" ID="Label16" CssClass="Derecha" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("MONTO_REASEGURO_EQ"))) %>' Width="80px" Font-Size="10px"></asp:label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="Monto RetEQ">
                                                    <ItemTemplate>
                                                        <asp:label runat="server" ID="Label17" CssClass="Derecha " Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("MONTO_RETENIDA_EQ"))) %>' Width="90px" Font-Size="10px"></asp:label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="Fecha Ocur">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="Label18" CssClass="Centro" Text='<%# Eval("FECHA_OCURRENCIA") %>' Width="70px" Font-Size="10px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Registro REA">
                                                    <ItemTemplate>
                                                        <asp:label runat="server" ID="lbl_RegReasegurador"  Text='<%# Eval("REG_REASEGURADOR") %>' Width="120px" Font-Size="10px"></asp:label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Registro COR">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="Label20" Text='<%# Eval("REG_CORREDOR") %>' Width="60px" Font-Size="10px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Asegurado">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="Label21" Text='<%# Eval("ASEGURADO") %>' Width="250px" Font-Size="10px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Cobertura">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="Label22" Text='<%# Eval("COBERTURA") %>' Width="200px" Font-Size="10px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Tipo Cambio">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="Label23" CssClass="Derecha" Text='<%# Eval("TIPO_CAMBIO") %>' Width="60px" Font-Size="10px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="CodCia">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="Label24" Text='<%# Eval("cod_cia_reas_cia") %>' Width="60px" Font-Size="10px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="CodAgente">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="Label25" Text='<%# Eval("cod_agente") %>' Width="70px" Font-Size="10px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="CodTContrato">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="Label26" Text='<%# Eval("cod_tipo_contrato") %>' Width="100px" Font-Size="10px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Fecha Ini">
                                                    <ItemTemplate>
                                                        <asp:label runat="server" ID="lbl_FecIniVig"  Text='<%# Eval("FEC_INI_VIG") %>' Width="70px" Font-Size="10px"></asp:label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Fecha Fin">
                                                    <ItemTemplate>
                                                        <asp:label runat="server" ID="lbl_FecFinVig"  Text='<%# Eval("FEC_FIN_VIG") %>' Width="70px" Font-Size="10px"></asp:label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Pais">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_Pais" Text='<%# Eval("PAIS") %>' Width="150px" Font-Size="10px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Causa">
                                                    <ItemTemplate>
                                                        <asp:label runat="server" ID="lbl_CausaStro" Text='<%# Eval("CAUSA_STRO") %>' Width="100px" Font-Size="10px"></asp:label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Dirección">
                                                    <ItemTemplate>
                                                        <asp:label runat="server" ID="lbl_DirStro" Text='<%# Eval("DIR_STRO") %>' Width="400px" Font-Size="10px"></asp:label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Fecha Aviso">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="Label32" Text='<%# Eval("FEC_AVISO") %>' Width="60px" Font-Size="10px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Ajustador">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_Ajustador" Text='<%# Eval("AJUSTADOR") %>' Width="200px" Font-Size="10px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Riesgo">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="Label34" Text='<%# Eval("RIESGO") %>' Width="220px" Font-Size="10px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="ID_PV">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lblId_Pv" Text='<%# Eval("ID_PV") %>' Width="60px" Font-Size="10px" ></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                            <PagerStyle CssClass="pager" />
                                            <PagerSettings Mode="NumericFirstLast" FirstPageText="Primero" LastPageText="Ultimo" />
                                        </asp:GridView>
                                 </asp:Panel>
                                <div class="clear padding10"></div>
                                         <div>
                                              <div class="col-md-6"> 
                                                    <asp:LinkButton id="lnk_PrevioAC" runat="server" class="btn botones" Visible =" false">
                                                        <span>
                                                            <img class="btn-buscar"/>
                                                            Previo AC 
                                                        </span>
                                                    </asp:LinkButton>
                                            </div> 
                                         </div>
                                         <div class="row Derecha">
                                            <div class="col-md-6"> 
                                                    <asp:LinkButton id="btn_Selec" runat="server" class="btn botones" visible="false">
                                                        <span>
                                                            <img class="btn-todos"/>
                                                             Selección 
                                                        </span>
                                                    </asp:LinkButton>
                                                    <asp:LinkButton id="btn_Todos" runat="server" class="btn botones" visible="false">
                                                        <span>
                                                            <img class="btn-enviar"/>
                                                             Todos 
                                                        </span>
                                                    </asp:LinkButton>
                                                    <asp:LinkButton id="btn_GuardaAJ" runat="server" class="btn botones" visible="false">
                                                        <span>
                                                            <img class="btn-modificar"/>
                                                            Editar 
                                                        </span>
                                                    </asp:LinkButton>
                                                    <asp:LinkButton id="btn_CancelaDet" runat="server" class="btn botones">
                                                        <span>
                                                            <img class="btn-cancelar"/>
                                                            Cancelar
                                                        </span>
                                                    </asp:LinkButton>
                                            </div>
                                        </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        
                        <div class="clear padding30"></div>
                        <div class="clear padding30"></div>
                        <div class="clear padding30"></div>
                </div>
            </div>

        </div>
                  <div id="GuardaAjustesAC" style="width:900px; height:500px"  class="modal-ajustes">
                       <div class="cuadro-titulo" style="height:40px">
                            <button type="button" class="close"  data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">
                                 Ajustes a Aviso de Cobro
                             </h4>
                       </div>
                       <asp:UpdatePanel runat="server" ID="updAC">
                           <ContentTemplate>
                               <div class="modal-body" style="height:470px">

                                   <div class="clear padding5"></div>
                                   <asp:label runat="server" class="col-md-1 titulo-seccion " ID="lbl_NumSinModal" Width="300px">Siniestro: </asp:label>  
                                   <div class="clear padding10"></div>
                                    <div>
                                        <table>
                                          <%--  <tr>
                                                <td>
                                                
                                                </td>
                                            </tr>--%>

                                            <tr>
                                                 <br />
                                                <td>
                                                    <asp:label runat="server" class="col-md-1 etiqueta-control" Width="150px">Fecha Vigencia Inicial:</asp:label>
                                                    <asp:textbox runat="server" ID="txt_ModFecIni" CssClass ="estandar-control Fecha Centro"  Width="100px" Font-Size="10px"></asp:textbox>
                                                </td>

                                            <%--</tr>
                                             <tr>--%>
                                                <td>
                                                    <asp:label runat="server" class="col-md-1 etiqueta-control" Width="150px">Fecha Vigencia Final</asp:label>
                                                     <asp:textbox runat="server" ID="txt_ModFecFin" CssClass ="estandar-control Fecha Centro"  Width="100px" Font-Size="10px"></asp:textbox>
                                                </td>
                                            </tr>
                                        </table>
                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:label runat="server" class="col-md-1 etiqueta-control" Width="150px">Causa del Siniestro</asp:label>
                                                </td>
                                                <td>
                                                    <asp:textbox runat="server" ID="txt_ModCausaStro" TextMode ="MultiLine" CssClass ="estandar-control " Width="380px" Height="50px" Font-Size="10px"></asp:textbox>
                                                </td>
                                            </tr>
                                            <div class="clear padding5"></div>
                                            <tr>
                                                <td>
                                                    <asp:label runat="server" class="col-md-1 etiqueta-control" Width="150px">Dirección del Siniestro</asp:label>
                                                </td>
                                                <td>
                                                    <asp:textbox runat="server" ID="txt_ModDirStro" TextMode="MultiLine"  CssClass ="estandar-control "  Width="380px" Height="50px" Font-Size="10px"></asp:textbox>
                                                </td>
                                            </tr>
                                            <div class="clear padding5"></div>
                                            <tr>
                                                <td>
                                                    <asp:label runat="server" class="col-md-1 etiqueta-control" Width="150px">Ajustador</asp:label>
                                                </td>
                                                <td>
                                                    <asp:textbox runat="server" ID="txt_ModAjustador" CssClass ="estandar-control " Width="380px" Font-Size="10px"></asp:textbox>
                                                </td>
                                            </tr>
                                            <tr>

                                            </tr>
                                        </table>
                                     </div>
                                   <div class="clear padding20"></div>
                                        <asp:Panel runat="server" ID="pnlBroker" Width="100%" Height="170px" ScrollBars="Both">
                                                <asp:GridView runat="server" ID="gvd_ModFac" AutoGenerateColumns="false" 
                                                              CssClass="grid-view" HeaderStyle-CssClass="header" AlternatingRowStyle-CssClass="altern"
                                                              GridLines="Horizontal"  ShowHeaderWhenEmpty="false" >
                                                    <Columns>
                                                      <asp:TemplateField Visible="false" >
                                                            <ItemTemplate>
                                                                <asp:label runat="server" ID="lbl_codcia" CssClass="estandar-control"  Text='<%# Eval("cod_cia_reas") %>' Width="120px" Font-Size="10px"></asp:label>
                                                            </ItemTemplate>
                                                    </asp:TemplateField>
                                                   <asp:TemplateField HeaderText="Reasegurador">
                                                       <ItemTemplate>
                                                           <asp:HiddenField runat="server" ID="hid_Edit" value="false"/>
                                                        <div class="row" style="width:400px">
                                                            <div class="col-md-6" style="width:80%">
                                                                 <asp:Label runat="server" ID="lbl_Reasegurador" Text='<%# Eval("txt_razon_social") %>' Width="320px" Font-Size="10px"></asp:Label>
                                                                 
                                                            </div>
                                                             <div class="col-md-6" style="width:20%">
                                                               <asp:Button runat="server" ID="btn_Reaseg" Text="..." CssClass ="btn botones boton-chico btnReasegurador Derecha" Height="25px"/>
                                                            </div>
                                                            
                                                        </div>
                                                        </ItemTemplate>
                                                       </asp:TemplateField> 
                                                        <asp:TemplateField HeaderText="Registro REA">
                                                            <ItemTemplate>
                                                                <asp:textbox runat="server" ID="lbl_RegReasegurador" CssClass="estandar-control"  Text='<%# Eval("cia_cod_naic") %>' Width="120px" Font-Size="10px"></asp:textbox>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                       <asp:TemplateField Visible="false" >
                                                            <ItemTemplate>
                                                                <asp:label runat="server" ID="lbl_codbro" CssClass="estandar-control"  Text='<%# Eval("cod_cia_reas_brok") %>' Width="120px" Font-Size="10px"></asp:label>
                                                            </ItemTemplate>
                                                      </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="Corredor">
                                                           <ItemTemplate>
                                                                <div class="row" style="width:450px">
                                                                    <div class="col-md-6" style="width:83%">
                                                                         <asp:Label runat="server" ID="lbl_Broker" Text='<%# Eval("txt_broker") %>' Width="360px" Font-Size="10px"></asp:Label>
                                                                    </div>
                                                                     <div class="col-md-6" style="width:17%">
                                                                        <asp:Button runat="server" ID="btn_Broker" Text="..." CssClass ="btn botones boton-chico btnBroker" Height="25px"/>
                                                                    </div>
                                                            
                                                                </div>
                                                          </ItemTemplate>
                                                </asp:TemplateField>
                                                     </Columns>
                                                </asp:GridView>
                                         </asp:Panel>
                           
                                
                                         <div style="width:100%; padding-left:215px; border-top:none;border-top-width:1px; padding-top:3px;" class="Derecha">
                                            <asp:LinkButton id="btn_modGuardarAJ" runat="server" class="btn botones" OnClick="btn_modGuardarAJ_Click" >
                                                <span>
                                                    <img class="btn-guardar"/>
                                                    Guardar
                                                </span>
                                            </asp:LinkButton>
                                            <asp:LinkButton id="btn_modCancelaAJ" runat="server" class="btn botones" OnClientClick="fn_CerrarModal('#GuardaAjustesAC');">
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
</asp:Content>

