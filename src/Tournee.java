package projet_jee;
import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;


@Entity
public class Tournee {

    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    int id;
    String titre;
    String description;
    String dateDebut;
    String dateFin;
    @ManyToOne
    Artiste artiste;
    @OneToMany(mappedBy="tournee")
    Collection<Evenement> evenements;
    @OneToMany
	Collection<Message> commentaires;

	public Tournee() {
		
	}
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public String getDateDebut() {
		return dateDebut;
	}
	public void setDateDebut(String dateDebut) {
		this.dateDebut = dateDebut;
	}
	public String getDateFin() {
		return dateFin;
	}
	public void setDateFin(String dateFin) {
		this.dateFin = dateFin;
	}
	public Artiste getArtiste() {
		return artiste;
	}
	public void setArtiste(Artiste artiste) {
		this.artiste = artiste;
	}
	public Collection<Evenement> getEvenements() {
		return evenements;
	}
	public void setEvenements(Collection<Evenement> evenements) {
		this.evenements = evenements;
	}
	
	public Collection<Message> getCommentaires() {
		return commentaires;
	}

	public void setCommentaires(Collection<Message> commentaires) {
		this.commentaires = commentaires;
	}
}