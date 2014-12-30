package projet_jee;

import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;

@Entity
public class Artiste extends Utilisateur {
	
	String nom_groupe;
	String description_groupe;
	
	@ManyToMany
	Collection<Utilisateur> followers;
	
	@OneToMany(mappedBy="artiste")
	Collection<Evenement> evenements;
	
	 @OneToMany(mappedBy="artiste")
	 Collection<Tournee> tournees;
	
	

}
