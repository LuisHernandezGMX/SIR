function PageLoadMesaControl() {
    if ($("input[id$='hid_Operacion']")[0].value == 1 || $("input[id$='hid_Operacion']")[0].value == 2) {
        fn_EvaluaAutoComplete('txt_ClaveResp', 'txt_SearchResp');
        fn_EvaluaAutoComplete('txt_ClaveOfi', 'txt_SearchOfi');
        fn_EvaluaAutoComplete('txt_ClaveSusc', 'txt_SearchSusc');
        fn_EvaluaAutoComplete('txt_ClaveBro', 'txt_SearchBro');
        fn_EvaluaAutoComplete('txt_ClaveAseg', 'txt_SearchAse');
        fn_EvaluaAutoComplete('txt_ClaveRamC', 'txt_SearchRamC');
        fn_EvaluaAutoComplete('txt_ClaveRam', 'txt_SearchRam');
        fn_EvaluaAutoComplete('txt_ClaveGiro', 'txt_SearchGiro');
    }
}

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

$("body").on("click", ".AgregaResponsable", function () {
    fn_CargaCatalogo("spS_CatalogosOP ==Usu==,====", "Unica", "txt_ClaveResp|txt_SearchResp", "Usu", "USUARIOS");
});

$("body").on("click", ".AgregaOficina", function () {
    fn_CargaCatalogo("spS_CatalogosOP ==Suc==,====", "Unica", "txt_ClaveOfi|txt_SearchOfi", "Suc", "OFICINAS");
});

$("body").on("click", ".AgregaSuscriptor", function () {
    fn_CargaCatalogo("spS_CatalogosOP ==Usu==,====", "Unica", "txt_ClaveSusc|txt_SearchSusc", "Usu", "USUARIOS");
});

//Detecta la clase Agregar Broker y abre el Catalogo
$("body").on("click", ".AgregaBroker", function () {
    fn_CargaCatalogo("spS_CatalogosOP ==Bro==,====", "Unica", "txt_ClaveBro|txt_SearchBro", "Bro", "INTERMEDIARIOS");
});

//Detecta la clase Agregar Broker y abre el Catalogo
$("body").on("click", ".AgregaBrokers", function () {
    var strSel = fn_ElementosSeleccionados($("[id*=gvd_Broker]"), $('[id*=lbl_ClaveBro]'), $('[id*=chk_SelBro]'), false);

    //*************fn_CargaCatalogo(Consulta,Seleccion,TipoSeleccion,IdGrid,PrefijoCatalogo,Titulo)***************
    fn_CargaCatalogo("spS_CatalogosOP ==Bro==,====" + strSel, "Multiple", "gvd_Broker", "Bro", "INTERMEDIARIOS");
});

$("body").on("click", ".AgregaRamoCont", function () {
    fn_CargaCatalogo("spS_CatalogosOP ==RamC==,====", "Unica", "txt_ClaveRamC|txt_SearchRamC", "RamC", "ANTE-RAMOS");
});

$("body").on("click", ".AgregaProducto", function () {
    var strSel = fn_ElementosSeleccionados($("[id*=gvd_Producto]"), $('[id*=lbl_ClavePro]'), $('[id*=chk_SelPro]'), true);
    fn_CargaCatalogo("spS_CatalogosOP ==Pro==,====" + strSel, "Multiple", "gvd_Producto", "Pro", "PRODUCTOS");
});

$("body").on("click", ".AgregaCia", function () {
    var strSel = fn_ElementosSeleccionados($("[id*=gvd_Compañia]"), $('[id*=lbl_ClaveCia]'), $('[id*=chk_SelCia]'), false);

    //*************fn_CargaCatalogo(Consulta,Seleccion,TipoSeleccion,IdGrid,PrefijoCatalogo,Titulo)***************
    fn_CargaCatalogo("spS_CatalogosOP ==Cia==,====" + strSel, "Multiple", "gvd_Compañia", "Cia", "REASEGURADORES");
});

