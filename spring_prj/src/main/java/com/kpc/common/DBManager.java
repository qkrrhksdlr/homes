package com.kpc.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBManager {
//	public int add() {
//		int res=0;
//		return res;
//	}
	private final String DB_ID = "kpc";
	private final String DB_PW = "0000";
	private String DB_URL = null;
	
	public Connection conn(String type) {
		
		Connection conn = null;
		try {
			if(type.equals("oracle")) {
//				System.out.println("--oracle연결--");
				DB_URL = "jdbc:oracle:thin:@localhost:1521:xe";
				Class.forName("oracle.jdbc.driver.OracleDriver"); //오라클
			} else if (type.equals("mysql")) {
//				System.out.println("--mysql연결--");
				DB_URL = "jdbc:mysql://localhost/mydb";
				Class.forName("com.mysql.jdbc.Driver"); //mysql 구버전
				//Class.forName("com.mysql.cj.jdbc.Driver"); //mysql 신버전
			}
			conn = DriverManager.getConnection(DB_URL, DB_ID, DB_PW);
		} catch (ClassNotFoundException e1) {
			e1.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	//오버로딩
	public void close(Connection conn, PreparedStatement pstmt, ResultSet rs) {
		try{
			//close : 객체가 생성된 순서의 반대로 close
			if( rs != null && !rs.isClosed()){
				rs.close();
			}
			if( pstmt != null && !pstmt.isClosed()){
				pstmt.close();
			}
			if( conn != null && !conn.isClosed()){
				conn.close();
			}
		} catch( SQLException e){
			e.printStackTrace();
		}
//		System.out.println("--close done--");
	}
	
	public void close(Connection conn, PreparedStatement pstmt) {
		try{
			//close : 객체가 생성된 순서의 반대로 close
			if( pstmt != null && !pstmt.isClosed()){
				pstmt.close();
			}
			if( conn != null && !conn.isClosed()){
				conn.close();
			}
		} catch( SQLException e){
			e.printStackTrace();
		}
//		System.out.println("--close done--");
	}
	
}
