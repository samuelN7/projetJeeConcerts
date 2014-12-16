package projet_jee;

import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;

@Entity
public class Artiste {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	int id;
	
	String nom_gerant;
	String prenom_gerant;
	String adresse_gerant;
	String Ville_gerant;
	String email_gerant;
	String nom_groupe;
	String motDePasse;
	String description_groupe;
	
	@ManyToMany(mappedBy="artistesFavoris")
	Collection<Utilisateur> followers;
	
	

}
