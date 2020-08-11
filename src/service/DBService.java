package service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DBService {

	//javax.sql로 가져온다.
			//BasicDataSource 사용을 위한 설명서 DataSource
	DataSource ds = null;
	
	//static 하나만 생성된다.
	static DBService single = null;

	public static DBService getInstance() {

		if (single == null)
			single = new DBService();
		
		return single;
	}

	//생성자
	private DBService() {
		/* JNDI - 이름을 통해 검색 획득하는 기술
		   JNDI를 이용해 자원의 정보를 획득한다. */
		
		try {
			//블록 지정 후, alt + shift + z를 이용해 try / catch한다.
			
			//1. JNDI 획득하기 위한 객체
			InitialContext ic = new InitialContext();
			
			/* 2. Resource가 기록된 위치 검색
									   lookup = 검색
											META-INF에서 context.xml에서 <Context>까지 검색 */
			Context ctx = (Context) ic.lookup("java:comp/env");
			
			//3. Context에서 자원(DataSource_설명서)검색
			ds = (DataSource) ctx.lookup("jdbc/oracle_test");
			
		} catch (NamingException e) {
			e.printStackTrace();
		}
				
	}
	
	//ds와 dao를 연결하기 위한
									//throws 오류 발생 시, getConnection()를 사용하는 곳에서 예외 처리르 한다.
	public Connection getConnection() throws SQLException {
		return ds.getConnection();
	}
	
}
