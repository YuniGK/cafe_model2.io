package vo;

public class ReviewVo {

	int r_idx, m_idx, c_idx, r_grade, 
	    total, bad, notBad, soso, likes, god;  
	
	String r_cot, r_pwd, r_ip, r_regdate,
		   m_id, m_pwd, m_name, m_gender, m_tel, m_email, m_photo, m_grade, m_ip, m_regdate,  
		   gender_img;

	double avg;
		
	public ReviewVo() {
	}
	
	//insert
	public ReviewVo(int m_idx, int c_idx, int r_grade, String r_cot, String r_pwd, String r_ip) {
		super();
		this.m_idx = m_idx;
		this.c_idx = c_idx;
		this.r_grade = r_grade;
		this.r_cot = r_cot;
		this.r_pwd = r_pwd;
		this.r_ip = r_ip;
	}
	
	//update
	public ReviewVo(int r_idx, String r_cot, int m_idx, int c_idx, int r_grade,  String r_pwd, String r_ip) {
		super();
		this.r_idx = r_idx;
		this.m_idx = m_idx;
		this.c_idx = c_idx;
		this.r_grade = r_grade;
		this.r_cot = r_cot;
		this.r_pwd = r_pwd;
		this.r_ip = r_ip;
	}
	
	 public String getGender_img() {
		gender_img = "god"; 
		
		if (r_grade == 5) {
		}else if (r_grade == 4) {
			gender_img = "like";
		}else if (r_grade == 3) {
			gender_img = "soso";
		}else if (r_grade == 2) {
			gender_img = "notBad";
		}else {
			gender_img = "bad";
		}
		
		return gender_img;
	}
	
	public double getAvg() {
		return Math.round(avg*100)/100.0;
	}

	public int getR_idx() {
		return r_idx;
	}

	public void setR_idx(int r_idx) {
		this.r_idx = r_idx;
	}

	public int getM_idx() {
		return m_idx;
	}

	public void setM_idx(int m_idx) {
		this.m_idx = m_idx;
	}

	public int getC_idx() {
		return c_idx;
	}

	public void setC_idx(int c_idx) {
		this.c_idx = c_idx;
	}

	public int getR_grade() {
		return r_grade;
	}

	public void setR_grade(int r_grade) {
		this.r_grade = r_grade;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public String getR_cot() {
		return r_cot;
	}

	public void setR_cot(String r_cot) {
		this.r_cot = r_cot;
	}

	public String getR_pwd() {
		return r_pwd;
	}

	public void setR_pwd(String r_pwd) {
		this.r_pwd = r_pwd;
	}

	public String getR_ip() {
		return r_ip;
	}

	public void setR_ip(String r_ip) {
		this.r_ip = r_ip;
	}

	public String getR_regdate() {
		return r_regdate;
	}

	public void setR_regdate(String r_regdate) {
		this.r_regdate = r_regdate;
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

	public int getBad() {
		return bad;
	}

	public void setBad(int bad) {
		this.bad = bad;
	}

	public int getNotBad() {
		return notBad;
	}

	public void setNotBad(int notBad) {
		this.notBad = notBad;
	}

	public int getSoso() {
		return soso;
	}

	public void setSoso(int soso) {
		this.soso = soso;
	}

	public int getLikes() {
		return likes;
	}

	public void setLikes(int likes) {
		this.likes = likes;
	}

	public int getGod() {
		return god;
	}

	public void setGod(int god) {
		this.god = god;
	}

}
