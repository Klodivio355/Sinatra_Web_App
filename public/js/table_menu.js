function menuChange(selectObj) {
    var x = selectObj.selectedIndex;
    var url = selectObj.options[x].value;
    if(url != "") {
       window.open(url);
    }
    selectObj.selectedIndex = 0;
}