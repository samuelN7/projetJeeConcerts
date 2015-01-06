package projet_jee;

import java.util.Collection;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;

@Entity
@DiscriminatorValue("utilisateur")
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
	
	@ManyToMany
	Collection<Utilisateur> amis;
	
	@ManyToMany(mappedBy="inscrisE")
	Collection<Evenement> inscris;
	
	@ManyToMany(mappedBy="inscrisNonCacheE")
	Collection<Evenement> inscrisNonCache;
	
	
	

	public Utilisateur() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getPrenom() {
		return prenom;
	}

	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}

	public String getAdresse() {
		return adresse;
	}

	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}

	public String getVille() {
		return Ville;
	}

	public void setVille(String ville) {
		Ville = ville;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPseudo() {
		return pseudo;
	}

	public void setPseudo(String pseudo) {
		this.pseudo = pseudo;
	}

	public String getMotDePasse() {
		return motDePasse;
	}

	public void setMotDePasse(String motDePasse) {
		this.motDePasse = motDePasse;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Collection<Artiste> getArtistesFavoris() {
		return artistesFavoris;
	}

	public void setArtistesFavoris(Collection<Artiste> artistesFavoris) {
		this.artistesFavoris = artistesFavoris;
	}

	public Collection<Salle> getSallesFavorites() {
		return sallesFavorites;
	}

	public void setSallesFavorites(Collection<Salle> sallesFavorites) {
		this.sallesFavorites = sallesFavorites;
	}

	public Collection<Utilisateur> getAmis() {
		return amis;
	}

	public void setAmis(Collection<Utilisateur> amis) {
		this.amis = amis;
	}

	public Collection<Evenement> getInscris() {
		return inscris;
	}

	public void setInscris(Collection<Evenement> inscris) {
		this.inscris = inscris;
	}

	public Collection<Evenement> getInscrisNonCache() {
		return inscrisNonCache;
	}

	public void setInscrisNonCache(Collection<Evenement> inscrisNonCache) {
		this.inscrisNonCache = inscrisNonCache;
	}
	
	
	
	

}
