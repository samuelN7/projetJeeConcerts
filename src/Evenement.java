package projet_jee;

import java.util.Set;
import java.util.TreeSet;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;


@Entity
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
	String date;
	@ManyToOne
	Tournee tournee;
	@ManyToMany(fetch=FetchType.EAGER)//(/*cascade=CascadeType.ALL,*/ fetch=FetchType.EAGER)
	Set<Utilisateur> inscrisE; //= new TreeSet<Utilisateur>();
	/*@ManyToMany
	Set<Utilisateur> inscrisNonCacheE;*/
	@OneToMany
	Set<Message> commentaires;
	
	
	
	
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
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public Tournee getTournee() {
		return tournee;
	}
	public String getTitreTournee() {
		if (tournee==null){
			return null;
		}
		else{
			return tournee.getTitre();
		}
	}
	public void setTournee(Tournee tournee) {
		this.tournee = tournee;
	}
	public Set<Utilisateur> getInscrisE() {
		return inscrisE;
	}
	public void setInscrisE(Set<Utilisateur> inscris) {
		this.inscrisE = inscris;
	}
//	public Set<Utilisateur> getInscrisNonCacheE() {
//		return inscrisNonCacheE;
//	}
	public Set<Message> getCommentaires() {
		return commentaires;
	}
	public void setCommentaires(Set<Message> commentaires) {
		this.commentaires = commentaires;
	}
//	public void setInscrisNonCacheE(Set<Utilisateur> inscrisNonCacheE) {
//		this.inscrisNonCacheE = inscrisNonCacheE;
//	}
	
	

}
