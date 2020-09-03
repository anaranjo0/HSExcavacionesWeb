//const empresa = document.getElementById('empre');
//empresa.innerHTML = '@System.Configuration.ConfigurationManager.AppSettings["Empresa"]';

//function formatCurrency(number) {
//    var formatted = new Intl.NumberFormat("es-CO", {
//        style: 'currency',
//        currency: "COP",
//        minimumFractionDigits: 2
//    }).format(number);
//    return formatted;
//}



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

//$(document).ready(function () {
//    var gridHeader = $('#<%=GRDmaquinaria.ClientID%>').clone(true); // Here Clone Copy of Gridview with style
//    $(gridHeader).find("tr:gt(0)").remove(); // Here remove all rows except first row (header row)
//    $('#<%=GRDmaquinaria.ClientID%> tr th').each(function (i) {
//        // Here Set Width of each th from gridview to new table(clone table) th 
//        $("th:nth-child(" + (i + 1) + ")", gridHeader).css('width', ($(this).width()).toString() + "px");
//    });
//    $("#GHead").append(gridHeader);
//    $('#GHead').css('position', 'absolute');
//    $('#GHead').css('top', $('#<%=GRDmaquinaria.ClientID%>').offset().top);

//});