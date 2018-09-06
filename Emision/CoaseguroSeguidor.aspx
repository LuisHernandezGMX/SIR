<%@ Page Title="Coaseguro Seguidor" Language="VB" MasterPageFile="~/Pages/SiteMaster.master" AutoEventWireup="false" CodeFile="CoaseguroLider.aspx.vb" Inherits="Emision_Coaseguro" %>
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
                                        <label class="col-sm-6">NO LÍDER</label>
                                    </div>
                                    <div class="padding10"></div>
                                    <div class="form-inline">
                                        <div class="form-group">
                                            <label class="col-sm-6 etiqueta-control">Límite máximo de responsabilidad al 100%</label>
                                            <label class="col-sm-2">$</label>
                                            <input type="text" id="txtLimiteMaximoResponsabilidad" class="estandar-control Tablero col-sm-4" style="width:20%" placeholder="0.00" autofocus />
                                        </div>
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
                                                                <td>
                                                                    <input type="text" id="txtPorcentajeParticipacionGMX" class="estandar-control Tablero" style="width:80%" placeholder="0.00%" />
                                                                </td>
                                                                <td>
                                                                    <span>$</span>
                                                                    <span id="montoParticipacionGMX" class="pull-right" data-monto="0">0.00</span>
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
                                                        <tbody id="tbodyCoaseguradoras">
                                                            <tr id="trCoaseguradoraLider" class="trCoaseguradora">
                                                                <td>
                                                                    <strong>GRUPO NACIONAL PROVINCIAL, S.A.B.</strong>
                                                                </td>
                                                                <td id="porcentajeCoaseguradoraLider" class="porcentajeCoaseguradora" data-porcentaje="60">
                                                                    <strong>60.00%</strong>
                                                                </td>
                                                                <td>
                                                                    <strong>
                                                                        <span>$</span>
                                                                        <span id="montoCoaseguradoraLider" class="pull-right montoCoaseguradora" data-monto="0">0.00</span>
                                                                    </strong>
                                                                </td>
                                                            </tr>
                                                            <tr id="trTotalParticipacion">
                                                                <td class="etiqueta-control">
                                                                    <strong>TOTAL DE LA PARTICIPACIÓN</strong>
                                                                </td>
                                                                <td class="etiqueta-control">
                                                                    <strong id="porcentajeTotalCoaseguradoras" data-porcentaje="60">60%</strong>
                                                                </td>
                                                                <td class="etiqueta-control">
                                                                    <strong>
                                                                        <span>$</span>
                                                                        <span id="montoTotalCoaseguradoras" class="pull-right" data-monto="0">0.00</span>
                                                                    </strong>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="etiqueta-control">Aseguradoras Disponibles:</td>
                                                                <td colspan="2">
                                                                    <select id="dropdownCoaseguradoras" class="estandar-control"></select>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                                <a id="btnAgregarCoaseguradora" class="btn botones" style="font-size:11.5px">
                                                    <span>
                                                        <img class="btn-añadir" />
                                                    </span>
                                                    Agregar
                                                </a>
                                                <div class="padding10"></div>
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
                                                    <td>GRUPO MEXICANO DE SEGUROS, S.A. DE C.V.</td>
                                                    <td>
                                                        <input type="text" class="estandar-control Tablero txtPorcentajeFee" style="width:40%" placeholder="%" />
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
                                                        <input type="text" id="txtPagoAutomaticoSiniestro" class="estandar-control Tablero" style="width:40%" placeholder="%" disabled />
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
    <script>
        // Aquí irá el catálogo de coaseguradoras de la Base de Datos
        var COASEGURADORAS = JSON.parse('<%= CoaseguradorasJson %>');
        
        COASEGURADORAS.forEach(function (co) {
            $("#dropdownCoaseguradoras").append('<option value="' + co.Id + '">' +co.Nombre + '</option>');
        });
    </script>
    <script src="../Scripts/Emision/CoaseguroComun.js"></script>
    <script src="../Scripts/Emision/CoaseguroModels.js"></script>
    <script src="../Scripts/Emision/CoaseguroSeguidor.js"></script>
</asp:Content>