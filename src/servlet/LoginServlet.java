package servlet;

import java.io.IOException;
import java.net.URL;

import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.namespace.QName;
import javax.xml.ws.Service;

import ws.interfaces.UsuarioService;
import ws.model.Usuario;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Service wsUsuario;
	private UsuarioService usuarioService;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
    	try {
    		wsUsuario = Service.create(
			        new URL("http://localhost:8080/PoliGerenciaSistemaVotacionUsuarios/webservices/DefaultUsuarioService?wsdl"),
			        new QName("http://superbiz.org/wsdl", "SistemaVotacionUsuariosService"));
    		usuarioService = wsUsuario.getPort(UsuarioService.class);
			
		}catch(Exception e){
			e.printStackTrace();
			wsUsuario = null;
		}
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Entra al servlet de login por get!!");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Entra al servlet de login por post!!");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		System.out.println("Username: "+username);
		System.out.println("Password: "+password);
		
		Usuario user = null;
		
		try {
			user = usuarioService.autenticar(username, password);
			if(user!=null){
				response.sendRedirect("success.jsp");
			}else{
				response.sendRedirect("login.jsp?error=loginFailed");
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("login.jsp?error=loginFailed");
		}
		
		
	}

}
