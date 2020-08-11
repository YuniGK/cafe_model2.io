package action.member;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.MemberDao;
import vo.MemberVo;

/*
 * Servlet implementation class MemberUpdateFormAction
 */
@WebServlet("/member_update.do")
public class MemberUpdateAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/*
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//���� ���ڵ�
		request.setCharacterEncoding("utf-8");
		
		//���� ------------------------------------------
		//�����
		String webPath = "./upload/";
		
		ServletContext application = request.getServletContext();
		
		//������
		String path = application.getRealPath(webPath);
		
		System.out.println(path);
		
		//���� ũ�� ����
		int maxSize = 1024 * 1024 * 100;
		
		MultipartRequest mr = new MultipartRequest(request, path, maxSize, "utf-8", new DefaultFileRenamePolicy());
		
		//���ε�� �����̸� ���
		String m_photo = "no_file.jpg";
		
		//���� ���ε�� �������� ���ϱ�
		File file = mr.getFile("m_photo");
		
		if (file != null) {
			m_photo = file.getName();
		}
		
		String m_id = mr.getParameter("m_id");
		String m_pwd = mr.getParameter("m_pwd");
		String m_name = mr.getParameter("m_name");
		String m_gender = mr.getParameter("m_gender");
		String m_tel = mr.getParameter("m_tel");
		String m_email = mr.getParameter("m_email");
		String m_ip = request.getRemoteAddr();
		
		String grade = mr.getParameter("m_grade");
		
		MemberVo id_vo = MemberDao.getInstance().selectOne(m_id);
		
		int m_idx = id_vo.getM_idx();
		
		try {
			if (grade == null) {
				grade = "�Ϲ�";
			}
		} catch (Exception e) {
		}

		//System.out.println(grade);
		
		String m_grade = grade.equals("�Ϲ�") ? "�Ϲ�" : grade; 
				
		MemberVo vo = new MemberVo(m_idx, m_id, m_pwd, m_name, m_gender, m_tel, m_email, m_photo, m_grade, m_ip);
		
		//Dao ����
		int res = MemberDao.getInstance().update(vo);
		
		HttpSession session = request.getSession();
		MemberVo user1 = (MemberVo) session.getAttribute("user");
		
		String userGrade = user1.getM_grade();
      
      
		if(userGrade.equals("�Ϲ�")) {
      
			MemberVo user = MemberDao.getInstance().selectOne(m_id);
      
			session.setAttribute("user", user);
		}
      
		response.sendRedirect("user_mypage.do");

	}

}

