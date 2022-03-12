package com.wecar.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.wecar.dbmanager.WDBManager;
import com.wecar.dto.NoticeBoardDto;

public class BoardDao {
	private Connection con;
	
	public BoardDao() { super(); }

	public ArrayList<NoticeBoardDto> list() {
		ArrayList<NoticeBoardDto> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = "select * from notice_board order by bno desc";
		
		WDBManager db = new WDBManager();
		
		try {
			con = db.getCon();
			pstmt = con.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new NoticeBoardDto(rset.getInt("bno"),rset.getString("bname"),rset.getString("bpass"),rset.getString("btitle"),rset.getString("bcontent"),rset.getString("bimg"),rset.getString("bdate"),rset.getInt("bhit"),rset.getString("bip")));
			}
			 
		} catch (SQLException e) { e.printStackTrace(); 
		} finally {
			if (rset != null) {try { rset.close(); } catch (SQLException e) { e.printStackTrace(); }}
			if (pstmt != null) {try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }}
			if (con != null) {try { con.close(); } catch (SQLException e) { e.printStackTrace(); }}
		} 
		
		return list;
	}
	
	public int insert(NoticeBoardDto dto) {
		PreparedStatement pstmt = null;
		
		String sql = "insert into notice_board (bname, bpass, btitle, bcontent, bimg, bip) values (?,?,?,?,?,?)";
		int result = -1;
		
		WDBManager db = new WDBManager();
		
		try {
			con = db.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getBname());
			pstmt.setString(2, dto.getBpass());
			pstmt.setString(3, dto.getBtitle());
			pstmt.setString(4, dto.getBcontent());
			pstmt.setString(5, dto.getBimg());
			pstmt.setString(6, dto.getBip());
			result = pstmt.executeUpdate();
			 
		} catch (Exception e) { e.printStackTrace(); 
		} finally {
			if (pstmt != null) {try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }}
			if (con != null) {try { con.close(); } catch (SQLException e) { e.printStackTrace(); }}
		} 
		
		return result;
	}
	
	public NoticeBoardDto select(NoticeBoardDto dto) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = "select * from notice_board where bno = ?";
		NoticeBoardDto result = null;
		
		WDBManager db = new WDBManager();
		
		try {
			con = db.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, dto.getBno());
			rset = pstmt.executeQuery();
			rset.next();
			result = new NoticeBoardDto(rset.getInt("bno"),rset.getString("bname"),rset.getString("bpass"),rset.getString("btitle"),rset.getString("bcontent"),rset.getString("bimg"),rset.getString("bdate"),rset.getInt("bhit"),rset.getString("bip"));
			
		} catch (SQLException e) { e.printStackTrace(); 
		} finally {
			if (rset != null) {try { rset.close(); } catch (SQLException e) { e.printStackTrace(); }}
			if (pstmt != null) {try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }}
			if (con != null) {try { con.close(); } catch (SQLException e) { e.printStackTrace(); }}
		} 
		
		return result;
	}
	
	public int update_bhit(NoticeBoardDto dto) {
		PreparedStatement pstmt = null;
		
		String sql = "update notice_board set bhit=bhit+1 where bno = ?";
		int result = -1;
		
		WDBManager db = new WDBManager();
		
		try {
			con = db.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, dto.getBno());
			result = pstmt.executeUpdate();
			 
		} catch (SQLException e) { e.printStackTrace(); 
		} finally {
			if (pstmt != null) {try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }}
			if (con != null) {try { con.close(); } catch (SQLException e) { e.printStackTrace(); }}
		} 
		
		return result;
	}
	
	public int update(NoticeBoardDto dto) {
		PreparedStatement pstmt = null;
		
		String sql = "update notice_board set btitle = ?, bcontent = ?, bimg = ?, bip = ?, bdate = current_timestamp where bno = ? and bpass = ?";
		int result = -1;
		
		WDBManager db = new WDBManager();
		
		try {
			con = db.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getBtitle());
			pstmt.setString(2, dto.getBcontent());
			pstmt.setString(3, dto.getBimg());
			pstmt.setString(4, dto.getBip());
			pstmt.setInt(5, dto.getBno());
			pstmt.setString(6, dto.getBpass());
			result = pstmt.executeUpdate();
			 
		} catch (SQLException e) { e.printStackTrace(); 
		} finally {
			if (pstmt != null) {try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }}
			if (con != null) {try { con.close(); } catch (SQLException e) { e.printStackTrace(); }}
		} 
		
		return result;
	}
	
	public int delete(NoticeBoardDto dto) {
		PreparedStatement pstmt = null;
		
		String sql = "delete from notice_board where bno = ? and bpass = ?";
		int result = -1;
		
		WDBManager db = new WDBManager();
		
		try {
			con = db.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, dto.getBno());
			pstmt.setString(2, dto.getBpass());
			result = pstmt.executeUpdate();
		
		} catch (SQLException e) { e.printStackTrace(); 
		} finally {
			if (pstmt != null) {try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }}
			if (con != null) {try { con.close(); } catch (SQLException e) { e.printStackTrace(); }}
		} 
		
		return result;
	}
}
