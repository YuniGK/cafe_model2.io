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

		//�α��� ����� ���� ���ϱ�
		HttpSession session = request.getSession();
		
		MemberVo user = (MemberVo) session.getAttribute("user");
		
		int m_idx = user.getM_idx();
		
		System.out.println(m_idx);
		
		//��� ��������
		
		//ȸ������ ����
		MemberVo userList = MemberDao.getInstance().selectOne(m_idx);
		
		//ȸ�� ���
		List<MemberVo> user_list = MemberDao.getInstance().selectList();
		
		//ī�� ���
		List<CafeVo> cafe_list = CafeDao.getInstance().selectList();
		
		//���� ���
		List<ReviewVo> review_list = ReviewDao.getInstance().selectList();
		
		//�ű� ȸ����
		int todayMember = MemberDao.getInstance().todayMember();
		
		//�űԱ�
		int todayReview = ReviewDao.getInstance().today_review();
				
		//���� �� �� 
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
		String forward_page = (m_grader.equals("�Ϲ�") ? "my_write.do?m_idx="+m_idx : "/content/mypage/admin_mypage.jsp");

		//System.out.println("grader "+forward_page);
		//System.out.println("grader "+m_grader.equals("�Ϲ�"));
		
		RequestDispatcher disp = request.getRequestDispatcher(forward_page);

		disp.forward(request, response);

	}

}
