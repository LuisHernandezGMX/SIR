function PageLoadMesaControl() {
    if ($("input[id$='hid_Operacion']")[0].value == 1 || $("input[id$='hid_Operacion']")[0].value == 2) {
        fn_EvaluaAutoComplete('txt_ClaveAseg', 'txt_SearchAse');
        fn_EvaluaAutoComplete('txt_ClaveOfi', 'txt_SearchOfi');
        fn_EvaluaAutoComplete('txt_ClaveSusc', 'txt_SearchSusc');
        fn_EvaluaAutoComplete('txt_ClaveGiro', 'txt_SearchGiro');
        fn_EvaluaAutoComplete('txt_ClaveGre', 'txt_SearchGre');
        fn_EvaluaAutoComplete('txt_ClaveTte', 'txt_SearchTte');

        fn_EvaluaAutoComplete('txt_ClaveResp', 'txt_SearchResp');
        fn_EvaluaAutoComplete('txt_ClaveBro', 'txt_SearchBro');
    }
    
    LeftClick = 0;


    gridviewScroll();


    fn_ActualizaLapso();
    fn_EstadoSeleccionGrid('gvd_RamoSbr', 'Ram');
    fn_EstadoSeleccionGrid('gvd_Seccion', 'Rie');
    fn_EstadoSeleccionGrid('gvd_Cobertura', 'Cob');
}

$(document).ready(function () {
    gridviewScroll()
});

$(window).resize(function () {
    gridviewScroll()
});


function gridviewScroll() {
    if ($("input[id$='hid_Pestaña']")[0].value == 0) {
        if ($(window).width() > 1366 && $(window).width() <= 1600) {
            $('[id$=gvd_Riesgo]').gridviewScroll({
                freezesize: 6,
                width: 1180
            });
        }
        else if ($(window).width() >= 1264 && $(window).width() <= 1366) {
            $('[id$=gvd_Riesgo]').gridviewScroll({
                freezesize: 6,
                width: 960
            });
        }
    }
}

$("body").on("mouseup", "", function (e) {
    LeftClick = 0;
});

$("body").on("click", ".Generales", function (e) {
    $("input[id$='hid_Pestaña']")[0].value = 0;
});
$("body").on("click", ".Colocacion", function (e) {
    $("input[id$='hid_Pestaña']")[0].value = 1;
});
$("body").on("click", ".Resumen", function (e) {
    $("input[id$='hid_Pestaña']")[0].value = 2;
});


////////////////////////////////////////////////////////////////////EVENTO EXPANDIR-CONTRAER/////////////////////////////////////
//Colapsar Ventana
$("body").on("click", ".contraer", function () {
    event.preventDefault ? event.preventDefault() : event.returnValue = false;
    var id = this.id.substr(this.id.length - 1)
    fn_CambiaEstado(id, "1");
});

//Expandir Ventana
$("body").on("click", ".expandir", function () {
    event.preventDefault ? event.preventDefault() : event.returnValue = false;
    var id = this.id.substr(this.id.length - 1)
    fn_CambiaEstado(id, "0");
});
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

$("body").on("click", ".AgregaOficina", function () {
    fn_CargaCatalogo("Suc", "", "", "Unica", "txt_ClaveOfi|txt_SearchOfi", "OFICINAS");
});

$("body").on("click", ".AgregaSuscriptor", function () {
    fn_CargaCatalogo("Usu", "", "", "Unica", "txt_ClaveSusc|txt_SearchSusc", "USUARIOS");
});

$("body").on("click", ".AgregaResponsable", function () {
    fn_CargaCatalogo("Usu", "", "", "Unica", "txt_ClaveResp|txt_SearchResp", "USUARIOS");
});

//Detecta la clase Agregar Broker y abre el Catalogo
$("body").on("click", ".AgregaBroker", function () {
    //*************fn_CargaCatalogo(PrefijoCatalogo,Condicion,Seleccion,TipoSeleccion,IdGrid,Titulo)***************
    fn_CargaCatalogo("Bro", "", "", "Multiple", "", "INTERMEDIARIOS");
});

$("body").on("click", ".AgregaCia", function () {
    var strSel = fn_ElementosSeleccionados($("[id*=gvd_Compañia]"), $('[id*=lbl_ClaveCia]'), $('[id*=chk_SelCia]'), false);

    //*************fn_CargaCatalogo(PrefijoCatalogo,Condicion,Seleccion,TipoSeleccion,IdGrid,Titulo)***************
    fn_CargaCatalogo("Cia", "", strSel, "Multiple", "", "REASEGURADORES");
});

$("body").on("click", ".AgregaRiesgo", function () {
    event.preventDefault ? event.preventDefault() : event.returnValue = false;
    fn_AbrirModalSimple('#Riesgos');
});

//Delete event handler.
$("body").on("click", "[id*=gvd_Compañia] .Delete", function () {
    event.preventDefault ? event.preventDefault() : event.returnValue = false;
    var row = $(this).closest("tr");
    $('[id*=chk_SelCia]')[row[0].rowIndex - 1].value = "true";
    row.hide();
    return false;
});

//Funciones de Autocompletar----------------------------------------------------------------------------------------------
//Asegurado
$("body").on("keydown", "[id$=txt_SearchAse]", function (e) {
    fn_Autocompletar("Ase", "txt_ClaveAseg", "txt_SearchAse", "", 3, e.which)
});



//Oficina
$("body").on("keydown", "[id$=txt_SearchOfi]", function (e) {
    if (e.which == 9) {
        $("input[id$='txt_SearchSusc']").focus();
        return false;
    }
    fn_Autocompletar("Suc", "txt_ClaveOfi", "txt_SearchOfi", "", 0, e.which)
});

$("body").on("focusout", "[id$=txt_SearchOfi]", function () {
    if ($(this)[0].value == '') {
        $("input[id$='txt_ClaveOfi']")[0].value = ''
    }
    fn_EvaluaAutoComplete('txt_ClaveOfi', 'txt_SearchOfi');
});

$("body").on("focus", "[id$=txt_SearchOfi]", function () {
    fn_Autocompletar("Suc", "txt_ClaveOfi", "txt_SearchOfi", "", 0, -1)
    $(this).trigger({
        type: "keydown",
        which: 46
    });
});


//Suscriptor
$("body").on("keydown", "[id$=txt_SearchSusc]", function (e) {
    if (e.which == 9) {
        $("input[id$='txt_SearchAge']").focus();
        return false;
    }
    fn_Autocompletar("Usu", "txt_ClaveSusc", "txt_SearchSusc", "", 0, e.which)
});

$("body").on("focusout", "[id$=txt_SearchSusc]", function () {
    if ($(this)[0].value == '') {
        $("input[id$='txt_ClaveSusc']")[0].value = ''
    }
    fn_EvaluaAutoComplete('txt_ClaveSusc', 'txt_SearchSusc');
});

$("body").on("focus", "[id$=txt_SearchSusc]", function () {
    fn_Autocompletar("Usu", "txt_ClaveSusc", "txt_SearchSusc", "", 0, -1)
    $(this).trigger({
        type: "keydown",
        which: 46
    });
});


//Agente
$("body").on("keydown", "[id$=txt_SearchAge]", function (e) {
    fn_Autocompletar("Age", "txt_ClaveAge", "txt_SearchAge", "", 2, e.which)
});

$("body").on("focusout", "[id$=txt_SearchAge]", function () {
    if ($(this)[0].value == '') {
        $("input[id$='txt_ClaveAge']")[0].value = ''
    }
    fn_EvaluaAutoComplete('txt_ClaveAge', 'txt_SearchAge');
});



//Grupo de Endoso
$("body").on("keydown", "[id$=txt_SearchGre]", function (e) {
    fn_Autocompletar("Gre", "txt_ClaveGre", "txt_SearchGre", "", 0, e.which)
});

$("body").on("focusout", "[id$=txt_SearchGre]", function () {
    var blnClear = 0;

    if ($(this)[0].value == '') {
        $("input[id$='txt_ClaveGre']")[0].value = ''
        blnClear = 1
    }
    else if ($("input[id$='txt_ClaveGre']")[0].value != $("input[id$='txt_ClaveGreAux']")[0].value) {
        $("input[id$='txt_ClaveGreAux']")[0].value = $("input[id$='txt_ClaveGre']")[0].value;
        blnClear = 1;
    }

    if (blnClear == 1) {
        $("input[id$='txt_ClaveTte']")[0].value = '';
        $("input[id$='txt_SearchTte']")[0].value = '';
    }

    fn_EvaluaAutoComplete('txt_ClaveGre', 'txt_SearchGre');
});

