package projetJeeConcerts;

import java.util.Collection;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.print.attribute.DateTimeSyntax;

public class Evenement {
	
	
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	int id;
	@ManyToOne
	Artiste artiste;
	@ManyToOne
	Salle salle;
	String titre;
	String description;
	int prix;
	DateTimeSyntax date;
	@ManyToOne
	Tournee tournee;
	@ManyToMany
	Collection<Utilisateur> inscrisE;
	@ManyToMany
	Collection<Utilisateur> inscrisNonCacheE;
	
	
	
	
	public Evenement() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Artiste getArtiste() {
		return artiste;
	}
	public void setArtiste(Artiste artiste) {
		this.artiste = artiste;
	}
	public Salle getSalle() {
		return salle;
	}
	public void setSalle(Salle salle) {
		this.salle = salle;
	}
	public String getTitre() {
		return titre;
	}
	public void setTitre(String titre) {
		this.titre = titre;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getPrix() {
		return prix;
	}
	public void setPrix(int prix) {
		this.prix = prix;
	}
	public DateTimeSyntax getDate() {
		return date;
	}
	public void setDate(DateTimeSyntax date) {
		this.date = date;
	}
	public Tournee getTournee() {
		return tournee;
	}
	public void setTournee(Tournee tournee) {
		this.tournee = tournee;
	}
	public Collection<Utilisateur> getInscrisE() {
		return inscrisE;
	}
	public void setInscrisE(Collection<Utilisateur> inscris) {
		this.inscrisE = inscris;
	}
	public Collection<Utilisateur> getInscrisNonCacheE() {
		return inscrisNonCacheE;
	}
	public void setInscrisNonCache(Collection<Utilisateur> inscrisNonCache) {
		this.inscrisNonCacheE = inscrisNonCache;
	}
	
	

}
