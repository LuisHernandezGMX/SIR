////////////////////////////////////////////////////////////////////EVENTO EXPANDIR-CONTRAER/////////////////////////////////////

//Colapsar Ventana
$("body").on("click", ".contraer", function () {
    event.preventDefault ? event.preventDefault() : event.returnValue = false;
    var id = this.id.replace('coVentana', '');
    fn_CambiaEstado(id, "1");
});

//Expandir Ventana
$("body").on("click", ".expandir", function () {
    event.preventDefault ? event.preventDefault() : event.returnValue = false;
    var id = this.id.replace('exVentana', '');
    fn_CambiaEstado(id, "0");
});

/******************************************************************** FUNCIONES GENERALES ********************************************************************/

// Aceptar solamente números en campo de texto
// URL: https://stackoverflow.com/questions/13952686/how-to-make-html-input-tag-only-accept-numerical-values
function soloNumeros(ev) {
    var charCode = ev.which ? ev.which : event.keyCode;

    return !((charCode > 31) && (charCode != 46 &&(charCode < 48 || charCode > 57)));
}

// Habilitar input para Monto Máximo para Pago Automático de Siniestro.
$('input[name="siniestros"]').change(function () {
    var idRadio = $(this).attr("id");

    if (idRadio === "rdbSiniestro100") {
        $("#txtPagoAutomaticoSiniestro").val("");
        $("#txtPagoAutomaticoSiniestro").prop("disabled", true);
        $("#montoMaximoSiniestro").text("0.00");
    } else {
        $("#txtPagoAutomaticoSiniestro").prop("disabled", false);
    }
});

// Calcular Monto máximo para pago automático de siniestro
// keyCode === 46 || 190 === .
// keyCode === 8 === BACKSPACE
$("#txtPagoAutomaticoSiniestro").keyup(function (ev) {
    var campoTexto = $(this);

    if (ev.keyCode === 46 || ev.keyCode === 190) {
        return true;
    } else if (ev.keyCode === 8) {
        if (campoTexto.val() == "") {
            $("#montoMaximoSiniestro").text("0.00");

            return false;
        }
    } else if (!soloNumeros(ev)) {
        var texto = campoTexto.val().replace(/[^(0-9.|\.)]/g, "");
        campoTexto.val(texto);

        return false;
    }

    var argumentos = {
        montoParticipacion: campoTexto.attr("data-monto"),
        porcentaje: $("#txtPagoAutomaticoSiniestro").val()
    };

    $.ajax({
        url: "CoaseguroLider.aspx/CalcularMontoPorcentaje",
        type: "POST",
        data: JSON.stringify(argumentos),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            var data = response.d;

            if (data.Status) {
                $("#montoMaximoSiniestro").text(data.Mensaje);
            } else {
                alert(data.Mensaje);
            }
        }
    });
});

// Calcular monto por Fee por administración
$(".txtPorcentajeFee").keyup(function (ev) {
    var campoTexto = $(this);

    if (ev.keyCode === 46 || ev.keyCode === 190) {
        return true;
    } else if (ev.keyCode === 8) {
        if (campoTexto.val() == "") {
            var tdMontoComision = campoTexto.parent().parent().children(".monto-comision-td")[0];
            var span = $(tdMontoComision).children(".monto-comision")[0];

            $(span).text("0.00");
            return false;
        }
    } else if (!soloNumeros(ev)) {
        var texto = campoTexto.val().replace(/[^(0-9.|\.)]/g, "");
        campoTexto.val(texto);

        return false;
    }

    var argumentos = {
        montoParticipacion: campoTexto.attr("data-monto"),
        porcentaje: campoTexto.val()
    };

    $.ajax({
        url: "CoaseguroLider.aspx/CalcularMontoPorcentaje",
        type: "POST",
        data: JSON.stringify(argumentos),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            var data = response.d;

            if (data.Status) {
                var tdMontoComision = campoTexto.parent().parent().children(".monto-comision-td")[0];
                var span = $(tdMontoComision).children(".monto-comision")[0];

                $(span).text(data.Mensaje);
            } else {
                alert(data.Mensaje);
            }
        }
    });
});
/******************************************************************** FUNCIONES GENERALES ********************************************************************/

/******************************************************************** COASEGURO SEGUIDOR ********************************************************************/

// Capturar Límite Máximo de Responsabilidad al 100%
// Modificar este campo de texto modifica los valores dependientes en la página en cascada
$("#txtLimiteMaximoResponsabilidad").keyup(function (ev) {
    var campoTexto = $(this);

    if (ev.keyCode === 46 || ev.keyCode === 190) {
        return true;
    } else if (!soloNumeros(ev)) {
        var texto = campoTexto.val().replace(/[^(0-9.|\.)]/g, "");
        campoTexto.val(texto);

        return false;
    }

    // TODO: Cambiar todos los porcentajes y montos en cascada

    // Porcentaje de participación de GMX en cascada
    (function () {
        var argumentos = {
            montoParticipacion: campoTexto.val(),
            porcentaje: $("#txtPorcentajeParticipacionGMX").val()
        };

        $.ajax({
            url: "CoaseguroLider.aspx/CalcularMontoPorcentaje",
            type: "POST",
            data: JSON.stringify(argumentos),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                var data = response.d;

                if (data.Status) {
                    $("#montoParticipacionGMX").text(data.Mensaje);
                } else {
                    alert(data.Mensaje);
                }
            }
        });
    })();


});

// Capturar Porcentaje de Participación de GMX
$("#txtPorcentajeParticipacionGMX").keyup(function (ev) {
    var campoTexto = $(this);

    if (ev.keyCode === 46 || ev.keyCode === 190) {
        return true;
    } else if (ev.keyCode === 8) {
        if (campoTexto.val() == "") {
            $("#montoParticipacionGMX").text("0.00");

            return false;
        }
    } else if (!soloNumeros(ev)) {
        var texto = campoTexto.val().replace(/[^(0-9.|\.)]/g, "");
        campoTexto.val(texto);

        return false;
    }

    var argumentos = {
        montoParticipacion: $("#txtLimiteMaximoResponsabilidad").val(),
        porcentaje: campoTexto.val()
    };

    $.ajax({
        url: "CoaseguroLider.aspx/CalcularMontoPorcentaje",
        type: "POST",
        data: JSON.stringify(argumentos),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            var data = response.d;

            if (data.Status) {
                $("#montoParticipacionGMX").text(data.Mensaje);
            } else {
                alert(data.Mensaje);
            }
        }
    });
});

/******************************************************************** COASEGURO SEGUIDOR ********************************************************************/


/******************************************************************** TODO!!!!!!!!!!!!!! ********************************************************************/

// 1.- Convertir las llamadas de AJAX hacia CalcularMontoPorcentaje en una función, que recibe como parámetros el monto de participación y el porcentaje a
// calcular, quedando la definición así:
//                                  function CalcularMontoPorcentaje(montoParticipacion, porcentaje) => Mensaje {Status: Boolean, Mensaje: String}

/******************************************************************** TODO!!!!!!!!!!!!!! ********************************************************************/