$("body").on("focus", "[id$=txt_SearchGre]", function () {
    fn_Autocompletar("Gre", "txt_ClaveGre", "txt_SearchGre", "", 0, -1)
    $(this).trigger({
        type: "keydown",
        which: 46
    });
});


//Tipo de Endoso
$("body").on("keydown", "[id$=txt_SearchTte]", function (e) {
    if ($("input[id$='txt_ClaveGre']")[0].value != '') {
        fn_Autocompletar("Tte", "txt_ClaveTte", "txt_SearchTte", " AND cod_grupo_endo = " + $("input[id$='txt_ClaveGre']")[0].value, 0, e.which)
    }
});

$("body").on("focusout", "[id$=txt_SearchTte]", function () {
    if ($(this)[0].value == '') {
        $("input[id$='txt_ClaveTte']")[0].value = ''
    }
    fn_EvaluaAutoComplete('txt_ClaveTte', 'txt_SearchTte');
});

$("body").on("focus", "[id$=txt_SearchTte]", function () {
    fn_Autocompletar("Tte", "txt_ClaveTte", "txt_SearchTte", " AND cod_grupo_endo = 0", 0, -1)
    $(this).trigger({
        type: "keydown",
        which: 46
    });
});

//Giro
$("body").on("keydown", "[id$=txt_SearchGiro]", function (e) {
    var cod_ramo = $("input[id$='txt_ClaveRam']")[0].value;

    if(cod_ramo == ''){
        cod_ramo = 0;
    }

    fn_Autocompletar("Gro", "txt_ClaveGiro", "txt_SearchGiro", ' AND cod_ramo = ' + cod_ramo, 2, e.which)
});


//----------------------------------------------------------------AUTOCOMPLETE DENTRO DE GRID------------------------------------------------------------------
//Ramo del Inciso
$("body").on("mouseover", "[id*=gvd_Riesgo] .Ramo", function (e) {
    $(this).attr('title', $(this)[0].value);
});

$("body").on("keydown", "[id*=gvd_Riesgo] .Ramo", function (e) {
    var row = $(this).closest("tr");
    var ClaveRamo = row.find('.ClaveRamo');
    fn_AutocompletarGrid('Ram', ClaveRamo, 'txt_SearchRamo', '', e.which)

    if (e.which != 46) {
        var ClaveSubramo = row.find('.ClaveSubramo');
        var Subramo = row.find('.Subramo');
        var ClaveRiesgo = row.find('.ClaveRiesgo');
        var Riesgo = row.find('.Riesgo');
        var ClaveCobertura = row.find('.ClaveCobertura');
        var Cobertura = row.find('.Cobertura');

        $(ClaveSubramo)[0].value = '';
        $(Subramo)[0].value = '';
        $(ClaveRiesgo)[0].value = '';
        $(Riesgo)[0].value = '';
        $(ClaveCobertura)[0].value = '';
        $(Cobertura)[0].value = '';
    }
});

$("body").on("focusout", "[id*=gvd_Riesgo] .Ramo", function (e) {
    var row = $(this).closest("tr");
    var ClaveRamo = row.find('.ClaveRamo');
    var ClaveRamoAux = row.find('.ClaveRamoAux');
    var blnClear = 0;

    if ($(this)[0].value == '') {
        $(ClaveRamo)[0].value = '';
        blnClear = 1
    }
    else if ($(ClaveRamo)[0].value != $(ClaveRamoAux)[0].value) {
        $(ClaveRamoAux)[0].value = $(ClaveRamo)[0].value;
        blnClear = 1;
    }

    if (blnClear == 1) {
        var ClaveSubramo = row.find('.ClaveSubramo');
        var Subramo = row.find('.Subramo');
        var ClaveRiesgo = row.find('.ClaveRiesgo');
        var Riesgo = row.find('.Riesgo');
        var ClaveCobertura = row.find('.ClaveCobertura');
        var Cobertura = row.find('.Cobertura');
        $(ClaveSubramo)[0].value = '';
        $(Subramo)[0].value = '';
        $(ClaveRiesgo)[0].value = '';
        $(Riesgo)[0].value = '';
        $(ClaveCobertura)[0].value = '';
        $(Cobertura)[0].value = '';
    }
});

$("body").on("focus", "[id*=gvd_Riesgo] .Ramo", function () {
    fn_AutocompletarGrid('Ram', undefined, 'txt_SearchRamo', '', -1)
    $(this).trigger({
        type: "keydown",
        which: 46
    });
});



//SubRamo del Inciso
$("body").on("mouseover", "[id*=gvd_Riesgo] .Subramo", function (e) {
    $(this).attr('title', $(this)[0].value);
});

$("body").on("keydown", "[id*=gvd_Riesgo] .Subramo", function (e) {
    var row = $(this).closest("tr");
    var ClaveRamo = row.find('.ClaveRamo');
    var ClaveSubramo = row.find('.ClaveSubramo');
    fn_AutocompletarGrid('Sbr', ClaveSubramo, 'txt_SearchSubramo', ' AND cod_ramo = ' + $(ClaveRamo)[0].value, e.which)

    if (e.which != 46) {
        var ClaveCobertura = row.find('.ClaveCobertura');
        var Cobertura = row.find('.Cobertura');
        $(ClaveCobertura)[0].value = '';
        $(Cobertura)[0].value = '';
    }
});


$("body").on("focusout", "[id*=gvd_Riesgo] .Subramo", function (e) {
    var row = $(this).closest("tr");
    var ClaveSubramo = row.find('.ClaveSubramo');
    var ClaveSubramoAux = row.find('.ClaveSubramoAux');
    var blnClear = 0;

    if ($(this)[0].value == '') {
        $(ClaveSubramo)[0].value = ''
        blnClear = 1
    }
    else if ($(ClaveSubramo)[0].value != $(ClaveSubramoAux)[0].value) {
        $(ClaveSubramoAux)[0].value = $(ClaveSubramo)[0].value
        blnClear = 1
    }

    if (blnClear == 1) {
        var ClaveCobertura = row.find('.ClaveCobertura');
        var Cobertura = row.find('.Cobertura');
        $(ClaveCobertura)[0].value = '';
        $(Cobertura)[0].value = '';
    }
});

$("body").on("focus", "[id*=gvd_Riesgo] .Subramo", function () {
    fn_AutocompletarGrid('Sbr', undefined, 'txt_SearchSubramo', ' AND cod_ramo = 0', -1)
    var row = $(this).closest("tr");
    var ClaveRamo = row.find('.ClaveRamo');
    if ($(ClaveRamo)[0].value != '') {
        $(this).trigger({
            type: "keydown",
            which: 46
        });
    }
    else {
        fn_MuestraMensaje('Error en Inciso', 'Se debe seleccionar un Ramo válido', 0);
    }
});




//Sección del Inciso
$("body").on("mouseover", "[id*=gvd_Riesgo] .Riesgo", function (e) {
    $(this).attr('title', $(this)[0].value);
});

$("body").on("keydown", "[id*=gvd_Riesgo] .Riesgo", function (e) {
    var row = $(this).closest("tr");
    var ClaveRamo = row.find('.ClaveRamo');
    var ClaveRiesgo = row.find('.ClaveRiesgo');

    fn_AutocompletarGrid('Rie', ClaveRiesgo, 'txt_SearchSeccion', ' AND cod_ramo = ' + $(ClaveRamo)[0].value, e.which)
});

$("body").on("focusout", "[id*=gvd_Riesgo] .Riesgo", function () {
    var row = $(this).closest("tr");
    var ClaveRiesgo = row.find('.ClaveRiesgo');

    if ($(this)[0].value == '') {
        $(ClaveRiesgo)[0].value = ''
    }
});

$("body").on("focus", "[id*=gvd_Riesgo] .Riesgo", function () {
    fn_AutocompletarGrid('Rie', undefined, 'txt_SearchSeccion', ' AND cod_ramo = 0', -1)
    var row = $(this).closest("tr");
    var ClaveRamo = row.find('.ClaveRamo');

    if ($(ClaveRamo)[0].value != '') {
        $(this).trigger({
            type: "keydown",
            which: 46
        });
    }
    else {
        fn_MuestraMensaje('Error en Inciso', 'Se debe seleccionar un Ramo válido', 0);
    }
});




//Cobertura del Inciso
$("body").on("mouseover", "[id*=gvd_Riesgo] .Cobertura", function (e) {
    $(this).attr('title', $(this)[0].value);
});

