/******************************************************************** POLYFILL ********************************************************************/
// https://tc39.github.io/ecma262/#sec-array.prototype.find
if (!Array.prototype.find) {
    Object.defineProperty(Array.prototype, 'find', {
        value: function (predicate) {
            // 1. Let O be ? ToObject(this value).
            if (this == null) {
                throw new TypeError('"this" is null or not defined');
            }

            var o = Object(this);

            // 2. Let len be ? ToLength(? Get(O, "length")).
            var len = o.length >>> 0;

            // 3. If IsCallable(predicate) is false, throw a TypeError exception.
            if (typeof predicate !== 'function') {
                throw new TypeError('predicate must be a function');
            }

            // 4. If thisArg was supplied, let T be thisArg; else let T be undefined.
            var thisArg = arguments[1];

            // 5. Let k be 0.
            var k = 0;

            // 6. Repeat, while k < len
            while (k < len) {
                // a. Let Pk be ! ToString(k).
                // b. Let kValue be ? Get(O, Pk).
                // c. Let testResult be ToBoolean(? Call(predicate, T, « kValue, k, O »)).
                // d. If testResult is true, return kValue.
                var kValue = o[k];
                if (predicate.call(thisArg, kValue, k, o)) {
                    return kValue;
                }
                // e. Increase k by 1.
                k++;
            }

            // 7. Return undefined.
            return undefined;
        },
        configurable: true,
        writable: true
    });
}
/******************************************************************** POLYFILL ********************************************************************/

/******************************************************************** COASEGURO SEGUIDOR ********************************************************************/

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
    } else if (!CoaseguroUtilities.soloNumeros(ev)) {
        var texto = campoTexto.val().replace(/[^(0-9.|\.)]/g, "");
        campoTexto.val(texto);

        return false;
    }

    var monto = $("#montoParticipacionGMX").attr("data-monto");
    var porcentaje = campoTexto.val();

    CoaseguroUtilities.calcularMontoPorcentaje(monto, porcentaje, function (response) {
        var data = response.d;

        if (data.Status) {
            $("#montoMaximoSiniestro").text(data.Mensaje);
        } else {
            alert(data.Mensaje);
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
    } else if (!CoaseguroUtilities.soloNumeros(ev)) {
        var texto = campoTexto.val().replace(/[^(0-9.|\.)]/g, "");
        campoTexto.val(texto);

        return false;
    }

    var monto = $("#montoParticipacionGMX").attr("data-monto");
    var porcentaje = campoTexto.val();

    CoaseguroUtilities.calcularMontoPorcentaje(monto, porcentaje, function (response) {
        var data = response.d;

        if (data.Status) {
            var tdMontoComision = campoTexto.parent().parent().children(".monto-comision-td")[0];
            var span = $(tdMontoComision).children(".monto-comision")[0];

            $(span).text(data.Mensaje);
        } else {
            alert(data.Mensaje);
        }
    });
});

// Capturar Límite Máximo de Responsabilidad al 100%
// Modificar este campo de texto modifica los valores dependientes en la página en cascada
$("#txtLimiteMaximoResponsabilidad").keyup(function (ev) {
    var campoTexto = $(this);

    if (ev.keyCode === 46 || ev.keyCode === 190) {
        return true;
    } else if (ev.keyCode === 8) {
        if (campoTexto.val() == "") {
            // Modificar los montos de participación, Fee y Siniestros en 0 y en cascada
            GrafoObservador.notificarCambio(0);
        }
    } else if (!CoaseguroUtilities.soloNumeros(ev)) {
        var texto = campoTexto.val().replace(/[^(0-9.|\.)]/g, "");
        campoTexto.val(texto);

        return false;
    }

    // Actualización de montos en cascada.
    GrafoObservador.notificarCambio(campoTexto.val());
});

// Capturar Porcentaje de Participación de GMX
$("#txtPorcentajeParticipacionGMX").keyup(function (ev) {
    var campoTexto = $(this);

    if (ev.keyCode === 46 || ev.keyCode === 190) {
        return true;
    } else if (ev.keyCode === 8) {
        if (campoTexto.val() == "") {
            $("#montoParticipacionGMX").text("0.00");
            $("#montoParticipacionGMX").attr("data-monto", "0");

            // Cascada para Fee y para Siniestros
            NodoFee.notificarCambio(0);
            NodoSiniestro.notificarCambio(0);
            NodoTotalParticipacion.notificarCambio();

            return false;
        }
    } else if (!CoaseguroUtilities.soloNumeros(ev)) {
        var texto = campoTexto.val().replace(/[^(0-9.|\.)]/g, "");
        campoTexto.val(texto);

        return false;
    }

    var montoParticipacion = $("#txtLimiteMaximoResponsabilidad").val() || 0;
    var porcentaje = campoTexto.val();

    CoaseguroUtilities.calcularMontoPorcentaje(montoParticipacion, porcentaje, function (response) {
        var data = response.d;

        if (data.Status) {
            $("#montoParticipacionGMX").text(data.Mensaje);
            $("#montoParticipacionGMX").attr("data-monto", data.Valor);

            // Cascada para Fee y para Siniestros
            NodoFee.notificarCambio(data.Valor);
            NodoSiniestro.notificarCambio(data.Valor);
            NodoTotalParticipacion.notificarCambio();
        } else {
            alert(data.Mensaje);
        }
    });
});

