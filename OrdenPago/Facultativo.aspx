<%@ Page Title="" Language="VB" MasterPageFile="~/Pages/SiteMaster.master" AutoEventWireup="false" CodeFile="Facultativo.aspx.vb" Inherits="OrdenPago_Facultativo" %>
<%@ MasterType VirtualPath="~/Pages/SiteMaster.master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="cph_principal" Runat="Server">
    <script src="../Scripts/Facultativos.js"></script>

    <asp:HiddenField runat="server" ID="hid_Ventanas" Value="0|0|0|1|" />

    <%-----------------------------------Sección 1----------------------------------------------------------------------------------------------------%>
        <div style="width:900px; min-width:900px; overflow-x:hidden">
            <div class="cuadro-titulo panel-encabezado">
                <input type="image" src="../Images/contraer_mini_inv.png" id="coVentana0" class="contraer"  />
                <input type="image" src="../Images/expander_mini_inv.png"   id="exVentana0" class="expandir"  />
                Filtro Broker / Compañia
            </div>




            <div class="panel-contenido ventana0" >
                <div class="row">
                    <div class="col-md-6">
                        <div class="cuadro-subtitulo">
                            Broker
                        </div>
                        <div class="panel-subcontenido">
                                <asp:UpdatePanel runat="server" ID="upBroker">
                                    <ContentTemplate>
                                        <asp:Panel runat="server" ID="pnlBroker" Width="100%" Height="130px" ScrollBars="Both">
                                                <asp:GridView runat="server" ID="gvd_Broker" AutoGenerateColumns="false" 
                                                              CssClass="grid-view" HeaderStyle-CssClass="header" AlternatingRowStyle-CssClass="altern"
                                                              GridLines="Horizontal"  ShowHeaderWhenEmpty="true" >
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="">
                                                            <ItemTemplate>
                                                                    <asp:HiddenField runat="server" ID="chk_SelBro" value="false"/>
                                                            </ItemTemplate>
                                                        </asp:TemplateField >
                                                        <asp:TemplateField HeaderText="Clave">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" ID="lbl_ClaveBro" Text='<%# Eval("Clave") %>' Width="50px" Font-Size="10px" ></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Descripción">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" ID="lbl_Desc" Text='<%# Eval("Descripcion") %>' Width="310px" Font-Size="10px"></asp:Label>
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
                                                <asp:LinkButton id="btn_AddBroker" runat="server" class="btn botones AgregaBroker" data-toggle="modal" data-target="#EsperaModal">
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
                            Compañia
                        </div>
                        <div class="panel-subcontenido">
                                <asp:UpdatePanel runat="server" ID="upCompañia">
                                    <ContentTemplate>
                                        <asp:Panel runat="server" ID="pnlCompañia" Width="100%" Height="130px" ScrollBars="Both">
                                                <asp:GridView runat="server" ID="gvd_Compañia" AutoGenerateColumns="false" 
                                                              CssClass="grid-view" HeaderStyle-CssClass="header" AlternatingRowStyle-CssClass="altern"
                                                              GridLines="Horizontal"  ShowHeaderWhenEmpty="true">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="" ItemStyle-CssClass="SelCia">
                                                            <ItemTemplate>
                                                                <asp:HiddenField runat="server" ID="chk_SelCia" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Clave" ItemStyle-CssClass="ClaveCia">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" ID="lbl_ClaveCia" Text='<%# Eval("Clave") %>' Width="50px" Font-Size="9.5px" ></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Descripción" ItemStyle-CssClass="DescripcionCia">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" ID="lbl_Desc" Text='<%# Eval("Descripcion") %>' Width="310px" Font-Size="9.5px"></asp:Label>
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
                                    </ContentTemplate>
                                </asp:UpdatePanel> 
                        </div>
                    </div>
                </div>
            </div>


             <%-----------------------------------Sección 2----------------------------------------------------------------------------------------------------%>
            <div class="cuadro-titulo panel-encabezado">
                <input type="image" src="../Images/contraer_mini_inv.png" id="coVentana1" class="contraer"  />
                <input type="image" src="../Images/expander_mini_inv.png"   id="exVentana1" class="expandir"  />
                <strong>Filtro Facultativos / Pólizas</strong>
            </div>
            <div class="panel-contenido ventana1" >
                <div class="row">
                    <div class="col-md-6">
                        <div class="cuadro-subtitulo">
                            Facultativos
                        </div>
                        <div class="panel-subcontenido">
                            <asp:UpdatePanel runat="server" ID="upFechas">
                            <ContentTemplate>

                                    <table>
                                        <tr>
                                            <td>
                                                <asp:label runat="server" class="col-md-1 etiqueta-control" Width="100px">Fec. Fac</asp:label>
                                                <asp:TextBox runat="server" ID="txt_FechaDe" CssClass="estandar-control Fecha" Width="110px" Height="26px" ></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:label runat="server" class="col-md-1 etiqueta-control" Width="38px">A</asp:label>
                                                <asp:TextBox runat="server" ID="txt_FechaA" CssClass="estandar-control Fecha" Width="110px" Height="26px" ></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
        
                                </ContentTemplate>
                            </asp:UpdatePanel>
                                            
                                                            

                            <asp:UpdatePanel runat="server" ID="upContrato">
                                <ContentTemplate>
                                    <asp:Panel runat="server" ID="pnlContrato" Width="100%" Height="105px" ScrollBars="Both">
                                        <asp:GridView runat="server" ID="gvd_Contrato" AutoGenerateColumns="false"  
                                                      CssClass="grid-view" HeaderStyle-CssClass="header" AlternatingRowStyle-CssClass="altern"
                                                      GridLines="Horizontal"  ShowHeaderWhenEmpty="true" >
                                            <Columns>
                                                <asp:TemplateField HeaderText="" ItemStyle-CssClass="SelCia">
                                                    <ItemTemplate>
                                                        <asp:HiddenField runat="server" ID="chk_SelFac" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Clave" ItemStyle-CssClass="ClaveCia">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_ClaveFac" Text='<%# Eval("Clave") %>' Width="60px" Font-Size="9.5px" ></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Descripción" ItemStyle-CssClass="DescripcionCia">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_Desc" Text='<%# Eval("Descripcion") %>' Width="300px" Font-Size="9.5px"></asp:Label>
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
                                        <asp:LinkButton id="btn_AddCtr" runat="server" class="btn botones AgregaContrato" data-toggle="modal" data-target="#EsperaModal">
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
                            Póliza
                        </div>
                        <div class="panel-subcontenido">
                                <asp:UpdatePanel runat="server" ID="upPoliza">
                                    <ContentTemplate>
                                        <asp:HiddenField runat="server" ID="hid_Polizas" Value="" />
                                        <asp:HiddenField runat="server" ID="hid_HTML" Value="" />
                                        <div class="clear padding5"></div>
                                        <div class="input-group">
                                            <asp:label runat="server" class="col-md-1 etiqueta-control" Width="120px">Busqueda por:</asp:label>
                                            <asp:RadioButtonList runat="server"  ID="optAjuste" CssClass="rbl etiqueta-control" RepeatDirection="Horizontal" AutoPostBack="true">
                                                <asp:ListItem Selected="True" Value="0" Text="Endosos"></asp:ListItem>
                                                <asp:ListItem  Value="1" Text="Endosos y Ajustes"></asp:ListItem>
                                            </asp:RadioButtonList>
                                        </div>

                                        <asp:Panel runat="server" ID="pnlPoliza" Width="100%" Height="100px" ScrollBars="Both">
                                                <asp:GridView runat="server" ID="gvd_Poliza" AutoGenerateColumns="false" 
                                                              CssClass="grid-view" HeaderStyle-CssClass="header" AlternatingRowStyle-CssClass="altern"
                                                              GridLines="Horizontal"  ShowHeaderWhenEmpty="true" >
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="" ItemStyle-CssClass="SelCia">
                                                            <ItemTemplate>
                                                                <asp:HiddenField runat="server" ID="chk_SelPol" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Clave" ItemStyle-CssClass="ClaveCia">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" ID="lbl_ClavePol" Text='<%# Eval("Clave") %>' Width="100px" Font-Size="9.5px" ></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Grupo Endoso">
                                                            <ItemTemplate>
                                                                <asp:label runat="server" ID="lbl_DescripcionPol" Enabled="false" Text='<%# Eval("Descripcion")   %>' Width="260px" Font-Size="9.5px"  ></asp:label>
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
                                                <asp:LinkButton id="btn_AddPol" runat="server" class="btn botones AgregaPoliza" data-toggle="modal" data-target="#EsperaModal">
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

             <%-----------------------------------Sección 3----------------------------------------------------------------------------------------------------%>
            <div class="cuadro-titulo panel-encabezado">
                <input type="image" src="../Images/contraer_mini_inv.png" id="coVentana2" class="contraer"  />
                <input type="image" src="../Images/expander_mini_inv.png"   id="exVentana2" class="expandir"  />
                <strong>Filtro Adicionales</strong>
            </div>
            <div class="panel-contenido ventana2" >
                <div class="row">
                    <div class="col-md-6">
                        <div class="cuadro-subtitulo">
                            Ramo Contable
                        </div>
                        <div class="panel-subcontenido">
                             <asp:UpdatePanel runat="server" ID="upRamoContable">
                                <ContentTemplate>
                                     <asp:Panel runat="server" ID="pn_RamoContable" Width="100%" Height="130px" ScrollBars="Both">
                                        <asp:GridView runat="server" ID="gvd_RamoContable" AutoGenerateColumns="false" 
                                                      CssClass="grid-view" HeaderStyle-CssClass="header" AlternatingRowStyle-CssClass="altern"
                                                      GridLines="Horizontal"  ShowHeaderWhenEmpty="true" >
                                            <Columns>
                                                <asp:TemplateField HeaderText="">
                                                    <ItemTemplate>
                                                            <asp:HiddenField runat="server" ID="chk_SelRamC" value="false"/>
                                                    </ItemTemplate>
                                                </asp:TemplateField >
                                                <asp:TemplateField HeaderText="Clave">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_ClaveRamC" Text='<%# Eval("Clave") %>' Width="80px" Font-Size="10px" ></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Descripción">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_Desc" Text='<%# Eval("Descripcion") %>' Width="280px" Font-Size="10px"></asp:Label>
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
                                        <asp:LinkButton id="btn_AddRamoContable" runat="server" class="btn botones AgregaRamoCont" data-toggle="modal" data-target="#EsperaModal">
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
                            Producto
                        </div>
                        <div class="panel-subcontenido">
                            <asp:UpdatePanel runat="server" ID="upProducto">
                                <ContentTemplate>
                                    <asp:Panel runat="server" ID="pnl_Producto" Width="100%" Height="130px" ScrollBars="Both">
                                        <asp:GridView runat="server" ID="gvd_Producto" AutoGenerateColumns="false"
                                                      CssClass="grid-view" HeaderStyle-CssClass="header" AlternatingRowStyle-CssClass="altern"
                                                      GridLines="Horizontal"  ShowHeaderWhenEmpty="true" >
                                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                            <Columns>
                                                <asp:TemplateField HeaderText="">
                                                    <ItemTemplate>
                                                            <asp:HiddenField runat="server" ID="chk_SelPro" value="false"/>
                                                    </ItemTemplate>
                                                </asp:TemplateField >
                                                <asp:TemplateField HeaderText="Clave">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_ClavePro" Text='<%# Eval("Clave") %>' Width="50px" Font-Size="10px" ></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Descripción">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_Desc" Text='<%# Eval("Descripcion") %>' Width="310px" Font-Size="10px"></asp:Label>
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
                                        <asp:LinkButton id="btn_AddProducto" runat="server" class="btn botones AgregaProducto" data-toggle="modal" data-target="#EsperaModal">
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

                <div class="row">
                     <div class="col-md-6">
                        <asp:UpdatePanel runat="server" ID="upFechasAdicional">
                            <ContentTemplate>
                             <table>
                                <tr>
                                    <td>
                                        <asp:label runat="server" class="col-md-1 etiqueta-control" Width="100px">Fec. Pago</asp:label>
                                        <asp:TextBox runat="server" ID="txtFecPagoDe" CssClass="form-control Fecha" Width="110px" Height="26px" ></asp:TextBox>  
                                    </td>
                                    <td>
                                        <asp:label runat="server" class="col-md-1 etiqueta-control" Width="38px">A</asp:label>
                                        <asp:TextBox runat="server" ID="txtFecPagoA" CssClass="form-control Fecha" Width="110px" Height="26px" ></asp:TextBox>
                                    </td>
                                </tr>
                             </table>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                     </div>
                     
                     <div class="col-md-6">
                         <asp:UpdatePanel runat="server" ID="upMoneda">
                            <ContentTemplate>
                             <asp:label runat="server" class="col-md-1 etiqueta-control" Width="130px">Moneda</asp:label>
                             <asp:DropDownList runat="server" ID="ddl_Moneda" CssClass="form-control" Width="302px" Height="26px"></asp:DropDownList>
                          </ContentTemplate>
                        </asp:UpdatePanel>
                     </div>
                </div>

                <div class="row">
                     <div class="col-md-6">
                         <asp:label runat="server" class="col-md-1 etiqueta-control" Width="120px">Cobranzas</asp:label>
                         <asp:RadioButtonList runat="server" ID="opt_Cobranzas" RepeatDirection="Vertical" CssClass="rbl etiqueta-control" Width="300px"  >
                            <asp:ListItem Text="Todos" Value="-1" Selected="True"/>
                            <asp:ListItem Text="Cobrados" value="1" />
                            <asp:ListItem Text="Compensados" value="2" />
                            <asp:ListItem Text="Parcial Cobrado" Value="3" />
                            <asp:ListItem Text="No Cobrados/No Compensados" Value="0" />
                            <asp:ListItem Text="Cancelados" Value="4" />
                            <%--<asp:ListItem Text="Primas en Deposito" Value="3" />--%>
                         </asp:RadioButtonList>
                     </div>
                     <div class="col-md-6">
                         <asp:label runat="server" class="col-md-1 etiqueta-control" Width="120px">Reaseguro</asp:label>
                         <asp:RadioButtonList runat="server" ID="opt_Estatus" RepeatDirection="Vertical" CssClass="rbl etiqueta-control" Width="300px" >
                            <asp:ListItem Text="Todos" Value="-1" Selected="True" />
                            <asp:ListItem Text="Pagados" value="1" />
                            <asp:ListItem Text="Pagados en Exceso" Value="2" />
                            <asp:ListItem Text="Saldo Pendiente" Value="0" />
                            <asp:ListItem Text="Solicitados" Value="3" />
                            <asp:ListItem Text="Recuperaciones" Value="4" />
                            <asp:ListItem Text="Temporales" Value="5" />
                         </asp:RadioButtonList>
                     </div>
                </div>


                
            </div>
        </div>
</asp:Content>