$("body").on("keydown", "[id*=gvd_Riesgo] .Cobertura", function (e) {
    var row = $(this).closest("tr");
    var ClaveRamo = row.find('.ClaveRamo');
    var ClaveSubramo = row.find('.ClaveSubramo');
    var ClaveCobertura = row.find('.ClaveCobertura');

    fn_AutocompletarGrid('Cob', ClaveCobertura, 'txt_SearchCobertura', ' AND cod_ramo = ' + $(ClaveRamo)[0].value + ' AND cod_subramo = ' + $(ClaveSubramo)[0].value, e.which)
});

$("body").on("focusout", "[id*=gvd_Riesgo] .Cobertura", function () {
    var row = $(this).closest("tr");
    var ClaveCobertura = row.find('.ClaveCobertura');

    if ($(this)[0].value == '') {
        $(ClaveCobertura)[0].value = ''
    }
});

$("body").on("focus", "[id*=gvd_Riesgo] .Cobertura", function () {
    fn_AutocompletarGrid('Cob', undefined, 'txt_SearchCobertura', ' AND cod_ramo = 0 AND cod_subramo = 0', -1)
    var row = $(this).closest("tr");
    var ClaveRamo = row.find('.ClaveRamo');
    var ClaveSubramo = row.find('.ClaveSubramo');

    if ($(ClaveRamo)[0].value != '' && $(ClaveSubramo)[0].value != '') {
        $(this).trigger({
            type: "keydown",
            which: 46
        });
    }
    else {
        fn_MuestraMensaje('Error en Inciso', 'Se debe seleccionar un Ramo y un Subramo válidos', 0);
    }
});


