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


$("body").on("click", ".AgregaUsuario", function () {
    var strSel = fn_ElementosSeleccionados($("[id*=gvd_Usuario]"), $('[id*=lbl_ClaveUsu]'), $('[id*=chk_SelUsu]'), true);
    fn_CargaCatalogo("spS_CatalogosOP ==Usu==,====" + strSel, "Multiple", "gvd_Usuario", "Usu", "USUARIOS");
});

$("body").on("click", ".AgregaEstatus", function () {
    var strSel = fn_ElementosSeleccionados($("[id*=gvd_Estatus]"), $('[id*=lbl_ClaveEst]'), $('[id*=chk_SelEst]'), true);
    fn_CargaCatalogo("spS_CatalogosOP ==Est==,====" + strSel, "Multiple", "gvd_Estatus", "Est", "ESTATUS");
});

//Delete event handler.
$("body").on("click", "[id*=gvd_Usuario] .Delete", function () {
    event.preventDefault ? event.preventDefault() : event.returnValue = false;
    var row = $(this).closest("tr");
    $('[id*=chk_SelUsu]')[row[0].rowIndex - 1].value = "true";
    row.hide();
    return false;
});

//Delete event handler.
$("body").on("click", "[id*=gvd_Estatus] .Delete", function () {
    event.preventDefault ? event.preventDefault() : event.returnValue = false;
    var row = $(this).closest("tr");
    $('[id*=chk_SelEst]')[row[0].rowIndex - 1].value = "true";
    row.hide();
    return false;
});

//Detecta evento de Confirmación en Controles con dicha Clase
$("body").on("click", ".Autorizacion", function () {
    event.preventDefault ? event.preventDefault() : event.returnValue = false;
    if (this.name == '') {
        var id = '';
        id = this.id;
        this.name = id.replace('cph_principal_', 'ctl00$cph_principal$');
    }
    $("input[id$='hid_controlAuto']")[0].value = this.name;
    fn_AbrirModal('#Autorizacion');
    return false;
});