package action.hit;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.org.apache.bcel.internal.generic.INVOKEVIRTUAL;

import dao.HitDao;
import vo.HitVo;

/*
 * Servlet implementation class HitInsertAction
 */
@WebServlet("/hit_insert.do")
public class HitInsertAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/*
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		int c_idx = Integer.parseInt(request.getParameter("c_idx"));
		
		HitVo vo = HitDao.getInstance().selectOne(c_idx);
		
		if (vo == null) {
			int res = HitDao.getInstance().insert(c_idx);
		}else {
			
			int s_idx = vo.getS_idx();
			int s_num = vo.getS_num() + 1;
			
			System.out.printf("카페 %d 번호 %d 죄회수 %d \n",c_idx, s_idx, s_num);
			
			HitVo uVo = new HitVo(s_idx, s_num, c_idx);
			
			int up = HitDao.getInstance().update(uVo);
		}
		
		response.sendRedirect("cafe_detail.do?c_idx="+c_idx);

	}

}
