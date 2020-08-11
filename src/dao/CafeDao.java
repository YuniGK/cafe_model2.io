package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MyBatisConnector;
import vo.CafeVo;

public class CafeDao {

	SqlSessionFactory factory;
	
	//single-ton : ��ü 1���������ؼ� ���(����)����
	static CafeDao single = null;

	public static CafeDao getInstance() {

		if (single == null)
			single = new CafeDao();
		return single;
		
	}

	public CafeDao() {
		factory = MyBatisConnector.getInstance().getSqlSessionFactory();
	}
	
	//ī�� ���	
	public int insert(CafeVo vo) {
		int res = 0;

		SqlSession sqlSession = factory.openSession(true);

		res = sqlSession.insert("cafe.cafe_insert", vo);
		
		sqlSession.close();
		
		//���н� 0	
		return res;
	}
	
	//ī�� ��� ��ȸ	
	public List<CafeVo> selectList(Map map) {

		List<CafeVo> list = null;

		SqlSession sqlSession = factory.openSession();
		
		list = sqlSession.selectList("cafe.cafe_list", map);
		
		sqlSession.close();

		return list;
	}
		
	public List<CafeVo> selectList() {

		List<CafeVo> list = null;

		SqlSession sqlSession = factory.openSession();
		
		list = sqlSession.selectList("cafe.cafe_list_only");
		
		sqlSession.close();

		return list;
	}
	
	//������ ī�� �� ��ȸ
	public List<CafeVo> selectListSize(String addrs) {

		List<CafeVo> list = null;

		SqlSession sqlSession = factory.openSession();
		
		list = sqlSession.selectList("cafe.cafe_list_size", addrs);
		
		sqlSession.close();

		return list;
	}
	
	//ī��� �ϳ��� ��ȸ
	public CafeVo selectOne(int c_idx) {

		CafeVo vo = null;
		
		SqlSession sqlSession = factory.openSession();
		
		vo = sqlSession.selectOne("cafe.cafe_one_list", c_idx);
		
		sqlSession.close();
		
		return vo;
	}
	
	//����
	public int delete(int c_idx) {
		
		int res = 0;
		
		SqlSession sqlSession = factory.openSession(true);
		
		res = sqlSession.delete("cafe.cafe_delete", c_idx);
		
		sqlSession.close();
		
		//���н� 0	
		return res;
	}
	
	//����
	public int update(CafeVo vo) {
		
		int res = 0;
		
		SqlSession sqlSession = factory.openSession(true);
		
		res = sqlSession.update("cafe.cafe_update", vo);
		
		sqlSession.close();
		
		//���н� 0	
		return res;
	}
	
	public List<CafeVo> tagSelect(String c_tag) {

		List<CafeVo> list = null;

		SqlSession sqlSession = factory.openSession();
		
		list = sqlSession.selectList("cafe.cafe_tag_list", c_tag);
		
		sqlSession.close();

		return list;
	}
	
}
