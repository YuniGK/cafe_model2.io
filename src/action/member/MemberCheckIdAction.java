package action.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import vo.MemberVo;

/*
 * Servlet implementation class MemberCheckIdAction
 */
@WebServlet("/check_id.do")
public class MemberCheckIdAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/*
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// /content/user/check_id.do?m_id = hong
		
		//수신 인코딩
		request.setCharacterEncoding("utf-8");
		
		//파라미터 받기
		String m_id = request.getParameter("m_id");
		
		//System.out.println(m_id);
		
		//DB조회
		MemberVo member_id = MemberDao.getInstance().selectOne(m_id);
		
		//DB에 등록된 정보가 없을 경우
		boolean result = (member_id == null);
		
		//결과값
		String json = String.format("{\"result\": %b}", result);
		
		//응답인코딩
		response.setContentType("text/json; charset=utf-8");
		
		//System.out.println(json);
		
		//전송
		response.getWriter().print(json);

	}

}
