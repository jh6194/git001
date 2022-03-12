package com.wecar.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.wecar.dbmanager.WDBManager;
import com.wecar.dto.NoticeBoardDto;
import com.wecar.dto.WDto;

public class PagingDao {
	
	public int userlistSum() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		WDBManager db = new WDBManager();
		
		int result = -1;
		String sql = "select count(*) from wecar_user";
		
		try {
			con = db.getCon();
			pstmt = con.prepareStatement(sql);
			rset = pstmt.executeQuery();
			if (rset.next()) {result = rset.getInt(1);}
			
		} catch (SQLException e) { e.printStackTrace(); 
		}  finally {
			if(rset != null) {try { rset.close(); } catch (SQLException e) {  e.printStackTrace(); }}
			if(pstmt != null) {try { pstmt.close(); } catch (SQLException e) {  e.printStackTrace(); }}
			if(con != null) {try { con.close(); } catch (SQLException e) {  e.printStackTrace(); }}
		}
		
		return result;
	}
	
	public ArrayList<WDto> userlistpage(int pstartno) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		WDBManager db = new WDBManager();
		ArrayList<WDto> list = new ArrayList<>();
		
		String sql = "select * from wecar_user order by uno desc limit ?, 20"; 
		
		try {
			con = db.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pstartno);
			rset = pstmt.executeQuery();
			
			while (rset.next()) {
				list.add(new WDto(rset.getInt("uno"),rset.getString("id"),rset.getString("pass"),rset.getString("name"),rset.getString("birth"),rset.getString("date"),rset.getString("phone"),rset.getString("email"),rset.getString("post"),rset.getString("address"),rset.getString("address_detail"),rset.getInt("rank"),rset.getString("ip")));
			}
			
		} catch (SQLException e) {  e.printStackTrace(); 
		} finally {
			if(rset != null) {try { rset.close(); } catch (SQLException e) {  e.printStackTrace(); }}
			if(pstmt != null) {try { pstmt.close(); } catch (SQLException e) {  e.printStackTrace(); }}
			if(con != null) {try { con.close(); } catch (SQLException e) {  e.printStackTrace(); }}
		}
		
		return list;
	} 
	
	public int boardlistSum() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		WDBManager db = new WDBManager();
		
		int result = -1;
		String sql = "select count(*) from notice_board";
		
		try {
			con = db.getCon();
			pstmt = con.prepareStatement(sql);
			rset = pstmt.executeQuery();
			if (rset.next()) {result = rset.getInt(1);}
			
		} catch (SQLException e) { e.printStackTrace(); 
		}  finally {
			if(rset != null) {try { rset.close(); } catch (SQLException e) {  e.printStackTrace(); }}
			if(pstmt != null) {try { pstmt.close(); } catch (SQLException e) {  e.printStackTrace(); }}
			if(con != null) {try { con.close(); } catch (SQLException e) {  e.printStackTrace(); }}
		}
		
		return result;
	}
	
	public ArrayList<NoticeBoardDto> boardlistpage(int pstartno) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		WDBManager db = new WDBManager();
		ArrayList<NoticeBoardDto> list = new ArrayList<>();
		
		String sql = "select * from notice_board order by bno desc limit ?, 20;"; 
		
		try {
			con = db.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pstartno);
			rset = pstmt.executeQuery();
			
			while (rset.next()) {
				list.add(new NoticeBoardDto(rset.getInt("bno"),rset.getString("bname"),rset.getString("bpass"),rset.getString("btitle"),rset.getString("bcontent"),rset.getString("bimg"),rset.getString("bdate"),rset.getInt("bhit"),rset.getString("bip")));
			}
			
		} catch (SQLException e) {  e.printStackTrace(); 
		} finally {
			if(rset != null) {try { rset.close(); } catch (SQLException e) {  e.printStackTrace(); }}
			if(pstmt != null) {try { pstmt.close(); } catch (SQLException e) {  e.printStackTrace(); }}
			if(con != null) {try { con.close(); } catch (SQLException e) {  e.printStackTrace(); }}
		}
		
		return list;
	} 
}
