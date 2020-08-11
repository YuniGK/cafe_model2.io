package action.member;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import vo.MemberVo;

/*
 * Servlet implementation class MemberDeleteAction
 */
@WebServlet("/member_delete.do")
public class MemberDeleteAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/*
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//파라미터 얻기
		int m_idx = Integer.parseInt(request.getParameter("m_idx"));
		
		//vo얻기
		MemberVo vo = MemberDao.getInstance().selectOne(m_idx);
		
		//절대 경로 구하기
		String webPath = "./upload/";
		
		ServletContext application = request.getServletContext();
		
		String path = application.getRealPath(webPath);
		
		File file = new File(path, vo.getM_photo());
		
		file.delete();
		
		//Dao 전송
		int res = MemberDao.getInstance().delete(m_idx);
		
		//페이지 이동
		response.sendRedirect("user_mypage.do");

	}

}
