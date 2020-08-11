package vo;

public class HitVo {
	int s_idx, s_num, c_idx;

	public HitVo() {
		
	}

	public HitVo(int s_idx, int s_num, int c_idx) {
		super();
		this.s_idx = s_idx;
		this.s_num = s_num;
		this.c_idx = c_idx;
	}

	public int getS_idx() {
		return s_idx;
	}

	public void setS_idx(int s_idx) {
		this.s_idx = s_idx;
	}

	public int getS_num() {
		return s_num;
	}

	public void setS_num(int s_num) {
		this.s_num = s_num;
	}

	public int getC_idx() {
		return c_idx;
	}

	public void setC_idx(int c_idx) {
		this.c_idx = c_idx;
	}
	
}
