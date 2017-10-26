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
    fn_CargaCatalogo("Usu", "", "", "Unica", "txt_ClaveResp|txt_SearchResp", "USUARIOS");
});

$("body").on("click", ".AgregaOficina", function () {
    fn_CargaCatalogo("Suc", "", "", "Unica", "txt_ClaveOfi|txt_SearchOfi", "OFICINAS");
});

$("body").on("click", ".AgregaSuscriptor", function () {
    fn_CargaCatalogo("Usu", "", "", "Unica", "txt_ClaveSusc|txt_SearchSusc", "USUARIOS");
});

//Detecta la clase Agregar Broker y abre el Catalogo
$("body").on("click", ".AgregaBroker", function () {
    //*************fn_CargaCatalogo(PrefijoCatalogo,Condicion,Seleccion,TipoSeleccion,IdGrid,Titulo)***************
    fn_CargaCatalogo("Bro", "", "", "Multiple", "lst_Brokers", "INTERMEDIARIOS");
});

$("body").on("click", ".AgregaRamoCont", function () {
    fn_CargaCatalogo("RamC", "", "", "Unica", "txt_ClaveRamC|txt_SearchRamC", "ANTE-RAMOS");
});

$("body").on("click", ".AgregaProducto", function () {
    var strSel = fn_ElementosSeleccionados($("[id*=gvd_Producto]"), $('[id*=lbl_ClavePro]'), $('[id*=chk_SelPro]'), true);

    fn_CargaCatalogo("Pro", "" , strSel, "Multiple", "gvd_Producto", "PRODUCTOS");
});

