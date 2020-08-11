package service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DBService {

	//javax.sql�� �����´�.
			//BasicDataSource ����� ���� ���� DataSource
	DataSource ds = null;
	
	//static �ϳ��� �����ȴ�.
	static DBService single = null;

	public static DBService getInstance() {

		if (single == null)
			single = new DBService();
		
		return single;
	}

	//������
	private DBService() {
		/* JNDI - �̸��� ���� �˻� ȹ���ϴ� ���
		   JNDI�� �̿��� �ڿ��� ������ ȹ���Ѵ�. */
		
		try {
			//��� ���� ��, alt + shift + z�� �̿��� try / catch�Ѵ�.
			
			//1. JNDI ȹ���ϱ� ���� ��ü
			InitialContext ic = new InitialContext();
			
			/* 2. Resource�� ��ϵ� ��ġ �˻�
									   lookup = �˻�
											META-INF���� context.xml���� <Context>���� �˻� */
			Context ctx = (Context) ic.lookup("java:comp/env");
			
			//3. Context���� �ڿ�(DataSource_����)�˻�
			ds = (DataSource) ctx.lookup("jdbc/oracle_test");
			
		} catch (NamingException e) {
			e.printStackTrace();
		}
				
	}
	
	//ds�� dao�� �����ϱ� ����
									//throws ���� �߻� ��, getConnection()�� ����ϴ� ������ ���� ó���� �Ѵ�.
	public Connection getConnection() throws SQLException {
		return ds.getConnection();
	}
	
}
