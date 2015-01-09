package projet_jee;


import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Serv
 */
@WebServlet("/Serv")
public class Serv extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
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
		else if(op.equals("connexion")) {
			String pseudo = request.getParameter("pseudo");
			String mdp = request.getParameter("mdp");
			request.setAttribute("id", facade.identifier(pseudo,mdp));
			String id_string = request.getParameter("id");
			int id = Integer.parseInt(id_string);
			if (id == -1) {
				request.setAttribute("pseudo", "Pas inscris");
			}
			request.getRequestDispatcher("accueil.jsp").forward(request, response);
		} 
		else if(op.equals("achat")) {
			request.getRequestDispatcher("Achat.jsp").forward(request, response);
		}
		else if(op.equals("achete")) {
			 if(request.getParameter("PourMoi") != null) {
				 //Avec l'id de l'utilisateur connecté, ajouter l'événement dans la liste de ses inscriptions
				 
			 } else {
				 //Sinon achat pour quelqu'un d'autre, donc on ajoute pas (sauf si utilisateur existe)
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
