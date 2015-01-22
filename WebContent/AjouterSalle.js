/**
 * 
 */

var bouton = document.getElementById("ajouterSalle");

var form = document.forms;
var erreur1 = document.getElementById("erreur1");
var erreur2 = document.getElementById("erreur2");
var erreur3 = document.getElementById("erreur3");
var erreur4 = document.getElementById("erreur4");
var erreur5 = document.getElementById("erreur5");
var erreur6 = document.getElementById("erreur6");

var listeErreur = [ erreur1, erreur2, erreur3, erreur4, erreur5, erreur6 ]; // liste des images d'erreur
var listeString = [ "nomSalle", "adresse", "ville", "descriptionSalle",
		"capacite", "tel" ]; // liste des input associés aux images

//Initialement, le formulaire ne comporte pas d'erreur
for ( var i = 0; i < listeString.length; i++) {
	listeErreur[i].style.display = 'none';
}

//on vérifie que le formulaire a été correctement rempli
bouton.addEventListener('click', function(e) {

	var bool = true;

	for ( var i = 0; i < listeString.length; i++) {
		if (form["formAjouterSalle"][listeString[i]].value == "") {
			bool = false;
			listeErreur[i].style.display = 'inline-block';
		} else {
			listeErreur[i].style.display = 'none';
		}
	}
	if (!bool) {
		alert("Vous devez remplir les champs obligatoires !");
		e.preventDefault();
		// break;
	} else {
		alert("Votre Salle a bien été ajoutée !");
	}
}, false);