$("body").on("click", ".AgregaCia", function () {
    var strSel = fn_ElementosSeleccionados($("[id*=gvd_Compañia]"), $('[id*=lbl_ClaveCia]'), $('[id*=chk_SelCia]'), false);

    //*************fn_CargaCatalogo(PrefijoCatalogo,Condicion,Seleccion,TipoSeleccion,IdGrid,Titulo)***************
    fn_CargaCatalogo("Cia", "", strSel, "Multiple", "gvd_Compañia", "REASEGURADORES");
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
//Oficina
$("body").on("keydown", "[id$=txt_SearchOfi]", function (e) {
    if (e.which == 9) {
        $("input[id$='txt_SearchRamC']").focus();
        return false;
    }

    if (e.which != 13) {
        $("input[id$='txt_ClaveOfi']")[0].value = "";
    }
    fn_Autocompletar("Suc", "txt_ClaveOfi", "txt_SearchOfi", "", 1)
});

//Ante Ramo
$("body").on("keydown", "[id$=txt_SearchRamC]", function (e) {
    if (e.which == 9) {
        $("input[id$='txt_SearchCob']").focus();
        return false;
    }

    if (e.which != 13) {
        $("input[id$='txt_ClaveRamC']")[0].value = "";
    }
    fn_Autocompletar("RamC", "txt_ClaveRamC", "txt_SearchRamC", "", 1)
});

//Cobertura
$("body").on("keydown", "[id$=txt_SearchCob]", function (e) {
    if (e.which == 9) {
        $("input[id$='txt_SearchAse']").focus();
        return false;
    }

    //if (e.which != 13) {
    //    $("input[id$='txt_ClaveCob']")[0].value = "";
    //}
    //fn_Autocompletar("Cob", "txt_ClaveCob", "txt_SearchCob", "", 1)
});

//Asegurado
$("body").on("keydown", "[id$=txt_SearchAse]", function (e) {
    if (e.which == 9) {
        $('.Moneda').focus();
        return false;
    }

    if (e.which != 13) {
        $("input[id$='txt_ClaveAseg']")[0].value = "";
    }
    fn_Autocompletar("Ase", "txt_ClaveAseg", "txt_SearchAse", "", 3)
});

//Giro Asegurado
$("body").on("keydown", "[id$=txt_GiroAsegurado]", function (e) {
    if (e.which == 9) {
        $("input[id$='txt_SearchGiro']").focus();
        return false;
    }
});

//Giro
$("body").on("keydown", "[id$=txt_SearchGiro]", function (e) {
    if (e.which == 9) {
        $('.TipoMov').focus();
        return false;
    }

    if (e.which != 13) {
        $("input[id$='txt_ClaveGiro']")[0].value = "";
    }
    fn_Autocompletar("Gro", "txt_ClaveGiro", "txt_SearchGiro", "txt_ClaveRam", 2)
});

//Suscriptor
$("body").on("keydown", "[id$=txt_SearchSusc]", function (e) {
    if (e.which == 9) {
        $("input[id$='txt_SearchAge']").focus();
        return false;
    }

    if (e.which != 13) {
        $("input[id$='txt_ClaveSusc']")[0].value = "";
    }
    fn_Autocompletar("Usu", "txt_ClaveSusc", "txt_SearchSusc", "", 2)
});

//Agente
$("body").on("keydown", "[id$=txt_SearchAge]", function (e) {
    if (e.which == 9) {
        $("input[id$='txt_ComAgente']").focus();
        return false;
    }

    if (e.which != 13) {
        $("input[id$='txt_ClaveAge']")[0].value = "";
    }
    fn_Autocompletar("Ase", "txt_ClaveAge", "txt_SearchAge", "", 3)
});


//COmision Agente
$("body").on("keydown", "[id$=txt_ComAgente]", function (e) {
    if (e.which == 9) {
        $("input[id$='txt_SearchSuc']").focus();
        return false;
    }
});

//Sucursal Poliza
$("body").on("keydown", "[id$=txt_SearchSuc]", function (e) {
    if (e.which == 9) {
        $("input[id$='txt_SearchRam']").focus();
        return false;
    }

    if (e.which != 13) {
        $("input[id$='txt_ClaveSuc']")[0].value = "";
    }
    fn_Autocompletar("Suc", "txt_ClaveSuc", "txt_SearchSuc", "", 1)
});

//Descripción Ramo
$("body").on("keydown", "[id$=txt_SearchRam]", function (e) {
    if (e.which == 9) {
        $("input[id$='txt_NroPoliza']").focus();
        return false;
    }

    if (e.which != 13) {
        $("input[id$='txt_ClaveRam']")[0].value = "";
    }
    fn_Autocompletar("Pro", "txt_ClaveRam", "txt_SearchRam", "", 1)
    //$("input[id$='txt_ClaveGiro']")[0].value = "";
    //$("input[id$='txt_SearchGiro']")[0].value = "";
});

//Sufijo
$("body").on("keydown", "[id$=txt_Sufijo]", function (e) {
    if (e.which == 9) {
        $("input[id$='txt_VigIni']").focus();
        return false;
    }
});

//Fin de Vigencia
$("body").on("keydown", "[id$=txt_VigFin]", function (e) {
    if (e.which == 9) {
        $("input[id$='txt_SumaAseg']").focus();
        return false;
    }
});

//Cuota
$("body").on("keydown", "[id$=chk_Target]", function (e) {
    if (e.which == 9) {
        $("input[id$='txt_Notas']").focus();
        return false;
    }
});



//Responsable
$("body").on("keydown", "[id$=txt_SearchResp]", function (e) {
    if (e.which == 9) {
        $('.Esquema').focus();
        return false;
    }

    if (e.which != 13) {
        $("input[id$='txt_ClaveResp']")[0].value = "";
    }
    fn_Autocompletar("Usu", "txt_ClaveResp", "txt_SearchResp", "", 2)
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

$("body").on("focusout", "[id$=txt_SumaAseg]", function (e) {
    var SumaAseg = parseFloat($(this)[0].value.replace(",", "").replace(",", ""))
    $(this)[0].value = fn_FormatoMonto(SumaAseg, 2);
});

$("body").on("focusout", "[id$=txt_Prima]", function (e) {
    var Prima = parseFloat($(this)[0].value.replace(",", "").replace(",", ""))
    $(this)[0].value = fn_FormatoMonto(Prima, 2);
});

$("body").on("focusout", "[id$=txt_ComAgente]", function (e) {
    var Comision = parseFloat($(this)[0].value.replace(",", "").replace(",", ""))
    $(this)[0].value = fn_FormatoMonto(Comision, 2);
});

$("body").on("focusout", "[id$=txt_Cuota]", function (e) {
    var Cuota = parseFloat($(this)[0].value.replace(",", "").replace(",", ""))
    $(this)[0].value = fn_FormatoMonto(Cuota, 2);
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

$("body").on("focusout", "[id$=txt_SearchSuc]", function (e) {
    fn_EvaluaAutoComplete('txt_ClaveSuc', 'txt_SearchSuc');
});

$("body").on("focusout", "[id$=txt_SearchAse]", function (e) {
    fn_EvaluaAutoComplete('txt_ClaveAseg', 'txt_SearchAse');
});

$("body").on("focusout", "[id$=txt_SearchAge]", function (e) {
    fn_EvaluaAutoComplete('txt_ClaveAge', 'txt_SearchAge');
});

$("body").on("focusout", "[id$=txt_SearchCob]", function (e) {
    fn_EvaluaAutoComplete('txt_ClaveCob', 'txt_SearchCob');
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









