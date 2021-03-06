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


var Submit = document.getElementById("submit");
Submit.disabled = true;


var query = document.getElementById("queryLabel");
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
    hideAll();
    
	lOne.innerHTML = "Registration: ";
	lTwo.innerHTML = "Type: ";
    lThree.innerHTML = "Area: ";
	
	iOne.style.display = "inline";
	lOne.style.display = "inline";
	iTwo.style.display = "inline";
	lTwo.style.display = "inline";
    iThree.style.display = "inline";
	lThree.style.display = "inline";
    
    query.value = "addTaxi";
    
    Submit.disabled = false;
    
}

function removeTaxi() {
	hideAll();
	
	lOne.innerHTML = "Registration: ";
	
	iOne.style.display = "inline";
	lOne.style.display = "inline";
    
    query.value = "removeTaxi";
    
    Submit.disabled = false;
}

function addType() {
	hideAll();
	
	lOne.innerHTML = "Type: ";
	lTwo.innerHTML = "Description: ";
    lThree.innerHTML = "Base price: ";
    lFour.innerHTML = "Number of seats: ";
	
	iOne.style.display = "inline";
	lOne.style.display = "inline";
	iTwo.style.display = "inline";
	lTwo.style.display = "inline";
    iThree.style.display = "inline";
	lThree.style.display = "inline";
    iFour.style.display = "inline";
	lFour.style.display = "inline";
    
    query.value = "addType";
    
    Submit.disabled = false;
}

function updatePr() {
	hideAll();
	
	lOne.innerHTML = "Type: ";
	lTwo.innerHTML = "Price: ";
	
	iOne.style.display = "inline";
	lOne.style.display = "inline";
	iTwo.style.display = "inline";
	lTwo.style.display = "inline";
    
    query.value = "updatePrice";
    
    Submit.disabled = false;
}

function updateDescription() {
	hideAll();
	
	lOne.innerHTML = "Type: ";
	lTwo.innerHTML = "Description: ";
    lThree.innerHTML = "Base price: ";
    lFour.innerHTML = "Number of seats: ";
	
	iOne.style.display = "inline";
	lOne.style.display = "inline";
	iTwo.style.display = "inline";
	lTwo.style.display = "inline";
    iThree.style.display = "inline";
	lThree.style.display = "inline";
    iFour.style.display = "inline";
	lFour.style.display = "inline";
    
    query.value = "updateDescription";
    
    Submit.disabled = false;
}

function unbanUser() {
	hideAll();
	
	lOne.innerHTML = "Twitter handle :";
	iOne.style.display = "inline";
	lOne.style.display = "inline";
    
    query.value = "unbanUser";
    
    Submit.disabled = false;
}

function updateEmail() {
	hideAll();
	
    lOne.innerHTML = "Id: ";
	lTwo.innerHTML = "Email: ";
	iOne.style.display = "inline";
	lOne.style.display = "inline";
    iTwo.style.display = "inline";
	lTwo.style.display = "inline";
    
    query.value = "updateEmail";
    
    Submit.disabled = false;
}

function updatePassword() {
	hideAll();
	
    lOne.innerHTML = "Id: ";
	lTwo.innerHTML = "Password: ";
	lThree.innerHTML = "Re-enter password: ";
	
	iOne.style.display = "inline";
	lOne.style.display = "inline";
	iTwo.style.display = "inline";
	lTwo.style.display = "inline";
    iThree.style.display = "inline";
	lThree.style.display = "inline";
    
    query.value = "updatePassword";
    
    Submit.disabled = false;
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
    
    query.value = "addAdmin";
    
    Submit.disabled = false;
}

function removeAdmin() {
	hideAll();
	
	lOne.innerHTML = "Id: ";
	iOne.style.display = "inline";
	lOne.style.display = "inline";
    
    query.value = "removeAdmin";
    
    Submit.disabled = false;
}
