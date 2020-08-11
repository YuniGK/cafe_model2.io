package action.member;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.MemberDao;
import vo.MemberVo;

/*
 * Servlet implementation class MemberInsertAction
 */
@WebServlet("/insert.do")
public class MemberInsertAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/*
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// /insert.do?m_id=test12&m_pwd=1106qwe&m_name=%EA%B9%80%EC%9C%A0%EB%8B%88&m_gender=%EB%82%A8%EC%84%B1&m_email=1106qwe%40hanmail.net&m_photo=user.jpg	
		
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
		String m_photo = "";
		
		//���� ���ε�� �������� ���ϱ�
		File file = mr.getFile("m_photo");
		
		if (file != null) {
			m_photo = file.getName();
		}else {
			m_photo = "no_file.jpg";
		}
		
		System.out.println("������ ���� "+m_photo);
		
		//���� ------------------------------------------
		
		String m_id = mr.getParameter("m_id");
		String m_pwd = mr.getParameter("m_pwd");
		String m_name = mr.getParameter("m_name");
		String m_gender = mr.getParameter("m_gender");
		String m_email = mr.getParameter("m_email");
		String m_tel = mr.getParameter("m_tel");
		String m_ip = request.getRemoteAddr();
		String m_grade = "�Ϲ�";
		
		MemberVo vo = new MemberVo(m_id, m_pwd, m_name, m_gender, m_tel, m_email, m_photo, m_grade, m_ip);
		
		int res = MemberDao.getInstance().insert(vo);
		
		response.sendRedirect("index.do");
		
	}

}
