function menuChange(selectObj) {
    var x = selectObj.selectedIndex;
    if(x == 1) { 
        var box = document.getElementById('handleIn');
        var value = selectObj.options[x].value;
        value = value.split(",");
        box.value = value[0];
        selectObj.selectedIndex = 0;
    }
    else if(x == 2) {
        var box = document.getElementById('replyHandle');
        var box2 = document.getElementById('replyID');
        var value = selectObj.options[x].value;
        value = value.split(",");
        box.value = value[0];
        box2.value = value[1];
        selectObj.selectedIndex = 0;
    }
}

function clear() {
    document.getElementById("handleIn").value = "";
    document.getElementById("regIn").value = "";
    document.getElementById("startTimeIn").value = "";
    document.getElementById("endTimeIn").value = "";
    document.getElementById("dateIn").value = "";
    document.getElementById("startPosIn").value = "";
    document.getElementById("endPosIn").value = "";
    document.getElementById("priceIn").value = "";
}

function autosearch(term) {
    document.getElementById("searchbar").value = "#TaxisIn" + term;
    document.getElementById("searchform").submit();
}