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

var CoaseguroUtilities = (function () {
    // Aceptar solamente números en campo de texto
    // URL: https://stackoverflow.com/questions/13952686/how-to-make-html-input-tag-only-accept-numerical-values
    function soloNumeros(ev) {
        var charCode = ev.which ? ev.which : event.keyCode;

        return !((charCode > 31) && (charCode != 46 && (charCode < 48 || charCode > 57)));
    }

    // Ejecuta la llamada de AJAX al método Web CalcularMontoPorcentaje() y ejecuta la función indicada al regresar dicha llamada.
    // montoParticipacion => El monto sobre el cual se calculará el porcentaje
    // porcentaje => El porcentaje a calcular
    // retrollamada(response) => La función a ejecutar cuando regrese la llamada de AJAX. Toma como argumento la respuesta del servidor
    function calcularMontoPorcentaje(montoParticipacion, porcentaje, retrollamada) {
        var argumentos = {
            montoParticipacion: montoParticipacion,
            porcentaje: porcentaje
        };

        $.ajax({
            url: "CoaseguroLider.aspx/CalcularMontoPorcentaje",
            type: "POST",
            data: JSON.stringify(argumentos),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            success: retrollamada
        });
    }

    return {
        soloNumeros: soloNumeros,
        calcularMontoPorcentaje: calcularMontoPorcentaje
    };
})();

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

/******************************************************************** FUNCIONES GENERALES ********************************************************************/