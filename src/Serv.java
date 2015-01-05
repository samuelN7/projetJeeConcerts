package projetJeeConcerts;


import java.io.IOException;

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
			request.setAttribute("listeUtilisateurs", facade.utilisateurs);
			request.getRequestDispatcher("listerUtilisateurs.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
