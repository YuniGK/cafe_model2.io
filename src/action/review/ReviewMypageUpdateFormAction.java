package action.review;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ReviewDao;
import vo.ReviewVo;

/*
 * Servlet implementation class ReviewMypageUpdateFormAction
 */
@WebServlet("/mypage_review_update_form.do")
public class ReviewMypageUpdateFormAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/*
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//수신 인코딩
		request.setCharacterEncoding("utf-8");
		
		//파라미터
		int r_idx = Integer.parseInt(request.getParameter("r_idx"));
		
		String old_url = request.getParameter("url");
		
		System.out.println(old_url);
		
		//Dao
		ReviewVo mypage_review_list = ReviewDao.getInstance().selectOne(r_idx);
		
		//연결
		request.setAttribute("mypage_review_list", mypage_review_list);
		
		//Dispatcher(forward)
		String forward_page = "/content/cafe/review.jsp";

		RequestDispatcher disp = request.getRequestDispatcher(forward_page);

		disp.forward(request, response);

	}

}

