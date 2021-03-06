﻿<%@ Page Title="Coaseguro Líder" Language="VB" MasterPageFile="~/Pages/SiteMaster.master" AutoEventWireup="false" CodeFile="CoaseguroLider.aspx.vb" Inherits="Emision_Coaseguro" %>
<%@ MasterType VirtualPath="~/Pages/SiteMaster.master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="cph_principal" runat="server">
    <div class="zona-principal small" style="overflow-x:hidden;overflow-y:hidden">
        <div class="row">
            <div class="col-sm-7">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="cuadro-titulo">
                            <%--<input type="image" src="../Images/contraer_mini_inv.png" id="coVentana1" class="contraer"  />
                            <input type="image" src="../Images/expander_mini_inv.png" id="exVentana1" class="expandir"  />--%>
                            <asp:Label runat="server" Text="CARACTERÍSTICAS DEL COASEGURO" Width="50%"></asp:Label>
                        </div>
                        <div class="ventana1">
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="padding10"></div>
                                    <div class="form-group">
                                        <label class="col-sm-6 etiqueta-control">TIPO DE COASEGURO</label>
                                        <label class="col-sm-6">LÍDER</label>
                                    </div>
                                    <div class="padding10"></div>
                                    <div class="form-group">
                                        <label class="col-sm-6 etiqueta-control">Límite máximo de responsabilidad al 100%</label>
                                        <label class="col-sm-6">$ 1,000,000.00</label>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-1"></div>
                                <div class="col-sm-10">
                                    <div class="cuadro-titulo">
                                        <%--<input type="image" src="../Images/contraer_mini_inv.png" id="coVentana2" class="contraer"  />
                                        <input type="image" src="../Images/expander_mini_inv.png" id="exVentana2" class="expandir"  />--%>
                                        <asp:Label runat="server" Text="GMX SEGUROS" Width="50%"></asp:Label>
                                    </div>
                                    <div class="ventana2">
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <div class="table-responsive">
                                                    <table class="table">
                                                        <thead>
                                                            <tr>
                                                                <th></th>
                                                                <th class="etiqueta-control">% participación</th>
                                                                <th class="etiqueta-control">Monto de participación</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr>
                                                                <td>GRUPO MEXICANO DE SEGUROS, S.A. de C.V.</td>
                                                                <td>70%</td>
                                                                <td>
                                                                    <span>$</span>
                                                                    <span class="pull-right">700,000.00</span>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-1"></div>
                            </div>
                            <div class="row">
                                <div class="padding20"></div>
                                <div class="col-sm-1"></div>
                                <div class="col-sm-10">
                                    <div class="cuadro-titulo">
                                        <%--<input type="image" src="../Images/contraer_mini_inv.png" id="coVentana3" class="contraer"  />
                                        <input type="image" src="../Images/expander_mini_inv.png" id="exVentana3" class="expandir"  />--%>
                                        <asp:Label runat="server" Text="COASEGURADORAS" Width="50%"></asp:Label>
                                    </div>
                                    <div class="ventana3">
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <div class="table-responsive">
                                                    <table class="table">
                                                        <thead>
                                                            <tr>
                                                                <th class="etiqueta-control">Compañías participantes</th>
                                                                <th class="etiqueta-control">% participación</th>
                                                                <th class="etiqueta-control">Monto de participación</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr>
                                                                <td>CHUBB DE MÉXICO, COMPAÑÍA DE SEGUROS</td>
                                                                <td>10%</td>
                                                                <td>
                                                                    <span>$</span>
                                                                    <span class="pull-right">100,000.00</span>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>EL ÁGUILA COMPAÑÍA DE SEGUROS, S.A.</td>
                                                                <td>5%</td>
                                                                <td>
                                                                    <span>$</span>
                                                                    <span class="pull-right">50,000.00</span>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>ACE SEGUROS, S.A.</td>
                                                                <td>5%</td>
                                                                <td>
                                                                    <span>$</span>
                                                                    <span class="pull-right">50,000.00</span>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>GENERAL DE SEGUROS, S.A.B.</td>
                                                                <td>10%</td>
                                                                <td>
                                                                    <span>$</span>
                                                                    <span class="pull-right">100,000.00</span>
                                                                </td>
                                                            </tr>
                                                            <tr></tr>
                                                            <tr>
                                                                <td class="etiqueta-control">
                                                                    <strong>TOTAL DE LA PARTICIPACIÓN</strong>
                                                                </td>
                                                                <td class="etiqueta-control">
                                                                    <strong>30%</strong>
                                                                </td>
                                                                <td class="etiqueta-control">
                                                                    <strong>
                                                                        <span>$</span>
                                                                        <span class="pull-right">300,000.00</span>
                                                                    </strong>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-1"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <div class="cuadro-titulo">
                            <%--<input type="image" src="../Images/contraer_mini_inv.png" id="coVentana4" class="contraer"  />
                            <input type="image" src="../Images/expander_mini_inv.png" id="exVentana4" class="expandir"  />--%>
                            <asp:Label runat="server" Text="Fee por administración" Width="50%"></asp:Label>
                        </div>
                        <div class="ventana4">
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th></th>
                                                    <th></th>
                                                    <th class="etiqueta-control">Monto total a comisión de cobro</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>CHUBB DE MÉXICO, COMPAÑÍA DE SEGUROS</td>
                                                    <td>
                                                        <input type="text" class="estandar-control Tablero txtPorcentajeFee" style="width:40%" placeholder="%" data-monto="100000" />
                                                    </td>
                                                    <td class="monto-comision-td">
                                                        <span>$</span>
                                                        <span class="pull-right monto-comision">0.00</span>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>EL ÁGUILA COMPAÑÍA DE SEGUROS, S.A.</td>
                                                    <td>
                                                        <input type="text" class="estandar-control Tablero txtPorcentajeFee" style="width:40%" placeholder="%" data-monto="50000" />
                                                    </td>
                                                    <td class="monto-comision-td">
                                                        <span>$</span>
                                                        <span class="pull-right monto-comision">0.00</span>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>ACE SEGUROS, S.A.</td>
                                                    <td>
                                                        <input type="text" class="estandar-control Tablero txtPorcentajeFee" style="width:40%" placeholder="%" data-monto="50000" />
                                                    </td>
                                                    <td class="monto-comision-td">
                                                        <span>$</span>
                                                        <span class="pull-right monto-comision">0.00</span>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>GENERAL DE SEGUROS, S.A.B.</td>
                                                    <td>
                                                        <input type="text" class="estandar-control Tablero txtPorcentajeFee" style="width:40%" placeholder="%" data-monto="100000" />
                                                    </td>
                                                    <td class="monto-comision-td">
                                                        <span>$</span>
                                                        <span class="pull-right monto-comision">0.00</span>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-5">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="cuadro-titulo">
                            <%--<input type="image" src="../Images/contraer_mini_inv.png" id="coVentana5" class="contraer"  />
                            <input type="image" src="../Images/expander_mini_inv.png" id="exVentana5" class="expandir"  />--%>
                            <asp:Label runat="server" Text="Método de Pago" Width="50%"></asp:Label>
                        </div>
                        <div class="ventana5">
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="form-inline">
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <p>
                                                    <input type="radio" name="metodoPago" checked />
                                                    Estado de Cuenta
                                                </p>
                                            </div>
                                            <div class="col-sm-6">
                                                <p>
                                                    <input type="radio" name="metodoPago" />
                                                    Por conceptos
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <div class="cuadro-titulo">
                            <%--<input type="image" src="../Images/contraer_mini_inv.png" id="coVentana6" class="contraer"  />
                            <input type="image" src="../Images/expander_mini_inv.png" id="exVentana6" class="expandir"  />--%>
                            <asp:Label runat="server" Text="Pago de comisión al agente" Width="50%"></asp:Label>
                        </div>
                        <div class="ventana6">
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="form-inline">
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <p>
                                                    <input type="radio" name="pagoComisionAgente" checked />
                                                    Líder al 100%
                                                </p>
                                            </div>
                                            <div class="col-sm-6">
                                                <p>
                                                    <input type="radio" name="pagoComisionAgente" />
                                                    Pago a participación
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <div class="cuadro-titulo">
                            <%--<input type="image" src="../Images/contraer_mini_inv.png" id="coVentana7" class="contraer"  />
                            <input type="image" src="../Images/expander_mini_inv.png" id="exVentana7" class="expandir"  />--%>
                            <asp:Label runat="server" Text="Siniestros" Width="50%"></asp:Label>
                        </div>
                        <div class="ventana7">
                            <div class="row">
                                <div class="col-sm-12">
                                    <p>
                                        <input type="radio" name="siniestros" id="rdbSiniestro100" checked />
                                        Pago del siniestro al 100%
                                    </p>
                                    <p>
                                        <input type="radio" name="siniestros" id="rdbSiniestroParticipacion" />
                                        Pago del siniestro a participación
                                    </p>
                                    <div class="table-responsive">
                                        <table class="table">
                                            <tbody>
                                                <tr>
                                                    <td>Monto máximo para pago automático de siniestro</td>
                                                    <td>
                                                        <input type="text" id="txtPagoAutomaticoSiniestro" class="estandar-control Tablero" style="width:40%" placeholder="%" data-monto="1000000" disabled />
                                                    </td>
                                                    <td>
                                                        <span>$</span>
                                                        <span id="montoMaximoSiniestro" class="pull-right">0.00</span>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <div class="cuadro-titulo">
                            <%--<input type="image" src="../Images/contraer_mini_inv.png" id="coVentana8" class="contraer"  />
                            <input type="image" src="../Images/expander_mini_inv.png" id="exVentana8" class="expandir"  />--%>
                            <asp:Label runat="server" Text="Garantía de pago" Width="50%"></asp:Label>
                        </div>
                        <div id="ventana8">
                            <p>
                                <input type="radio" name="garantiaPago" checked />
                                De acuerdo a la Ley sobre el Contrato de Seguro
                            </p>
                            <p>
                                <input type="radio" name="garantiaPago" />
                                Otro (especificar): ____________________
                            </p>
                        </div>
                    </div>
                </div>
                <div class="padding40"></div>
                <div class="row">
                    <div class="col-sm-4">
                        <asp:LinkButton id="btnSiguiente" runat="server" class="btn botones">
                            <span>
                                <img class="btn-aceptar"/>
                                Siguiente
                            </span>
                        </asp:LinkButton>
                    </div>
                    <div class="col-sm-4">
                        <asp:LinkButton id="btnAtras" runat="server" class="btn botones">
                            <span>
                                <img class="btn-quitar"/>
                                Atrás
                            </span>
                        </asp:LinkButton>
                    </div>
                    <div class="col-sm-4">
                        <asp:LinkButton id="btnSuspender" runat="server" class="btn botones">
                            <span>
                                <img class="btn-cancelar"/>
                                Suspender
                            </span>
                        </asp:LinkButton>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="../Scripts/Emision/CoaseguroComun.js"></script>
    <script src="../Scripts/Emision/Coaseguro.js"></script>
</asp:Content>