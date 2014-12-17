package Projet;
import java.util.Collection;
import java.util.LinkedList;

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
	public Collection<Lieu> lieux;
	
	
	public Facade() {
		this.utilisateurs = new LinkedList<Utilisateur>();
		this.artistes = new LinkedList<Artiste>();
		this.evenements = new LinkedList<Evenement>();
		this.lieux = new LinkedList<Lieu>();
	}
	
	public void ajoutUtilisateur(String nom, String prenom, String pseudo,
			String motDePasse, String adresseMail){
		Utilisateur u = new Utilisateur(nom, prenom, pseudo, motDePasse, adresseMail);
		this.utilisateurs.add(u);
	}
	
	public void ajoutEvenement(Lieu lieu, Artiste artiste, String date){
		Evenement e = new Evenement(lieu, artiste, date);
		this.evenements.add(e);
	}
	
	public void ajoutArtiste(String nom, String prenom, String fonction){
		Artiste a = new Artiste(nom, prenom, fonction);
		this.artistes.add(a);
	}
	
	public void ajoutLieu(String adresse, String nom, int capacité, int telephone){
		Lieu l = new Lieu(adresse, nom, capacité, telephone);
		this.lieux.add(l);
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