/**
 * 
 */

var bouton = document.getElementById("bouton");

var cocher = document.getElementById("checkbox");
var formArtiste = document.getElementById("formArtiste");
cocher.addEventListener('click', function() {
	if (cocher.checked) {
		formArtiste.style.display = 'inline-block';
	}
	if (!cocher.checked) {
		formArtiste.style.display = 'none';
	}
}, false);

var form = document.getElementById("formulaireInscription");
var form = document.forms;
var erreur1 = document.getElementById("erreur1");
var erreur2 = document.getElementById("erreur2");
var erreur3 = document.getElementById("erreur3");
var erreur4 = document.getElementById("erreur4");
var erreur5 = document.getElementById("erreur5");
var erreur6 = document.getElementById("erreur6");
var erreur7 = document.getElementById("erreur7");
var erreur8 = document.getElementById("erreur8");
var erreur9 = document.getElementById("erreur9");
var erreur10 = document.getElementById("erreur10");

var listeErreur = [ erreur1, erreur2, erreur3, erreur4, erreur5, erreur6,
		erreur7, erreur8, erreur9, erreur10 ];
var listeString = [ "nom", "prenom", "pseudo", "mdp", "adresse", "mail",
		"ville", "typeArtiste", "nomArtiste", "desc_groupe" ];
var form = document.forms;

for ( var i = 0; i < listeString.length; i++) {
	listeErreur[i].style.display = 'none';
}

bouton
		.addEventListener(
				'click',
				function(e) {

					var bool = true;
					if (cocher.checked) {
						for ( var i = 0; i < listeString.length; i++) {
							if (form["formulaireInscription"][listeString[i]].value == "") {
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
							alert("Merci de vous être inscit. Nous vous souhaitons de belles découvertes culturelles !");
						}
					} else {
						for ( var i = 0; i < 7; i++) {
							if (form["formulaireInscription"][listeString[i]].value == "") {
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
							alert("Merci de vous être inscit. Nous vous souhaitons de belles découvertes culturelles !");
						}

					}

				}, false);
