package ConectaBD;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/hola2")
public class ConexionRegistro extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String nombre = request.getParameter("nombre");
		String correo = request.getParameter("correo");
		String contraseña = request.getParameter("password");
		String fecha_nacimiento = request.getParameter("fecha_nacimiento");

		String url = "jdbc:mysql://bppzhrdgz4ehcc5l7sem-mysql.services.clever-cloud.com:3306/bppzhrdgz4ehcc5l7sem";
		String usuario = "ulcpeik6z9ed9k6p";
		String password = "bfnlGrx8vXNofMtaHgQE";

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, usuario, password);

			System.out.println("Nombre recibido: " + nombre);
			System.out.println("Correo recibido: " + correo);
			System.out.println("Contraseña recibida: " + contraseña);
			System.out.println("Fecha nacimiento recibida: " + fecha_nacimiento);

			String sql = "INSERT INTO usuarios (nombre, correo, contraseña, fecha_nacimiento) VALUES (?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nombre);
			pstmt.setString(2, correo);
			pstmt.setString(3, contraseña);
			pstmt.setString(4, fecha_nacimiento);
			pstmt.executeUpdate();

			response.sendRedirect("inicio.html");

		} catch (Exception e) {
			response.getWriter().println("<p>Error: " + e.getMessage() + "</p>");
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				response.getWriter().println("<p>Error al cerrar conexión: " + e.getMessage() + "</p>");
			}
		}
	}
}