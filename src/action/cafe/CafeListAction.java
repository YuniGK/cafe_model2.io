package action.cafe;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CafeDao;
import vo.CafeVo;

/*
 * Servlet implementation class CafeListAction
 */
@WebServlet("/cafe_list.do")
public class CafeListAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/*
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		String addrs = request.getParameter("addrs");
		int page_num = Integer.parseInt(request.getParameter("page_num"));
		
		//xml if�������� String���� ����� �Ұ��ϴ�. map���� �μ� ������� �Ѵ�.
		Map map = new HashMap();
		
		if (addrs != null) {
			map.put("addrs", addrs);
		}
		
		map.put("page_num", page_num);
		
		//��� ��������
		List<CafeVo> product_cafe_list = CafeDao.getInstance().selectList(map);
		
		request.setAttribute("product_cafe_list", product_cafe_list);
		
		System.out.printf("addrs %s page_num %d \n", addrs, page_num);
		
		//������ 
		List<CafeVo> cafe_size = CafeDao.getInstance().selectListSize(addrs);
		
		if (cafe_size.size() != 0) {
			
			int size= (int) Math.ceil(cafe_size.size()/5.0);
			
			request.setAttribute("size", size);
			
			System.out.printf("���� %s ������ �� %d", addrs, size);
		}
		
		if (product_cafe_list.size() == 0) {
			response.sendRedirect("index.do");
		}else {
			//Dispatcher(forward)
			String forward_page = "/content/cafe/cafe_list.jsp";

			RequestDispatcher disp = request.getRequestDispatcher(forward_page);

			disp.forward(request, response);
		}

	}

}
