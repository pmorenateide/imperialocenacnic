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

@WebServlet("/hola")
public class Conexion extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String destino = request.getParameter("destino");
		String duracion = request.getParameter("duracion");
		String camarote = request.getParameter("tipo-camarote");
		String pasajeros = request.getParameter("pasajeros");
		String excursiones = request.getParameter("excursiones");
		String servicios_extra = request.getParameter("servicios-extra");
		String nombre = request.getParameter("nombre");
		String dni_pasaporte = request.getParameter("dni");
		String fechanac = request.getParameter("fecha-nacimiento");
		String telefono = request.getParameter("telefono");

		String url = "jdbc:mysql://bppzhrdgz4ehcc5l7sem-mysql.services.clever-cloud.com:3306/bppzhrdgz4ehcc5l7sem";
		String usuario = "ulcpeik6z9ed9k6p";
		String password = "bfnlGrx8vXNofMtaHgQE";

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, usuario, password);

			String sql = "INSERT INTO ticket (destino, duracion, camarote, pasajeros, excursiones, servicios_extra, nombre, dni_pasaporte, fechanac, telefono) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, destino);
			pstmt.setString(2, duracion);
			pstmt.setString(3, camarote);
			pstmt.setString(4, pasajeros);
			pstmt.setString(5, excursiones);
			pstmt.setString(6, servicios_extra);
			pstmt.setString(7, nombre);
			pstmt.setString(8, dni_pasaporte);
			pstmt.setString(9, fechanac);
			pstmt.setString(10, telefono);
			pstmt.executeUpdate();

			response.sendRedirect("reserva3.jsp");

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