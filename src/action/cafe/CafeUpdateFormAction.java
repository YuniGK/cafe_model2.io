package action.cafe;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CafeDao;
import dao.MemberDao;
import vo.CafeVo;
import vo.MemberVo;

/*
 * Servlet implementation class MemberUpdateFormAction
 */
@WebServlet("/cafe_updateForm.do")
public class CafeUpdateFormAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/*
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//�������ڵ�
		request.setCharacterEncoding("utf-8");
		
		//�Ķ���� �ޱ�
		int c_idx = Integer.parseInt(request.getParameter("c_idx"));
		
		//Dao ����
		CafeVo cafe_update = CafeDao.getInstance().selectOne(c_idx);
		
		//request ����
		request.setAttribute("cafe_update", cafe_update);
		
		//Dispatcher(forward)
		String forward_page = "/content/cafe/cafe_edit.jsp";

		RequestDispatcher disp = request.getRequestDispatcher(forward_page);

		disp.forward(request, response);

	}

}

