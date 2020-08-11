package action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CafeDao;
import vo.CafeVo;

/*
 * Servlet implementation class IndexAction
 */
@WebServlet("/index.do")
public class IndexAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/*
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//목록 가져오기
		List<CafeVo> main_cafe_list = CafeDao.getInstance().selectList();
		
		request.setAttribute("main_cafe_list", main_cafe_list);
		
		//Dispatcher(forward)
		String forward_page = "/index.jsp";

		RequestDispatcher disp = request.getRequestDispatcher(forward_page);

		disp.forward(request, response);

	}

}
