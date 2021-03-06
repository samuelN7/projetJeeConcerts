package projet_jee;


import java.io.IOException;
import java.util.Collection;
import java.util.GregorianCalendar;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import projet_jee.Artiste;
import projet_jee.Evenement;
import projet_jee.Utilisateur;

/**
 * Servlet implementation class Serv
 */
@WebServlet("/Serv")
public class Serv extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static final String ATT_SESSION_USER = "sessionUtilisateur";
	public static final String MON_EVT = "monEvenement";
	private HttpSession session;
	private int idevt;
	
	@EJB
	Facade facade = new Facade();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Serv() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String op = request.getParameter("op");
		
		if (request.getSession().isNew()) {
			int i = 0;
			request.getSession().setAttribute("estInscris",i );
			//estInscris vaut 0 si l'utilisateur est anonyme, 1 sinon (cf le traitement de la connexion)
		}
		
		//Inscription d'un utilisateur
		if(op.equals("ajoututilisateur")){
			String nom = request.getParameter("nom");
			String prenom = request.getParameter("prenom");
			String pseudo = request.getParameter("pseudo");
			String mdp = request.getParameter("mdp");
			String adresse = request.getParameter("adresse");
			String mail = request.getParameter("mail");
			String ville = request.getParameter("ville");
			
			if (request.getParameter("checkbox") != null) {
				String nomA = request.getParameter("nomArtiste");
				String desc = request.getParameter("desc_groupe");
				facade.ajoutArtiste(nom,prenom,pseudo,mdp,mail,adresse,ville,nomA,desc);
			
			} else {			
				facade.ajoutUtilisateur(nom,prenom,pseudo,mdp,mail,adresse,ville);				
			}
			request.getRequestDispatcher("accueil.jsp").forward(request, response);
		}
		
		//Connexion d'un utilisateur
		else if(op.equals("connexion")) {	
				String pseudo = request.getParameter("pseudo");
				String mdp = request.getParameter("mdp");
				request.setAttribute("ut", facade.identifier(pseudo,mdp));
				Utilisateur ut = (Utilisateur) request.getAttribute("ut");
				if (ut != null) {
						//Création d'une session qui connaît l'utilisateur
						request.getSession().setAttribute("uti", ut);
						int i = 1;
						request.getSession().setAttribute("estInscris", 1);
				}
					request.getRequestDispatcher("accueil.jsp").forward(request, response);
		}
		
		//Deconnexion
		else if (op.equals("deconnexion")) {
					
			request.getSession().invalidate();
			int i = 0;
			//L'utilisateur redevient anonyme
			request.getSession().setAttribute("estInscris",i );
			request.getRequestDispatcher("accueil.jsp").forward(request, response);
					
		}
		
		//Traitements pour les listes 
		else if(op.equals("listerUtilisateurs")){
			request.setAttribute("listeUtilisateurs", facade.getUtilisateurs());
			request.getRequestDispatcher("listerUtilisateurs.jsp").forward(request, response);
		}
		else if(op.equals("listerSalles")){
			request.setAttribute("listeSalles", facade.getSalles());
			request.getRequestDispatcher("ListeSalle.jsp").forward(request, response);
		}
		else if(op.equals("listerArtistesMusique")){
			request.setAttribute("listeArtistes", facade.getArtistes(1));
			request.getRequestDispatcher("listeArtistes.jsp").forward(request, response);
		}
		else if(op.equals("listerArtistesDanse")){
			request.setAttribute("listeArtistes", facade.getArtistes(2));
			request.getRequestDispatcher("listeArtistes.jsp").forward(request, response);
		}
		else if(op.equals("listerArtistesHumour")){
			request.setAttribute("listeArtistes", facade.getArtistes(3));
			request.getRequestDispatcher("listeArtistes.jsp").forward(request, response);
		}
		else if(op.equals("listeArtistes")){
			request.setAttribute("listeArtistes", facade.getArtistes(4));
			request.getRequestDispatcher("listeArtistes.jsp").forward(request, response);
		}
		else if(op.equals("listerEvenements")){
			request.setAttribute("listeEvenements", facade.getEvenements());
			request.getRequestDispatcher("listeEvenements.jsp").forward(request, response);
		}
		else if(op.equals("listerTournees")){
			request.setAttribute("listeTournees", facade.getTournees());
			request.getRequestDispatcher("listeTournees.jsp").forward(request, response);
		}
		
		//Traitement pour des recherches
		else if(op.equals("RechercherSalle")){
			String rechercheNom = request.getParameter("rechercheNom");
			String rechercheVille = request.getParameter("rechercheVille");
			request.setAttribute("listeSalles", facade.getSallesRecherche(rechercheNom, rechercheVille));
			request.getRequestDispatcher("ListeSalle.jsp").forward(request, response);
		}
		else if(op.equals("RechercherEvenement")){
			String rechercheTitre = request.getParameter("titreEvent");
			request.setAttribute("listeEvenements", facade.getEvenementsRecherche(rechercheTitre));
			request.getRequestDispatcher("listeEvenements.jsp").forward(request, response);
		}
		else if(op.equals("RechercherTournee")){
			String rechercheTitre = request.getParameter("titreTournee");
			request.setAttribute("listeTournees", facade.getTourneesRecherche(rechercheTitre));
			request.getRequestDispatcher("listeTournees.jsp").forward(request, response);
		}
		else if(op.equals("RechercherPseudo")){
			String pseudo = request.getParameter("pseudoRech");
			request.setAttribute("listeUtilisateurs", facade.getPseudoRecherche(pseudo));
			request.getRequestDispatcher("listerUtilisateurs.jsp").forward(request, response);
		}
		
		//Traitement pour les liens des listes vers les pages individuelles
		else if(op.equals("lienSalle")){
			String nomSalle = request.getParameter("param");
			request.setAttribute("salle", facade.getSalle(nomSalle));
			request.getRequestDispatcher("salle.jsp").forward(request, response);
		}		
		else if(op.equals("lienArtiste")){
			String nomArtiste = request.getParameter("param");
			request.setAttribute("artiste", facade.getArtiste(nomArtiste));
			request.getRequestDispatcher("artiste.jsp").forward(request, response);
		}
		
		else if(op.equals("lienTournee")){
			String nomTournee = request.getParameter("param");
			request.setAttribute("tournee", facade.getTournee(nomTournee));
			request.getRequestDispatcher("tournee.jsp").forward(request, response);
		}
		
		else if(op.equals("lienEvenement")){
			String nomEvent = request.getParameter("param");
			request.setAttribute("evenement", facade.getEvenement(nomEvent));
			request.getRequestDispatcher("evenement.jsp").forward(request, response);
		}
		
		//L'utilisateur est sur un evenement, il veut acheter, on transmet l'evt à la prochaine page
		else if(op.equals("achat")) { 
			if( (Integer) request.getSession().getAttribute("estInscris") == 1){
				Evenement e = (Evenement) request.getAttribute("monEvenement");
				int idevt = Integer.parseInt(request.getParameter("idEvt"));
				request.getSession().setAttribute("idEvt", idevt);			
				request.getRequestDispatcher("Achat.jsp").forward(request, response);
			} else {
				request.getRequestDispatcher("connexion.html").forward(request, response);
			}

		}
		
		//On effectue l'achat, l'inscription...
		else if(op.equals("achete")) {
			 if(request.getParameter("PourMoi") != null) {
				 Utilisateur u = (Utilisateur) request.getSession().getAttribute("uti");//ATT_SESSION_USER);
				 int idevt = (Integer) request.getSession().getAttribute("idEvt");
				 facade.ajouterInscription(idevt, u, request.getParameter("Visible") != null );
				 request.getRequestDispatcher("accueil.jsp").forward(request, response);
			 } else {
				 //Sinon achat pour quelqu'un d'autre, donc on ajoute pas (sauf si utilisateur existe)
			 }		 
			 
		}
		//Ajouts dans la base de donnée via des formulaires
		else if(op.equals("ajouterEvt")) {
			if( (Integer) request.getSession().getAttribute("estInscris") == 1){
				String nom = request.getParameter("nomEvt");
				String description = request.getParameter("descriptionEvt");
				String nomsalle = request.getParameter("nomSalle");
				int prix = Integer.parseInt(request.getParameter("prix"));
				String date = request.getParameter("date");
				String tournee = request.getParameter("tournee");
				//Artiste artiste = (Artiste) session.getAttribute(ATT_SESSION_USER);	
				Artiste artiste = (Artiste) request.getSession().getAttribute("uti");
			
				facade.ajoutEvt(artiste.getId(),nom,description,nomsalle, date,prix,tournee);
				request.getRequestDispatcher("/Serv?op=pagePerso").forward(request, response);
			}
			else {
				request.getRequestDispatcher("connexion.html").forward(request, response);
			}
		}
		else if (op.equals("ajouterTournee")) {
			if( (Integer) request.getSession().getAttribute("estInscris") == 1){
				String nom = request.getParameter("nomT");
				String dateD = request.getParameter("dateD");
				String dateF = request.getParameter("dateF");			
				String desc = request.getParameter("descT");
				//Artiste artiste = (Artiste) session.getAttribute(ATT_SESSION_USER);
				Artiste artiste = (Artiste) request.getSession().getAttribute("uti");
				facade.ajouterTournee(nom,dateD,dateF,desc,artiste.getId());			
				request.getRequestDispatcher("/Serv?op=pagePerso").forward(request, response);
			}
			else {
				request.getRequestDispatcher("connexion.html").forward(request, response);
			}
			
		}
		else if(op.equals("ajouterSalle")) {
			if((Integer) request.getSession().getAttribute("estInscris") == 1){
				String nom = request.getParameter("nomSalle");
				String adresse = request.getParameter("adresse");
				String ville = request.getParameter("ville");
				int capacite = Integer.parseInt(request.getParameter("capacite"));
				String description = request.getParameter("desciptionSalle");
				int tel = Integer.parseInt(request.getParameter("tel"));
			
				facade.ajoutSalle(adresse, nom, ville, capacite, tel, description);
				request.getRequestDispatcher("/Serv?op=pagePerso").forward(request, response);
			}
			else{
				request.getRequestDispatcher("connexion.html").forward(request, response);	
			}		
		}
		
		//Ajouter un artiste aux favoris
		else if(op.equals("suivreArtiste")) {
			if ( (Integer) request.getSession().getAttribute("estInscris") == 1) {
				int id = Integer.parseInt(request.getParameter("artiste"));
				//Utilisateur u = (Utilisateur) session.getAttribute(ATT_SESSION_USER);
				 Utilisateur u = (Utilisateur) request.getSession().getAttribute("uti");
				if (u!=null) {
					facade.ajouterArtisteSuivis(id, u);
					request.setAttribute("favoris", facade.getFavoris(u.getId()));
					request.setAttribute("inscriptions", facade.getInscriptions(u.getId()));
					request.setAttribute("evtsFav", facade.getEvtsDesFavoris(u.getId()));
					request.getRequestDispatcher("/Serv?op=pagePerso").forward(request, response);
				}
			}
			else{
				request.getRequestDispatcher("connexion.html").forward(request, response);
			}
		}
		
		//Traitement avant l'accès à la page perso
		else if(op.equals("pagePerso")) {
			if (((Integer) request.getSession().getAttribute("estInscris")) == 1) {
			//Utilisateur u = (Utilisateur) session.getAttribute(ATT_SESSION_USER);
			 Utilisateur u = (Utilisateur) request.getSession().getAttribute("uti");
			request.setAttribute("inscriptions", facade.getInscriptions(u.getId()));			
			request.setAttribute("favoris", facade.getFavoris(u.getId()));
			request.setAttribute("evtsFav", facade.getEvtsDesFavoris(u.getId()));
			request.setAttribute("estArtiste", facade.estArtiste(u.getId()));
			request.getRequestDispatcher("PagePerso.jsp").forward(request, response);
			} 
			else {
				request.getRequestDispatcher("inscription.html").forward(request, response);	
			}
		}
		
		//Traitement lors de l'envoi d'un message
		else if(op.equals("sendMP")) {
			//Utilisateur u = (Utilisateur) session.getAttribute(ATT_SESSION_USER);
			 Utilisateur u = (Utilisateur) request.getSession().getAttribute("uti");
			facade.envoyer(u.getNom(),request.getParameter("dest"),request.getParameter("mess"));
			request.getRequestDispatcher("Serv?op=MP").forward(request, response);

		}
		
		//Traitement avant l'accès aux messages persos
		else if(op.equals("MP")) {
			if (((Integer) request.getSession().getAttribute("estInscris")) == 1) {
			//Utilisateur u = (Utilisateur) session.getAttribute(ATT_SESSION_USER);
			 Utilisateur u = (Utilisateur) request.getSession().getAttribute("uti");
			request.setAttribute("mps", facade.getMPs(u.getId()));
			request.getRequestDispatcher("MessagesPersos.jsp").forward(request, response);
			}  else {
				request.getRequestDispatcher("inscription.html").forward(request, response);	
			}

		}
		
		//Traitement lors d'un poste d'un commentaire
		else if(op.equals("poster")) {
			if (((Integer) request.getSession().getAttribute("estInscris")) == 1) {
			int typeC = Integer.parseInt(request.getParameter("typeC"));
			Utilisateur u = (Utilisateur) request.getSession().getAttribute("uti");
			int idEvt = Integer.parseInt(request.getParameter("idEvt"));
						
			java.util.GregorianCalendar calendar = new GregorianCalendar();
			java.util.Date time  = calendar.getTime();			
			
			facade.poster(u.getPseudo(),idEvt,request.getParameter("commentaire"), time.toString(),typeC);//dateFormat.format(actuelle),typeC);
			response.sendRedirect((String) request.getHeader("Referer"));	
		} else {
			request.getRequestDispatcher("inscription.html").forward(request, response);	
			}
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
