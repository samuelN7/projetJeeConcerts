package projet_jee;
import java.util.Collection;
import java.util.LinkedList;

import javax.ejb.Singleton;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.print.attribute.DateTimeSyntax;

/**
 * 
 */

/**
 * @author Nicolas Ronco
 *
 */
@Singleton
public class Facade {
	
	@PersistenceContext
	private EntityManager em;
	
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
		/*this.utilisateurs.add(u);*/
		this.em.persist(u);
	}
	
	public void ajoutEvenement(Salle salle, Artiste artiste, DateTimeSyntax date){
		Evenement e = new Evenement();
		e.setSalle(salle);
		e.setArtiste(artiste);
		e.setDate(date);
		/*this.evenements.add(e);*/
		em.persist(e);
	}
	
	public void ajoutArtiste(String nom, String prenom, TypeArtiste typeArtiste){
		Artiste a = new Artiste();
		a.setNom(nom);
		a.setPrenom(prenom);
		//a.setTypeArtiste(typeArtiste);
		/*this.artistes.add(a);*/
		em.persist(a);
	}
	
	public void ajoutSalle(String adresse, String nom, int capacite, int telephone){
		Salle l = new Salle();
		l.setAdresse(adresse);
		l.setNom(nom);
		l.setCapacite(capacite);
		l.setTelephone(telephone);
		/*this.salles.add(l);*/
		this.em.persist(l);
	}
	
	public void ajoutTournee(Artiste artiste, DateTimeSyntax dateDebut, DateTimeSyntax dateFin, String titre){
		Tournee t = new Tournee();
		t.setArtiste(artiste);
		t.setDateDebut(dateDebut);
		t.setDateFin(dateFin);
		t.setTitre(titre);
		/*this.tournees.add(t);*/
		em.persist(t);
	}

	public Collection<Utilisateur> getUtilisateurs() {
		TypedQuery<Utilisateur> tq = em.createQuery("select u from Utilisateur u", Utilisateur.class);
		Collection<Utilisateur> utilisateurs = (Collection<Utilisateur>) tq.getResultList(); 
		return utilisateurs;
	}

	public Collection<Evenement> getEvenements() {
		TypedQuery<Evenement> tq = em.createQuery("select e from Evenement e", Evenement.class);
		Collection<Evenement> evenements = (Collection<Evenement>) tq.getResultList(); 
		return evenements;
	}

	public Collection<Artiste> getArtistes(int type) {
		TypedQuery<Artiste> tq;
		if (type==1){
			tq = em.createQuery("select a from Artiste a where a.typeArtiste = 1", Artiste.class);
		}
		else if (type==2){
			tq = em.createQuery("select a from Artiste a where a.typeArtiste = 2", Artiste.class);
		}
		else if (type == 3){
			tq = em.createQuery("select a from Artiste a where a.typeArtiste = 3", Artiste.class);
		}
		
		else{
			tq = em.createQuery("select a from Artiste a", Artiste.class);
		}
			
		Collection<Artiste> artistes = (Collection<Artiste>) tq.getResultList(); 
		return artistes;
	}
	
	public Collection<Salle> getSalles() {
		TypedQuery<Salle> tq = em.createQuery("select s from Salle s", Salle.class);
		Collection<Salle> salles = (Collection<Salle>) tq.getResultList(); 
		
		return salles;
	}
	
	public Collection<Salle> getSallesRecherche(String rechercheNom, String rechercheVille) {
		TypedQuery<Salle> tq = em.createQuery("select s from Salle s where s.nom ='"+rechercheNom+"' and s.ville='"+rechercheVille+"'", Salle.class);
		Collection<Salle> salles = (Collection<Salle>) tq.getResultList(); 
		
		return salles;
	}
	
	public Collection<Tournee> getTournees() {
		TypedQuery<Tournee> tq = em.createQuery("select t from Tournee t", Tournee.class);
		Collection<Tournee> tournees = (Collection<Tournee>) tq.getResultList(); 
		return tournees;
	}

	public Salle getSalle(String nom) {
		TypedQuery<Salle> tq = em.createQuery("select s from Salle s where s.nom='"+nom+"'", Salle.class);
		Collection<Salle> salles = (Collection<Salle>) tq.getResultList(); 
		if (salles.size() != 0) {
			Salle s = salles.iterator().next();
			return s;
		}
		return null;
	}
	
	public Artiste getArtiste(String nom) {
		TypedQuery<Artiste> tq = em.createQuery("select a from Artiste a where a.nom_groupe='"+nom+"'", Artiste.class);
		Collection<Artiste> artistes = (Collection<Artiste>) tq.getResultList(); 
		if (artistes.size() != 0) {
			Artiste a = artistes.iterator().next();
			return a;
		}
		return null;
	}
	
	public Tournee getTournee(String titre) {
		TypedQuery<Tournee> tq = em.createQuery("select t from Tournee t where t.titre='"+titre+"'", Tournee.class);
		Collection<Tournee> tournees = (Collection<Tournee>) tq.getResultList(); 
		if (tournees.size() != 0) {
			Tournee t = tournees.iterator().next();
			return t;
		}
		return null;
	}
	
	//Renvoie l'id de l'utilisateur s'il est inscris, sinon -1.
	public int identifier(String pseudo, String mdp) {
		// TODO Auto-generated method stub
		TypedQuery<Utilisateur> tq = em.createQuery("select u from Utilisateur u where u.pseudo="+pseudo+" and u.motDePasse="+mdp, Utilisateur.class);
		
		
		System.out.println("OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO");
		Collection<Utilisateur> ut = (Collection<Utilisateur>) tq.getResultList(); 
		int retour = -1;
		if (ut.size() == 1) {
			Utilisateur u = ut.iterator().next();
			retour = u.getId();
		}
		return retour;
		
		
	}
}
