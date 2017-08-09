<%@ Page Title="" Language="VB" MasterPageFile="~/Pages/SiteMaster.master" AutoEventWireup="false" CodeFile="DetalleSiniestros.aspx.vb" Inherits="Recordatorios_DetalleSiniestros" %>
<%@ MasterType VirtualPath="~/Pages/SiteMaster.master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="cph_principal" Runat="Server">

            <div class="cuadro-titulo panel-encabezado">
                Consulta de Siniestros
                 <asp:HiddenField runat="server" ID="hid_Ventanas" Value="0|0|0|" />
                 <asp:HiddenField runat="server" ID="hid_Clave" Value="" />
            </div>
            <div class="clear padding20"></div>
            <div style="width:1000px; min-width:1000px; overflow-x:hidden">
                 <div class="row">
                    <div class="col-md-6">
                        <asp:UpdatePanel runat="server" ID="upd_Opc">
                         <ContentTemplate>
                               <asp:Label runat="server" class="col-md-1 etiqueta-control" Width="150px">Tipo de Consulta: </asp:Label>
                                <asp:RadioButton runat="server" ID="opcFac" CssClass="etiqueta-control" Text=" Facultativos" Checked="true" OnCheckedChanged="opcFac_CheckedChanged" AutoPostBack ="true" />
                                <asp:RadioButton runat="server" ID="opcEsp" CssClass="etiqueta-control" Text=" Especiales" OnCheckedChanged="opcEsp_CheckedChanged" AutoPostBack ="true" />
                                 </asp:LinkButton>
                         </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
                <div class="clear padding20"></div>
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
                                                <asp:TemplateField HeaderText="Enviar">
                                                    <ItemTemplate>
                                                        <asp:Checkbox runat="server" ID="chkSeguir" Width="40px" Font-Size="10px"></asp:Checkbox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText ="Email Destino">
                                                    <ItemTemplate>
                                                        <asp:TextBox runat="server" ID="txt_Mail" Width="150" Font-Size="10px"></asp:TextBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                            <PagerStyle CssClass="pager" />
                                            <PagerSettings Mode="NumericFirstLast" FirstPageText="Primero" LastPageText="Ultimo" />
                                        </asp:GridView>
                                 </asp:Panel>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        
                        <div class="clear padding20"></div>
                </div>
            </div>

                  <div class="cuadro-subtitulo">
                          Detalle
                  </div>
                <div class="clear padding20"></div>
                 <div class="row" >
                    <div class="col-md-12"> 
                        <asp:UpdatePanel runat="server" ID="updDetalleSin">
                            <ContentTemplate>
                                 <asp:Panel runat="server" ID="pnl_Detalle" Width="100%"  ScrollBars="Both">
                                        <asp:GridView runat="server" ID="gvd_Detalle" AutoGenerateColumns="false" CssClass="grid-view" HeaderStyle-CssClass="header" 
                                            AlternatingRowStyle-CssClass="altern" GridLines="Horizontal"  ShowHeaderWhenEmpty="false" AllowPaging="true" PageSize="10"
                                            DataKeyNames="">
                                            <Columns>
                                                <asp:TemplateField HeaderText="">
                                                    <ItemTemplate>
                                                        <asp:HiddenField runat="server" ID="chk_SelSin" value="false"/>
                                                    </ItemTemplate>
                                                </asp:TemplateField >
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
                                                 <asp:TemplateField HeaderText="Moneda">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="Label4" Text='<%# Eval("MONEDA") %>' Width="60px" Font-Size="10px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                 <asp:TemplateField HeaderText="Ramo Contable">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="Label5" Text='<%# Eval("COD_RAMO_CONTABLE") %>' Width="50px" Font-Size="10px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                 <asp:TemplateField HeaderText="Contrato">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="Label6" Text='<%# Eval("CONTRATO") %>' Width="60px" Font-Size="10px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                 <asp:TemplateField HeaderText="Descripción">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="Label7" Text='<%# Eval("DESCRIP_CONTRATO") %>' Width="260px" Font-Size="10px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                 <asp:TemplateField HeaderText="Reasegurador">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="Label8" Text='<%# Eval("REASEGURADOR") %>' Width="260px" Font-Size="10px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                 <asp:TemplateField HeaderText="Corredor">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="Label9" Text='<%# Eval("CORREDOR") %>' Width="350px" Font-Size="10px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                 <asp:TemplateField HeaderText="Estimación">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="Label10" Text='<%# Eval("ESTIMACION") %>' Width="200px" Font-Size="10px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                 <asp:TemplateField HeaderText="Movimiento">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="Label11" Text='<%# Eval("MOVIMIENTO") %>' Width="120px" Font-Size="10px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                 <asp:TemplateField HeaderText="Solicitud">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="Label12" Text='<%# Eval("SOLICITUD_PAGO") %>' Width="50px" Font-Size="10px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                 <asp:TemplateField HeaderText="Monto Mov">
                                                    <ItemTemplate>
                                                        <asp:Textbox runat="server" ID="txt_montomov" CssClass="Derecha" Text='<%# Eval("MONTO_MOVIMIENTO") %>' Width="80px" Font-Size="10px"></asp:Textbox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                 <asp:TemplateField HeaderText="Monto Rea">
                                                    <ItemTemplate>
                                                        <asp:Textbox runat="server" ID="Label14" CssClass="Derecha" Text='<%# Eval("MONTO_REASEGURO") %>' Width="80px" Font-Size="10px"></asp:Textbox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                 <asp:TemplateField HeaderText="Monto MovEQ">
                                                    <ItemTemplate>
                                                        <asp:Textbox runat="server" ID="Label15" CssClass="Derecha" Text='<%# Eval("MONTO_MOVIMIENTO_EQ") %>' Width="80px" Font-Size="10px"></asp:Textbox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="Monto ReaEQ">
                                                    <ItemTemplate>
                                                        <asp:Textbox runat="server" ID="Label16" CssClass="Derecha" Text='<%# Eval("MONTO_REASEGURO_EQ") %>' Width="80px" Font-Size="10px"></asp:Textbox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="Monto RetEQ">
                                                    <ItemTemplate>
                                                        <asp:Textbox runat="server" ID="Label17" CssClass="Derecha" Text='<%# Eval("MONTO_RETENIDA_EQ") %>' Width="90px" Font-Size="10px"></asp:Textbox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="Fecha Ocur">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="Label18" Text='<%# Eval("FECHA_OCURRENCIA") %>' Width="70px" Font-Size="10px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="Registro REA">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="Label19" Text='<%# Eval("REG_REASEGURADOR") %>' Width="120px" Font-Size="10px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Registro COR">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="Label20" Text='<%# Eval("REG_CORREDOR") %>' Width="60px" Font-Size="10px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Asegurado">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="Label21" Text='<%# Eval("ASEGURADO") %>' Width="200px" Font-Size="10px"></asp:Label>
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
                                                        <asp:Label runat="server" ID="Label27" Text='<%# Eval("FEC_INI_VIG") %>' Width="60px" Font-Size="10px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Fecha Fin">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="Label28" Text='<%# Eval("FEC_FIN_VIG") %>' Width="60px" Font-Size="10px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Pais">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="Label29" Text='<%# Eval("PAIS") %>' Width="150px" Font-Size="10px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Causa">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="Label30" Text='<%# Eval("CAUSA_STRO") %>' Width="100px" Font-Size="10px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Dirección">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="Label31" Text='<%# Eval("DIR_STRO") %>' Width="400px" Font-Size="10px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Fecha Aviso">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="Label32" Text='<%# Eval("FEC_AVISO") %>' Width="60px" Font-Size="10px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Ajustador">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="Label33" Text='<%# Eval("AJUSTADOR") %>' Width="100px" Font-Size="10px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Riesgo">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="Label34" Text='<%# Eval("RIESGO") %>' Width="120px" Font-Size="10px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <asp:imagebutton ImageUrl="~/Images/guardar_mini.png" CommandName="GuardarAjuste" Height="26" runat="server" CssClass="btn Guardar" />
                                                     </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                            <PagerStyle CssClass="pager" />
                                            <PagerSettings Mode="NumericFirstLast" FirstPageText="Primero" LastPageText="Ultimo" />
                                        </asp:GridView>
                                 </asp:Panel>
                                <div class="clear padding10"></div>
                                         <div class="row">
                                            <div class="col-md-12"> 
                                                    <asp:LinkButton id="btn_EnviarDet" runat="server" class="btn botones">
                                                        <span>
                                                            <img class="btn-enviar"/>
                                                            Enviar 
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

</asp:Content>

