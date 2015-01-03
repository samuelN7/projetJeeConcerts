package projet_jee;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

public class Evenement {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	int id;
	@ManyToOne
	Artiste artiste;
	@ManyToOne
	Salle salle;
	String titre;
	String description;
	int prix;
	DateTimeSyntax date;
	@ManyToOne
	Tournee tournee;
	@ManyToMany
	Collection<Utilisateur> inscris;
	@ManyToMany
	Collection<Utilisateur> inscrisNonCache;

}