// Agregar Coaseguradora junto con sus respectivos campos
$("#btnAgregarCoaseguradora").click(function () {
    // Verificamos que aún quedan coaseguradoras disponibles para agregar.
    var existenCoaseguradorasDisponibles = COASEGURADORAS.some(function (el) { return !el.EnUso; });

    if (!existenCoaseguradorasDisponibles) {
        alert("No hay más aseguradoras disponibles.");
    } else {
        // Removemos la coaseguradora del DropDownList e indicamos que ésta en particular está siendo utilizada
        var idCoaseguradora = $("#dropdownCoaseguradoras").val();
        var coaseguradora = COASEGURADORAS.find(function (co) { return co.Id == idCoaseguradora; });
        var selectorId = "trCoaseguradora" + coaseguradora.Id;

        coaseguradora.EnUso = true;
        $('#dropdownCoaseguradoras option[value="' + idCoaseguradora + '"]').remove();

        var fila = '<tr id="' + selectorId + '" class="trCoaseguradora" data-id="' + coaseguradora.Id + '">' +
            '<td class="btnRemoverCoaseguradora"><span><a class="btn botones" style="width: 20px; padding: 2px;"><img class="btn-cancelar" /></a></span>' +
            "<span>" + coaseguradora.Nombre + "</span></td>" +
            '<td class="porcentajeCoaseguradora" data-porcentaje="0"><input type="text" class="estandar-control Tablero txtPorcentajeCoaseguradora" style="width:40%" placeholder="0.00%" /></td>' +
            '<td><span>$</span><span class="pull-right montoCoaseguradora" data-monto="0">0.00</span></td>' + 
            "</tr>";

        var nuevaAseguradora = NodoCoaseguradora("#" + selectorId);
        nuevaAseguradora.agregarHijo(NodoTotalParticipacion);
        GrafoObservador.agregarHijo(nuevaAseguradora);

        $("#tbodyCoaseguradoras tr#trTotalParticipacion").before(fila);
    }

    return false;
});

// Calcular monto de participación de las coaseguradoras que se vayan agregando
$("#tbodyCoaseguradoras").on("keyup", ".txtPorcentajeCoaseguradora", function (ev) {
    var campoTexto = $(this);
    var tr = campoTexto.parent().parent();
    var tdPorcentaje = tr.find(".porcentajeCoaseguradora")[0];
    var tdMonto = tr.find(".montoCoaseguradora")[0];

    if (ev.keyCode === 46 || ev.keyCode === 190) {
        return true;
    } else if (ev.keyCode === 8) {
        if (campoTexto.val() == "") {
            $(tdPorcentaje).attr("data-porcentaje", "0");
            $(tdMonto).attr("data-monto", "0");
            $(tdMonto).text("0.00");

            // Cascada para Total de Participación
            NodoTotalParticipacion.notificarCambio();

            return false;
        }
    } else if (!CoaseguroUtilities.soloNumeros(ev)) {
        var texto = campoTexto.val().replace(/[^(0-9.|\.)]/g, "");
        campoTexto.val(texto);

        return false;
    }

    var porcentaje = campoTexto.val();
    var monto = $("#txtLimiteMaximoResponsabilidad").val() || 0;

    CoaseguroUtilities.calcularMontoPorcentaje(monto, porcentaje, function (response) {
        var data = response.d;

        if (data.Status) {
            $(tdPorcentaje).attr("data-porcentaje", porcentaje);
            $(tdMonto).attr("data-monto", data.Valor);
            $(tdMonto).text(data.Mensaje);

            // Cascada para Total de Participación
            NodoTotalParticipacion.notificarCambio();
        } else {
            alert(data.Mensaje);
        }
    });
});

// Remover coaseguradora al presionar su respectivo botón
$("#tbodyCoaseguradoras").on("click", ".btnRemoverCoaseguradora", function () {
    var trCoaseguradora = $(this).parent();
    var idCoaseguradora = trCoaseguradora.attr("data-id");
    var tdPorcentaje = trCoaseguradora.find(".porcentajeCoaseguradora")[0];
    var tdMonto = trCoaseguradora.find(".montoCoaseguradora")[0];
    
    $(tdPorcentaje).attr("data-porcentaje", "0");
    $(tdMonto).attr("data-monto", "0");
    $(tdMonto).text("0.00");

    // Eliminar el nodo del Grafo Observador
    GrafoObservador.eliminarNodo("#" + trCoaseguradora.attr("id"));

    // Cascada para Total de Participación
    NodoTotalParticipacion.notificarCambio();

    // Agregar la coaseguradora liberada al DropDownList
    var coaseguradora = COASEGURADORAS.find(function (co) { return co.Id == idCoaseguradora; });
    coaseguradora.EnUso = false;
    $("#dropdownCoaseguradoras").append('<option value="' + coaseguradora.Id + '">' + coaseguradora.Nombre + '</option>');

    trCoaseguradora.remove();
    return false;
});
/******************************************************************** COASEGURO SEGUIDOR ********************************************************************/