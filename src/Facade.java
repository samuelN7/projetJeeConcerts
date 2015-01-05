package projetJeeConcerts;
import java.util.Collection;
import java.util.LinkedList;

import javax.print.attribute.DateTimeSyntax;

/**
 * 
 */

/**
 * @author Nicolas Ronco
 *
 */
public class Facade {
	
	public Collection<Utilisateur> utilisateurs;
	public Collection<Evenement> evenements;
	public Collection<Artiste> artistes;
	public Collection<Salle> Salle;
	
	
	public Facade() {
		this.utilisateurs = new LinkedList<Utilisateur>();
		this.artistes = new LinkedList<Artiste>();
		this.evenements = new LinkedList<Evenement>();
		this.Salle = new LinkedList<Salle>();
	}
	
	public void ajoutUtilisateur(String nom, String prenom, String pseudo,
			String motDePasse, String adresseMail){
		Utilisateur u = new Utilisateur();
		u.setNom(nom);
		u.setPrenom(prenom);
		u.setPseudo(pseudo);
		u.setMotDePasse(motDePasse);
		u.setAdresse(adresseMail);
		this.utilisateurs.add(u);
	}
	
	public void ajoutEvenement(Salle salle, Artiste artiste, DateTimeSyntax date){
		Evenement e = new Evenement();
		this.evenements.add(e);
		e.setSalle(salle);
		e.setArtiste(artiste);
		e.setDate(date);
	}
	
	public void ajoutArtiste(String nom, String prenom, TypeArtiste typeArtiste){
		Artiste a = new Artiste();
		this.artistes.add(a);
		a.setNom(nom);
		a.setPrenom(prenom);
		a.setTypeArtiste(typeArtiste);
	}
	
	public void ajoutSalle(String adresse, String nom, int capacite, int telephone){
		Salle l = new Salle();
		this.Salle.add(l);
		l.setAdresse(adresse);
		l.setNom(nom);
		l.setCapacite(capacite);
		l.setTelephone(telephone);
	}

	public Collection<Utilisateur> getUtilisateurs() {
		return utilisateurs;
	}

	public Collection<Evenement> getEvenements() {
		return evenements;
	}

	public Collection<Artiste> getArtistes() {
		return artistes;
	}
}