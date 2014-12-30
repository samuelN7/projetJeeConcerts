package projet_jee;

import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;

@Entity
public class Utilisateur {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	int id;
	
	String nom;
	String prenom;
	String adresse;
	String Ville;
	String email;
	String pseudo;
	String motDePasse;
	String description;
	
	@ManyToMany
	Collection<Artiste> artistesFavoris;
	
	@ManyToMany
	Collection<Salle> sallesFavorites;
	
	@ManyToMany(mappedBy="amis")
	Collection<Utilisateur> amis;
	
	@ManyToMany(mappedBy="inscrisNonCache")
	Collection<Utilisateur> inscrisNonCache;
	
	

}
