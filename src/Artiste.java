package projet_jee;

import java.util.Set;
import java.util.LinkedList;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;

@Entity
@DiscriminatorValue("artiste")
public class Artiste extends Utilisateur {

	String nom_groupe;
	String description_groupe;
	int typeArtiste ;
	
	@ManyToMany(mappedBy="artistesFavoris",fetch=FetchType.EAGER)
	Set<Utilisateur> followers;
	
	@OneToMany(mappedBy="artiste",fetch=FetchType.EAGER)
	Set<Evenement> evenements;
	
	 @OneToMany(mappedBy="artiste")
	 Set<Tournee> tournees;
	 
	 @OneToMany
	 Set<Message> commentaires;
	 
	 

	public Artiste() {
		super();
		// TODO Auto-generated constructor stub
	}
	

	public int getTypeArtiste() {
		return typeArtiste;
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

	public Set<Utilisateur> getFollowers() {
		return followers;
	}

	public void setFollowers(Set<Utilisateur> followers) {
		this.followers = followers;
	}

	public Set<Evenement> getEvenements() {
		return evenements;
	}

	public void setEvenements(Set<Evenement> evenements) {
		this.evenements = evenements;
	}

	public Set<Tournee> getTournees() {
		return tournees;
	}

	public void setTournees(Set<Tournee> tournees) {
		this.tournees = tournees;
	}
	
	public Set<Message> getCommentaires() {
		return commentaires;
	}

	public void setCommentaires(Set<Message> commentaires) {
		this.commentaires = commentaires;
	}
	

}