function fn_AutocompletarGrid(Catalogo, ControlClave, ControlBusqueda, Dependencia, caracter) {
    if (caracter != 13 && caracter != 9 && caracter != -1 && caracter != 37 && caracter != 38 && caracter != 39 && caracter != 40 && caracter != 46) {
        $(ControlClave)[0].value = '';
    }

    $("[id*=" + ControlBusqueda + "]").autocomplete({
        minLength: 0,
        source: function (request, response) {
            $.ajax({
                url: "../LocalServices/ConsultaBD.asmx/GetAutocompletar",
                data: "{ 'catalogo': '" + Catalogo + "' , 'prefix': '" + request.term + "' , 'strSel': '" + Dependencia + "'}",
                dataType: "json",
                type: "POST",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    response($.map(data.d, function (item) {i
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
            $(ControlClave)[0].value = i.item.val;
        }
    });

}
//--------------------------------------------------------------------------------------------------------------------------------------------------------------

//OPERACIONES ARITMETICAS GRID RIESGO

//Sumatorias Totales
function fn_SumaTotales(Grid, ArrayClase, ArrayControl, AST, ArrayNoSumar, Posicion) {

    var ArraySuma = [0];
    ArraySuma.length = ArrayClase.length;

    for (i = 0; i < ArraySuma.length; i++) {
        ArraySuma[i] = 0;
        $("[id*=" + Grid + "]").find("[id*=" + ArrayControl[i] + "]")[Posicion].value = 0;
        $("[id*=" + Grid + "] ." + ArrayClase[i])[Posicion].value = '0.00';
    }

    $("[id*=" + Grid + "] ." + ArrayClase[0]).each(function (e) {
        var row = $(this).closest("tr");

        for (i = 0; i < ArrayClase.length; i++) {
            if (ArrayNoSumar.indexOf(row[0].rowIndex - 1) == -1) {

                elemento = parseFloat($("[id*=" + Grid + "]").find('[id*=' + ArrayControl[i] + ']')[row[0].rowIndex - 1].value);
                //Valida la Acumulación
                if (AST == 1 && ArrayClase[i] == 'SumaAsegurada') {
                    if ($("[id*=" + Grid + "]").find("[id*=opt_Adicional] input:checked")[row[0].rowIndex - 2].value == 0) {
                        elemento = 0;
                    }
                }
                ArraySuma[i] = ArraySuma[i] + elemento

                $("[id*=" + Grid + "]").find("[id*=" + ArrayControl[i] + "]")[Posicion].value = ArraySuma[i];
                $("[id*=" + Grid + "] ." + ArrayClase[i])[Posicion].value = fn_FormatoMonto(parseFloat(ArraySuma[i]), 2);
            }
            else {
                i = ArrayClase.length;  //Break For
                break;
            }
        }
    });
}

//Suma de Desgloce de Primas
function fn_SumaPrimas(Control,ControlAux,PrimaINC,PrimaTEV,PrimaFHM) {
    ControlAux.value = parseFloat(PrimaINC) + parseFloat(PrimaTEV) + parseFloat(PrimaFHM);
    Control.value = fn_FormatoMonto(parseFloat(ControlAux.value), 2);
}

//Calculo de Cuota
function fn_CalculaCuota(row) {
    var Cuota = row.find('.Cuota');
    if ($('[id*=txt_LimRespAux]')[row[0].rowIndex - 1].value != 0) {
        $(Cuota)[0].value = fn_FormatoMonto($('[id*=txt_PrimaNetaAux]')[row[0].rowIndex - 1].value / $('[id*=txt_LimRespAux]')[row[0].rowIndex - 1].value, 2);
        $('[id*=txt_CuotaAux]')[row[0].rowIndex - 1].value = $('[id*=txt_PrimaNetaAux]')[row[0].rowIndex - 1].value / $('[id*=txt_LimRespAux]')[row[0].rowIndex - 1].value;
    }
    else {
        $(Cuota)[0].value = '0.0000'
        $('[id*=txt_CuotaAux]')[row[0].rowIndex - 1].value = 0;
    }
    fn_SumaTotales('gvd_Riesgo', ['Cuota'], ['txt_CuotaAux'], 0, [0], 0);
}


//Actualiza Agrupaciones al editar Montos
function fn_ActualizaGrupo(Grupo, inciso, ArrayClase, ArrayControl, AST) {

    $("[id*=gvd_Agrupacion] .Incisos").each(function (e) {
        var row = $(this).closest("tr");
        var incisos = $(this)[0].value.split(',');

        var ArraySuma = [0];
        ArraySuma.length = ArrayClase.length;

        //Obtiene la Clave del Grupo
        var ClaveGrupo = $("[id*=gvd_Agrupacion]").find("[id*=txt_Clave]")[row[0].rowIndex - 1].value

        //Valida en que Grupo se encuentra el inciso o de que Grupo se trata
        if (incisos.indexOf(inciso) != -1 || Grupo == ClaveGrupo) {

            for (i = 0; i < ArraySuma.length; i++) {
                ArraySuma[i] = 0;
                $("[id*=gvd_Agrupacion]").find("[id*=" + ArrayControl[i] + "]")[row[0].rowIndex - 1].value = 0;
                $("[id*=gvd_Agrupacion] ." + ArrayClase[i])[row[0].rowIndex - 1].value = '0.00';
            }

            var elemento = 0;

            $("[id*=gvd_Riesgo] ." + ArrayClase[0]).each(function (e) {
                var rowAux = $(this).closest("tr");

                for (i = 0; i < ArrayClase.length; i++) {
                    if (incisos.indexOf($('[id*=txt_Inciso]')[rowAux[0].rowIndex - 1].value) != -1) {
                        elemento = parseFloat($("[id*=gvd_Riesgo]").find("[id*=" + ArrayControl[i] + "]")[rowAux[0].rowIndex - 1].value);
                        if (AST == 1) {
                            if ($("[id*=gvd_Riesgo]").find("[id*=opt_Adicional] input:checked")[rowAux[0].rowIndex - 2].value == 0) {
                                elemento = 0;
                            }
                        }
                        ArraySuma[i] = ArraySuma[i] + elemento;

                        $("[id*=gvd_Agrupacion]").find("[id*=" + ArrayControl[i] + "]")[row[0].rowIndex - 1].value = ArraySuma[i];
                        $("[id*=gvd_Agrupacion] ." + ArrayClase[i])[row[0].rowIndex - 1].value = fn_FormatoMonto(parseFloat(ArraySuma[i]), 2);
                    }
                    else {
                        i = ArrayClase.length;  //Break For
                        break;
                    }
                }
            });

        }
    });
}



$("body").on("click", "[id*=gvd_Riesgo] [id*=opt_Adicional] input:checked", function (e) {
    var row = $(this).closest("tr").parents('tr');
    fn_SumaTotales('gvd_Riesgo', ['SumaAsegurada'], ['txt_LimRespAux'], 1, [0], 0);
    fn_ActualizaGrupo(0,$('[id*=txt_Inciso]')[row[0].rowIndex - 1].value, ['SumaAsegurada'], ['txt_LimRespAux'], 1)
    fn_CalculaReparto($('[id*=txt_Inciso]')[row[0].rowIndex - 1].value, -1, ['SumaAsegurada'], ['txt_LimResp']);
    fn_CalculaDistribucionGMX($('[id*=txt_Inciso]')[row[0].rowIndex - 1].value, -1, ['SumaAsegurada'], ['txt_LimResp']);
    fn_CalculaIntermediario($('[id*=txt_Inciso]')[row[0].rowIndex - 1].value, -1, ['SumaAsegurada'], ['txt_LimResp']);
    fn_CalculaReasegurador($('[id*=txt_Inciso]')[row[0].rowIndex - 1].value, -1, ['SumaAsegurada'], ['txt_LimResp']);
});

$("body").on("focusout", "[id*=gvd_Riesgo] .ValoresTotales", function (e) {
    var row = $(this).closest("tr");
    $('[id*=txt_ValoresTotalesAux]')[row[0].rowIndex - 1].value = $(this)[0].value.replace(/,/g, "");
    $(this)[0].value = fn_FormatoMonto(parseFloat($(this)[0].value.replace(/,/g, "")), 2);
    fn_SumaTotales('gvd_Riesgo', ['ValoresTotales'], ['txt_ValoresTotalesAux'], 0, [0], 0);
});

$("body").on("focusout", "[id*=gvd_Riesgo] .SumaAsegurada", function (e) {
    var row = $(this).closest("tr");

    //Solo si el valor cambia
    if ($(this)[0].value.replace(/,/g, "") != $('[id*=txt_LimRespAux]')[row[0].rowIndex - 1].value) {
        $('[id*=txt_LimRespAux]')[row[0].rowIndex - 1].value = $(this)[0].value.replace(/,/g, "");
        $(this)[0].value = fn_FormatoMonto(parseFloat($(this)[0].value.replace(/,/g, "")), 2);
        fn_SumaTotales('gvd_Riesgo', ['SumaAsegurada'], ['txt_LimRespAux'], 1, [0], 0);
        fn_CalculaCuota(row);
        fn_ActualizaGrupo(0, $('[id*=txt_Inciso]')[row[0].rowIndex - 1].value, ['SumaAsegurada'], ['txt_LimRespAux'], 1);
        fn_CalculaReparto($('[id*=txt_Inciso]')[row[0].rowIndex - 1].value, -1, ['SumaAsegurada'], ['txt_LimResp']);
        fn_CalculaDistribucionGMX($('[id*=txt_Inciso]')[row[0].rowIndex - 1].value, -1, ['SumaAsegurada'], ['txt_LimResp']);
        fn_CalculaIntermediario($('[id*=txt_Inciso]')[row[0].rowIndex - 1].value, -1, ['SumaAsegurada'], ['txt_LimResp']);
        fn_CalculaReasegurador($('[id*=txt_Inciso]')[row[0].rowIndex - 1].value, -1, ['SumaAsegurada'], ['txt_LimResp']);
    }
    
});

$("body").on("focusout", "[id*=gvd_Riesgo] .PrimaNeta", function (e) {
    var row = $(this).closest("tr");

    //Solo si el valor cambia
    if ($(this)[0].value.replace(/,/g, "") != $('[id*=txt_PrimaNetaAux]')[row[0].rowIndex - 1].value) {

        //Borra las demas Primas para Consolidarla en una Prima Neta -----------------------------------------------------------------------------
        $('[id*=txt_PrimaINCAux]')[row[0].rowIndex - 1].value = 0;
        $('[id*=txt_PrimaTEVAux]')[row[0].rowIndex - 1].value = 0;
        $('[id*=txt_PrimaFHMAux]')[row[0].rowIndex - 1].value = 0;

        $('.PrimaINC')[row[0].rowIndex - 1].value = '0.00';
        $('.PrimaTEV')[row[0].rowIndex - 1].value = '0.00';
        $('.PrimaFHM')[row[0].rowIndex - 1].value = '0.00';
        //-----------------------------------------------------------------------------------------------------------------------------------------

        $('[id*=txt_PrimaNetaAux]')[row[0].rowIndex - 1].value = $(this)[0].value.replace(/,/g, "");
        $(this)[0].value = fn_FormatoMonto(parseFloat($(this)[0].value.replace(/,/g, "")), 2);

        //Actualiza la Suma de todas las Primas
        fn_SumaTotales('gvd_Riesgo', ['PrimaNeta', 'PrimaINC', 'PrimaTEV', 'PrimaFHM'], ['txt_PrimaNetaAux', 'txt_PrimaINCAux', 'txt_PrimaTEVAux', 'txt_PrimaFHMAux'], 0, [0], 0);
        fn_CalculaCuota(row);
        fn_ActualizaGrupo(0, $('[id*=txt_Inciso]')[row[0].rowIndex - 1].value, ['PrimaNeta', 'PrimaINC', 'PrimaTEV', 'PrimaFHM'], ['txt_PrimaNetaAux', 'txt_PrimaINCAux', 'txt_PrimaTEVAux', 'txt_PrimaFHMAux'], 0)
        fn_CalculaReparto($('[id*=txt_Inciso]')[row[0].rowIndex - 1].value, -1, ['PrimaNeta', 'PrimaINC', 'PrimaTEV', 'PrimaFHM'], ['txt_PrimaNeta', 'txt_PrimaINC', 'txt_PrimaTEV', 'txt_PrimaFHM']);
        fn_CalculaDistribucionGMX($('[id*=txt_Inciso]')[row[0].rowIndex - 1].value, -1, ['PrimaNeta', 'PrimaINC', 'PrimaTEV', 'PrimaFHM'], ['txt_PrimaNeta', 'txt_PrimaINC', 'txt_PrimaTEV', 'txt_PrimaFHM']);
        fn_CalculaIntermediario($('[id*=txt_Inciso]')[row[0].rowIndex - 1].value, -1, ['PrimaNeta'], ['txt_PrimaNeta']);
        fn_CalculaReasegurador($('[id*=txt_Inciso]')[row[0].rowIndex - 1].value, -1, ['PrimaNeta'], ['txt_PrimaNeta']);
    }
});

$("body").on("focusout", "[id*=gvd_Riesgo] .PrimaINC", function (e) {
    var row = $(this).closest("tr");

    //Solo si el valor cambia
    if ($(this)[0].value.replace(/,/g, "") != $('[id*=txt_PrimaINCAux]')[row[0].rowIndex - 1].value) {

        //Consolida la Prima Neta en base al Desglose de Primas
        fn_SumaPrimas($('.PrimaNeta')[row[0].rowIndex - 1],
                      $('[id*=txt_PrimaNetaAux]')[row[0].rowIndex - 1],
                      $(this)[0].value.replace(/,/g, ""),
                      $('[id*=txt_PrimaTEVAux]')[row[0].rowIndex - 1].value,
                      $('[id*=txt_PrimaFHMAux]')[row[0].rowIndex - 1].value);

        $('[id*=txt_PrimaINCAux]')[row[0].rowIndex - 1].value = $(this)[0].value.replace(/,/g, "");
        $(this)[0].value = fn_FormatoMonto(parseFloat($(this)[0].value.replace(/,/g, "")), 2);

        //Actualiza la Suma de todas las Primas
        fn_SumaTotales('gvd_Riesgo', ['PrimaNeta', 'PrimaINC', 'PrimaTEV', 'PrimaFHM'], ['txt_PrimaNetaAux', 'txt_PrimaINCAux', 'txt_PrimaTEVAux', 'txt_PrimaFHMAux'], 0, [0], 0);
        fn_CalculaCuota(row);
        fn_ActualizaGrupo(0, $('[id*=txt_Inciso]')[row[0].rowIndex - 1].value, ['PrimaNeta', 'PrimaINC'], ['txt_PrimaNetaAux', 'txt_PrimaINCAux'], 0);
        fn_CalculaReparto($('[id*=txt_Inciso]')[row[0].rowIndex - 1].value, -1, ['PrimaNeta', 'PrimaINC'], ['txt_PrimaNeta', 'txt_PrimaINC']);
        fn_CalculaDistribucionGMX($('[id*=txt_Inciso]')[row[0].rowIndex - 1].value, -1, ['PrimaNeta', 'PrimaINC'], ['txt_PrimaNeta', 'txt_PrimaINC']);
        fn_CalculaIntermediario($('[id*=txt_Inciso]')[row[0].rowIndex - 1].value, -1, ['PrimaNeta', 'PrimaINC'], ['txt_PrimaNeta', 'txt_PrimaINC']);
        fn_CalculaReasegurador($('[id*=txt_Inciso]')[row[0].rowIndex - 1].value, -1, ['PrimaNeta', 'PrimaINC'], ['txt_PrimaNeta', 'txt_PrimaINC']);
    }
});

$("body").on("focusout", "[id*=gvd_Riesgo] .PrimaTEV", function (e) {
    var row = $(this).closest("tr");

    //Solo si el valor cambia
    if ($(this)[0].value.replace(/,/g, "") != $('[id*=txt_PrimaTEVAux]')[row[0].rowIndex - 1].value) {

        //Consolida la Prima Neta en base al Desglose de Primas
        fn_SumaPrimas($('.PrimaNeta')[row[0].rowIndex - 1],
                      $('[id*=txt_PrimaNetaAux]')[row[0].rowIndex - 1],
                      $('[id*=txt_PrimaINCAux]')[row[0].rowIndex - 1].value,
                      $(this)[0].value.replace(/,/g, ""),
                      $('[id*=txt_PrimaFHMAux]')[row[0].rowIndex - 1].value);

        $('[id*=txt_PrimaTEVAux]')[row[0].rowIndex - 1].value = $(this)[0].value.replace(/,/g, "");
        $(this)[0].value = fn_FormatoMonto(parseFloat($(this)[0].value.replace(/,/g, "")), 2);

        //Actualiza la Suma de todas las Primas
        fn_SumaTotales('gvd_Riesgo', ['PrimaNeta', 'PrimaINC', 'PrimaTEV', 'PrimaFHM'], ['txt_PrimaNetaAux', 'txt_PrimaINCAux', 'txt_PrimaTEVAux', 'txt_PrimaFHMAux'], 0, [0], 0);
        fn_CalculaCuota(row);
        fn_ActualizaGrupo(0, $('[id*=txt_Inciso]')[row[0].rowIndex - 1].value, ['PrimaNeta', 'PrimaTEV'], ['txt_PrimaNetaAux', 'txt_PrimaTEVAux'], 0)
        fn_CalculaReparto($('[id*=txt_Inciso]')[row[0].rowIndex - 1].value, -1, ['PrimaNeta', 'PrimaTEV'], ['txt_PrimaNeta', 'txt_PrimaTEV']);
        fn_CalculaDistribucionGMX($('[id*=txt_Inciso]')[row[0].rowIndex - 1].value, -1, ['PrimaNeta', 'PrimaTEV'], ['txt_PrimaNeta', 'txt_PrimaTEV']);
        fn_CalculaIntermediario($('[id*=txt_Inciso]')[row[0].rowIndex - 1].value, -1, ['PrimaNeta','PrimaTEV'], ['txt_PrimaNeta', 'txt_PrimaTEV']);
        fn_CalculaReasegurador($('[id*=txt_Inciso]')[row[0].rowIndex - 1].value, -1, ['PrimaNeta','PrimaTEV'], ['txt_PrimaNeta', 'txt_PrimaTEV']);
    }
});

$("body").on("focusout", "[id*=gvd_Riesgo] .PrimaFHM", function (e) {
    var row = $(this).closest("tr");

    //Solo si el valor cambia
    if ($(this)[0].value.replace(/,/g, "") != $('[id*=txt_PrimaFHMAux]')[row[0].rowIndex - 1].value) {

        //Consolida la Prima Neta en base al Desglose de Primas
        fn_SumaPrimas($('.PrimaNeta')[row[0].rowIndex - 1],
                      $('[id*=txt_PrimaNetaAux]')[row[0].rowIndex - 1],
                      $('[id*=txt_PrimaINCAux]')[row[0].rowIndex - 1].value,
                      $('[id*=txt_PrimaTEVAux]')[row[0].rowIndex - 1].value,
                      $(this)[0].value.replace(/,/g, ""));

        $('[id*=txt_PrimaFHMAux]')[row[0].rowIndex - 1].value = $(this)[0].value.replace(/,/g, "");
        $(this)[0].value = fn_FormatoMonto(parseFloat($(this)[0].value.replace(/,/g, "")), 2);

        //Actualiza la Suma de todas las Primas
        fn_SumaTotales('gvd_Riesgo', ['PrimaNeta', 'PrimaINC', 'PrimaTEV', 'PrimaFHM'], ['txt_PrimaNetaAux', 'txt_PrimaINCAux', 'txt_PrimaTEVAux', 'txt_PrimaFHMAux'], 0, [0], 0);
        fn_CalculaCuota(row);
        fn_ActualizaGrupo(0, $('[id*=txt_Inciso]')[row[0].rowIndex - 1].value, ['PrimaNeta', 'PrimaFHM'], ['PrimaNeta', 'txt_PrimaFHMAux'], 0);
        fn_CalculaReparto($('[id*=txt_Inciso]')[row[0].rowIndex - 1].value, -1, ['PrimaNeta', 'PrimaFHM'], ['txt_PrimaNeta', 'txt_PrimaFHM']);
        fn_CalculaDistribucionGMX($('[id*=txt_Inciso]')[row[0].rowIndex - 1].value, -1, ['PrimaNeta', 'PrimaFHM'], ['txt_PrimaNeta', 'txt_PrimaFHM']);
        fn_CalculaIntermediario($('[id*=txt_Inciso]')[row[0].rowIndex - 1].value, -1, ['PrimaNeta', 'PrimaFHM'], ['txt_PrimaNeta', 'txt_PrimaFHM']);
        fn_CalculaReasegurador($('[id*=txt_Inciso]')[row[0].rowIndex - 1].value, -1, ['PrimaNeta', 'PrimaFHM'], ['txt_PrimaNeta', 'txt_PrimaFHM']);
    }
});

$("body").on("focusout", "[id*=gvd_Riesgo] .ComAgente", function (e) {
    var row = $(this).closest("tr");

    //Solo si el valor cambia
    if ($(this)[0].value.replace(/,/g, "") != $('[id*=txt_ComAgeAux]')[row[0].rowIndex - 1].value) {
        $('[id*=txt_ComAgeAux]')[row[0].rowIndex - 1].value = $(this)[0].value.replace(/,/g, "");
        $(this)[0].value = fn_FormatoMonto(parseFloat($(this)[0].value.replace(/,/g, "")), 2);
        fn_SumaTotales('gvd_Riesgo', ['ComAgente'], ['txt_ComAgeAux'], 0, [0], 0);
    }
    
});

$("body").on("focusout", "[id*=gvd_Riesgo] .ComAgenteAdi", function (e) {
    var row = $(this).closest("tr");

    if ($(this)[0].value.replace(/,/g, "") != $('[id*=txt_ComAdiAgeAux]')[row[0].rowIndex - 1].value) {
        $('[id*=txt_ComAdiAgeAux]')[row[0].rowIndex - 1].value = $(this)[0].value.replace(/,/g, "");
        $(this)[0].value = fn_FormatoMonto(parseFloat($(this)[0].value.replace(/,/g, "")), 4);
        fn_SumaTotales('gvd_Riesgo', 'ComAgenteAdi', 'txt_ComAdiAgeAux', 0, [0]);
    }
    
});

$("body").on("focusout", "[id*=gvd_Riesgo] .FeeGMX", function (e) {
    var row = $(this).closest("tr");

    if ($(this)[0].value.replace(/,/g, "") != $('[id*=txt_FeeGmxAux]')[row[0].rowIndex - 1].value) {
        $('[id*=txt_FeeGmxAux]')[row[0].rowIndex - 1].value = $(this)[0].value.replace(/,/g, "");
        $(this)[0].value = fn_FormatoMonto(parseFloat($(this)[0].value.replace(/,/g, "")), 2);
        fn_SumaTotales('gvd_Riesgo', ['FeeGMX'], ['txt_FeeGmxAux'], 0, [0], 0);
    }
    
});

$("body").on("focusout", "[id*=gvd_Riesgo] .ComFac", function (e) {
    var row = $(this).closest("tr");

    if ($(this)[0].value.replace(/,/g, "") != $('[id*=txt_ComFacAux]')[row[0].rowIndex - 1].value) {
        $('[id*=txt_ComFacAux]')[row[0].rowIndex - 1].value = $(this)[0].value.replace(/,/g, "");
        $(this)[0].value = fn_FormatoMonto(parseFloat($(this)[0].value.replace(/,/g, "")), 2);
        fn_SumaTotales('gvd_Riesgo', ['ComFac'], ['txt_ComFacAux'], 0, [0], 0);
    }
    
});


//Agrupaciones
$("body").on("focusout", "[id*=gvd_Distribucion] .PrcPart", function (e) {
    var row = $(this).closest("tr");

    var ArrayCalculo = [0, 1, 2];

    //Aplica para la Distribución de GMX y Coaseguradores
    if (ArrayCalculo.indexOf(row[0].rowIndex - 1) != -1) {
        fn_CalculaReparto(-1, row[0].rowIndex - 1, ['SumaAsegurada', 'PrimaNeta', 'PrimaINC' , 'PrimaTEV', 'PrimaFHM'], ['txt_LimResp', 'txt_PrimaNeta' , 'txt_PrimaINC' , 'txt_PrimaTEV', 'txt_PrimaFHM']);
        fn_CalculaDistribucionGMX(-1, -1, ['SumaAsegurada', 'PrimaNeta', 'PrimaINC', 'PrimaTEV', 'PrimaFHM'], ['txt_LimResp', 'txt_PrimaNeta', 'txt_PrimaINC', 'txt_PrimaTEV', 'txt_PrimaFHM']);
        fn_CalculaIntermediario(-1, -1, ['SumaAsegurada', 'PrimaNeta', 'PrimaINC', 'PrimaTEV', 'PrimaFHM'], ['txt_LimResp', 'txt_PrimaNeta', 'txt_PrimaINC', 'txt_PrimaTEV', 'txt_PrimaFHM']);
        fn_CalculaReasegurador(-1, -1, ['SumaAsegurada', 'PrimaNeta', 'PrimaINC', 'PrimaTEV', 'PrimaFHM'], ['txt_LimResp', 'txt_PrimaNeta', 'txt_PrimaINC', 'txt_PrimaTEV', 'txt_PrimaFHM']);
    }

    $(this)[0].value = fn_FormatoMonto(parseFloat($(this)[0].value.replace(/,/g, "")), 4 , 1);
});



$("body").on("focusout", "[id*=gvd_Distribucion] .PrcPartGMX", function (e) {
    var row = $(this).closest("tr");

    fn_CalculaDistribucionGMX(-1, row[0].rowIndex - 1, ['SumaAsegurada', 'PrimaNeta', 'PrimaINC', 'PrimaTEV', 'PrimaFHM'], ['txt_LimResp', 'txt_PrimaNeta', 'txt_PrimaINC', 'txt_PrimaTEV', 'txt_PrimaFHM']);

    $(this)[0].value = fn_FormatoMonto(parseFloat($(this)[0].value.replace(/,/g, "")), 4, 1);
});


//Calculo de la DIstribución General con Coaseguro
function fn_CalculaReparto(Inciso, Posicion, Clase, Control) {
    var Index = $("input[id$='hid_IndiceGrupo']")[0].value;

    //Si existe agrupación seleccionada
    if (Index > -1) {
        var Incisos = $("[id*=gvd_Agrupacion] .Incisos")[Index].value.split(',');

        //Si se trata de la AGrupación en Pantalla
        if (Incisos.indexOf(Inciso.toString()) != -1) {
            if (Posicion > -1) {
                var ArrayCalculo = [Posicion];
            }
            else {
                var ArrayCalculo = [0, 1, 2];
            }

            for (pos = 0; pos < ArrayCalculo.length; pos++) {
                Posicion = ArrayCalculo[pos];
                var Prc = $("[id*=gvd_Distribucion] .PrcPart")[Posicion].value
                for (i = 0; i < Clase.length; i++) {
                    $("[id*=gvd_Distribucion]").find("[id*=" + Control[i] + "Aux]")[Posicion].value = $("[id*=gvd_Agrupacion]").find("[id*=" + Control[i] + "Aux]")[Index].value * (Prc / 100);
                    $("[id*=gvd_Distribucion] ." + Clase[i])[Posicion].value = fn_FormatoMonto(parseFloat($("[id*=gvd_Distribucion]").find("[id*=" + Control[i] + "Aux]")[Posicion].value), 2);
                }
            }
            fn_SumaTotales('gvd_Distribucion', ['PrcPart', 'SumaAsegurada', 'PrimaNeta', 'PrimaINC', 'PrimaTEV', 'PrimaFHM'], ['txt_PrcPart', 'txt_LimRespAux', 'txt_PrimaNetaAux', 'txt_PrimaINCAux', 'txt_PrimaTEVAux', 'txt_PrimaFHMAux'], 0, [3, 4, 5, 6, 7, 8, 9, 10], 3);
        }
    }
}


//Calculo de la Distribución correspondiente a GMX
function fn_CalculaDistribucionGMX(Inciso, Posicion, Clase, Control) {
    var Index = $("input[id$='hid_IndiceGrupo']")[0].value;

    //Si existe agrupación seleccionada
    if (Index > -1) {
        var Incisos = $("[id*=gvd_Agrupacion] .Incisos")[Index].value.split(',');

        if (Incisos.indexOf(Inciso.toString()) != -1) {
            if (Posicion > -1) {
                var ArrayCalculo = [Posicion];
            }
            else {
                var ArrayCalculo = [5, 6, 7, 8, 9];
            }

            for (pos = 0; pos < ArrayCalculo.length; pos++) {
                Posicion = ArrayCalculo[pos];
                var Prc = $("[id*=gvd_Distribucion] .PrcPartGMX")[Posicion].value
                
                for (i = 0; i < Clase.length; i++) {
                    $("[id*=gvd_Distribucion]").find("[id*=" + Control[i] + "Aux]")[Posicion].value = $("[id*=gvd_Distribucion]").find("[id*=" + Control[i] + "Aux]")[0].value * (Prc / 100);
                    $("[id*=gvd_Distribucion] ." + Clase[i])[Posicion].value = fn_FormatoMonto(parseFloat($("[id*=gvd_Distribucion]").find("[id*=" + Control[i] + "Aux]")[Posicion].value), 2);
                }

                $("[id*=gvd_Distribucion] .PrcPart")[Posicion].value = fn_FormatoMonto(parseFloat(($("[id*=gvd_Distribucion]").find("[id*=" + Control[0] + "Aux]")[Posicion].value / $("[id*=gvd_Distribucion]").find("[id*=" + Control[0] + "Aux]")[3].value) * 100), 4);

            }
            fn_SumaTotales('gvd_Distribucion', ['SumaAsegurada', 'PrimaNeta', 'PrimaINC', 'PrimaTEV', 'PrimaFHM'], ['txt_LimRespAux', 'txt_PrimaNetaAux', 'txt_PrimaINCAux', 'txt_PrimaTEVAux', 'txt_PrimaFHMAux'], 0, [0, 1, 2, 3, 4, 10], 10);
        }
    }
}

//Procesos Auxiliares

$("body").on("focusout", ".Observaciones", function (e) {
    var Index = $("input[id$='hid_IndiceBroker']")[0].value;

    //SI existe Broker Seleccionado
    if (Index > -1) {
        if ($("[id*=gvd_Intermediario] .Clave")[Index].innerText == 0) {
            var Index = $("input[id$='hid_IndiceReas']")[0].value;
            if (Index > -1) {
                $("[id*=gvd_Reasegurador] .Observaciones")[Index].value = $(this)[0].value;
            }
        }
        else {
            $("[id*=gvd_Intermediario] .Observaciones")[Index].value = $(this)[0].value;
        }
    }
});


$("body").on("focusout", ".PrcComNeta", function (e) {
    var row = $(this).closest("tr");
    fn_CaluculaComPNR(row[0].rowIndex - 1, ["Neta"]);
});

$("body").on("focusout", ".PrcComINC", function (e) {
    var row = $(this).closest("tr");
    fn_CaluculaComPNR(row[0].rowIndex - 1, ["INC"]);
});

$("body").on("focusout", ".PrcComTEV", function (e) {
    var row = $(this).closest("tr");
    fn_CaluculaComPNR(row[0].rowIndex - 1, ["TEV"]);
});

$("body").on("focusout", ".PrcComFHM", function (e) {
    var row = $(this).closest("tr");
    fn_CaluculaComPNR(row[0].rowIndex - 1, ["FHM"]);
});

//Porcentaje de Participación Intermediarios
$("body").on("focusout", "[id*=gvd_Intermediario] .PrcPart", function (e) {
    var row = $(this).closest("tr");
    fn_CalculaIntermediario(-1, row[0].rowIndex - 1, ['SumaAsegurada', 'PrimaNeta', 'PrimaINC', 'PrimaTEV', 'PrimaFHM'], ['txt_LimResp', 'txt_PrimaNeta', 'txt_PrimaINC', 'txt_PrimaTEV', 'txt_PrimaFHM']);
    fn_CalculaReasegurador(-1, -1, ['SumaAsegurada', 'PrimaNeta', 'PrimaINC', 'PrimaTEV', 'PrimaFHM'], ['txt_LimResp', 'txt_PrimaNeta', 'txt_PrimaINC', 'txt_PrimaTEV', 'txt_PrimaFHM']);
    $(this)[0].value = fn_FormatoMonto(parseFloat($(this)[0].value.replace(/,/g, "")), 4, 1);
});

//Porcentaje de Participación Reaseguradores
$("body").on("focusout", "[id*=gvd_Reasegurador] .PrcPart", function (e) {
    var row = $(this).closest("tr");
    fn_CalculaReasegurador(-1, row[0].rowIndex - 1, ['SumaAsegurada', 'PrimaNeta', 'PrimaINC', 'PrimaTEV', 'PrimaFHM'], ['txt_LimResp', 'txt_PrimaNeta', 'txt_PrimaINC', 'txt_PrimaTEV', 'txt_PrimaFHM']);
    $(this)[0].value = fn_FormatoMonto(parseFloat($(this)[0].value.replace(/,/g, "")), 4, 1);
});


$("body").on("focusout", "[id*=gvd_Intermediario] .PrcCorretaje", function (e) {
    var row = $(this).closest("tr");
    fn_CalculaCorretaje(row[0].rowIndex - 1, $(this)[0]);
});


function fn_CaluculaComPNR(Posicion, ArrayTipo) {
    var Index = $("input[id$='hid_IndiceBroker']")[0].value;
    var grid = '';

    //SI se trata de un Negocio Directo o por Intermediario
    if ($("[id*=gvd_Intermediario] .Clave")[Index].innerText == 0) {
        var Index = $("input[id$='hid_IndiceReas']")[0].value;
        if (Index > -1) {
            grid = "[id*=gvd_Reasegurador]";
        }
    }
    else {
        grid = "[id*=gvd_Intermediario]";
    }

    if (grid != '') {
        var Prima = 0;
        var Comision = 0;
        var PNR = 0;
        for (i = 0; i <= ArrayTipo.length - 1; i++) {
            $(grid).find("[id*=txt_PrcCom" + ArrayTipo[i] + "]")[Index].value = $(".PrcCom" + ArrayTipo[i])[0].value;
            Prima = $(grid).find("[id*=txt_Prima" + ArrayTipo[i] + "Aux]")[Index].value;
            Comision = Prima * ($(".PrcCom" + ArrayTipo[i])[0].value / 100);
            PNR = Prima - Comision;

            $(grid).find("[id*=txt_Com" + ArrayTipo[i] + "]")[Index].value = Comision;
            $(grid).find("[id*=txt_Pnr" + ArrayTipo[i] + "]")[Index].value = PNR;

            $(".PrcCom" + ArrayTipo[i])[0].value = fn_FormatoMonto(parseFloat($(".PrcCom" + ArrayTipo[i])[0].value), 4, 1)
            $(".Com" + ArrayTipo[i])[0].value = fn_FormatoMonto(parseFloat(Comision), 2);
            $("[id*=txt_Com" + ArrayTipo[i] + "Aux]")[0].value = Comision;
            $(".Pnr" + ArrayTipo[i])[0].value = fn_FormatoMonto(parseFloat(PNR), 2);
        }
    }
}

//Calculo del Corretaje
function fn_CalculaCorretaje(Posicion, Prc) {
    if ($("[id*=gvd_Intermediario] .Clave")[Posicion].innerText > 0) {
        $("[id*=gvd_Intermediario]").find("[id*=txt_CorretajeAux]")[Posicion].value = $("[id*=gvd_Intermediario]").find("[id*=txt_PrimaNetaAux]")[Posicion].value * (Prc.value / 100);
        $("[id*=gvd_Intermediario] .Corretaje")[Posicion].value = fn_FormatoMonto(parseFloat($("[id*=gvd_Intermediario]").find("[id*=txt_CorretajeAux]")[Posicion].value), 2);
        Prc.value = fn_FormatoMonto(parseFloat(Prc.value), 4, 1)
    }
}

//Calculo de la Distribución correspondiente a GMX
function fn_CalculaIntermediario(Inciso, Posicion, Clase , Control) {
    var Index = $("input[id$='hid_IndiceGrupo']")[0].value;
   
    
    //Si existe agrupación seleccionada
    if (Index > -1) {
        var Incisos = $("[id*=gvd_Agrupacion] .Incisos")[Index].value.split(',');
        var inicio = 0;
        var fin = -1;

        if (Incisos.indexOf(Inciso.toString()) != -1) {

            if (Posicion > -1) {
                inicio = Posicion;
                fin = Posicion;
            }
            else {
                inicio = 0;
                fin = $("[id*=gvd_Intermediario] tr").length - 2;
            }

            for (Posicion = inicio; Posicion <= fin; Posicion++) {
                var Prc = $("[id*=gvd_Intermediario] .PrcPart")[Posicion].value

                for (i = 0; i < Clase.length; i++) {
                    $("[id*=gvd_Intermediario]").find("[id*=" + Control[i] + "Aux]")[Posicion].value = $("[id*=gvd_Distribucion]").find("[id*=" + Control[i] + "Aux]")[3].value * (Prc / 100);
                    $("[id*=gvd_Intermediario] ." + Clase[i])[Posicion].value = fn_FormatoMonto(parseFloat($("[id*=gvd_Intermediario]").find("[id*=" + Control[i] + "Aux]")[Posicion].value), 2);
                }
                //Calculo de Corretaje
                fn_CalculaCorretaje(Posicion, $("[id*=gvd_Intermediario] .PrcCorretaje")[Posicion]);

                //Calculo de Comisiones
                fn_CaluculaComPNR(Posicion, ['Neta', 'INC', 'TEV', 'FHM']);
            }
        }
    }
}

function fn_CalculaReasegurador(Inciso, Posicion, Clase, Control) {
    var Index = $("input[id$='hid_IndiceGrupo']")[0].value;
    var IndexBroker = $("input[id$='hid_IndiceBroker']")[0].value;

    //Si existe agrupación seleccionada
    if (Index > -1) {
        var Incisos = $("[id*=gvd_Agrupacion] .Incisos")[Index].value.split(',');
        var inicio = 0;
        var fin = -1;

        if (Incisos.indexOf(Inciso.toString()) != -1) {

            if (Posicion > -1) {
                inicio = Posicion;
                fin = Posicion;
            }
            else {
                inicio = 0;
                fin = $("[id*=gvd_Reasegurador] tr").length - 2;
            }

            for (Posicion = inicio; Posicion <= fin; Posicion++) {
                var Prc = $("[id*=gvd_Reasegurador] .PrcPart")[Posicion].value

                for (i = 0; i < Clase.length; i++) {
                    $("[id*=gvd_Reasegurador]").find("[id*=" + Control[i] + "Aux]")[Posicion].value = $("[id*=gvd_Intermediario]").find("[id*=" + Control[i] + "Aux]")[IndexBroker].value * (Prc / 100);
                    $("[id*=gvd_Reasegurador] ." + Clase[i])[Posicion].value = fn_FormatoMonto(parseFloat($("[id*=gvd_Reasegurador]").find("[id*=" + Control[i] + "Aux]")[Posicion].value), 2);
                }

                //Calculo de Comisiones
                fn_CaluculaComPNR(Posicion, ['Neta', 'INC', 'TEV', 'FHM']);
            }
        }
    }
}

//---------------------------------------------------------------------------------------------------------------------------------------------------------------

//Responsable
$("body").on("keydown", "[id$=txt_SearchResp]", function (e) {
    if (e.which == 9) {
        $('.Esquema').focus();
        return false;
    }
    fn_Autocompletar("Usu", "txt_ClaveResp", "txt_SearchResp", "", 2, e.which)
});


//----------------------------------------------------------------------------------------------------------------------
$("body").on("focus", ".Seleccion", function (e) {
    fn_Seleccion(this);
});

$("body").on("focus", "[id$=gvd_Compañia] .Seleccion", function (e) {
    fn_Seleccion(this);
});

$("body").on("focusout", "[id$=gvd_Compañia] .Prc", function (e) {
    var Prc = parseFloat($(this)[0].value.replace(",", "").replace(",", ""))
    $(this)[0].value = fn_FormatoMonto(Prc, 2);
});
//---------------------------------------------------------------

//-----------------------------------------------------EVENTOS FOCUSOUT-------------------------------------------
////Busqueda de Producto por Clave
//$("body").on("focusout", "[id$=txt_ClaveRam]", function (e) {
//    $.ajax({
//        url: "../LocalServices/ConsultaBD.asmx/GetProducto",
//        data: "{ 'Id': " + Id + "}",
//        dataType: "json",
//        type: "POST",
//        contentType: "application/json; charset=utf-8",
//        success: function (data) {
//            $("input[id$='txt_SearchRam']")[0].value = data.d;
//        },
//        error: function (response) {
//            fn_MuestraMensaje('JSON', response.responseText, 2);
//        },
//    });
//});



$("body").on("focusout", "[id$=txt_SearchAse]", function (e) {
    fn_EvaluaAutoComplete('txt_ClaveAseg', 'txt_SearchAse');
});

$("body").on("focusout", "[id$=txt_SearchGiro]", function (e) {
    fn_EvaluaAutoComplete('txt_ClaveGiro', 'txt_SearchGiro');
});

$("body").on("focusout", "[id$=txt_SearchResp]", function (e) {
    fn_EvaluaAutoComplete('txt_ClaveResp', 'txt_SearchResp');
});


$("body").on("click", "[id*=gvd_Monitor] .Folio", function () {
    event.preventDefault ? event.preventDefault() : event.returnValue = false;
    var row = $(this).closest("tr");
    var Folio = row.find('.Folio');

    if (Folio[0].text != '0') {
        window.open("Gestion.aspx?Folio=" + Folio[0].text);
    }
});

//Delete event handler.
$("body").on("click", "[id*=gvd_Compañia] .dropdown-toggle", function () {
    var row = $(this).closest("tr");
    var pos = $(this).position();

  
    var Intermediario1 = row.find('.Intermediario1');

    var Intermediario2 = row.find('.Intermediario2');

    $(Intermediario2)[0].innerText = $(Intermediario1)[0].innerText;

    var menu = row.find('.dropdown-menu');
    $(menu).css("top", pos.top + 293);
    $(this).dropdown();
});


$("body").on("change", "[id*=gvd_Tablero] .FecFin", function () {
    var row = $(this).closest("tr");
    var FecIni = row.find('.FecIni');
    var Lapso = row.find('.Lapso');
    var LapsoAux = row.find('.LapsoAux');
    
    if (fn_IsDate($(this)[0].value) == true && fn_IsDate($(FecIni)[0].value) == true) {
        $(Lapso)[0].innerText = fn_DateDiff($(FecIni)[0].value, $(this)[0].value, 'day')
    }
    else {
        $(Lapso)[0].innerText = '0';
    }
    
    $(LapsoAux)[0].value = $(Lapso)[0].innerText;
});


$("body").on("change", "[id*=gvd_Tablero] .FecIni", function () {
    var row = $(this).closest("tr");
    var FecFin = row.find('.FecFin');
    var Lapso = row.find('.Lapso');
    var LapsoAux = row.find('.LapsoAux');

    if (fn_IsDate($(this)[0].value) == true && fn_IsDate($(FecFin)[0].value) == true) {
        $(Lapso)[0].innerText = fn_DateDiff($(this)[0].value, $(FecFin)[0].value, 'day');
    }
    else {
        $(Lapso)[0].innerText = '0';
    }
    
    $(LapsoAux)[0].value = $(Lapso)[0].innerText;
});


function fn_ActualizaLapso() {
    $("[id*=gvd_Tablero] tr").each(function (e) {
        var row = $(this).closest("tr");
        var Lapso = row.find('.Lapso');
        var LapsoAux = row.find('.LapsoAux');
        if ($(Lapso)[0] != undefined && $(LapsoAux)[0] != undefined) {
            $(Lapso)[0].innerText = $(LapsoAux)[0].value;
        }
    });
}


//Click para Selección
function fn_ClickGrid(row,prefijo) {
    var Seleccion = row.find('.Seleccion');
    var Detalle = row.find('.Detalle');

    if ($('[id*=txt_Sel' + prefijo + ']')[row[0].rowIndex].value == "0") {
        $('[id*=txt_Sel' + prefijo + ']')[row[0].rowIndex].value = "1"

        $(Seleccion).css("background-color", "lightgreen");

        if (Detalle.length > 0) {
            $(Detalle).css("display", "block");
        }
    }
    else {
        $('[id*=txt_Sel' + prefijo + ']')[row[0].rowIndex].value = "0"
        $(Seleccion).css("background-color", "white");

        if (Detalle.length > 0) {
            $(Detalle).css("display", "none");
        }

        if ($("input[id$='hid_Ramo']")[0].value == row[0].rowIndex && prefijo == 'Ram') {
            $("[id*=gvd_Seccion]").not($("[id*=gvd_Seccion] tr:first")).remove();
            $("[id*=gvd_Cobertura]").not($("[id*=gvd_Cobertura] tr:first")).remove();
        }
        else if ($("input[id$='hid_Seccion']")[0].value == row[0].rowIndex && prefijo == 'Rie') {
            $("[id*=gvd_Cobertura]").not($("[id*=gvd_Cobertura] tr:first")).remove();
        }
    }
}

//Desplazamiento de Mouse
function fn_MouseOverGrid(row, prefijo, boton) {
    if (boton == 1 && LeftClick == 1) {
        if ($('[id*=txt_Sel' + prefijo + ']')[row[0].rowIndex].value == "0") {
            $('[id*=txt_Sel' + prefijo + ']')[row[0].rowIndex].value = "1"

            var Seleccion = row.find('.Seleccion');
            $(Seleccion).css("background-color", "lightgreen");

            var Detalle = row.find('.Detalle');
            if (Detalle.length > 0) {
                $(Detalle).css("display", "block");
            }
        }
    }
}


//Ramos y Subramos
$("body").on("mousedown", "[id*=gvd_RamoSbr] .Seleccion", function (e) {
    event.preventDefault ? event.preventDefault() : event.returnValue = false;
    if (e.which == 1) {
        LeftClick = 1;
        fn_ClickGrid($(this).closest("tr"), 'Ram');
    }
});

$("body").on("mouseover", "[id*=gvd_RamoSbr] .Seleccion", function (e) {
    event.preventDefault ? event.preventDefault() : event.returnValue = false;
    fn_MouseOverGrid($(this).closest("tr"), 'Ram', e.which);
});


//Secciones
$("body").on("mousedown", "[id*=gvd_Seccion] .Seleccion", function (e) {
    event.preventDefault ? event.preventDefault() : event.returnValue = false;
    if (e.which == 1) {
        LeftClick = 1;
        fn_ClickGrid($(this).closest("tr"), 'Rie');
    }
});

$("body").on("mouseover", "[id*=gvd_Seccion] .Seleccion", function (e) {
    event.preventDefault ? event.preventDefault() : event.returnValue = false;
    fn_MouseOverGrid($(this).closest("tr"), 'Rie', e.which);
});


//Coberturas
$("body").on("mousedown", "[id*=gvd_Cobertura] .Seleccion", function (e) {
    event.preventDefault ? event.preventDefault() : event.returnValue = false;
    if (e.which == 1) {
        LeftClick = 1;
        fn_ClickGrid($(this).closest("tr"), 'Cob');
    }
});

$("body").on("mouseover", "[id*=gvd_Cobertura] .Seleccion", function (e) {
    event.preventDefault ? event.preventDefault() : event.returnValue = false;
    fn_MouseOverGrid($(this).closest("tr"), 'Cob', e.which);
});


function fn_EstadoSeleccionGrid(Grid,prefijo) {
    $("[id*=" + Grid + "] tr").each(function (e) {
        var row = $(this).closest("tr");
        if ($('[id*=txt_Sel' + prefijo + ']')[row[0].rowIndex] != undefined) {
            if ($('[id*=txt_Sel' + prefijo + ']')[row[0].rowIndex].value == "1") {
                var Seleccion = row.find('.Seleccion');
                var Detalle = row.find('.Detalle');
                $(Seleccion).css("background-color", "lightgreen");

                if (Detalle.length > 0) {
                    $(Detalle).css("display", "block");
                }
            }
        }
    });
}










