package projet_jee;


import java.io.IOException;

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
		if(op.equals("ajoututilisateur")){
			facade.ajoutUtilisateur(request.getParameter("nom"), request.getParameter("prenom"), request.getParameter("pseudo"),request.getParameter("mdp"), request.getParameter("mail"));
			request.getRequestDispatcher("accueil.html").forward(request, response);
		}
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
		
		else if(op.equals("accueil")){
			request.setAttribute("eventsRecents", facade.getEvenements());
			request.getRequestDispatcher("accueil.jsp").forward(request, response);
		}
		
		else if(op.equals("connexion")) {			

			String pseudo = request.getParameter("pseudo");
			String mdp = request.getParameter("mdp");
			request.setAttribute("ut", facade.identifier(pseudo,mdp));
			Utilisateur ut = (Utilisateur) request.getAttribute("ut");
			if (ut != null) {
				session = request.getSession();
				session.setAttribute(ATT_SESSION_USER, ut);
			}
			request.getRequestDispatcher("accueil.jsp").forward(request, response);
		}
		//L'utilisateur est sur un evenement, il veut acheter, on transmet l'evt à la prochaine page
		else if(op.equals("achat")) { 
			Evenement e = (Evenement) request.getAttribute("monEvenement");
			idevt = Integer.parseInt(request.getParameter("idEvt"));
			session.setAttribute(MON_EVT, e);			
			request.getRequestDispatcher("Achat.jsp").forward(request, response);
		}
		//On effectue l'achat, l'inscription...
		else if(op.equals("achete")) {
			 if(request.getParameter("PourMoi") != null) {
				 //int idevt = Integer.parseInt(request.getParameter("idEvt"));
				 //Evenement e = (Evenement) session.getAttribute(MON_EVT);
				 System.out.println("KKKKKKKKKKKKKKKKKKKKKKKKK"+idevt);
				 Utilisateur u = (Utilisateur) session.getAttribute(ATT_SESSION_USER);
				 facade.ajouterInscription(idevt, u, request.getParameter("Visible") != null );
				 request.getRequestDispatcher("accueil.jsp").forward(request, response);
			 } else {
				 //Sinon achat pour quelqu'un d'autre, donc on ajoute pas (sauf si utilisateur existe)
			 }		 
			 
		}
		else if(op.equals("ajouterEvt")) {
			String nom = request.getParameter("nomEvt");
			String description = request.getParameter("descriptionEvt");
			String nomsalle = request.getParameter("nomSalle");
			int prix = Integer.parseInt(request.getParameter("prix"));
			String date = request.getParameter("date");
			String tournee = request.getParameter("tournee");
			Artiste artiste = (Artiste) session.getAttribute(ATT_SESSION_USER);	
			
			facade.ajoutEvt(artiste.getId(),nom,description,nomsalle, date,prix,tournee);
			request.getRequestDispatcher("PagePerso.jsp").forward(request, response);

		}
		else if (op.equals("ajouterTournee")) {
			String nom = request.getParameter("nomT");
			String dateD = request.getParameter("dateD");
			String dateF = request.getParameter("dateF");			
			String desc = request.getParameter("descT");
			Artiste artiste = (Artiste) session.getAttribute(ATT_SESSION_USER);
			facade.ajouterTournee(nom,dateD,dateF,desc,artiste.getId());			
			request.getRequestDispatcher("PagePerso.jsp").forward(request, response);
			
			
		}
		else if(op.equals("suivreArtiste")) {
			 int id = Integer.parseInt(request.getParameter("artiste"));
			 Utilisateur u = (Utilisateur) session.getAttribute(ATT_SESSION_USER);
			 System.out.println("UUUUUUUUUUUUUU"+u.getPseudo()+id);
			 if (u!=null) {
			 facade.ajouterArtisteSuivis(id, u);
			 }
			 //Permet de retourner à la page précédente
			 //System.out.println("POPOPOPOPOPOPOPOPOPP"+u.getArtistesFavoris().iterator().next().getNom_groupe());;
			 response.sendRedirect((String) request.getHeader("Referer"));			
		}
		else if(op.equals("ajouterSalle")) {
			String nom = request.getParameter("nomSalle");
			String adresse = request.getParameter("adresse");
			String ville = request.getParameter("ville");
			int capacite = Integer.parseInt(request.getParameter("capacite"));
			String description = request.getParameter("desciptionSalle");
			int tel = Integer.parseInt(request.getParameter("tel"));
			
			facade.ajoutSalle(adresse, nom, ville, capacite, tel, description);
			request.getRequestDispatcher("PagePerso.jsp").forward(request, response);
			
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
