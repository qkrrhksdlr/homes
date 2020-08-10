package com.kpc.homes;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.kpc.common.DBManager;
import com.kpc.common.PagingUtil;

public class AptImpl {

	
	//Ajax 위경도 반경 약국 찾기
	public ArrayList<AptVO> selectByLatLng(AptVO vo) {
		DBManager db = new DBManager();
		ArrayList<AptVO> list = new ArrayList<AptVO>();
		Connection c = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			c = db.conn("oracle");  
				
			String sql = "";
			sql += "select *  ";
			sql += "       from aptxy  ";
			sql += "       where (lat between ?-0.01 and ?+0.01) and (lng between ?-0.01 and ?+0.01)";
			sql += "       order  by pharm_name desc ";
			
			pstmt = c.prepareStatement(sql);
			pstmt.setString(1, vo.getLat());
			pstmt.setString(2, vo.getLat());
			pstmt.setString(3, vo.getLng());
			pstmt.setString(4, vo.getLng());
			rs = pstmt.executeQuery();
			while(rs.next() ) {
				vo = new AptVO();
				vo.setGu(rs.getString("gu"));
				vo.setDong(rs.getString("dong"));
				vo.setAddr1(rs.getInt("addr1"));
				vo.setApt(rs.getString("apt"));
				vo.setLat(rs.getString("lat"));
				vo.setLng(rs.getString("lng"));
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.close(c,pstmt,rs);					
		}
		return list;
	}
	//Ajax 동검색 반경 약국 찾기
	public ArrayList<AptVO> selectByCount(AptVO vo) {
		DBManager db = new DBManager();
		ArrayList<AptVO> list = new ArrayList<AptVO>();
		Connection c = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			c = db.conn("oracle");  
			
			String sql = "";
			sql += "select *  ";
			sql += "       from aptxy  ";
			sql += "       where gu=? and (dong=? or street=? or apt=?)";
			sql += "       order by apt asc, dong asc, street asc ";
	
			pstmt = c.prepareStatement(sql);
			pstmt.setString(1, vo.getGu());
			pstmt.setString(2, vo.getDong());
			pstmt.setString(3, vo.getStreet());
			pstmt.setString(4, vo.getApt());
			
			rs = pstmt.executeQuery();
			while(rs.next() ) {
				vo = new AptVO();
				vo.setGu(rs.getString("getGu"));
				vo.setDong(rs.getString("getDong"));
				vo.setStreet(rs.getString("getStreet"));
				vo.setApt(rs.getString("getApt"));
				vo.setLat(rs.getString("lat"));
				vo.setLng(rs.getString("lng"));
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.close(c,pstmt,rs);					
		}
		return list;
	}
		
	

}
