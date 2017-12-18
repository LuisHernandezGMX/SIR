$(document).ready(function () {
    PageLoadMaster();
});

//Evento Inicial en Master
function PageLoadMaster() {
    fn_EstadoVentanas();
    fn_EstadoGrid("gvd_Broker", "chk_SelBro");
    fn_EstadoGrid("gvd_Compañia", "chk_SelCia");
    fn_EstadoGrid("gvd_Poliza", "chk_SelPol");
    fn_EstadoGrid("gvd_RamoContable", "chk_SelRamC");
    fn_EstadoGrid("gvd_Producto", "chk_SelPro");

    $(".Fecha").mask("99/99/9999");

    $(".Fecha").datepicker({
        showOn: 'focus',
        buttonImageOnly: false,
        dateFormat: 'dd/mm/yy',
        numberOfMonths: 1,
        dayNamesMin: ['Do', 'Lu', 'Ma', 'Mi', 'Ju', 'Vi', 'Sa'],
        monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo',
                        'Junio', 'Julio', 'Agosto', 'Septiembre',
                        'Octubre', 'Noviembre', 'Diciembre'],
        monthNamesShort: ['Ene', 'Feb', 'Mar', 'Abr',
                            'May', 'Jun', 'Jul', 'Ago',
                            'Sep', 'Oct', 'Nov', 'Dic']
    });


    //Botón Aceptar en Catalogo
    $("[id*=btn_Aceptar_Catalogo]").click(function () {
        var varSeleccion = '';
        var Filas = $("[id*=gvd_Catalogo]")[0].rows;

        for (i = 0; i <= Filas.length - 2; i++) {
            if ($('[id*=chk_Cat]')[i].checked == true) {
                varSeleccion = varSeleccion + Filas[i + 1].cells[1].innerText + '~' +
                                              Filas[i + 1].cells[2].innerText + '~' +
                                              Filas[i + 1].cells[3].innerText + '~' +
                                              Filas[i + 1].cells[4].innerText + '~' +
                                              Filas[i + 1].cells[5].innerText + '|';
            }
        }

        $("input[id$='hid_Seleccion']")[0].value = varSeleccion
        __doPostBack(this.name, '');
    });


    $("[id*=btn_Cancelar_Catalogo]").click(function () {
        event.preventDefault ? event.preventDefault() : event.returnValue = false;
        $("input[id$='hid_Control']")[0].value = '';
        $("input[id$='hid_Seleccion']")[0].value = '';
        $("input[id$='hid_Prefijo']")[0].value = '';
        fn_CerrarModal('#Catalogo');
    });

    $("#btn_Cerrar_Cat").click(function () {
        event.preventDefault ? event.preventDefault() : event.returnValue = false;
        $("input[id$='hid_Control']")[0].value = '';
        $("input[id$='hid_Seleccion']")[0].value = '';
        $("input[id$='hid_Prefijo']")[0].value = '';
        fn_CerrarModal('#Catalogo');
    });

    //Botón Mostrar Aclaración
    $("[id*=gvd_GrupoPolizas] .MuestraAclaracion").click(function () {
        event.preventDefault ? event.preventDefault() : event.returnValue = false;
        var row = $(this).closest("tr");
        var id_pv = row.find('.id_pv');
        fn_Aclaracion($(id_pv)[0].value);
    });


    //ToolTip para cualquier control
    //Establecer la propiedad title
    $('.masterTooltip').click(function () {
        // Hover over code
        var title = $(this).attr('title');
        $(this).data('tipText', title).removeAttr('title');
        $('<p class="tooltip"></p>')
        .text(title)
        .appendTo('body')
        .fadeIn('slow');
    }, function () {
        // Hover out code
        $(this).attr('title', $(this).data('tipText'));
        $('.tooltip').remove();
    }).mousemove(function (e) {
        var mousex = e.pageX + 20; //Get X coordinates
        var mousey = e.pageY + 10; //Get Y coordinates
        $('.tooltip')
        .css({ top: mousey, left: mousex })
    });

    //FORMATEO DE CAMPOS EN LA VISTA
    $(".Fecha").mask("99/99/9999");

    $(".cod").numeric({ decimal: false, negative: true, min: 0, max: 999999 });
    $(".cod").attr({ maxLength: 6 });
    $(".cod").css('text-align', 'center');

    $(".nro_pol").numeric({ decimal: false, negative: false, min: 0, max: 9999999 });
    $(".nro_pol").attr({ maxLength: 7 });
    $(".nro_pol").css('text-align', 'center');

    //$(".Monto").numeric({ precision: 18, scale: 4 });
    $(".Monto").numeric({ decimal: ".", negative: false, scale: 3 });
    //$(".Monto").numeric({ decimal: true, negative: false, min: 0, max: 9999999 });
    $(".Monto").css('text-align', 'right');

    $(".Prc").numeric({ decimal: ".", negative: false, scale: 2 });
    $(".Prc").css('text-align', 'right');
    $(".Prc").attr({ maxLength: 5 });

    $(".Centro").css('text-align', 'center');
    $(".Derecha").css('text-align', 'right');

    //Busqueda de Producto por Catalogo
    $("#btn_SelRam").click(function () {
        fn_CargaCatalogo("Pro", "", "", "Unica", "txtClaveRam|txtSearchRam", "Productos");
    });

    //Busqueda de Producto por Clave
    $("input[id$='txtClaveRam']").focusout(function () {
        var Id = $("input[id$='txtClaveRam']")[0].value;
        if (Id == "") {
            Id = 10000; //Coloca un número inexistente
        }
        $.ajax({
            url: "../LocalServices/ConsultaBD.asmx/GetProducto",
            data: "{ 'Id': " + Id + "}",
            dataType: "json",
            type: "POST",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                $("input[id$='txtSearchRam']")[0].value = data.d;
                $(".nro_pol").select();
            },
            error: function (response) {
                fn_MuestraMensaje('JSON', response.responseText, 2);
            },
        });
    });


    $('#txt_Filtro').keyup(function (event) {
        var searchKey = $(this).val().toLowerCase();
        var textoFila = ''

        if (searchKey.length > 1) {
            var Filas = $("[id*=gvd_Catalogo]")[0].rows;

            for (i = 0; i <= Filas.length - 2; i++) {
                var Clave = Filas[i + 1].cells[1].innerText.toLowerCase()
                var Descripcion = Filas[i + 1].cells[2].innerText.toLowerCase()

                if (Clave.indexOf(searchKey) >= 0 || Descripcion.indexOf(searchKey) >= 0) {
                    $(Filas[i + 1]).show();
                }
                else {
                    $(Filas[i + 1]).hide();
                }
            }
        }


        if ($('#txt_Filtro')[0].value == "") {
            $('[id$=gvd_Catalogo]').tablePagination({});
        }
    });

}


