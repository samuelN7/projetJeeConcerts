package projet_jee;

import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;

@Entity
public class Salle {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	int id;
	String adresse;
	String Ville;
	String description;
	
	@ManyToMany(mappedBy="sallesFavorites")
	Collection<Utilisateur> followers;
	
}
