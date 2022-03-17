


function soloNumeros(e) {
    var key = window.Event ? e.which : e.keyCode
    return (key >= 48 && key <= 57)
}




function NumCheck(e, field) {
    key = e.keyCode ? e.keyCode : e.which;
    if (key === 8)
        return true;
    if (field.value !== "") {
        if ((field.value.indexOf(",")) > 0) {
            if (key > 47 && key < 58) {
                if (field.value === "")
                    return true;
                regexp = /[0-9]{1,10}[,][0-9]{1,3}$/;
                regexp = /[0-9]{2}$/;
                return !(regexp.test(field.value))
            }
        }
    }
    if (key > 47 && key < 58) {
        if (field.value === "")
            return true;
        regexp = /[0-9]{10}/;
        return !(regexp.test(field.value));
    }
    if (key === 44) {
        if (field.value === "")
            return false;
        regexp = /^[0-9]+$/;
        return regexp.test(field.value);

    }

    return false;
}

function confirmacion() {
    var answer = confirm("Seguro desea continuar?")
    if (answer == true) {
        ShowProgress();
        return true;
    }
    else { return false; }

}

function ShowProgress() {
    setTimeout(function () {
        var loading = $(".loading");
        loading.css("vertical-align", "middle");
        loading.css("horizontal-align", "middle");
        loading.css("display", "table-cell");
        var top = Math.max($(window).height() / 2 - loading[0].offsetHeight / 2, 0);
        var left = Math.max($(window).height() / 2 - loading[0].offsetHeight / 2, 0);
        loading.css({ top: top, left: left });



    }, 100);
}

