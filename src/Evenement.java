package projet_jee;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

public class Evenement {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	int id;
	Artiste artiste;
	Salle salle;
	String titre;
	String description;
	int prix;
	@ManyToMany
	Collection<Utilisateur> inscris;
	@ManyToMany
	Collection<Utilisateur> inscrisNonCache;

}
