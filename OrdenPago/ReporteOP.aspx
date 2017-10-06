<%@ Page Title="" Language="VB" MasterPageFile="~/Pages/SiteMaster.master" AutoEventWireup="false" CodeFile="ReporteOP.aspx.vb" Inherits="OrdenPago_ReporteOP" %>
<%@ MasterType VirtualPath="~/Pages/SiteMaster.master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="cph_principal" Runat="Server">
    <script src="../Scripts/FirmasElectronicas.js"></script>
    <asp:HiddenField runat="server" ID="hid_Ventanas" Value="0|0|1|1|1|1|1|1|" />

    <div style="width:1000px; min-width:1000px; overflow-x:hidden">
        <div class="cuadro-titulo panel-encabezado">
            <input type="image" src="../Images/contraer_mini_inv.png" id="coVentana0" class="contraer"  />
            <input type="image" src="../Images/expander_mini_inv.png"   id="exVentana0" class="expandir"  />
            Filtros
        </div>

        <div class="panel-contenido ventana0" >
            <asp:UpdatePanel runat="server" ID="upFiltros">
                <ContentTemplate>
                    <div class="row">
                        <div class="col-md-6">
                            <asp:label runat="server" class="col-md-1 etiqueta-control" Width="100px">Orden Pago</asp:label>
                            <asp:TextBox runat="server" ID="txt_NroOP" CssClass="estandar-control" Width="370px"></asp:TextBox>
                        </div>
                    </div>

                    <div class="clear padding5"></div>

                    <div class="row">
                        <div class="col-md-3">
                            <asp:label runat="server" class="col-md-1 etiqueta-control" Width="100px">Moneda</asp:label>
                            <asp:DropDownList runat="server" ID="ddl_Moneda" CssClass="estandar-control" Width="110px" ></asp:DropDownList>
                        </div>
                        <div class="col-md-3">
                            <asp:label runat="server" class="col-md-1 etiqueta-control" Width="85px">Asegurado</asp:label>
                            <asp:HiddenField runat="server" ID="hidClaveAse" Value="" />
                            <asp:textbox runat="server" ID="txtSearchAse" CssClass="estandar-control" Width="130px" ></asp:textbox>
                        </div>

                        <div class="col-md-3">
                            <asp:label runat="server" class="col-md-1 etiqueta-control" Width="100px">Fecha Genera</asp:label>
                            <asp:TextBox runat="server" ID="txtFecGeneraDe" CssClass="estandar-control Fecha Centro" Width="110px" ></asp:TextBox>
                        </div>
                        <div class="col-sm-1">
                            <asp:label runat="server" class="etiqueta-control">A</asp:label>
                        </div>
                        <div class="col-md-2">
                            <asp:TextBox runat="server" ID="txtFecGeneraA" CssClass="estandar-control Fecha Centro" Width="110px" ></asp:TextBox>
                        </div>
                    </div>

                    <div class="clear padding5"></div>

                    <div class="row">
                        <div class="col-md-3">
                            <asp:label runat="server" class="col-md-1 etiqueta-control" Width="100px">Monto</asp:label>
                            <asp:TextBox runat="server" ID="txt_MontoDe" CssClass="estandar-control Monto Derecha" Width="110px" ></asp:TextBox>
                        </div>
                        <div class="col-sm-1">
                            <asp:label runat="server" class="etiqueta-control">A</asp:label>
                        </div>
                        <div class="col-md-2">
                            <asp:TextBox runat="server" ID="txt_MontoA" CssClass="estandar-control Monto Derecha" Width="130px" ></asp:TextBox>
                        </div>
                        <div class="col-md-3">
                            <asp:label runat="server" class="col-md-1 etiqueta-control" Width="100px">Fecha Pago</asp:label>
                            <asp:TextBox runat="server" ID="txtFecPagoDe" CssClass="estandar-control Fecha Centro" Width="110px" ></asp:TextBox>
                        </div>
                        <div class="col-sm-1">
                            <asp:label runat="server" class="etiqueta-control">A</asp:label>
                        </div>
                        <div class="col-md-2">
                            <asp:TextBox runat="server" ID="txtFecPagoA" CssClass="estandar-control Fecha Centro" Width="110px" ></asp:TextBox>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>

            <div class="clear padding5"></div>

            <div class="row">
                <div class="col-md-6">
                    <div class="cuadro-subtitulo">
                        <input type="image" src="../Images/contraer_mini.png" id="coVentana2" class="contraer"  />
                        <input type="image" src="../Images/expander_mini.png"   id="exVentana2" class="expandir"  />
                        Usuario Solicitante
                    </div>
                    <div class="panel-subcontenido ventana2">
                        <asp:UpdatePanel runat="server" ID="upSolicitante">
                           <ContentTemplate>
                               <asp:Panel runat="server" ID="pnlUsuario" Width="100%" Height="100px" ScrollBars="Both">
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
                        <input type="image" src="../Images/contraer_mini.png" id="coVentana3" class="contraer"  />
                        <input type="image" src="../Images/expander_mini.png"   id="exVentana3" class="expandir"  />
                        Estatus Orden Pago
                    </div>
                    <div class="panel-subcontenido ventana3">
                        <asp:UpdatePanel runat="server" ID="upEstatus">
                           <ContentTemplate>
                               <asp:Panel runat="server" ID="pnlEstatus" Width="100%" Height="100px" ScrollBars="Both">
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
            <div class="clear padding5"></div>
            <div class="row">
                <div class="col-md-6">
                    <div class="cuadro-subtitulo">
                        <input type="image" src="../Images/contraer_mini.png" id="coVentana4" class="contraer"  />
                        <input type="image" src="../Images/expander_mini.png"   id="exVentana4" class="expandir"  />
                        Broker
                    </div>
                    <div class="panel-subcontenido ventana4">
                            <asp:UpdatePanel runat="server" ID="upBroker">
                                <ContentTemplate>
                                    <asp:Panel runat="server" ID="pnlBroker" Width="100%" Height="100px" ScrollBars="Both">
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
                                                            <asp:Label runat="server" ID="lbl_ClaveBro" Text='<%# Eval("Clave") %>' Width="50px"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Descripción">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" ID="lbl_Desc" Text='<%# Eval("Descripcion") %>' Width="360px"></asp:Label>
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
                        <input type="image" src="../Images/contraer_mini.png" id="coVentana5" class="contraer"  />
                        <input type="image" src="../Images/expander_mini.png"   id="exVentana5" class="expandir"  />
                        Reasegurador
                    </div>
                    <div class="panel-subcontenido ventana5">
                            <asp:UpdatePanel runat="server" ID="upCompañia">
                                <ContentTemplate>
                                    <asp:Panel runat="server" ID="pnlCompañia" Width="100%" Height="100px" ScrollBars="Both">
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
                                                            <asp:Label runat="server" ID="lbl_ClaveCia" Text='<%# Eval("Clave") %>' Width="50px" ></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Descripción" ItemStyle-CssClass="DescripcionCia">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" ID="lbl_Desc" Text='<%# Eval("Descripcion") %>' Width="360px"></asp:Label>
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
            <div class="clear padding5"></div>
            <div class="row">
                <div class="col-md-6">
                    <div class="cuadro-subtitulo">
                        <input type="image" src="../Images/contraer_mini.png" id="coVentana6" class="contraer"  />
                        <input type="image" src="../Images/expander_mini.png"   id="exVentana6" class="expandir"  />
                        Póliza
                    </div>
                    <div class="panel-subcontenido ventana6">
                            <asp:UpdatePanel runat="server" ID="upPoliza">
                                <ContentTemplate>
                                    <asp:HiddenField runat="server" ID="hid_HTML" Value="" />
                                    <div class="clear padding5"></div>

                                    <asp:Panel runat="server" ID="pnlPoliza" Width="100%" Height="100px" ScrollBars="Both">
                                            <asp:GridView runat="server" ID="gvd_Poliza" AutoGenerateColumns="false" 
                                                            CssClass="grid-view" HeaderStyle-CssClass="header" AlternatingRowStyle-CssClass="altern"
                                                            GridLines="Horizontal"  ShowHeaderWhenEmpty="true" >
                                                <Columns>
                                                    <asp:TemplateField HeaderText="">
                                                        <ItemTemplate>
                                                            <asp:HiddenField runat="server" ID="chk_SelPol" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Clave">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" ID="lbl_ClavePol" Text='<%# Eval("Clave") %>' Width="100px"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Grupo Endoso">
                                                        <ItemTemplate>
                                                            <asp:label runat="server" ID="lbl_DescripcionPol" Enabled="false" Text='<%# Eval("Descripcion")   %>' Width="310px"></asp:label>
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
                                            <asp:LinkButton id="btn_AddPol" runat="server" class="btn botones">
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
                        <input type="image" src="../Images/contraer_mini.png" id="coVentana7" class="contraer"  />
                        <input type="image" src="../Images/expander_mini.png"   id="exVentana7" class="expandir"  />
                        Ramo Contable
                    </div>
                    <div class="panel-subcontenido ventana7">
                            <asp:UpdatePanel runat="server" ID="upRamoContable">
                            <ContentTemplate>
                                    <asp:Panel runat="server" ID="pn_RamoContable" Width="100%" Height="100px" ScrollBars="Both">
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
                                                    <asp:Label runat="server" ID="lbl_ClaveRamC" Text='<%# Eval("Clave") %>' Width="50px"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Descripción">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="lbl_Desc" Text='<%# Eval("Descripcion") %>' Width="360px"></asp:Label>
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
            </div>

            <div class="clear padding5"></div>
            
            <div class="row">
                <div class="col-md-12">
                    <div class="cuadro-subtitulo">
                        Naturaleza de Orden de Pago
                    </div>
                    <div class="panel-subcontenido">
                        <asp:UpdatePanel ID="upNaturaleza" runat="server">
                            <ContentTemplate>

                                <div class="col-md-4">
                                    <asp:CheckBox runat="server" ID="chk_Devolucion" Text="Devolución de Impuestos a Reasegurador" CssClass="etiqueta-control" />
                                </div>
                                <div class="col-md-4">
                                    <asp:CheckBox runat="server" ID="chk_ConISR" Text="Con Retención de Impuestos a Reasegurador" CssClass="etiqueta-control" />
                                </div>
                                <div class="col-md-4">
                                    <asp:CheckBox runat="server" ID="chk_SinISR" Text="Sin Retención de Impuestos a Reasegurador" CssClass="etiqueta-control" />
                                </div>

                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>
        </div>


        <div class="clear padding5"></div>


        <div class="cuadro-titulo panel-encabezado">
            <input type="image" src="../Images/contraer_mini_inv.png" id="coVentana1" class="contraer"  />
            <input type="image" src="../Images/expander_mini_inv.png"   id="exVentana1" class="expandir"  />
            Campos de Consulta
        </div>

        <div class="panel-contenido ventana1" >

        </div>

        <div class="clear padding5"></div>

        <div style="width:100%; text-align:right; border-top-style:inset; border-width:1px; border-color:#003A5D">
            <asp:UpdatePanel runat="server" ID="upBusqueda">
                <ContentTemplate>
                    <asp:LinkButton id="btn_Reporte" runat="server" class="btn botones">
                        <span>
                            <img class="btn-buscar"/>
                            Reporte
                        </span>
                    </asp:LinkButton>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>

</asp:Content>



