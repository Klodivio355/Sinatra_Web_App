function menuChange(selectObj) {
    var x = selectObj.selectedIndex;
    if(x == 1) {
        
    }
    else {
        var url = selectObj.options[x].value;
        if(url != "") {
           window.open(url);
        }
        selectObj.selectedIndex = 0;
    }
}