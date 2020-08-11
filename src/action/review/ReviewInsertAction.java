package action.review;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ReviewDao;
import vo.MemberVo;
import vo.ReviewVo;

/*
 * Servlet implementation class ReviewInsertAction
 */
@WebServlet("/review_insert.do")
public class ReviewInsertAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/*
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//수신 인코딩
		request.setCharacterEncoding("utf-8");
		
		//파라미터 받기
		int c_idx = Integer.parseInt(request.getParameter("c_idx"));
		
		int r_grade = Integer.parseInt(request.getParameter("r_grade"));
		String r_cot = request.getParameter("r_cot");
		String r_pwd = request.getParameter("r_pwd");
		String r_ip = request.getRemoteAddr();
		
		//로그인 사용자 정보 구하기 --------------------------------
		HttpSession session = request.getSession();
		
		MemberVo user = (MemberVo) session.getAttribute("user");
		
		int m_idx = user.getM_idx();
		
		ReviewVo vo = new ReviewVo(m_idx, c_idx, r_grade, r_cot, r_pwd, r_ip);
		
		//System.out.printf("\n %d %d %d %s %s %s \n", m_idx, c_idx, r_grade, r_cot, r_pwd, r_ip);
		
		int review_writer = ReviewDao.getInstance().insert(vo);

		response.sendRedirect("cafe_detail.do?c_idx="+c_idx);
		
	}

}