//Ventana de Mensajes
function fn_MuestraMensaje(Titulo, Mensaje, Tipo, boton) {

    document.getElementById('lbl_TituloMensaje').innerHTML = Titulo;
    document.getElementById('lbl_Mensaje').innerHTML = Mensaje;

    document.getElementById('img_advertencia').style.display = 'none';
    document.getElementById('img_confirma').style.display = 'none';
    document.getElementById('img_error').style.display = 'none';
    document.getElementById('img_pregunta').style.display = 'none';

    document.getElementById('btn_Si').style.display = 'none';
    document.getElementById('btn_No').style.display = 'none';

    //Almacena el control que desplego el Mensaje de Confirmación
    if (boton != undefined) {
        document.getElementById('hid_ControlASP').value = boton;
    }

    //Evalua el tipo de Mensaje
    switch (Tipo) {
        case 0:
            document.getElementById('img_advertencia').style.display = 'block';
            break;
        case 1:
            document.getElementById('img_confirma').style.display = 'block';
            break;
        case 2:
            document.getElementById('img_error').style.display = 'block';
            break;
        case 3:
            document.getElementById('img_pregunta').style.display = 'block';
            document.getElementById('btn_Si').style.display = 'inline-block';
            document.getElementById('btn_No').style.display = 'inline-block';
            break;
    }

    fn_AbrirModal('#Mensajes');
    //$('#Mensajes').draggable();
}

//Respuesta del Usuario en Mensaje de Confirmación
function fn_Repuesta() {
    fn_CerrarModal('#Mensajes');
    __doPostBack(document.getElementById('hid_ControlASP').value, '');
}


