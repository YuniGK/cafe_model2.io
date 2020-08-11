package dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MyBatisConnector;
import vo.HitVo;

public class HitDao {

	//single-ton : ��ü 1���������ؼ� ���(����)����
	static HitDao single = null;
	
	SqlSessionFactory factory;

	public static HitDao getInstance() {

		if (single == null)
			single = new HitDao();
		return single;
	}

	public HitDao() {
		factory = MyBatisConnector.getInstance().getSqlSessionFactory();
	}
	
	public HitVo selectOne(int c_idx) {

		HitVo vo = null;
		
		SqlSession sqlSession = factory.openSession();
		
		vo = sqlSession.selectOne("hit.hit_select", c_idx);
		
		sqlSession.close();
		
		return vo;
		
	}
	
	public int insert(int c_idx) {
		
		int res = 0;
		
		SqlSession sqlSession = factory.openSession(true);
		
		res = sqlSession.insert("hit.hit_insert", c_idx);
		
		sqlSession.close();
		
		//���н� 0	
		return res;
	}
	
	public int update(HitVo vo) {
		
		int res = 0;
		
		SqlSession sqlSession = factory.openSession(true);
		
		res = sqlSession.update("hit.hit_update", vo);
		
		sqlSession.close();
		
		//���н� 0	
		return res;
	}
	
}
