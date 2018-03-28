function PageLoadMemoria() {
    LeftClick = 0;

    fn_EstadoSeleccionGrid('gvd_RamoSbr', 'Ram');
    fn_EstadoSeleccionGrid('gvd_Seccion', 'Rie');
    fn_EstadoSeleccionGrid('gvd_Cobertura', 'Cob');
}


$("body").on("mouseup", "", function (e) {
    LeftClick = 0;
});

//Click para Selección
function fn_ClickGrid(row, prefijo) {
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

function fn_EstadoSeleccionGrid(Grid, prefijo) {
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



//Asegurado
$("body").on("keydown", "[id$=txt_SearchAse]", function (e) {
    fn_Autocompletar("Ase", "txt_ClaveAseg", "txt_SearchAse", "", 3, e.which)
});

$("body").on("focusout", "[id$=txt_SearchAse]", function (e) {
    fn_EvaluaAutoComplete('txt_ClaveAseg', 'txt_SearchAse');
});

//Oficina
$("body").on("keydown", "[id$=txt_SearchOfi]", function (e) {
    if (e.which == 9) {
        $("input[id$='txt_ClaveTag']").focus();
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


//Tipo Agente
$("body").on("keydown", "[id$=txt_SearchTag]", function (e) {
    if (e.which == 9) {
        $("input[id$='txt_ClaveAge']").focus();
        return false;
    }
    fn_Autocompletar("Tag", "txt_ClaveTag", "txt_SearchTag", "", 0, e.which)
});

$("body").on("focusout", "[id$=txt_SearchTag]", function () {
    var blnClear = 0;

    if ($(this)[0].value == '') {
        $("input[id$='txt_ClaveTag']")[0].value = ''
        blnClear = 1
    }
    else if ($("input[id$='txt_ClaveTag']")[0].value != $("input[id$='txt_ClaveTagAux']")[0].value) {
        $("input[id$='txt_ClaveTagAux']")[0].value = $("input[id$='txt_ClaveTag']")[0].value;
        blnClear = 1;
    }

    if (blnClear == 1) {
        $("input[id$='txt_ClaveAge']")[0].value = '';
        $("input[id$='txt_SearchAge']")[0].value = '';
    }

    fn_EvaluaAutoComplete('txt_ClaveTag', 'txt_SearchTag');
});

$("body").on("focus", "[id$=txt_SearchTag]", function () {
    fn_Autocompletar("Tag", "txt_ClaveTag", "txt_SearchTag", "", 0, -1)
    $(this).trigger({
        type: "keydown",
        which: 46
    });
});

//Agente
$("body").on("keydown", "[id$=txt_SearchAge]", function (e) {
    if (e.which == 9) {
        $("input[id$='txt_SearchSusc']").focus();
        return false;
    }

    if ($("input[id$='txt_ClaveTag']")[0].value != '') {
        fn_Autocompletar("Age", "txt_ClaveAge", "txt_SearchAge", " AND cod_tipo_agente = " + $("input[id$='txt_ClaveTag']")[0].value, 2, e.which)
    }
});

$("body").on("focusout", "[id$=txt_SearchAge]", function () {
    if ($(this)[0].value == '') {
        $("input[id$='txt_ClaveAge']")[0].value = ''
    }
    fn_EvaluaAutoComplete('txt_ClaveAge', 'txt_SearchAge');

});

//Suscriptor
$("body").on("keydown", "[id$=txt_SearchSusc]", function (e) {
    if (e.which == 9) {
        $("input[id$='txt_SearchGre']").focus();
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


//Sucursal de Poliza
$("body").on("keydown", "[id$=txt_SearchSuc]", function (e) {
    if (e.which == 9) {
        $("input[id$='txt_ClaveRam']").focus();
        return false;
    }
    fn_Autocompletar("Suc", "txt_ClaveSuc", "txt_SearchSuc", "", 0, e.which)
});

$("body").on("focusout", "[id$=txt_SearchSuc]", function () {
    if ($(this)[0].value == '') {
        $("input[id$='txt_ClaveSuc']")[0].value = ''
    }
});

$("body").on("focus", "[id$=txt_SearchSuc]", function () {
    fn_Autocompletar("Suc", "txt_ClaveSuc", "txt_SearchSuc", "", 0, -1)
    $(this).trigger({
        type: "keydown",
        which: 46
    });
});

//Ramo de Poliza
$("body").on("keydown", "[id$=txt_SearchRam]", function (e) {
    if (e.which == 9) {
        $("input[id$='txt_NroPoliza']").focus();
        return false;
    }
    fn_Autocompletar("Pro", "txt_ClaveRam", "txt_SearchRam", "", 0, e.which)
});

$("body").on("focusout", "[id$=txt_SearchRam]", function () {
    if ($(this)[0].value == '') {
        $("input[id$='txt_ClaveRam']")[0].value = ''
    }
});

$("body").on("focus", "[id$=txt_SearchRam]", function () {
    fn_Autocompletar("Pro", "txt_ClaveRam", "txt_SearchRam", "", 0, -1)
    $(this).trigger({
        type: "keydown",
        which: 46
    });
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


//Busqueda de Sucursal por Clave
$("body").on("focusout", "[id$=txt_ClaveSuc]", function (e) {
    var Id = $(this)[0].value;
    if (Id == '') {
        $("input[id$='txt_SearchSuc']")[0].value = '';
    }
    else {
        $.ajax({
            url: "../LocalServices/ConsultaBD.asmx/GetSucursal",
            data: "{ 'Id': " + Id + "}",
            dataType: "json",
            type: "POST",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                $("input[id$='txt_SearchSuc']")[0].value = data.d;
            },
            error: function (response) {
                fn_MuestraMensaje('JSON', response.responseText, 2);
            },
        });
    }
});


//Busqueda de Producto por Clave
$("body").on("focusout", "[id$=txt_ClaveRam]", function (e) {
    var Id = $(this)[0].value;
    if (Id == '') {
        $("input[id$='txt_SearchRam']")[0].value = '';
    }
    else {
        $.ajax({
            url: "../LocalServices/ConsultaBD.asmx/GetProducto",
            data: "{ 'Id': " + Id + "}",
            dataType: "json",
            type: "POST",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                $("input[id$='txt_SearchRam']")[0].value = data.d;
            },
            error: function (response) {
                fn_MuestraMensaje('JSON', response.responseText, 2);
            },
        });
    }
});