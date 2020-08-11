package action.cafe;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CafeDao;
import vo.CafeVo;

/*
 * Servlet implementation class CafeTagCafeListAction
 */
@WebServlet("/tag_list.do")
public class CafeTagCafeListAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/*
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		String c_tag = request.getParameter("c_tag");
		
		List<CafeVo> tag_cafe_list = CafeDao.getInstance().tagSelect(c_tag);
		
		//System.out.println(c_tag);
		
		request.setAttribute("tag_cafe_list", tag_cafe_list);
		
		//Dispatcher(forward)
		String forward_page = "/content/cafe/cafe_tag_list.jsp";

		RequestDispatcher disp = request.getRequestDispatcher(forward_page);

		disp.forward(request, response);

	}

}
