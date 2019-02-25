function showDropdown() {
  document.getElementById("dropdownMenu").classList.toggle("showOptions");
  var x = document.getElementById("dropdownButton");
  if(x.innerHTML == "\u25B2&#9660;") {
    x.innerHTML = "\u25B2&#9650;"; 
  }
  else {
    x.innerHTML = "\u25B2&#9660;"; 
  }
}