package action.review;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ReviewDao;

/*
 * Servlet implementation class ReviewDeleteAction
 */
@WebServlet("/mypage_review_delete.do")
public class ReviewDeleteAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/*
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//�Ķ���� ���
		int r_idx = Integer.parseInt(request.getParameter("r_idx"));
		
		//�Ķ���ͷ� �ѱ� uri�� ���� ���� �������� �̵��Ѵ�.
		String old_url = request.getParameter("url");
		
		System.out.println(old_url);
		
		//Dao
		int res = ReviewDao.getInstance().delete(r_idx);
		
		//������ �̵�
		response.sendRedirect(old_url);
		
	}

}
