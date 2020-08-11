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
		
		//�Ķ���� ���
		int c_idx = Integer.parseInt(request.getParameter("c_idx"));
		
		//System.out.println(c_idx);
		
		//vo���
		CafeVo vo = CafeDao.getInstance().selectOne(c_idx);
		
		//���� ��� ���ϱ�
		String webPath = "./upload/";
		
		ServletContext application = request.getServletContext();
		
		String path = application.getRealPath(webPath);
		
		File file = new File(path, vo.getC_photo());
		
		file.delete();
		
		//Dao ����
		int res = CafeDao.getInstance().delete(c_idx);
		
		//������ �̵�
		response.sendRedirect("user_mypage.do");

	}

}
