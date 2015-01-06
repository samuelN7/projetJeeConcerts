package projet_jee;

import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;

@Entity
public class Salle {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	int id;
	String nom;
	String adresse;
	String ville;
	String description;
	int capacite;
	int telephone;
	
	@ManyToMany(mappedBy="sallesFavorites")
	Collection<Utilisateur> followers;
	@OneToMany(mappedBy="salle")
	Collection<Evenement> evenements;
	
	
	
	public Salle() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	

	public int getTelephone() {
		return telephone;
	}



	public void setTelephone(int telephone) {
		this.telephone = telephone;
	}



	public int getCapacite() {
		return capacite;
	}



	public void setCapacite(int capacite) {
		this.capacite = capacite;
	}



	public Collection<Evenement> getEvenements() {
		return evenements;
	}



	public void setEvenements(Collection<Evenement> evenements) {
		this.evenements = evenements;
	}



	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getAdresse() {
		return adresse;
	}

	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}

	public String getVille() {
		return ville;
	}

	public void setVille(String ville) {
		this.ville = ville;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Collection<Utilisateur> getFollowers() {
		return followers;
	}

	public void setFollowers(Collection<Utilisateur> followers) {
		this.followers = followers;
	}

}
