/* Conjunto de Sujetos y Observadores para realizar cambios sobre la interfaz gráfica de CoaseguroSeguidor.aspx
 * El Grafo Observador (Límite Máximo de Responsabilidad al 100%) es quien inicia la cadena de notificaciones; es decir,
 * cuando ocurre un cambio sobre este valor, se replicará en cascada sobre todos aquellos observadores conectados a él invocando
 * sus respectivos métodos. La cadena de eventos se visualiza de la siguiente manera:
 *
 *                                                      Límite Máximo de Responsabilidad
 *
 *                    Monto de Participación GMX | Coaseguradora Líder | Coaseguradoras 1..N
 *
 *                                         Fee GMX | Monto Siniestro | Monto Total de Participación
*/

// Grafo Observador: Es el SUJETO PRINCIPAL. Los cambios que sufra este nodo se propagarán
// a lo largo de todos sus observadores (nodos hijos).
// Representa el valor del Límite Máximo de Responsabilidad al 100%.
var GrafoObservador = (function () {
    var nodosHijos = [];

    function agregarHijo(nodo) {
        nodosHijos.push(nodo);
    }

    function notificarCambio(nuevoValor) {
        nodosHijos.forEach(function (nodo) {
            nodo.notificarCambio(nuevoValor);
        });
    }

    function eliminarNodo(querySelectorId) {
        var index = 0;
        var encontrado = false;

        // Buscamos a los nodos que tengan el método NodoCoaseguradora.obtenerSelectorId(), y de éstos, saber si coinciden sus Id's
        for (var i = 0; i < nodosHijos.length; i++) {
            if ((typeof nodosHijos[i].obtenerSelectorId === "function") && (nodosHijos[i].obtenerSelectorId() == querySelectorId)) {
                encontrado = true;
                index = i;
                break;
            }
        }

        if (encontrado) {
            nodosHijos.splice(index, 1);
        }
    }

    return {
        agregarHijo: agregarHijo,
        notificarCambio: notificarCambio,
        eliminarNodo: eliminarNodo
    };
})();

// Nodo GMX: Es un SUJETO OBSERVADOR (actúa como observador del Nodo Raíz y como sujeto de Nodo Fee y Nodo Siniestro).
// Representa el monto de participación de GMX como coaseguradora seguidora.
// (querySelectorMonto) => Selector del elemento de donde se tomará el atributo "data-monto".
// (querySelectorPorcentaje) => Selector de la caja de texto donde se escribirá el porcentaje de participación.
var NodoGMX = (function (querySelectorMonto, querySelectorPorcentaje) {
    var selectorMonto = querySelectorMonto;
    var selectorPorcentaje = querySelectorPorcentaje;
    var nodosHijos = [];
    
    function agregarHijo(nodo) {
        nodosHijos.push(nodo);
    }

    function notificarCambio(nuevoValor){
        var montoParticipacion = nuevoValor;
        var porcentaje = $(selectorPorcentaje).val();

        CoaseguroUtilities.calcularMontoPorcentaje(montoParticipacion, porcentaje, function (response) {
            var data = response.d;

            if (data.Status) {
                $(selectorMonto).text(data.Mensaje);
                $(selectorMonto).attr("data-monto", data.Valor);

                nodosHijos.forEach(function (nodo) {
                    nodo.notificarCambio(data.Valor);
                });
            } else {
                alert(data.Mensaje);
            }
        });
    }

    return {
        agregarHijo: agregarHijo,
        notificarCambio: notificarCambio
    };
})("#montoParticipacionGMX", "#txtPorcentajeParticipacionGMX");

// NodoCoaseguradoraLider: 
var NodoCoaseguradoraLider = (function (querySelectorId) {
    var selectorId = querySelectorId;
    var nodosHijos = [];

    function agregarHijo(nodo) {
        nodosHijos.push(nodo);
    }

    function notificarCambio(nuevoValor) {
        var tr = $(selectorId);
        var tdPorcentaje = tr.find(".porcentajeCoaseguradora")[0];
        var tdMonto = tr.find(".montoCoaseguradora")[0];

        var montoParticipacion = nuevoValor;
        var porcentaje = $(tdPorcentaje).attr("data-porcentaje");

        CoaseguroUtilities.calcularMontoPorcentaje(montoParticipacion, porcentaje, function (response) {
            var data = response.d;

            if (data.Status) {
                $(tdMonto).attr("data-monto", data.Valor);
                $(tdMonto).text(data.Mensaje);
            } else {
                alert(data.Mensaje);
            }
        });
    }

    return {
        agregarHijo: agregarHijo,
        notificarCambio: notificarCambio
    };
})("#" + $(".trCoaseguradora")[0].id);

