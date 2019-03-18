var AddT = document.getElementById("addT");
AddT.addEventListener('click', addTaxi);
var RemoveT = document.getElementById("removeT");
RemoveT.addEventListener('click', removeTaxi);
var UpdateT = document.getElementById("updateT");
UpdateT.addEventListener('click', addTaxi);
var UpdatePr = document.getElementById("updatePr");
UpdatePr.addEventListener('click', updatePr);
var Unban = document.getElementById("unban");
Unban.addEventListener('click', unbanUser);
var UpdateE = document.getElementById("updateE");
UpdateE.addEventListener('click', updateEmail);
var UpdatePa = document.getElementById("updatePa");
UpdatePa.addEventListener('click', updatePassword);
var AddA = document.getElementById("addA");
AddA.addEventListener('click', addAdmin);
var RemoveA = document.getElementById("removeA");
RemoveA.addEventListener('click', removeAdmin);

var iOne = document.getElementById("inputOne");
var lOne = document.getElementById("labelOne");
var iTwo = document.getElementById("inputTwo");
var lTwo = document.getElementById("labelTwo");
var iThree = document.getElementById("inputThree");
var lThree = document.getElementById("labelThree");
var iFour = document.getElementById("inputFour");
var lFour = document.getElementById("labelFour");

hideAll();

function hideAll() {
	iOne.style.display = "none";
	lOne.style.display = "none";
	iTwo.style.display = "none";
	lTwo.style.display = "none";
	iThree.style.display = "none";
	lThree.style.display = "none";
	iFour.style.display = "none";
	lFour.style.display = "none";
}

function addTaxi() {
	lOne.innerHTML = "Registration: ";
	lTwo.innerHTML = "Type: ";
	lThree.innerHTML = "Price: ";
	lFour.innerHTML = "Seats: ";
	
	iOne.style.display = "inline";
	lOne.style.display = "inline";
	iTwo.style.display = "inline";
	lTwo.style.display = "inline";
	iThree.style.display = "inline";
	lThree.style.display = "inline";
	iFour.style.display = "inline";
	lFour.style.display = "inline";
}

function removeTaxi() {
	hideAll();
	
	lOne.innerHTML = "Registration: ";
	
	iOne.style.display = "inline";
	lOne.style.display = "inline";
}

function updatePr() {
	hideAll();
	
	lOne.innerHTML = "Type: ";
	lTwo.innerHTML = "Price: ";
	
	iOne.style.display = "inline";
	lOne.style.display = "inline";
	iTwo.style.display = "inline";
	lTwo.style.display = "inline";
}

function unbanUser() {
	hideAll();
	
	lOne.innerHTML = "Twitter handle :";
	iOne.style.display = "inline";
	lOne.style.display = "inline";
}

function updateEmail() {
	hideAll();
	
	lOne.innerHTML = "Email: ";
	iOne.style.display = "inline";
	lOne.style.display = "inline";
}

function updatePassword() {
	hideAll();
	
	lOne.innerHTML = "Password: ";
	lTwo.innerHTML = "Re-enter password: ";
	
	iOne.style.display = "inline";
	lOne.style.display = "inline";
	iTwo.style.display = "inline";
	lTwo.style.display = "inline";
}

function addAdmin() {
	lOne.innerHTML = "First name: ";
	lTwo.innerHTML = "Surname: ";
	lThree.innerHTML = "Email: ";
	lFour.innerHTML = "Password: ";
}

function removeAdmin() {
	hideAll();
	
	lOne.innerHTML = "Id: ";
	iOne.style.display = "inline";
	lOne.style.display = "inline";
}