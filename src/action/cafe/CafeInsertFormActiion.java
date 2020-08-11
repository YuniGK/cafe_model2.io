package action.cafe;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 * Servlet implementation class CafeInsertActiion
 */
@WebServlet("/cafe_insert_form.do")
public class CafeInsertFormActiion extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/*
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//Dispatcher(forward)
		String forward_page = "/content/cafe/cafe_write.jsp";

		RequestDispatcher disp = request.getRequestDispatcher(forward_page);

		disp.forward(request, response);

	}

}