// NodoCoaseguradora: Es un SUJETO OBSERVADOR (actúa como observador del nodo raíz y como sujeto de Nodo Total Participación)
// Representa el monto de participación de cada una de las coaseguradoras, a excepción de GMX y la coaseguradora líder.
// (id) => Selector de la fila TR de la coaseguradora de la cual se calculará su monto de participación
// A diferencia de los demás nodos, este se debe crear cada vez que se agrega una nueva coaseguradora, y viceversa, al remover
// una coaseguradora su nodo correspondiente debe también removerse.
var NodoCoaseguradora = function (querySelectorId) {
    var selectorId = querySelectorId;
    var nodosHijos = [];

    function agregarHijo(nodo) {
        nodosHijos.push(nodo);
    }

    function notificarCambio(nuevoValor) {
        var tr = $(selectorId);
        var txtPorcentaje = tr.find(".txtPorcentajeCoaseguradora")[0];
        var tdPorcentaje = tr.find(".porcentajeCoaseguradora")[0];
        var tdMonto = tr.find(".montoCoaseguradora")[0];

        var montoParticipacion = nuevoValor;
        var porcentaje = $(txtPorcentaje).val() || 0;

        CoaseguroUtilities.calcularMontoPorcentaje(montoParticipacion, porcentaje, function (response) {
            var data = response.d;

            if (data.Status) {
                $(tdPorcentaje).attr("data-porcentaje", porcentaje);
                $(tdMonto).attr("data-monto", data.Valor);
                $(tdMonto).text(data.Mensaje);

                nodosHijos.forEach(function (nodo) {
                    nodo.notificarCambio(nuevoValor);
                });
            } else {
                alert(data.Mensaje);
            }
        });
    }

    function obtenerSelectorId() {
        return selectorId;
    }

    return {
        agregarHijo: agregarHijo,
        notificarCambio: notificarCambio,
        obtenerSelectorId: obtenerSelectorId
    };
};

// Nodo Total Participación: Es un OBSERVADOR (observa los cambios producidos por NodoGMX y por todos los NodoCoaseguradora).
// Representa el monto y porcentaje total de participación de todas las coaseguradoras, incluyendo a GMX.
// (querySelectorPorcentajeGMX) => Selector de la caja de texto del porcentaje de participación de GMX
// (querySelectorMontoGMX) => Selector del elemento donde se tomará el atributo "data-monto" de la participación de GMX.
// (querySelectorCoaseguradoras) => Selector de todas las coaseguradoras, incluída la líder.
// (querySelectorPorcentajeTotal) => Selector del elemento donde se mostrará el porcentaje total de la participación.
// (querySelectorMontoTotal) => Selector del elemento donde se mostrará el monto total de la participación.
var NodoTotalParticipacion = (function (querySelectorPorcentajeGMX, querySelectorMontoGMX, querySelectorCoaseguradoras, querySelectorPorcentajeTotal, querySelectorMontoTotal) {
    var selectorPorcentajeGMX = querySelectorPorcentajeGMX;
    var selectorMontoGMX = querySelectorMontoGMX;
    var selectorCoaseguradoras = querySelectorCoaseguradoras;
    var selectorPorcentajeTotal = querySelectorPorcentajeTotal;
    var selectorMontoTotal = querySelectorMontoTotal;
    
    // El parámetro nuevoValor no se utiliza.
    function notificarCambio(nuevoValor) {
        var porcentajeGMX = parseFloat($(selectorPorcentajeGMX).val() || 0);
        var montoGMX = parseFloat($(selectorMontoGMX).attr("data-monto"));

        var argumentos = {
            porcentajes: [porcentajeGMX],
            montos: [montoGMX]
        };

        // Se suman todos los porcentajes y montos de cada aseguradora
        $(selectorCoaseguradoras).each(function () {
            var tr = $(this);
            var tdPorcentaje = tr.find(".porcentajeCoaseguradora")[0];
            var tdMonto = tr.find(".montoCoaseguradora")[0];

            var porcentaje = parseFloat($(tdPorcentaje).attr("data-porcentaje"));
            var monto = parseFloat($(tdMonto).attr("data-monto"));

            argumentos.porcentajes.push(porcentaje);
            argumentos.montos.push(monto);
        });

        $.ajax({
            url: "CoaseguroLider.aspx/SumatoriaPorcentajesYMontos",
            type: "POST",
            data: JSON.stringify(argumentos),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            success: function (response) {
                var data = response.d;
                var formateado = data.Mensaje.split("||");
                var numerico = data.Valor.split("||")
                
                // Se actualiza el porcentaje y monto totales de la participación
                $(selectorPorcentajeTotal).attr("data-porcentaje", numerico[0]);
                $(selectorPorcentajeTotal).text(formateado[0] + "%");

                $(selectorMontoTotal).attr("data-monto", numerico[1]);
                $(selectorMontoTotal).text(formateado[1]);
            }
        });
    }

    return {
        notificarCambio: notificarCambio
    };
})("#txtPorcentajeParticipacionGMX", "#montoParticipacionGMX", ".trCoaseguradora", "#porcentajeTotalCoaseguradoras", "#montoTotalCoaseguradoras");

