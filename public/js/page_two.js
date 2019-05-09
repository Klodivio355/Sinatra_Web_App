var AddT = document.getElementById("addT");
AddT.addEventListener('click', addTaxi);
var RemoveT = document.getElementById("removeT");
RemoveT.addEventListener('click', removeTaxi);
var AddTy = document.getElementById("addTy");
AddTy.addEventListener('click', addType);
var UpdatePr = document.getElementById("updatePr");
UpdatePr.addEventListener('click', updatePr);
var UpdateDe = document.getElementById("updateDe");
UpdateDe.addEventListener('click', updateDescription);
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

var query = document.getElementById("querylabel");
query.style.display = "none";

var iOne = document.getElementById("inputOne");
var lOne = document.getElementById("labelOne");
var iTwo = document.getElementById("inputTwo");
var lTwo = document.getElementById("labelTwo");
var iThree = document.getElementById("inputThree");
var lThree = document.getElementById("labelThree");
var iFour = document.getElementById("inputFour");
var lFour = document.getElementById("labelFour");
var iFive = document.getElementById("inputFive");
var lFive = document.getElementById("labelFive");

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
    iFive.style.display = "none";
	lFive.style.display = "none";
    
}

function addTaxi() {
	lOne.innerHTML = "Registration: ";
	lTwo.innerHTML = "Type: ";
	
	iOne.style.display = "inline";
	lOne.style.display = "inline";
	iTwo.style.display = "inline";
	lTwo.style.display = "inline";
    
    query.InnerHTML = "addTaxi";
}

function removeTaxi() {
	hideAll();
	
	lOne.innerHTML = "Registration: ";
	
	iOne.style.display = "inline";
	lOne.style.display = "inline";
    
    query.InnerHTML = "removeTaxi";
}

function addType() {
	hideAll();
	
	lOne.innerHTML = "Type: ";
	lTwo.innerHTML = "Description: ";
    lThree.innerHTML = "Base price: ";
    lfour.innerHTML = "Number of seats: ";
	
	iOne.style.display = "inline";
	lOne.style.display = "inline";
	iTwo.style.display = "inline";
	lTwo.style.display = "inline";
    iThree.style.display = "inline";
	lThree.style.display = "inline";
    iFour.style.display = "inline";
	lFour.style.display = "inline";
    
    query.InnerHTML = "addType";
}

function updatePr() {
	hideAll();
	
	lOne.innerHTML = "Type: ";
	lTwo.innerHTML = "Price: ";
	
	iOne.style.display = "inline";
	lOne.style.display = "inline";
	iTwo.style.display = "inline";
	lTwo.style.display = "inline";
    
    query.InnerHTML = "updatePrice";
}

function updateDescription() {
	hideAll();
	
	lOne.innerHTML = "Type: ";
	lTwo.innerHTML = "Description: ";
    lThree.innerHTML = "Base price: ";
    lfour.innerHTML = "Number of seats: ";
	
	iOne.style.display = "inline";
	lOne.style.display = "inline";
	iTwo.style.display = "inline";
	lTwo.style.display = "inline";
    iThree.style.display = "inline";
	lThree.style.display = "inline";
    iFour.style.display = "inline";
	lFour.style.display = "inline";
    
    query.InnerHTML = "addDescription";
}

function unbanUser() {
	hideAll();
	
	lOne.innerHTML = "Twitter handle :";
	iOne.style.display = "inline";
	lOne.style.display = "inline";
    
    query.InnerHTML = "unbanUser";
}

function updateEmail() {
	hideAll();
	
	lOne.innerHTML = "Email: ";
	iOne.style.display = "inline";
	lOne.style.display = "inline";
    
    query.InnerHTML = "updateEmail";
}

function updatePassword() {
	hideAll();
	
	lOne.innerHTML = "Password: ";
	lTwo.innerHTML = "Re-enter password: ";
	
	iOne.style.display = "inline";
	lOne.style.display = "inline";
	iTwo.style.display = "inline";
	lTwo.style.display = "inline";
    
    query.InnerHTML = "updatePassword";
}

function addAdmin() {
	lOne.innerHTML = "First name: ";
	lTwo.innerHTML = "Surname: ";
	lThree.innerHTML = "Email: ";
	lFour.innerHTML = "Password: ";
    lFive.innerHTML = "Area";
    
    iOne.style.display = "inline";
	lOne.style.display = "inline";
	iTwo.style.display = "inline";
	lTwo.style.display = "inline";
	iThree.style.display = "inline";
	lThree.style.display = "inline";
	iFour.style.display = "inline";
	lFour.style.display = "inline";
    iFive.style.display = "inline";
	lFive.style.display = "inline";
    
    query.InnerHTML = "addAdmin";
}

function removeAdmin() {
	hideAll();
	
	lOne.innerHTML = "Id: ";
	iOne.style.display = "inline";
	lOne.style.display = "inline";
    
    query.InnerHTML = "removeAdmin";
}
