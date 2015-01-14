package projet_jee;


import java.io.IOException;
import java.util.Collection;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Serv
 */
@WebServlet("/Serv")
public class Serv extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static final String ATT_SESSION_USER = "sessionUtilisateur";
	public static final String MON_EVT = "monEvenement";
	private HttpSession session;
	
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
			System.out.println("");
			request.setAttribute("listeSalles", facade.getSalles());
			request.getRequestDispatcher("ListeSalle.jsp").forward(request, response);
		}
		else if(op.equals("listerArtistesMusique")){
			System.out.println("");
			request.setAttribute("listeArtistes", facade.getArtistes(1));
			request.getRequestDispatcher("listeArtistes.jsp").forward(request, response);
		}
		else if(op.equals("listerArtistesDanse")){
			System.out.println("");
			request.setAttribute("listeArtistes", facade.getArtistes(2));
			request.getRequestDispatcher("listeArtistes.jsp").forward(request, response);
		}
		else if(op.equals("listerArtistesHumour")){
			System.out.println("");
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
			session.setAttribute(MON_EVT, e);			
			request.getRequestDispatcher("Achat.jsp").forward(request, response);
		}
		//On effectue l'achat, l'inscription...
		else if(op.equals("achete")) {
			 if(request.getParameter("PourMoi") != null) {
				 Evenement e = (Evenement) session.getAttribute(MON_EVT);
				 Utilisateur u = (Utilisateur) session.getAttribute(ATT_SESSION_USER);
				 Collection<Evenement> evts = (Collection<Evenement>) u.getInscris();
				 evts.add(e);
				 u.setInscris(evts);
				 
				 //L'utilisateur veut être visible
				 if (request.getParameter("Visible") != null) {
					 Collection<Evenement> evts_vis = (Collection<Evenement>) u.getInscrisNonCache();
					 evts_vis.add(e);
					 u.setInscrisNonCache(evts_vis);
				 }
				 
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
			
			
			facade.ajoutEvt(nom,description,nomsalle, date,prix,tournee);
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
