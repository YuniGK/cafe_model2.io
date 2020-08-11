package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MyBatisConnector;
import vo.CafeVo;

public class CafeDao {

	SqlSessionFactory factory;
	
	//single-ton : 객체 1개만생성해서 사용(서비스)하자
	static CafeDao single = null;

	public static CafeDao getInstance() {

		if (single == null)
			single = new CafeDao();
		return single;
		
	}

	public CafeDao() {
		factory = MyBatisConnector.getInstance().getSqlSessionFactory();
	}
	
	//카페 등록	
	public int insert(CafeVo vo) {
		int res = 0;

		SqlSession sqlSession = factory.openSession(true);

		res = sqlSession.insert("cafe.cafe_insert", vo);
		
		sqlSession.close();
		
		//실패시 0	
		return res;
	}
	
	//카페 목록 조회	
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
	
	//지역별 카페 수 조회
	public List<CafeVo> selectListSize(String addrs) {

		List<CafeVo> list = null;

		SqlSession sqlSession = factory.openSession();
		
		list = sqlSession.selectList("cafe.cafe_list_size", addrs);
		
		sqlSession.close();

		return list;
	}
	
	//카페글 하나만 조회
	public CafeVo selectOne(int c_idx) {

		CafeVo vo = null;
		
		SqlSession sqlSession = factory.openSession();
		
		vo = sqlSession.selectOne("cafe.cafe_one_list", c_idx);
		
		sqlSession.close();
		
		return vo;
	}
	
	//삭제
	public int delete(int c_idx) {
		
		int res = 0;
		
		SqlSession sqlSession = factory.openSession(true);
		
		res = sqlSession.delete("cafe.cafe_delete", c_idx);
		
		sqlSession.close();
		
		//실패시 0	
		return res;
	}
	
	//수정
	public int update(CafeVo vo) {
		
		int res = 0;
		
		SqlSession sqlSession = factory.openSession(true);
		
		res = sqlSession.update("cafe.cafe_update", vo);
		
		sqlSession.close();
		
		//실패시 0	
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
