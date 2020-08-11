package action.member;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CafeDao;
import dao.MemberDao;
import dao.ReviewDao;
import vo.CafeVo;
import vo.MemberVo;
import vo.ReviewVo;

/*
 * Servlet implementation class MemberSelectListAction
 */
@WebServlet("/user_mypage.do")
public class MemberOneListAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/*
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//로그인 사용자 정보 구하기
		HttpSession session = request.getSession();
		
		MemberVo user = (MemberVo) session.getAttribute("user");
		
		int m_idx = user.getM_idx();
		
		System.out.println(m_idx);
		
		//목록 가져오기
		
		//회원정보 수정
		MemberVo userList = MemberDao.getInstance().selectOne(m_idx);
		
		//회원 목록
		List<MemberVo> user_list = MemberDao.getInstance().selectList();
		
		//카페 목록
		List<CafeVo> cafe_list = CafeDao.getInstance().selectList();
		
		//리뷰 목록
		List<ReviewVo> review_list = ReviewDao.getInstance().selectList();
		
		//신규 회원수
		int todayMember = MemberDao.getInstance().todayMember();
		
		//신규글
		int todayReview = ReviewDao.getInstance().today_review();
				
		//내가 쓴 글 
		int myReview = ReviewDao.getInstance().my_review(m_idx);
		
		System.out.println(todayMember);

		String m_grader = userList.getM_grade();
		
		request.setAttribute("userOneList", userList);
		
		request.setAttribute("userList", user_list);
		
		request.setAttribute("cafe_list", cafe_list);
		
		request.setAttribute("review_list", review_list);
		
		request.setAttribute("todayMember", todayMember);
		request.setAttribute("todayReview", todayReview);
		request.setAttribute("myReview", myReview);
		
		//Dispatcher(forward)
		String forward_page = (m_grader.equals("일반") ? "my_write.do?m_idx="+m_idx : "/content/mypage/admin_mypage.jsp");

		//System.out.println("grader "+forward_page);
		//System.out.println("grader "+m_grader.equals("일반"));
		
		RequestDispatcher disp = request.getRequestDispatcher(forward_page);

		disp.forward(request, response);

	}

}
