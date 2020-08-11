package action.cafe;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CafeDao;
import vo.CafeVo;

/*
 * Servlet implementation class MemberDeleteAction
 */
@WebServlet("/mypage_cafe_delete.do")
public class CafeDeleteAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/*
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//파라미터 얻기
		int c_idx = Integer.parseInt(request.getParameter("c_idx"));
		
		//System.out.println(c_idx);
		
		//vo얻기
		CafeVo vo = CafeDao.getInstance().selectOne(c_idx);
		
		//절대 경로 구하기
		String webPath = "./upload/";
		
		ServletContext application = request.getServletContext();
		
		String path = application.getRealPath(webPath);
		
		File file = new File(path, vo.getC_photo());
		
		file.delete();
		
		//Dao 전송
		int res = CafeDao.getInstance().delete(c_idx);
		
		//페이지 이동
		response.sendRedirect("user_mypage.do");

	}

}
