package action.cafe;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.CafeDao;
import vo.CafeVo;
import vo.MemberVo;

/*
 * Servlet implementation class CafeUpdateAction
 */
@WebServlet("/cafe_update.do")
public class CafeUpdateAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/*
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//수신 인코딩
		request.setCharacterEncoding("utf-8");
		
		//사진 ------------------------------------------
		//상대경로
		String webPath = "./upload/";
		
		ServletContext application = request.getServletContext();
		
		//절대경로
		String path = application.getRealPath(webPath);
		
		//System.out.println(path);
		
		//파일 크기 제한
		int maxSize = 1024 * 1024 * 100;
		
		MultipartRequest mr = new MultipartRequest(request, path, maxSize, "utf-8", new DefaultFileRenamePolicy());
		
		//업로드된 파일이름 얻기
		String c_photo = "";
		
		//실제 업로드된 파일정보 구하기
		File file = mr.getFile("c_photo");
		
		if (file != null) {
			c_photo = file.getName();
		}else {
			c_photo = "cafe.jpg";
		}
		
		System.out.println("카페 사진 "+c_photo);
				
		/*
		//업로드된 파일이름 얻기
		List<String> c_photo = new ArrayList<String>();
		
		//실제 업로드된 파일정보 구하기
		File file = mr.getFile("c_photo");
		
		if (file != null) {
			c_photo.add(file.getName());
		}else {
			c_photo.add("cafe.jpg");
		}
		
		for (String photo : c_photo) {
			System.out.println("카페 사진 "+photo);
		}
		*/
		
		//사진 ------------------------------------------
		
		int c_idx = Integer.parseInt(mr.getParameter("c_idx"));
		String c_name = mr.getParameter("c_name");//1
		String c_addr = mr.getParameter("c_addr");//2
		String c_tel = mr.getParameter("c_tel");//3
		String c_price = mr.getParameter("c_price");//4
		String c_park = mr.getParameter("c_park");//5
		String c_time = mr.getParameter("c_time");//6
		String c_hday = mr.getParameter("c_hday");//7
		String c_uri = mr.getParameter("c_uri");//8
		String c_map = mr.getParameter("c_map");//9
		String c_menu1 = mr.getParameter("c_menu1");//0
		String c_menu2 = mr.getParameter("c_menu2");//1
		String c_menu3 = mr.getParameter("c_menu3");//2
		String c_menu4 = mr.getParameter("c_menu4");//3
		String c_tag = mr.getParameter("c_tag");//4
		
		try {
			
			if (c_uri == null || c_uri.equals("")) {
				c_uri = "";
			}
			
			if (c_menu2 == null || c_menu2.equals("")) {
				c_menu2 = "";
			}
			
			if (c_menu3 == null || c_menu3.equals("")) {
				c_menu3 = "";
			}
			
			if (c_menu4 == null || c_menu4.equals("")) {
				c_menu4 = "";
			}
			
		} catch (Exception e) {
		}
		
		//System.out.printf("%s %s %s %s \n", c_uri, c_menu2, c_menu3, c_menu4);		
		
		//vo포장
		CafeVo vo = new CafeVo(c_name, c_addr, c_tel, c_price, c_park, c_time, c_hday, c_uri, c_map, c_menu1, c_menu2, c_menu3, c_menu4, c_tag, c_photo);
		
		//Dao
		int res = CafeDao.getInstance().update(vo);
				
		response.sendRedirect("user_mypage.do");

	}

}
