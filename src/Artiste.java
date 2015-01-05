package projetJeeConcerts;

import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;

@Entity
public class Artiste extends Utilisateur {
	
	String nom_groupe;
	String description_groupe;
	TypeArtiste typeArtiste ;
	
	@ManyToMany(mappedBy="artistesFavoris")
	Collection<Utilisateur> followers;
	
	@OneToMany(mappedBy="artiste")
	Collection<Evenement> evenements;
	
	 @OneToMany(mappedBy="artiste")
	 Collection<Tournee> tournees;
	 
	 

	public Artiste() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	

	public TypeArtiste getTypeArtiste() {
		return typeArtiste;
	}



	public void setTypeArtiste(TypeArtiste typeArtiste) {
		this.typeArtiste = typeArtiste;
	}



	public String getNom_groupe() {
		return nom_groupe;
	}

	public void setNom_groupe(String nom_groupe) {
		this.nom_groupe = nom_groupe;
	}

	public String getDescription_groupe() {
		return description_groupe;
	}

	public void setDescription_groupe(String description_groupe) {
		this.description_groupe = description_groupe;
	}

	public Collection<Utilisateur> getFollowers() {
		return followers;
	}

	public void setFollowers(Collection<Utilisateur> followers) {
		this.followers = followers;
	}

	public Collection<Evenement> getEvenements() {
		return evenements;
	}

	public void setEvenements(Collection<Evenement> evenements) {
		this.evenements = evenements;
	}

	public Collection<Tournee> getTournees() {
		return tournees;
	}

	public void setTournees(Collection<Tournee> tournees) {
		this.tournees = tournees;
	}
	
	

}
