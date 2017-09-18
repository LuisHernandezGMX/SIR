<%@ Page Title="" Language="VB" MasterPageFile="~/Pages/SiteMaster.master" AutoEventWireup="false" CodeFile="Contrato.aspx.vb" Inherits="OrdenPago_Contrato" %>
<%@ MasterType VirtualPath="~/Pages/SiteMaster.master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="cph_principal" Runat="Server">
    <script src="../Scripts/Facultativos.js"></script>

    <asp:HiddenField runat="server" ID="hid_Ventanas" Value="1|1|1|1|" />

    <div style="width:1000px; min-width:1000px; overflow-x:hidden">
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
                                                CssClass ="grid-view" AlternatingRowStyle-CssClass="altern"
                                                GridLines="None"  ShowHeaderWhenEmpty="true" AllowPaging="true" PageSize="10" 
                                                DataKeyNames="">
                                        <Columns>

                                            <asp:TemplateField HeaderText="" >
                                                <ItemTemplate>        
                                                    <div class="clear padding5" style="background-color:white; width:100%;"></div>                                                  
                                                    <div id="div_Nacional" class="cuadro-postit" style="height:60px;width:480px;">
                                                        <div class="row">
                                                            <div class="col-md-1">
                                                                <asp:CheckBox runat="server" ID="chk_Sel" Checked='<%# Eval("tSEl_Val") %>' AutoPostBack="true"/> 
                                                            </div>
                                                            <div class="col-md-11">
                                                                <label class="etiqueta">Broker:</label> <asp:Label runat="server" Text='<%# Mid(Eval("broker"), 1, 28) %>' Height="18px" Width="150px"></asp:Label> 
                                                                <label class="etiqueta">Compañia:</label>  <asp:Label runat="server" Text='<%# Mid(Eval("compañia"), 1, 28) %>' Height="18px" Width="150px"></asp:Label> 
                                                                <label class="etiqueta">Contrato:</label>  <asp:Label runat="server" Text='<%# Eval("id_contrato") %>' Height="18px" Width="150px"></asp:Label> 
                                                                <label class="etiqueta">Ramo:</label>  <asp:Label runat="server" Text='<%# Eval("ramo_contable") %>' Height="18px" Width="150px"></asp:Label> 
                                                                <label class="etiqueta">Concepto:</label>  <asp:Label runat="server" Text='<%# Mid(Eval("concepto"), 1, 28) %>' Height="18px" Width="150px"></asp:Label> 
                                                                <label class="etiqueta">Importe:</label>  <asp:Label runat="server" Text='<%# Eval("importe") %>' Height="18px" Width="150px"></asp:Label> 
                                                            </div>
                                                        </div>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            
                                        </Columns>
                                        <PagerStyle CssClass="pager" />
                                        <PagerSettings Mode="NumericFirstLast" FirstPageText="Primero" LastPageText="Ultimo" />
                                    </asp:GridView>
                              </asp:Panel>
                          </div>
                          <div class="col-md-6">
                              <div class="cuadro-subtitulo-grid">
                                MONEDA DOLARES
                              </div> 
                              <asp:Panel runat="server" id="pnlSaldosDll" width="100%">
                                  <asp:GridView runat="server" ID="gvd_SaldosDll" AutoGenerateColumns="false"  ShowHeader="false"
                                                CssClass ="grid-view" AlternatingRowStyle-CssClass="altern"
                                                GridLines="None"  ShowHeaderWhenEmpty="true" AllowPaging="true" PageSize="10" 
                                                DataKeyNames="">
                                        <Columns>

                                            <asp:TemplateField HeaderText="" >
                                                <ItemTemplate>        
                                                    <div class="clear padding5" style="background-color:white; width:100%;"></div>                                                  
                                                    <div id="div_Dolares" class="cuadro-postit" style="height:60px;width:480px;">
                                                        <div class="row">
                                                            <div class="col-md-1">
                                                                <asp:CheckBox runat="server" ID="chk_Sel" Checked='<%# Eval("tSEl_Val") %>' AutoPostBack="true"/> 
                                                            </div>
                                                            <div class="col-md-11">
                                                                <label class="etiqueta">Broker:</label> <asp:Label runat="server" Text='<%# Mid(Eval("broker"), 1, 28) %>' Height="18px" Width="150px"></asp:Label> 
                                                                <label class="etiqueta">Compañia:</label>  <asp:Label runat="server" Text='<%# Mid(Eval("compañia"), 1, 28) %>' Height="18px" Width="150px"></asp:Label> 
                                                                <label class="etiqueta">Contrato:</label>  <asp:Label runat="server" Text='<%# Eval("id_contrato") %>' Height="18px" Width="150px"></asp:Label> 
                                                                <label class="etiqueta">Ramo:</label>  <asp:Label runat="server" Text='<%# Eval("ramo_contable") %>' Height="18px" Width="150px"></asp:Label> 
                                                                <label class="etiqueta">Concepto:</label>  <asp:Label runat="server" Text='<%# Mid(Eval("concepto"), 1, 28) %>' Height="18px" Width="150px"></asp:Label> 
                                                                <label class="etiqueta">Importe:</label>  <asp:Label runat="server" Text='<%# Eval("importe") %>' Height="18px" Width="150px"></asp:Label> 
                                                            </div>
                                                        </div>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            
                                        </Columns>
                                        <PagerStyle CssClass="pager" />
                                        <PagerSettings Mode="NumericFirstLast" FirstPageText="Primero" LastPageText="Ultimo" />
                                    </asp:GridView>
                              </asp:Panel>
                          </div>
                      </div>
                  </ContentTemplate>
                </asp:UpdatePanel>
            </div>
    </div>
    <div class="clear padding100"></div> 
</asp:Content>

