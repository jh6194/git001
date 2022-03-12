package com.wecar.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.wecar.dbmanager.WDBManager;
import com.wecar.dto.WDto;

public class WMDao {
	private static Connection con;

	public WMDao() { super(); }
	
	public WDto detail(WDto dto) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		WDto result = null;
		String sql = "select * from wecar_user where uno = ?";
		
		WDBManager db = new WDBManager();
		
		try {
			con = db.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, dto.getUno());
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				result = new WDto(rset.getInt("uno"),rset.getString("id"),rset.getString("pass"),rset.getString("name"),rset.getString("birth"),rset.getString("date"),rset.getString("phone"),rset.getString("email"),rset.getString("post"),rset.getString("address"),rset.getString("address_detail"),rset.getInt("rank"),rset.getString("ip"));
			}
			
		} catch (Exception e) {  e.printStackTrace(); 
		} finally {
			if (rset != null) {try { rset.close(); } catch (SQLException e) {  e.printStackTrace(); }}
			if (pstmt != null) {try { pstmt.close(); } catch (SQLException e) {  e.printStackTrace(); }}
			if (con != null) {try { con.close(); } catch (SQLException e) {  e.printStackTrace(); }}
		}
		
		return result;
	}
	
	public int delete(WDto dto) {
		PreparedStatement pstmt = null;
		
		int result = -1;
		String sql = "delete from wecar_user where uno = ?";
		
		WDBManager db = new WDBManager();
		
		try {
			con = db.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, dto.getUno());
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {  e.printStackTrace(); 
		} finally {
			if (pstmt != null) {try { pstmt.close(); } catch (SQLException e) {  e.printStackTrace(); }}
			if (con != null) {try { con.close(); } catch (SQLException e) {  e.printStackTrace(); }}
		}
		
		return result;
	}
	
	public int infoUpdate(WDto dto) {
		PreparedStatement pstmt = null;
		
		int result = -1;
		String sql = "update wecar_user set email = ?, phone = ?, post = ?, address = ?, address_detail = ?, rank = ? where uno = ?";
		
		WDBManager db = new WDBManager();
		
		try {
			con = db.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getEmail());
			pstmt.setString(2, dto.getPhone());
			pstmt.setString(3, dto.getPost());
			pstmt.setString(4, dto.getAddress());
			pstmt.setString(5, dto.getAddress_detail());
			pstmt.setInt(6, dto.getRank());
			pstmt.setInt(7, dto.getUno());
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {  e.printStackTrace(); 
		} finally {
			if (pstmt != null) {try { pstmt.close(); } catch (SQLException e) {  e.printStackTrace(); }}
			if (con != null) {try { con.close(); } catch (SQLException e) {  e.printStackTrace(); }}
		}
		
		return result;
	}
	
	public int passUpdate(WDto dto) {
		PreparedStatement pstmt = null;
		
		int result = -1;
		String sql = "update wecar_user set pass = ?, email = ?, phone = ?, post = ?, address = ?, address_detail = ?, rank = ? where uno = ?";
		
		WDBManager db = new WDBManager();
		
		try {
			con = db.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getPass());
			pstmt.setString(2, dto.getEmail());
			pstmt.setString(3, dto.getPhone());
			pstmt.setString(4, dto.getPost());
			pstmt.setString(5, dto.getAddress());
			pstmt.setString(6, dto.getAddress_detail());
			pstmt.setInt(7, dto.getRank());
			pstmt.setInt(8, dto.getUno());
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {  e.printStackTrace(); 
		} finally {
			if (pstmt != null) {try { pstmt.close(); } catch (SQLException e) {  e.printStackTrace(); }}
			if (con != null) {try { con.close(); } catch (SQLException e) {  e.printStackTrace(); }}
		}
		
		return result;
	}
	
	public ArrayList<WDto> userSearch(String search) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<WDto> list = new ArrayList<>();
		String sql = "select * from wecar_user where name like concat('%', ? ,'%') or id like concat('%', ? ,'%') or uno like concat('%', ? ,'%')";
		
		WDBManager db = new WDBManager();
		
		try {
			con = db.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, search);
			pstmt.setString(2, search);
			pstmt.setString(3, search);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new WDto(rset.getInt("uno"),rset.getString("id"),rset.getString("pass"),rset.getString("name"),rset.getString("birth"),rset.getString("date"),rset.getString("phone"),rset.getString("email"),rset.getString("post"),rset.getString("address"),rset.getString("address_detail"),rset.getInt("rank"),rset.getString("ip")));
			}
			
		} catch (Exception e) {  e.printStackTrace(); 
		} finally {
			if (rset != null) {try { rset.close(); } catch (SQLException e) {  e.printStackTrace(); }}
			if (pstmt != null) {try { pstmt.close(); } catch (SQLException e) {  e.printStackTrace(); }}
			if (con != null) {try { con.close(); } catch (SQLException e) {  e.printStackTrace(); }}
		}
		
		return list;
	}
}
