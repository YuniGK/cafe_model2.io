package action.review;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
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
 * Servlet implementation class ReviewListAction
 */
@WebServlet("/my_write.do")
public class ReviewListAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/*
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//�α��� ����� ���� ���ϱ�
		HttpSession session = request.getSession();
				
		MemberVo user = (MemberVo) session.getAttribute("user");
		
		int m_idx = Integer.parseInt(request.getParameter("m_idx"));
		
		//���� �� ���� ���
		List<ReviewVo> my_review = ReviewDao.getInstance().select(m_idx);
		
		//���� �� �� 
		int myReview = ReviewDao.getInstance().my_review(m_idx);
		
		//System.out.println(" 1 "+ m_idx);
		
		request.setAttribute("my_review", my_review);
		request.setAttribute("myReview", myReview);
		
		//Dispatcher(forward)
		String forward_page = "/content/mypage/my_reivew.jsp";

		RequestDispatcher disp = request.getRequestDispatcher(forward_page);

		disp.forward(request, response);

	}

}
