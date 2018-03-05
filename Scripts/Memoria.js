function PageLoadMemoria() {
    gridviewScroll()

    LeftClick = 0;

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