//Respuesta del Usuario en Mensaje de Confirmación
function fn_Repuesta_Autoriza() {
    fn_CerrarModal('#Autorizacion');
    __doPostBack(document.getElementById('hid_controlAuto').value, '');
}

//Funciones de Consulta--------------------------------------------------------------------------------------------------------------------------------
function fn_CargaCatalogo(Catalogo, Condicion, Seleccion, Tipo, Control, Titulo) {
    $.ajax({
        type: 'POST',
        contentType: "application/json; charset=utf-8",
        url: '../LocalServices/ConsultaBD.asmx/ObtieneDatos',
        data: "{ 'Consulta': 'spS_CatalogosSIR ==" + Catalogo + "==,==" + Condicion + "==" + Seleccion + "'}",
        dataType: 'JSON',
        success: function (response) {
            if (response.d.length > 0) {
                $("#lbl_Catalogo")[0].innerText = Titulo;
                $("input[id$='hid_Control']")[0].value = Control;
                $("input[id$='hid_Prefijo']")[0].value = Catalogo;
                fn_AbrirModal('#Catalogo');

                $("[id*=gvd_Catalogo] tr").not($("[id*=gvd_Catalogo] tr:first")).remove();
                for (var i = 0; i < response.d.length; i++) {
                    $("[id*=gvd_Catalogo]").append('<tr>' +
                                                        '<td><input type="checkbox" id="chk_Cat" class="Select" onclick="fn_CambioSeleccion(this,' + "'" + Tipo + "'" + ')" /></td>' +
                                                        '<td><label id="lbl_ClaveCat" class="texto-catalogo" style="Width:75px;">' + response.d[i].Clave + '</label></td>' +
                                                        '<td><label id="lbl_DesCat" class="texto-catalogo" style="Width:205px;">' + response.d[i].Descripcion + '</label></td>' +
                                                        '<td><label id="lbl_Oculta1" style="display:none;">' + response.d[i].OcultaCampo1 + '</label></td>' +
                                                        '<td><label id="lbl_Oculta2" style="display:none;">' + response.d[i].OcultaCampo2 + '</label></td>' +
                                                        '<td><label id="lbl_Oculta3" style="display:none;">' + response.d[i].OcultaCampo3 + '</label></td>' +
                                                   '</tr>')
                };
                //Reference the GridView.
                var gridView = $("[id*=gvd_Catalogo]");

                //Reference the first row.
                var row = gridView.find("tr").eq(1);

                if ($.trim(row.find("td").eq(0).html()) == "") {
                    row.remove();
                }
                $('[id$=gvd_Catalogo]').tablePagination({});
                $('[id$=gvd_Catalogo]').each(function () {
                    $('tr:odd', this).addClass('odd').removeClass('even');
                    $('tr:even', this).addClass('even').removeClass('odd');
                })
                fn_CerrarModal('#EsperaModal');

            }
            else {
                fn_MuestraMensaje('Catálogo', 'No se encontraron registros', 0);
                fn_CerrarModal('#EsperaModal');
            }
        },
        error: function (e) {
            fn_MuestraMensaje('Catálogo', e.responseText, 2);
            fn_CerrarModal('#EsperaModal');
        }
    });
    return false;
};

//Función de Autocompletar
function fn_Autocompletar(Catalogo, ControlClave, ControlBusqueda, Condicion, minChar, caracter) {

    if (caracter != 13 && caracter != 9 && caracter != -1 && caracter != 37 && caracter != 38 && caracter != 39 && caracter != 40 && caracter != 46) {
        $("input[id$='" + ControlClave + "']")[0].value = '';
    }

    $("input[id$='" + ControlBusqueda + "']").css("color", "#555");
    
    var strSel = Condicion;
   
    $('[id$=' + ControlBusqueda + ']').autocomplete({
        minLength: minChar,
        source: function (request, response) {
            $.ajax({
                url: "../LocalServices/ConsultaBD.asmx/GetAutocompletar",
                data: "{ 'catalogo': '" + Catalogo + "' , 'prefix': '" + request.term + "' , 'strSel': '" + strSel + "'}",
                dataType: "json",
                type: "POST",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    response($.map(data.d, function (item) {
                        return {
                            label: item.split('|')[0],
                            val: item.split('|')[1]
                        }
                    }))
                },
                error: function (response) {
                    fn_MuestraMensaje('JSON', response.responseText, 2);
                },
            });
        },
        select: function (e, i) {
            $("input[id$='" + ControlClave + "']")[0].value = i.item.val;
        }
    });
}


