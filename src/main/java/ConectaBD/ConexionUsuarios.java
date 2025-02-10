package ConectaBD;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/hola3")
public class ConexionUsuarios extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.sendRedirect("inicio.html");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String correo = request.getParameter("email");
		String contraseña = request.getParameter("password");

		String url = "jdbc:mysql://bppzhrdgz4ehcc5l7sem-mysql.services.clever-cloud.com:3306/bppzhrdgz4ehcc5l7sem";
		String usuario = "ulcpeik6z9ed9k6p";
		String password = "bfnlGrx8vXNofMtaHgQE";

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection(url, usuario, password);

			String sql = "SELECT * FROM usuarios WHERE correo = ? AND contraseña = ?";
			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setString(1, correo);
			statement.setString(2, contraseña);

			ResultSet result = statement.executeQuery();

			if (result.next()) {
				HttpSession session = request.getSession();
				session.setAttribute("usuario", result.getString("nombre"));
				session.setAttribute("correo", correo);
				response.sendRedirect("inicio.html");
			} else {
				response.sendRedirect("iniciosesion.html");
			}
		} catch (Exception e) {
			response.getWriter().println("<p>Error: " + e.getMessage() + "</p>");
			e.printStackTrace();
		}
	}
}