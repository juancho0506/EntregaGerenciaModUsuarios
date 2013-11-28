package ws.interfaces;

import java.util.List;
import javax.jws.WebService;

import ws.model.Usuario;
@WebService(targetNamespace = "http://superbiz.org/wsdl")
public interface UsuarioService {
	
	public List<Usuario> listarUsuarios() throws Exception;
	
	public Usuario registrarUsuario(String username, String password) throws Exception;
	
	public void cambiarContrasena(String username, String password) throws Exception;
	
	public Usuario autenticar(String username, String password) throws Exception;
	
	public void desactivarUsuario(String username) throws Exception;
	
	public void activarUsuario(String username) throws Exception;
}
