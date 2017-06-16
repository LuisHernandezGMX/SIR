//Detecta evento de Confirmación en Controles con dicha Clase
$("body").on("click", ".Confirmacion", function () {
    event.preventDefault ? event.preventDefault() : event.returnValue = false;
    if (this.name == '') {
        var id = '';
        id = this.id;
        this.name = id.replace('cph_principal_', 'ctl00$cph_principal$');
    }
    $(this).addClass('Quitar');
    fn_MuestraMensaje('Confirmación', '¿Esta seguro de continuar con la operación?', 3, this.name)
    return false;
});

//Detecta la clase Agregar Broker y abre el Catalogo
$("body").on("click", ".AgregaBroker", function () {
    var strSel = fn_ElementosSeleccionados($("[id*=gvd_Broker]"), $('[id*=lbl_ClaveBro]'), $('[id*=chk_SelBro]'), false);

    //*************fn_CargaCatalogo(Consulta,Seleccion,TipoSeleccion,IdGrid,PrefijoCatalogo,Titulo)***************
    fn_CargaCatalogo("spS_CatalogosOP ==Bro==,====" + strSel, "Multiple", "gvd_Broker", "Bro", "BROKERS");
});

//Colapsar Ventana
$("body").on("click", "#coVentana0", function () {
    event.preventDefault ? event.preventDefault() : event.returnValue = false;
    fn_CambiaEstado("0", "1");
});

//Expandir Ventana
$("body").on("click", "#exVentana0", function () {
    event.preventDefault ? event.preventDefault() : event.returnValue = false;
    fn_CambiaEstado("0", "0");
});

function fn_OcultaRenglon() {
    var Row = $('.Quitar').closest('tr');
    Row.hide;
}
