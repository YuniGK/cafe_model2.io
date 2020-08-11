package vo;

public class MemberVo {

	int m_idx;
	
	String m_id, m_pwd, m_name, m_gender, m_tel, m_email, m_photo, m_grade, m_ip, m_regdate;

	public MemberVo() {
	}
	
	//insert
	public MemberVo(String m_id, String m_pwd, String m_name, String m_gender, String m_tel, String m_email,
			String m_photo, String m_grade, String m_ip) {
		super();
		this.m_id = m_id;
		this.m_pwd = m_pwd;
		this.m_name = m_name;
		this.m_gender = m_gender;
		this.m_tel = m_tel;
		this.m_email = m_email;
		this.m_photo = m_photo;
		this.m_grade = m_grade;
		this.m_ip = m_ip;
	}
	
	//update
	public MemberVo(int m_idx, String m_id, String m_pwd, String m_name, String m_gender, String m_tel, String m_email,
			String m_photo, String m_grade, String m_ip) {
		super();
		this.m_idx = m_idx;
		this.m_id = m_id;
		this.m_pwd = m_pwd;
		this.m_name = m_name;
		this.m_gender = m_gender;
		this.m_tel = m_tel;
		this.m_email = m_email;
		this.m_photo = m_photo;
		this.m_grade = m_grade;
		this.m_ip = m_ip;
	}
	
	public int getM_idx() {
		return m_idx;
	}

	public void setM_idx(int m_idx) {
		this.m_idx = m_idx;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getM_pwd() {
		return m_pwd;
	}

	public void setM_pwd(String m_pwd) {
		this.m_pwd = m_pwd;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getM_gender() {
		return m_gender;
	}

	public void setM_gender(String m_gender) {
		this.m_gender = m_gender;
	}

	public String getM_tel() {
		return m_tel;
	}

	public void setM_tel(String m_tel) {
		this.m_tel = m_tel;
	}

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	public String getM_photo() {
		return m_photo;
	}

	public void setM_photo(String m_photo) {
		this.m_photo = m_photo;
	}

	public String getM_grade() {
		return m_grade;
	}

	public void setM_grade(String m_grade) {
		this.m_grade = m_grade;
	}

	public String getM_ip() {
		return m_ip;
	}

	public void setM_ip(String m_ip) {
		this.m_ip = m_ip;
	}

	public String getM_regdate() {
		return m_regdate;
	}

	public void setM_regdate(String m_regdate) {
		this.m_regdate = m_regdate;
	}
	
}
