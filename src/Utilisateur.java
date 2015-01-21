package projet_jee;

import java.util.Set;
import java.util.TreeSet;

import javax.persistence.DiscriminatorColumn;
import javax.persistence.DiscriminatorType;
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
@Inheritance(strategy=InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(
	    name="est",
	    discriminatorType=DiscriminatorType.STRING
	)
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
	
	@ManyToMany(/*cascade=CascadeType.REMOVE,*/ fetch=FetchType.EAGER)
	Set<Artiste> artistesFavoris;
	
	@ManyToMany
	Set<Salle> sallesFavorites;
	
	/*@ManyToMany
	Set<Utilisateur> amis;*/
	
	
	@ManyToMany(mappedBy="inscrisE",fetch=FetchType.EAGER)
//	@LazySet(LazySetOption.FALSE)
//	@ Fetch(value = FetchMode.SUBSELECT)
	Set<Evenement> inscris;// = new TreeSet<Evenement>();
	
//	@ManyToMany(mappedBy="inscrisNonCacheE")
//	Set<Evenement> inscrisNonCache;
	
	@OneToMany(mappedBy="dest",fetch=FetchType.EAGER)
	Set<Message> messagesPerso;

	public Utilisateur() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public void ajouterArtisteFavoris(Artiste a) {
		this.artistesFavoris.add(a);
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

	public Set<Artiste> getArtistesFavoris() {
		return artistesFavoris;
	}

	public void setArtistesFavoris(Set<Artiste> artistesFavoris) {
		this.artistesFavoris = artistesFavoris;
	}

	public Set<Salle> getSallesFavorites() {
		return sallesFavorites;
	}

	public void setSallesFavorites(Set<Salle> sallesFavorites) {
		this.sallesFavorites = sallesFavorites;
	}

//	public Set<Utilisateur> getAmis() {
//		return amis;
//	}
//
//	public void setAmis(Set<Utilisateur> amis) {
//		this.amis = amis;
//	}

	public Set<Evenement> getInscris() {
		return inscris;
	}

	public void setInscris(Set<Evenement> inscris) {
		this.inscris = inscris;
	}

//	public Set<Evenement> getInscrisNonCache() {
//		return inscrisNonCache;
//	}
//
//	public void setInscrisNonCache(Set<Evenement> inscrisNonCache) {
//		this.inscrisNonCache = inscrisNonCache;
//	}
	
	public Set<Message> getMessagesPerso() {
		return messagesPerso;
	}

	public void setMessagesPerso(Set<Message> messagesPerso) {
		this.messagesPerso = messagesPerso;
	}	
	

}
