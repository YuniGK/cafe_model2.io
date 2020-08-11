package action.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import vo.MemberVo;

/*
 * Servlet implementation class MemberLoginFormAction
 */
@WebServlet("/login.do")
public class MemberLoginAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/*
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//수신 인코딩
		request.setCharacterEncoding("utf-8");
		
		//파라미터
		String m_id = request.getParameter("m_id");
		String m_pwd = request.getParameter("m_pwd");
		
		System.out.printf("id %s / pwd %s", m_id, m_pwd);
		
		MemberVo user = MemberDao.getInstance().selectOne(m_id);
		
		String result = "";
		
		if (user == null) {
			result = "fail_id";
		}else {
			if (user.getM_pwd().equals(m_pwd) == false) {
				result = "fail_pwd";
			}else {
				result = "success";
				
				//로그인 정보를 session에 넣는다.
				HttpSession session = request.getSession();
				
				session.setAttribute("user", user);
				
			}
		}

		//System.out.println(result);	
		
		//json포장
		String json = String.format("{\"result\": \"%s\"}", result);
		
		response.setContentType("text/json; charset=utf-8");
			
		response.getWriter().print(json);
		
	}

}
