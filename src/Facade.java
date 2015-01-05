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
	public Collection<Salle> salles;
	public Collection<Tournee> tournees;
	
	
	public Facade() {
		this.utilisateurs = new LinkedList<Utilisateur>();
		this.artistes = new LinkedList<Artiste>();
		this.evenements = new LinkedList<Evenement>();
		this.salles = new LinkedList<Salle>();
		this.tournees = new LinkedList<Tournee>();
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
		e.setSalle(salle);
		e.setArtiste(artiste);
		e.setDate(date);
		this.evenements.add(e);
	}
	
	public void ajoutArtiste(String nom, String prenom, TypeArtiste typeArtiste){
		Artiste a = new Artiste();
		a.setNom(nom);
		a.setPrenom(prenom);
		//a.setTypeArtiste(typeArtiste);
		this.artistes.add(a);
	}
	
	public void ajoutSalle(String adresse, String nom, int capacite, int telephone){
		Salle l = new Salle();
		l.setAdresse(adresse);
		l.setNom(nom);
		l.setCapacite(capacite);
		l.setTelephone(telephone);
		this.salles.add(l);
	}
	
	public void ajoutTournee(Artiste artiste, DateTimeSyntax dateDebut, DateTimeSyntax dateFin, String titre){
		Tournee t = new Tournee();
		t.setArtiste(artiste);
		t.setDateDebut(dateDebut);
		t.setDateFin(dateFin);
		t.setTitre(titre);
		this.tournees.add(t);
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
	
	public Collection<Salle> getSalles() {
		return salles;
	}
	
	public Collection<Tournee> getTournees() {
		return tournees;
	}
}