// Nodo Fee: Es un OBSERVADOR (observa los cambios producidos por NodoGMX)
// Representa el Fee por administración que le corresponde a GMX
// (querySelectorPorcentaje) => Selector de la caja de texto donde se captura el porcentaje del Fee.
var NodoFee = (function (querySelectorPorcentaje) {
    var selectorPorcentaje = querySelectorPorcentaje;

    function notificarCambio(nuevoValor) {
        var montoParticipacion = nuevoValor;
        var porcentaje = $(selectorPorcentaje).val();

        CoaseguroUtilities.calcularMontoPorcentaje(montoParticipacion, porcentaje, function (response) {
            var data = response.d;

            if (data.Status) {
                var tdMontoComision = $(selectorPorcentaje).parent().parent().children(".monto-comision-td")[0];
                var span = $(tdMontoComision).children(".monto-comision")[0];

                $(span).text(data.Mensaje);
            } else {
                alert(data.Mensaje);
            }
        });
    }

    return {
        notificarCambio: notificarCambio
    };
})(".txtPorcentajeFee");

// Nodo Siniestro: Es un OBSERVADOR (observa los cambios producidos por NodoGMX).
// Representa el monto máximo para pago automático de siniestro.
// (querySelectorMonto) => Selector del elemento donde se actualizará el valor del nuevo monto.
// (querySelectorPorcentaje) => Selector de la caja de texto donde se captura el porcentaje del siniestro.
var NodoSiniestro = (function (querySelectorMonto, querySelectorPorcentaje) {
    var selectorMonto = querySelectorMonto;
    var selectorPorcentaje = querySelectorPorcentaje;

    function notificarCambio(nuevoValor) {
        var montoParticipacion = nuevoValor;
        var porcentaje = $(selectorPorcentaje).val();

        CoaseguroUtilities.calcularMontoPorcentaje(montoParticipacion, porcentaje, function (response) {
            var data = response.d;

            if (data.Status) {
                $("#montoMaximoSiniestro").text(data.Mensaje);
            } else {
                alert(data.Mensaje);
            }
        });
    }

    return {
        notificarCambio: notificarCambio
    };
})("#montoMaximoSiniestro", "#txtPagoAutomaticoSiniestro");

// Construcción del Grafo Observador con los elementos de la página ASPX
(function () {
    NodoGMX.agregarHijo(NodoFee);
    NodoGMX.agregarHijo(NodoSiniestro);
    NodoGMX.agregarHijo(NodoTotalParticipacion);
    NodoCoaseguradoraLider.agregarHijo(NodoTotalParticipacion);

    GrafoObservador.agregarHijo(NodoGMX);
    GrafoObservador.agregarHijo(NodoCoaseguradoraLider);
})();