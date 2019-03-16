function menuChange(selectObj) {
    var x = selectObj.selectedIndex;
    if(x == 1) {
        var box = document.getElementById('handleIn');
        box.value = selectObj.options[x].value;
        selectObj.selectedIndex = 0;
    }
    else {
        var url = selectObj.options[x].value;
        if(url != "") {
           window.open(url);
        }
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