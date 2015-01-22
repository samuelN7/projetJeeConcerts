/**
 * 
 */

var Artiste = document.getElementById("Artiste");
var genreArtiste = document.getElementById("genreArtiste");
var evt = document.getElementById("evenement");

/* alignement menu déroulant Artiste */
Artiste.addEventListener('mouseover', function() {
	genreArtiste.style.display = 'inline-block';
	genreArtiste.style.position = 'absolute';
	genreArtiste.style.left = Artiste.offsetLeft.toString() + 'px';
	genreArtiste.style.top = (Artiste.offsetTop + Artiste.offsetHeight)
			.toString()
			+ 'px';
}, false);

/* gestion du fond bleu clair sur le menu nav */
Artiste.addEventListener('mouseout', function() {
	genreArtiste.style.display = 'none';
	Artiste.style.backgroundColor = '#e0e0e0';
}, false);

genreArtiste.addEventListener('mouseover', function() {
	Artiste.style.backgroundColor = '#33bde5';
}, false);

genreArtiste.addEventListener('mouseout', function() {
	Artiste.style.backgroundColor = '#e0e0e0';
}, false);

Artiste.addEventListener('mouseover', function(e) {

	var relatedTarget = e.relatedTarget;

	while (relatedTarget != genreArtiste && relatedTarget.nodeName != 'BODY'
			&& relatedTarget != document) {
		relatedTarget = relatedTarget.parentNode;
	}

	if (relatedTarget = genreArtiste) {
		Artiste.style.backgroundColor = '#33bde5';
	}

}, false);

/* taille boutons menu */

evt.style.width = (evt.style.offsetWidth + 5).toString() + 'px';
