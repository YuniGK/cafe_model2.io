package action.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import vo.MemberVo;

/*
 * Servlet implementation class MemberUpdateFormAction
 */
@WebServlet("/member_updateForm.do")
public class MemberUpdateFormAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/*
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//�������ڵ�
		request.setCharacterEncoding("utf-8");
		
		//�Ķ���� �ޱ�
		int m_idx = Integer.parseInt(request.getParameter("m_idx"));
		
		//Dao ����
		MemberVo vo = MemberDao.getInstance().selectOne(m_idx);
		
		//request ����
		request.setAttribute("member_update", vo);
		
		//Dispatcher(forward)
		String forward_page = "/content/mypage/user_edit.jsp";

		RequestDispatcher disp = request.getRequestDispatcher(forward_page);

		disp.forward(request, response);

	}

}

