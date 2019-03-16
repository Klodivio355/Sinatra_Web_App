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

function currentDetails() {
    var x = confirm('Yes or no?')
    if(x) { 
        alert('You picked Yes.') 
    }
    else { 
        alert('You picked No.') 
    }
}