<%@ Page Title="" Language="VB" MasterPageFile="~/Pages/SiteMaster.master" AutoEventWireup="false" CodeFile="Contrato.aspx.vb" Inherits="OrdenPago_Contrato" %>
<%@ MasterType VirtualPath="~/Pages/SiteMaster.master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="cph_principal" Runat="Server">
    <script src="../Scripts/Facultativos.js"></script>

    <script type="text/javascript"> 
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(PageLoadFacultativos);
    </script> 

    <asp:HiddenField runat="server" ID="hid_Ventanas" Value="1|1|0|0|" />

    <div style="width:1100px; min-width:1000px; overflow-x:hidden">
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
            </div>

            <div class="clear padding10"></div>

            <%-----------------------------------Sección 2----------------------------------------------------------------------------------------------------%>
            <div class="cuadro-titulo panel-encabezado">
                <input type="image" src="../Images/contraer_mini_inv.png" id="coVentana1" class="contraer"  />
                <input type="image" src="../Images/expander_mini_inv.png"   id="exVentana1" class="expandir"  />
                <strong>Filtro Contratos / Ramo Contable</strong>
            </div>
            <div class="panel-contenido ventana1" >
                <div class="row">
                    <div class="col-md-6">
                        <div class="cuadro-subtitulo">
                            Contratos
                        </div>
                        <div class="panel-subcontenido">
                            <asp:UpdatePanel runat="server" ID="upFechas">
                            <ContentTemplate>

                                    <table>
                                        <tr>
                                            <td>
                                                <asp:label runat="server" class="col-md-1 etiqueta-control" Width="100px">Fecha Desde:</asp:label>
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
                                                <asp:TemplateField HeaderText="">
                                                    <ItemTemplate>
                                                        <asp:HiddenField runat="server" ID="chk_SelFac" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Clave">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_ClaveFac" Text='<%# Eval("Clave") %>' Width="60px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Descripción" ItemStyle-CssClass="DescripcionCia">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_Desc" Text='<%# Eval("Descripcion") %>' Width="350px"></asp:Label>
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
                            Ramos Contables
                        </div>
                        <div class="panel-subcontenido">
                                <asp:UpdatePanel runat="server" ID="upPoliza">
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
            </div>

            <div class="clear padding5"></div>

            <div style="width:100%; text-align:right; border-top-style:inset; border-width:1px; border-color:#003A5D">
                <asp:UpdatePanel runat="server" ID="upBusqueda">
                    <ContentTemplate>
                        <asp:LinkButton id="btn_Buscar" runat="server" class="btn botones">
                            <span>
                                <img class="btn-buscar"/>
                                Consulta
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
                <input type="image" src="../Images/contraer_mini_inv.png" id="coVentana2" class="contraer"  />
                <input type="image" src="../Images/expander_mini_inv.png"   id="exVentana2" class="expandir"  />
                Listado Saldos
            </div>

            <div class="panel-contenido ventana2" >
                <asp:UpdatePanel runat="server" ID="upSaldos">
                  <ContentTemplate>
                      <div class="row">
                          <div class="col-md-6">
                              <div class="cuadro-subtitulo-grid">
                                MONEDA NACIONAL
                              </div>           
                              <asp:Panel runat="server" id="pnlSaldosNac" width="100%">
                                  <asp:GridView runat="server" ID="gvd_SaldosNac" AutoGenerateColumns="false"  ShowHeader="false"
                                                CssClass ="grid-view" BackColor="White"
                                                GridLines="None"  ShowHeaderWhenEmpty="true" AllowPaging="true" PageSize="10" 
                                                DataKeyNames="">
                                        <Columns>
                                            <asp:TemplateField HeaderText="" >
                                                <ItemTemplate>        
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="" >
                                                <ItemTemplate>        
                                                    <div class="clear padding3" style="background-color:white; width:100%;"></div>                                                  
                                                    <div id="div_Nacional" class="cuadro-postit Seleccion" style="height:40px;width:530px;">
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <asp:TextBox runat="server" ID="txt_SelNac" CssClass="NoDisplay" Text="0"></asp:TextBox>
                                                                <label class="etiqueta">Int:</label> <asp:Label runat="server" Text='<%# Mid(Eval("broker"), 1, 30) %>' Height="18px" Width="160px"></asp:Label> 
                                                                <label class="etiqueta">Rea:</label>  <asp:Label runat="server" Text='<%# Mid(Eval("compañia"), 1, 30) %>' Height="18px" Width="160px"></asp:Label> 
                                                                <label class="etiqueta">Ctr:</label>  <asp:Label runat="server" Text='<%# Eval("id_contrato") %>' Height="18px" Width="80px"></asp:Label> 

                                                               <%-- <input type="image" src="../Images/expander_mini.png" height="12" width="12" />
                                                                <input type="image" src="../Images/contraer_mini.png" height="12" width="12"  />--%>
                                                                

                                                                <label class="etiqueta">Ramo:</label>  <asp:Label runat="server" Text='<%# Eval("ramo_contable") %>' Height="18px" Width="160"></asp:Label> 
                                                                <label class="etiqueta">Cpto:</label>  <asp:Label runat="server" Text='<%# Mid(Eval("concepto"), 1, 28) %>' Height="18px" Width="160px"></asp:Label> 
                                                                <label class="etiqueta">Imp:</label>  <asp:Label runat="server" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("importe")))  %>' CssClass="ImpNac" Height="18px" Width="80px"></asp:Label>
                                                                <asp:TextBox runat="server" ID="txt_ImpNac" CssClass="NoDisplay" Text='<%# Eval("importe") %>'></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <PagerStyle CssClass="pager" />
                                        <PagerSettings Mode="NumericFirstLast" FirstPageText="Primero" LastPageText="Ultimo" />
                                    </asp:GridView>
                                    <div class="clear padding5"></div>
                                    <div id="div_TotalNac" class="cuadro-postit-total" style="height:25px;width:530px;text-align:right;">
                                        <label>Saldo Total ($): </label> 
                                        <asp:Label ID="lbl_TotalNac" runat="server" Text="0.00"></asp:Label> 
                                    </div>
                                    <div id="div_TotalSelNac" class="cuadro-postit-total" style="height:25px;width:530px;text-align:right;">
                                        <label>Total Seleccionado ($): </label> 
                                        <asp:Label ID="lbl_TotalSelNac" CssClass="TotalNac" runat="server" Text="0.00"></asp:Label> 
                                        <asp:TextBox runat="server" ID="txt_TotalNac" CssClass="NoDisplay" Text="0.00"></asp:TextBox>
                                    </div>
                                    
                              </asp:Panel>
                          </div>
                          <div class="col-md-6">
                              <div class="cuadro-subtitulo-grid">
                                MONEDA DOLARES
                              </div> 
                              <asp:Panel runat="server" id="pnlSaldosDll" width="100%">
                                  <asp:GridView runat="server" ID="gvd_SaldosDll" AutoGenerateColumns="false"  ShowHeader="false"
                                                CssClass ="grid-view"  BackColor="White"
                                                GridLines="None"  ShowHeaderWhenEmpty="true" AllowPaging="true" PageSize="10" 
                                                DataKeyNames="">
                                        <Columns>
                                            <asp:TemplateField HeaderText="" >
                                                <ItemTemplate>        
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="" >
                                                <ItemTemplate>        
                                                    <div class="clear padding3" style="background-color:white; width:100%;"></div>                                                  
                                                    <div id="div_Dolares" class="cuadro-postit Seleccion" style="height:40px;width:530px;">
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <asp:TextBox runat="server" ID="txt_SelDll" CssClass="NoDisplay" Text="0"></asp:TextBox>
                                                                <label class="etiqueta">Int:</label> <asp:Label runat="server" Text='<%# Mid(Eval("broker"), 1, 30) %>' Height="18px" Width="160px"></asp:Label> 
                                                                <label class="etiqueta">Rea:</label>  <asp:Label runat="server" Text='<%# Mid(Eval("compañia"), 1, 30) %>' Height="18px" Width="160px"></asp:Label> 
                                                                <label class="etiqueta">Ctr:</label>  <asp:Label runat="server" Text='<%# Eval("id_contrato") %>' Height="18px" Width="80px"></asp:Label> 
                                                                

                                                                <label class="etiqueta">Ramo:</label>  <asp:Label runat="server" Text='<%# Eval("ramo_contable") %>' Height="18px" Width="160"></asp:Label> 
                                                                <label class="etiqueta">Cpto:</label>  <asp:Label runat="server" Text='<%# Mid(Eval("concepto"), 1, 28) %>' Height="18px" Width="160px"></asp:Label> 
                                                                <label class="etiqueta">Imp:</label>  <asp:Label runat="server" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("importe")))  %>' CssClass="ImpDll" Height="18px" Width="80px"></asp:Label>
                                                                <asp:TextBox runat="server" ID="txt_ImpDll" CssClass="NoDisplay" Text='<%# Eval("importe") %>'></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            
                                        </Columns>
                                        <PagerStyle CssClass="pager" />
                                        <PagerSettings Mode="NumericFirstLast" FirstPageText="Primero" LastPageText="Ultimo" />
                                    </asp:GridView>
                                    <div class="clear padding5"></div>
                                    <div id="div_TotalDll" class="cuadro-postit-total" style="height:25px;width:530px;text-align:right;">
                                        <label>Saldo Total (US$): </label> 
                                        <asp:Label ID="lbl_TotalDll" runat="server" Text="0.00"></asp:Label> 
                                    </div>
                                    <div id="div_TotalSelDll" class="cuadro-postit-total" style="height:25px;width:530px;text-align:right;">
                                        <label>Total Seleccionado (US$): </label> 
                                        <asp:Label ID="lbl_TotalSelDll" CssClass="TotalDll" runat="server" Text="0.00"></asp:Label> 
                                        <asp:TextBox runat="server" ID="txt_TotalDll" CssClass="NoDisplay" Text="0.00"></asp:TextBox>
                                    </div>
                              </asp:Panel>
                          </div>
                      </div>
                  </ContentTemplate>
                </asp:UpdatePanel>
            </div>
    </div>
    <div class="clear padding5"></div>

    <div style="width:100%; text-align:right; border-top-style:inset; border-width:1px; border-color:#003A5D">
        <asp:UpdatePanel runat="server" ID="upAgrega">
            <ContentTemplate>
                <asp:LinkButton id="btn_Resumen" runat="server" class="btn botones VerResumen">
                    <span>
                        <img class="btn-monitor"/>
                        Resumen
                    </span>
                </asp:LinkButton>
                <asp:LinkButton id="btn_Agregar" runat="server" class="btn botones">
                    <span>
                        <img class="btn-añadir"/>
                        Agregar
                    </span>
                </asp:LinkButton>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>

    <div id="Resumen" style="width:1100px;" class="modal-simple" >
        <asp:UpdatePanel runat="server" ID="upResumen" >
            <ContentTemplate>
                <div class="cuadro-titulo" style="height:30px">
                    <div class="row" >
                        <div class="col-md-1">
                            <input type="image" src="../Images/contraer_mini_inv.png" id="coVentana3" class="contraer"  />
                            <input type="image" src="../Images/expander_mini_inv.png"   id="exVentana3" class="expandir"  />
                        </div>
                        <div class="col-md-10">
                            Resumen Saldos
                        </div>
                        <div class="col-md-1">
                            <button type="button" class="close" onclick="fn_CerrarModalSimple('#Resumen');">&times;</button>
                        </div>
                    </div>
                </div>


                <div class="panel-subcontenido ventana3">
                     <div class="row" >
                        <div class="col-md-6">
                            <div class="cuadro-subtitulo-grid">
                                MONEDA NACIONAL
                            </div> 
                            <asp:Panel runat="server" ID="pnl_ResumenNac" Width="100%" Height="450px" ScrollBars="Vertical">
                                <asp:GridView runat="server" ID="gvd_ResumenNac" AutoGenerateColumns="false" 
                                                CssClass="grid-view" HeaderStyle-CssClass="header" AlternatingRowStyle-CssClass="altern"
                                                GridLines="Horizontal"  ShowHeaderWhenEmpty="true">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Sucursal">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="lbl_Sucursal" Text='<%# Eval("sucursal") %>' Width="80px" ></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Intermediario">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="lbl_Intermediario" Text='<%# Eval("broker") %>' Width="150px" ></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Reasegurador">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="lbl_Reasegurador" Text='<%# Eval("reasegurador") %>' Width="150px" ></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Concepto">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="lbl_Concepto" Text='<%# Eval("concepto") %>' Width="100px" ></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Contrato">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="lbl_Contrato" Text='<%# Eval("id_contrato") %>' Width="80px" ></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Ramo Contable">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="lbl_RamoContable" Text='<%# Eval("ramo_contable") %>' Width="100px" ></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                
                                    </Columns>
                                </asp:GridView>
                            </asp:Panel> 
                        </div>
                        <div class="col-md-6">
                            <div class="cuadro-subtitulo-grid">
                                MONEDA DOLARES
                            </div> 
                            <asp:Panel runat="server" ID="pnl_ResumenDll" Width="100%" Height="450px" ScrollBars="Vertical">
                                <asp:GridView runat="server" ID="gvd_ResumenDll" AutoGenerateColumns="false" 
                                                CssClass="grid-view" HeaderStyle-CssClass="header" AlternatingRowStyle-CssClass="altern"
                                                GridLines="Horizontal"  ShowHeaderWhenEmpty="true">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Sucursal">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="lbl_Sucursal" Text='<%# Eval("sucursal") %>' Width="80px" ></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Intermediario">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="lbl_Intermediario" Text='<%# Eval("broker") %>' Width="150px" ></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Reasegurador">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="lbl_Reasegurador" Text='<%# Eval("reasegurador") %>' Width="150px" ></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Concepto">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="lbl_Concepto" Text='<%# Eval("concepto") %>' Width="100px" ></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Contrato">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="lbl_Contrato" Text='<%# Eval("id_contrato") %>' Width="80px" ></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Ramo Contable">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="lbl_RamoContable" Text='<%# Eval("ramo_contable") %>' Width="100px" ></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                
                                    </Columns>
                                </asp:GridView>
                            </asp:Panel> 
                        </div>
                     </div>

                    

                    <div class="clear padding5"></div>
                    
                    <div style="width:100%;  text-align:right">
                        <asp:LinkButton id="btn_Guardar" runat="server" class="btn botones">
                            <span>
                                <img class="btn-guardar"/>
                                Guardar
                            </span>
                        </asp:LinkButton>
                        <asp:LinkButton id="btn_Generar" runat="server" class="btn botones">
                            <span>
                                <img class="btn-modificar"/>
                                Generar
                            </span>
                        </asp:LinkButton>
                    </div>

                    <div class="clear padding5"></div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>

    <div class="clear padding100"></div> 
</asp:Content>

