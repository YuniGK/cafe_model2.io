package action.cafe;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CafeDao;
import dao.HitDao;
import dao.ReviewDao;
import vo.CafeVo;
import vo.HitVo;
import vo.ReviewVo;

/*
 * Servlet implementation class CafeOneListAction
 */
@WebServlet("/cafe_detail.do")
public class CafeOneListAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/*
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		int c_idx = Integer.parseInt(request.getParameter("c_idx"));
		
		//목록 가져오기
		CafeVo cafe_detail = CafeDao.getInstance().selectOne(c_idx);
		
		//리뷰목록 가져오기
		List<ReviewVo> review_detail = ReviewDao.getInstance().selectList(c_idx);
		
		//리뷰 평점 가져오기
		ReviewVo review_avg = ReviewDao.getInstance().select_review_avg(c_idx);
		
		//리뷰 총수
		ReviewVo review_total = ReviewDao.getInstance().select_review_total(c_idx);
		
		//조회수
		HitVo resVo = HitDao.getInstance().selectOne(c_idx);
		
		request.setAttribute("cafe_detail", cafe_detail);
		request.setAttribute("review_detail", review_detail);
		request.setAttribute("review_avg", review_avg);
		request.setAttribute("review_total", review_total);
		request.setAttribute("resVo", resVo);
		
		//Dispatcher(forward)
		String forward_page = "/content/cafe/cafe_detail.jsp";

		RequestDispatcher disp = request.getRequestDispatcher(forward_page);

		disp.forward(request, response);

	}

}