$("body").on("click", ".VerReaseguradores", function () {
    fn_AbrirModalSimple('#Reaseguradores');
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
//Responsable
$("body").on("keydown", "[id$=txt_SearchResp]", function (e) {
    if (e.which == 9) {
        $("input[id$='txt_SearchOfi']").focus();
        return false;
    }

    if (e.which != 13) {
        $("input[id$='txt_ClaveResp']")[0].value = "";
    }
    fn_Autocompletar("Usu", "txt_ClaveResp", "txt_SearchResp", "", 2)
});

//Oficina
$("body").on("keydown", "[id$=txt_SearchOfi]", function (e) {
    if (e.which == 9) {
        $("input[id$='txt_SearchSusc']").focus();
        return false;
    }

    if (e.which != 13) {
        $("input[id$='txt_ClaveOfi']")[0].value = "";
    }
    fn_Autocompletar("Suc", "txt_ClaveOfi", "txt_SearchOfi", "", 1)
});

//Suscriptor
$("body").on("keydown", "[id$=txt_SearchSusc]", function (e) {
    if (e.which == 9) {
        $("input[id$='txt_SearchAse']").focus();
        return false;
    }

    if (e.which != 13) {
        $("input[id$='txt_ClaveSusc']")[0].value = "";
    }
    fn_Autocompletar("Usu", "txt_ClaveSusc", "txt_SearchSusc", "", 2)
});

//Asegurado
$("body").on("keydown", "[id$=txt_SearchAse]", function (e) {
    if (e.which == 9) {
        $("input[id$='txt_SearchRamC']").focus();
        return false;
    }

    if (e.which != 13) {
        $("input[id$='txt_ClaveAseg']")[0].value = "";
    }
    fn_Autocompletar("Ase", "txt_ClaveAseg", "txt_SearchAse", "", 3)
});

//Ante Ramo
$("body").on("keydown", "[id$=txt_SearchRamC]", function (e) {
    if (e.which == 9) {
        $("input[id$='txt_ClaveRam']").focus();
        return false;
    }

    if (e.which != 13) {
        $("input[id$='txt_ClaveRamC']")[0].value = "";
    }
    fn_Autocompletar("RamC", "txt_ClaveRamC", "txt_SearchRamC", "", 1)
});

//Clave Ramo
$("body").on("keydown", "[id$=txt_ClaveRam]", function (e) {
    if (e.which == 9) {
        $("input[id$='txt_SearchRam']").focus();
        return false;
    }
});

//Descripción Ramo
$("body").on("keydown", "[id$=txt_SearchRam]", function (e) {
    if (e.which == 9) {
        $("input[id$='txt_SearchGiro']").focus();
        return false;
    }

    if (e.which != 13) {
        $("input[id$='txt_ClaveRam']")[0].value = "";
    }
    fn_Autocompletar("Pro", "txt_ClaveRam", "txt_SearchRam", "", 1)
    $("input[id$='txt_ClaveGiro']")[0].value = "";
    $("input[id$='txt_SearchGiro']")[0].value = "";
});

//Giro
$("body").on("keydown", "[id$=txt_SearchGiro]", function (e) {
    if (e.which != 13 && e.which != 9) {
        $("input[id$='txt_ClaveGiro']")[0].value = "";
    }
    fn_Autocompletar("Gro", "txt_ClaveGiro", "txt_SearchGiro", "txt_ClaveRam", 2)
});

$("body").on("keydown", "[id$=txt_GiroAsegurado]", function (e) {
    if (e.which == 9) {
        $('.Moneda').focus();
        return false;
    }
});

//Prima
$("body").on("keydown", "[id$=txt_Prima]", function (e) {
    if (e.which == 9) {
        $('.TipoMov').focus();
        return false;
    }
});

//Reasegurador
$("body").on("keydown", "[id$=txt_SearchBro]", function (e) {
    if (e.which == 9) {
        $('.TipoColoca').focus();
        return false;
    }

    if (e.which != 13) {
        $("input[id$='txt_ClaveBro']")[0].value = "";
    }
    fn_Autocompletar("Bro", "txt_ClaveBro", "txt_SearchBro", "", 1)
});


$("body").on("keydown", ".Estado", function (e) {
    if (e.which == 9) {
        $("input[id$='txt_ObsSuscriptor']").focus();
        return false;
    }
});

$("body").on("keydown", "[id$=txt_OfiSuscriptor]", function (e) {
    if (e.which == 9) {
        $("input[id$='txt_VigIni']").focus();
        return false;
    }
});

$("body").on("keydown", "[id$=txt_FecConfirmacion]", function (e) {
    if (e.which == 9) {
        $('.EstatusPoliza').focus();
        return false;
    }
});

//----------------------------------------------------------------------------------------------------------------------

$("body").on("focus", "[id$=txt_FRecibido]", function (e) {
    fn_Seleccion(this);
});

$("body").on("focus", "[id$=txt_SearchResp]", function (e) {
    fn_Seleccion(this);
});

$("body").on("focus", "[id$=txt_SearchOfi]", function (e) {
    fn_Seleccion(this);
});

$("body").on("focus", "[id$=txt_SearchSusc]", function (e) {
    fn_Seleccion(this);
});

$("body").on("focus", "[id$=txt_DescMov]", function (e) {
    fn_Seleccion(this);
});

$("body").on("focus", "[id$=txt_SearchBro]", function (e) {
    fn_Seleccion(this);
});

$("body").on("focus", "[id$=txt_VigIni]", function (e) {
    fn_Seleccion(this);
});

$("body").on("focus", "[id$=txt_VigFin]", function (e) {
    fn_Seleccion(this);
});

$("body").on("focus", "[id$=txt_FecOfrecimiento]", function (e) {
    fn_Seleccion(this);
});

$("body").on("focus", "[id$=txt_FecConfirmacion]", function (e) {
    fn_Seleccion(this);
});

$("body").on("focus", "[id$=txt_SearchAse]", function (e) {
    fn_Seleccion(this);
});

$("body").on("focus", "[id$=txt_SearchRamC]", function (e) {
    fn_Seleccion(this);
});

$("body").on("focus", "[id$=txt_ClaveRam]", function (e) {
    fn_Seleccion(this);
});

$("body").on("focus", "[id$=txt_SearchRam]", function (e) {
    fn_Seleccion(this);
});

$("body").on("focus", "[id$=txt_SearchGiro]", function (e) {
    fn_Seleccion(this);
});

$("body").on("focus", "[id$=txt_SumaAseg]", function (e) {
    fn_Seleccion(this);
});

$("body").on("focus", "[id$=txt_Prima]", function (e) {
    fn_Seleccion(this);
});

$("body").on("focus", "[id$=txt_ObsSuscriptor]", function (e) {
    fn_Seleccion(this);
});

$("body").on("focus", "[id$=txt_ObsConducto]", function (e) {
    fn_Seleccion(this);
});

$("body").on("focus", "[id$=txt_OfiSuscriptor]", function (e) {
    fn_Seleccion(this);
});



$("body").on("focusout", "[id$=txt_SumaAseg]", function (e) {
    var SumaAseg = parseFloat($(this)[0].value.replace(",", "").replace(",", ""))
    $(this)[0].value = fn_FormatoMonto(SumaAseg, 2);
});

$("body").on("focusout", "[id$=txt_Prima]", function (e) {
    var Prima = parseFloat($(this)[0].value.replace(",", "").replace(",", ""))
    $(this)[0].value = fn_FormatoMonto(Prima, 2);
});



//-----------------------------------------------------EVENTOS FOCUSOUT-------------------------------------------
//Busqueda de Producto por Clave
$("body").on("focusout", "[id$=txt_ClaveRam]", function (e) {
    var Id = $("input[id$='txt_ClaveRam']")[0].value;
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
            $("input[id$='txt_SearchRam']")[0].value = data.d;
        },
        error: function (response) {
            fn_MuestraMensaje('JSON', response.responseText, 2);
        },
    });
});