//Cambio de selección de elemento en Catalogo
function fn_CambioSeleccion(Control, TipoSeleccion) {
    //Get target base & child control.

    var row = $(Control).closest("tr");

    var Gread = document.getElementById($('[id$=gvd_Catalogo]')[0].id)

    //Evalua el tipo de seleccion
    if (TipoSeleccion == "Unica") {
        fn_SeleccionGread(Gread, false)
        fn_SeleccionarElemento(row[0].rowIndex)
    }
    return false;
}


function fn_SeleccionGread(Control, Valor) {
    //Get target base & child control.
    var TargetChildControl = "chk_Cat";

    if (Control == null) {
        fn_MuestraMensaje('no hay elementos', e.responseText, 2);
    }

    if (Control != null) {
        //Get all the control of the type INPUT in the base control.
        var Inputs = Control.getElementsByTagName("input");

        //Checked/Unchecked all the checkBoxes in side the GridView.
        for (var n = 0; n < Inputs.length; ++n)
            if (Inputs[n].type == 'checkbox' && Inputs[n].id.indexOf(TargetChildControl, 0) >= 0)
                Inputs[n].checked = Valor;
    }
    return false;
}


//Selecciona solo un elemento en caso de ser seleccion Unica
function fn_SeleccionarElemento(rowIndex) {
    $("[id*=gvd_Catalogo] tr").each(function (e) {
        var row = $(this).closest("tr");
        if (row[0].rowIndex == rowIndex) {
            var Select = row.find('.Select');
            $(Select)[0].checked = true;
        }
    })
    return false;
}

//Abrir Modal
function fn_AbrirModal(modal) {
    $(modal).modal('show');
}

//Cerrar Modal
function fn_CerrarModal(modal) {
    $(modal).modal('hide');
}

function fn_AbrirModalSimple(modal) {
    fn_Desplazable(modal);
    $(modal).css("display", "block");
}

function fn_CerrarModalSimple(modal) {
    $(modal).css("display", "none");
}

//Cambia Estado de Ventana
function fn_CambiaEstado(IdControl, Colapsado) {
    $('.ventana' + IdControl).slideToggle();

    var Ventana = $("input[id$='hid_Ventanas']")[0].value;
    var Estado = Ventana.split("|");

    Estado[IdControl] = Colapsado

    $("input[id$='hid_Ventanas']")[0].value = "";

    for (i = 0; i < Estado.length - 1; i++) {
        $("input[id$='hid_Ventanas']")[0].value = $("input[id$='hid_Ventanas']")[0].value + Estado[i] + "|";
    }

    if (Colapsado == "1") {
        $("#coVentana" + IdControl).hide();
        $("#exVentana" + IdControl).show();
    }
    else {
        $("#coVentana" + IdControl).show();
        $("#exVentana" + IdControl).hide();
    }
}

//Funciones Estado-------------------------------------------------------------------------------------------------------------------------------------
function fn_EstadoVentanas() {
    var Ventana = $("input[id$='hid_Ventanas']")[0].value;
    var Estado = Ventana.split("|");

    for (i = 0; i < Estado.length - 1; i++) {
        if (Estado[i] == "1") {
            $('.ventana' + i).hide();
            $("#coVentana" + i).hide();
            $("#exVentana" + i).show();
        }
        else {
            $("#coVentana" + i).show();
            $("#exVentana" + i).hide();
        }
    }
}

function fn_EstadoGrid(Grid, Control) {
    if ($("[id*=" + Grid + "]")[0] != undefined) {
        var Rows = $("[id*=" + Grid + "]")[0].rows;
        for (i = 0; i <= Rows.length - 2; i++) {
            if ($('[id*=' + Control + ']')[i].value == "true") {
                var row = $('[id*=' + Control + ']')[i].parentNode.parentNode;
                row.style.display = "none";
            }
        }
    }
}

