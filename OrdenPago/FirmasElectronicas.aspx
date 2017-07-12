<%@ Page Title="" Language="VB" MasterPageFile="~/Pages/SiteMaster.master" AutoEventWireup="false" CodeFile="FirmasElectronicas.aspx.vb" Inherits="OrdenPago_FirmasElectronicas" %>
<%@ MasterType VirtualPath="~/Pages/SiteMaster.master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="cph_principal" Runat="Server">
    <script src="../Scripts/FirmasElectronicas.js"></script>
    <asp:HiddenField runat="server" ID="hid_Ventanas" Value="0|0|0|1|" />
    
    <div style="width:1000px; min-width:1000px; overflow-x:hidden">
        <div class="cuadro-titulo panel-encabezado">
            <input type="image" src="../Images/contraer_mini_inv.png" id="coVentana0" class="contraer"  />
            <input type="image" src="../Images/expander_mini_inv.png"   id="exVentana0" class="expandir"  />
            Filtros
        </div>

        <div class="panel-contenido ventana0" >
            <div class="row">
                <div class="col-md-6">
                    <asp:UpdatePanel runat="server" ID="upFechasGen">
                        <ContentTemplate>
                            <table>
                                    <tr>
                                        <td>
                                            <div class="input-group">
                                                <asp:label runat="server" class="col-md-1 etiqueta-control" Width="100px">Generada</asp:label>
                                                <asp:TextBox runat="server" ID="txtFecGeneraDe" CssClass="estandar-control Fecha" Width="110px" Height="26px" ></asp:TextBox>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="input-group">
                                                <asp:label runat="server" class="col-md-1 etiqueta-control" Width="10px">A</asp:label>
                                                <asp:TextBox runat="server" ID="txtFecGeneraA" CssClass="estandar-control Fecha" Width="110px" Height="26px" ></asp:TextBox>
                                            </div>
                                        </td>
                                    </tr>
                            </table>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6">
                    <div class="cuadro-subtitulo">
                        Usuario Solicitante
                    </div>
                    <div class="panel-subcontenido">
                        <asp:UpdatePanel runat="server" ID="upSolicitante">
                           <ContentTemplate>
                               <asp:Panel runat="server" ID="pnlUsuario" Width="100%" Height="130px" ScrollBars="Both">
                                    <asp:GridView runat="server" ID="gvd_Usuario" AutoGenerateColumns="false" 
                                                   CssClass="grid-view" HeaderStyle-CssClass="header" AlternatingRowStyle-CssClass="altern"
                                                   GridLines="Horizontal"  ShowHeaderWhenEmpty="true" >
                                        <Columns>
                                            <asp:TemplateField HeaderText="">
                                                <ItemTemplate>
                                                        <asp:HiddenField runat="server" ID="chk_SelUsu" value="false"/>
                                                </ItemTemplate>
                                            </asp:TemplateField >
                                            <asp:TemplateField HeaderText="Clave">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="lbl_ClaveUsu" Text='<%# Eval("Clave") %>' Width="100px" ></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Descripción">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="lbl_Desc" Text='<%# Eval("Descripcion") %>' Width="310px"></asp:Label>
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
                                    <asp:LinkButton id="btn_AddUsuario" runat="server" class="btn botones AgregaUsuario" data-toggle="modal" data-target="#EsperaModal">
                                        <span>
                                            <img class="btn-añadir"/>
                                            Añadir
                                        </span>
                                    </asp:LinkButton>
                                </div>
                           </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="cuadro-subtitulo">
                        Estatus Orden Pago
                    </div>
                    <div class="panel-subcontenido">
                        <asp:UpdatePanel runat="server" ID="upEstatus">
                           <ContentTemplate>
                               <asp:Panel runat="server" ID="pnlEstatus" Width="100%" Height="130px" ScrollBars="Both">
                                    <asp:GridView runat="server" ID="gvd_Estatus" AutoGenerateColumns="false" 
                                                  CssClass="grid-view" HeaderStyle-CssClass="header" AlternatingRowStyle-CssClass="altern"
                                                  GridLines ="Horizontal"  ShowHeaderWhenEmpty="true" >
                                        <Columns>
                                            <asp:TemplateField HeaderText="">
                                                <ItemTemplate>
                                                        <asp:HiddenField runat="server" ID="chk_SelEst" value="false"/>
                                                </ItemTemplate>
                                            </asp:TemplateField >
                                            <asp:TemplateField HeaderText="Clave">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="lbl_ClaveEst" Text='<%# Eval("Clave") %>' Width="60px" Font-Size="10px" ></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Descripción">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="lbl_Desc" Text='<%# Eval("Descripcion") %>' Width="350px" Font-Size="10px"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:imagebutton ImageUrl="~/Images/delete_rojo.png" CommandName="Delete" Height="26" runat="server" CssClass="btn Delete" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                    </asp:GridView>
                               </asp:Panel>
                               <div style="width:100%;  text-align:right">
                                    <asp:LinkButton id="btn_AddEstatus" runat="server" class="btn botones AgregaEstatus" data-toggle="modal" data-target="#EsperaModal">
                                        <span>
                                            <img class="btn-añadir"/>
                                            Añadir
                                        </span>
                                    </asp:LinkButton>
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
                    <asp:LinkButton id="btn_BuscaOP" runat="server" class="btn botones">
                        <span>
                            <img class="btn-buscar"/>
                            Orden
                        </span>
                    </asp:LinkButton>

                    <asp:LinkButton id="btn_Limpiar" runat="server" class="btn botones">
                        <span>
                            <img class="btn-cancelar"/>
                            Limpiar
                        </span>
                    </asp:LinkButton>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>

        <div class="clear padding5"></div>

        <div class="cuadro-titulo panel-encabezado">
            <input type="image" src="../Images/contraer_mini_inv.png" id="coVentana1" class="contraer"  />
            <input type="image" src="../Images/expander_mini_inv.png"   id="exVentana1" class="expandir"  />
            Listado Ordenes de Pago
        </div>
        <div class="panel-contenido ventana1" >
            <asp:UpdatePanel runat="server" ID="upOrdenes">
              <ContentTemplate>
                    <asp:Panel runat="server" id="pnlOrdenP" width="100%">
                        <asp:GridView runat="server" ID="gvd_LstOrdenPago" AutoGenerateColumns="false"  ShowHeader="false"
                                      CssClass="grid-view" HeaderStyle-CssClass="header" AlternatingRowStyle-CssClass="altern"
                                      GridLines="Horizontal"  ShowHeaderWhenEmpty="true" AllowPaging="true" PageSize="10" 
                                      DataKeyNames="nro_op,id_imputacion,id_pv,cod_estatus_op,fec_baja,fec_autoriz_sector,fec_autoriz_contab,fec_pago">
                            <Columns>
                                <asp:TemplateField HeaderText="" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                            <asp:CheckBox runat="server"  Width="0px" ID="chk_SelOp" Checked='<%# Eval("tSEl_Val") %>' Visible="false" />
                                    </ItemTemplate>
                                </asp:TemplateField >
                                <asp:TemplateField HeaderText="" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                            <asp:CheckBox runat="server" Width="20px" ID="chk_Impresion" Checked='<%# Eval("sn_impresion") %>'/>
                                            <asp:Image runat="server" ID="imgPrint" ImageUrl="../Images/icono-impresion_mini.png" ToolTip="Selecciona para Imprimir OP" />
                                    </ItemTemplate>
                                </asp:TemplateField >
                                <asp:TemplateField HeaderText="Nro Op">
                                    <ItemTemplate>
                                        <asp:LinkButton runat="server" ID="lbl_OrdenPago" Text='<%# Eval("nro_op")%>' Font-Size="12px" Font-Bold="true" Width="45px" CssClass="Centro Link"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                            
                                <asp:TemplateField HeaderText="" >
                                    <ItemTemplate>      
                                        <div class="cuadro-subtitulo-grid">
                                            FIRMAS
                                        </div>                                                                                
                                        <div id="div_Firmas" style="text-align:left;height:160px; width:200px" runat="server" class="masterTooltip">
                                            <asp:CheckBox runat="server" Text=" Solicitante"  Width="130px"  ID="chk_FirmaSol" Checked='<%# Eval("sn_Solicita") %>' Enabled='<%# Eval("GeneraOp_Solicitante") %>' OnCheckedChanged="chk_FirmaSol_CheckedChanged" AutoPostBack="true"/>
                                            <asp:CheckBox runat="server" Text=" Jefe Inmediato" Width="130px"  ID="chk_FirmaJefe" Checked='<%# Eval("sn_JefeDirecto") %>' Enabled='<%# Eval("Autoriza_JefeInmediato") %>' OnCheckedChanged="chk_FirmaJefe_CheckedChanged" AutoPostBack =" true"/>
                                            <asp:LinkButton runat="server" ID="lnk_SelJefe" Text="Cambiar"  Width="10px"  OnClick="lnk_SelJefe_Click"></asp:LinkButton>
                                            <asp:CheckBox runat="server" Text=" SubDirección" Width="130px"  ID="chk_SubDir" Checked='<%# Eval("sn_Subdirector") %>' Enabled='<%# Eval("Autoriza_Subdirector") %>' OnCheckedChanged="chk_SubDir_CheckedChanged" AutoPostBack="true" />
                                            <asp:LinkButton runat="server" ID="lnk_SelSubDir" Text="Cambiar" Width="10px"  OnClick="lnk_SelSubDir_Click"></asp:LinkButton>
                                            <asp:CheckBox runat="server" Text=" Director Area" Width="130px" ID="chk_FirmaDir" Checked='<%# Eval("sn_DireccionArea") %>' Enabled='<%# Eval("Autoriza_DirArea") %>' OnCheckedChanged="chk_FirmaDir_CheckedChanged" AutoPostBack="true" />
                                            <asp:LinkButton runat="server" ID="lnk_SelDir" Text="Cambiar" Width="10px"  OnClick="lnk_SelDir_Click"></asp:LinkButton>
                                            <asp:CheckBox runat="server" Text=" Contabilidad" Width="130px"  ID="chk_FirmaCon" Checked='<%# Eval("sn_Contabilidad") %>' Enabled='<%# Eval("Autoriza_Conta") %>' OnCheckedChanged="chk_FirmaCon_CheckedChanged" AutoPostBack="true"/>
                                            <asp:LinkButton runat="server" ID="lnk_SelConta" Text="Cambiar"  Width="10px"  OnClick="lnk_SelConta_Click"></asp:LinkButton>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="">
                                    <ItemTemplate>
                                        <div class="cuadro-subtitulo-grid">
                                            DETALLE
                                        </div>
                                                                                               
                                        <div id="div_Detalle" style="text-align:left;height:160px;width:700px" runat="server" class="masterTooltip" >
                                            <asp:Label runat="server" CssClass="col-md-1" Width="120px" Text="Asegurado:" Font-Bold="true"></asp:Label>
                                            <asp:Label runat="server" ID="lbl_Asegurado" Text='<%# Eval("Asegurado")%>' Width="530px"></asp:Label>

                                            <div class="clear padding5"></div>

                                            <asp:Label runat="server" CssClass="col-md-1" Width="120px" Text="Ramos Contables:" Font-Bold="true"></asp:Label>
                                            <asp:DropDownList ID="ddl_RamosContables"  Width="480px" runat="server" CssClass="estandar-control-grid"></asp:DropDownList>
                                            <asp:Label ID="lbl_RamosContables" Text='<%# DataBinder.Eval(Container.DataItem, "Ramos") %>' Visible="false" runat="server"/>
                                            
                                            <div class="clear padding5"></div>
                                            
                                            <asp:Label runat="server" CssClass="col-md-1" Width="120px" Text="Broker/Compañia:" Font-Bold="true"></asp:Label>
                                            <asp:Label runat="server" ID="lbl_BroCia" Text='<%# Eval("txt_otros") %>' Width="530px" ></asp:Label>
                                            
                                            <div class="clear padding5"></div>

                                            <asp:Label runat="server" CssClass="col-md-1" Width="120px" Text="Moneda:" Font-Bold="true"></asp:Label>
                                            <asp:Label runat="server" ID="lbl_Moneda" Text='<%# Eval("Moneda") %>' Width="110px"  ></asp:Label>
                                            <asp:Label runat="server" Width="100px" Text="Fecha Generación:" Font-Bold="true"></asp:Label>
                                            <asp:Label runat="server" ID="lbl_FechaGenera" Text='<%# Eval("fec_generacion") %>' Width="110px"></asp:Label>
                                            <asp:Label runat="server" Width="100px" Text="Fecha de Pago:" Font-Bold="true"></asp:Label>
                                            <asp:Label runat="server" ID="lbl_FechaPago" Text='<%# Eval("Fec_Pago") %>' Width="110px"></asp:Label>
                                            
                                            <div class="clear padding5"></div>
                                            
                                            <asp:Label runat="server" CssClass="col-md-1" Width="120px" Text="Monto:" Font-Bold="true"></asp:Label>
                                            <asp:Label runat="server" ID="lbl_Monto" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("Monto")))  %>' Width="110px"></asp:Label>
                                            <asp:Label runat="server" Width="100px" Text="Estatus:" Font-Bold="true"></asp:Label>
                                            <asp:Label runat="server" ID="lbl_Estatus" Text='<%# Eval("estatus") %>' Width="250px"></asp:Label>

                                            <div class="clear padding5"></div>
                                            <asp:Label runat="server" CssClass="col-md-1" Width="120px" Text="Descripción:" Font-Bold="true"></asp:Label>
                                            <asp:label ID="lbl_Detalle" Text='<%# Eval("Texto") %>' Width="480px" Height="80px" runat="server"></asp:label>

                                        </div>
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

        <div style="width:100%; text-align:right; border-top-style:inset; border-width:1px; border-color:#003A5D">
            <asp:UpdatePanel runat="server" ID="upFirma">
                <ContentTemplate>
                    <asp:LinkButton id="btn_Imprimir" runat="server" class="btn botones">
                        <span>
                            <img class="btn-imprimir"/>
                            Imprimir
                        </span>
                    </asp:LinkButton>

                    <asp:LinkButton id="btn_Firmar" runat="server" class="btn botones Autorizacion">
                        <span>
                            <img class="btn-modificar"/>
                            Firmar
                        </span>
                    </asp:LinkButton>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>

    <div id="Destinatario" style="width:350px; height:160px"  class="modal-catalogo">
        <asp:UpdatePanel runat="server" ID="upAutoriza" >
         <ContentTemplate>
             <div class="cuadro-titulo" style="height:30px">
                <button type="button" class="close"  data-dismiss="modal">&times;</button>
                <div class="titulo-modal"><label>CAMBIAR DESTINATARIO</label></div>
             </div>

             <div class="panel-body" style="height:130px; ">
                 <div class="row">
                    <div class="col-sm-12">
                            <asp:label runat="server" class="col-md-1 etiqueta-control" Width="270px">El destinatario predeterminado es: </asp:label>
                            <asp:Label runat="server" class="col-md-1 etiqueta-control" Width="270px" ID="lblDestinatario" Text=""></asp:Label>
                            <asp:HiddenField runat="server" ID="hid_Persona" Value="" />
                            <div class="clear padding10"></div>
                            <asp:label runat="server" class="col-md-1 etiqueta-control" Width="100px">Destinatario: </asp:label>
                            <asp:DropDownList ID="ddl_Destinatario"  Height="25px" Width="205px" CssClass="estandar-control" runat="server"></asp:DropDownList>
                    </div>
                 </div>
                
                 <div class="clear padding10"></div> 

                 <div style="width:100%; text-align:right; padding-right:10px; ">
                    <asp:LinkButton id="btnCambia" runat="server" class="btn botones">
                        <span>
                            <img class="btn-modificar"/>
                            Cambiar
                        </span>
                    </asp:LinkButton>

                    <asp:LinkButton id="btnCancela" runat="server" data-dismiss="modal" class="btn botones CierraFirma">
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
    <div class="clear padding100"></div> 
</asp:Content>