$("body").on("focusout", "[id$=txt_SearchResp]", function (e) {
    fn_EvaluaAutoComplete('txt_ClaveResp', 'txt_SearchResp');
});

$("body").on("focusout", "[id$=txt_SearchOfi]", function (e) {
    fn_EvaluaAutoComplete('txt_ClaveOfi', 'txt_SearchOfi');
});

$("body").on("focusout", "[id$=txt_SearchSusc]", function (e) {
    fn_EvaluaAutoComplete('txt_ClaveSusc', 'txt_SearchSusc');
});

$("body").on("focusout", "[id$=txt_SearchBro]", function (e) {
    fn_EvaluaAutoComplete('txt_ClaveBro', 'txt_SearchBro');
});

$("body").on("focusout", "[id$=txt_SearchAse]", function (e) {
    fn_EvaluaAutoComplete('txt_ClaveAseg', 'txt_SearchAse');
});

$("body").on("focusout", "[id$=txt_SearchRamC]", function (e) {
    fn_EvaluaAutoComplete('txt_ClaveRamC', 'txt_SearchRamC');
});

$("body").on("focusout", "[id$=txt_SearchRam]", function (e) {
    fn_EvaluaAutoComplete('txt_ClaveRam', 'txt_SearchRam');
});

$("body").on("focusout", "[id$=txt_SearchGiro]", function (e) {
    fn_EvaluaAutoComplete('txt_ClaveGiro', 'txt_SearchGiro');
});

$("body").on("click", "[id*=gvd_Monitor] .Folio", function () {
    event.preventDefault ? event.preventDefault() : event.returnValue = false;
    var row = $(this).closest("tr");
    var Folio = row.find('.Folio');

    if (Folio[0].text != '0') {
        window.open("Gestion.aspx?Folio=" + Folio[0].text);
    }
});