//Evalua los elementos ya seleccionados para una Consulta
function fn_ElementosSeleccionados(Gread, Control, Seleccion, blnTexto) {
    var caracter = '';

    if (blnTexto == true) { caracter = '===='; }

    var strSel = caracter + '-1' + caracter;

    if (Gread.length > 0) {
        var Filas = Gread[0].rows;
        for (i = 0; i <= Filas.length - 2; i++) {
            var Clave = Control[i].innerText;
            var chk_Sel = Seleccion[i].value

            //Verifica que no haya sido descartado de la lista
            if (chk_Sel != 'true') { strSel = strSel + ',' + caracter + Clave + caracter; }
        }
    }

    if (strSel == caracter + '-1' + caracter) { strSel = ''; }
    else { strSel = ",==" + strSel + "=="; }

    return strSel;
}

function fn_Seleccion(Control) {
    $(Control).focus(function () {
        this.select();
    });
}

function fn_Aclaracion(id_pv) {
    $.ajax({
        type: 'POST',
        contentType: "application/json; charset=utf-8",
        url: '../LocalServices/ConsultaBD.asmx/GetAclaracion',
        data: "{ 'id_pv': '" + id_pv + "'}",
        dataType: 'JSON',
        success: function (response) {
            if (response.d.length > 0) {
                fn_CerrarModal('#EsperaModal');
                $(".Aclaracion")[0].innerHTML = response.d;
                fn_AbrirModal('#AclaracionesModal');
            }
            else {
                fn_CerrarModal('#EsperaModal');
                fn_MuestraMensaje('Aclaraciones', 'No se encontraron registros', 0);
            }
        },
        error: function (e) {
            fn_CerrarModal('#EsperaModal');
            fn_MuestraMensaje('JSON', e.responseText, 2);
        }
    });
    return false;
};

function fn_Desplazable(modal) {
    $(modal).draggable({ disabled: false });
}

function fn_Resizable(modal) {
    $(modal).resizable();
}

function fn_NoDesplazable(control, control_base) {
    var left = $(control_base).css("left");
    var top = $(control_base).css("top");

    $(control).css({
        'left': left,
        'top': top
    });
    $(control).draggable({ disabled: true });
}

//Formato de comas a N posiciones decimales
function fn_FormatoMonto(Monto, decimales , porcentaje) {
    if (isNaN(Monto) == true) {
        return '0.00';
    }
    else {
        if (porcentaje == undefined) {
            return Monto.toFixed(decimales).replace(/(\d)(?=(\d{3})+\.)/g, '$1,');
        }
        else {
            return Monto.toFixed(decimales)
        } 
    }
}

//Evalua tecla Numerica
function fn_EvaluaNumerico(keynum) {
    if ((keynum == 8) || (keynum == 46))
        return true;

    return /\d/.test(String.fromCharCode(keynum));
}

function fn_EvaluaAutoComplete(ControlClave, ControlDescripcion) {
    if ($("input[id$='" + ControlClave + "']")[0].value == "") {
        $("input[id$='" + ControlDescripcion + "']").css("color", "red");
    }
    else {
        $("input[id$='" + ControlDescripcion + "']").css("color", "#555");
    }
}


function fn_DateDiff(date1, date2, interval) {
    var date = date1.split('/');
    date1 = date[2] + '-' + date[1] + '-' + date[0]

    var date = date2.split('/');
    date2 = date[2] + '-' + date[1] + '-' + date[0]

    var second = 1000, minute = second * 60, hour = minute * 60, day = hour * 24, week = day * 7;
    date1 = new Date(date1);
    date2 = new Date(date2);
    var timediff = date2 - date1;
    if (isNaN(timediff)) return NaN;
    switch (interval) {
        case "year": return date2.getFullYear() - date1.getFullYear();
        case "month": return (
            (date2.getFullYear() * 12 + date2.getMonth())
            -
            (date1.getFullYear() * 12 + date1.getMonth())
        );
        case "week": return Math.floor(timediff / week);
        case "day": return Math.floor(timediff / day);
        case "hour": return Math.floor(timediff / hour);
        case "minute": return Math.floor(timediff / minute);
        case "second": return Math.floor(timediff / second);
        default: return undefined;
    }
}

function fn_IsDate(date) {
    return (new Date(date) !== "Invalid Date" && !isNaN(new Date(date)) )  ? true : false;
}