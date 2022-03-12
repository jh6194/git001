package com.wecar.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.wecar.dbmanager.WDBManager;
import com.wecar.dto.EventDto;

public class EventDao {
	private Connection con;
	
	public EventDao() { super(); }

	public ArrayList<EventDto> list() {
		ArrayList<EventDto> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = "select * from event_board order by eno desc";
		
		WDBManager db = new WDBManager();
		
		try {
			con = db.getCon();
			pstmt = con.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new EventDto(rset.getInt("eno"),rset.getString("ename"),rset.getString("epass"),rset.getString("etitle"),rset.getString("econtent"),rset.getString("eimg"),rset.getString("edate"),rset.getInt("ehit"),rset.getString("eip")));
			}
			 
		} catch (SQLException e) { e.printStackTrace(); 
		} finally {
			if (rset != null) {try { rset.close(); } catch (SQLException e) { e.printStackTrace(); }}
			if (pstmt != null) {try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }}
			if (con != null) {try { con.close(); } catch (SQLException e) { e.printStackTrace(); }}
		} 
		
		return list;
	}
	
	public int insert(EventDto dto) {
		PreparedStatement pstmt = null;
		
		String sql = "insert into event_board (ename, epass, etitle, econtent, eimg, eip) values (?,?,?,?,?,?)";
		int result = -1;
		
		WDBManager db = new WDBManager();
		
		try {
			con = db.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getEname());
			pstmt.setString(2, dto.getEpass());
			pstmt.setString(3, dto.getEtitle());
			pstmt.setString(4, dto.getEcontent());
			pstmt.setString(5, dto.getEimg());
			pstmt.setString(6, dto.getEip());
			result = pstmt.executeUpdate();
			 
		} catch (Exception e) { e.printStackTrace(); 
		} finally {
			if (pstmt != null) {try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }}
			if (con != null) {try { con.close(); } catch (SQLException e) { e.printStackTrace(); }}
		} 
		
		return result;
	}
	
	public EventDto select(EventDto dto) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = "select * from event_board where eno = ?";
		EventDto result = null;
		
		WDBManager db = new WDBManager();
		
		try {
			con = db.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, dto.getEno());
			rset = pstmt.executeQuery();
			rset.next();
			result = new EventDto(rset.getInt("eno"),rset.getString("ename"),rset.getString("epass"),rset.getString("etitle"),rset.getString("econtent"),rset.getString("eimg"),rset.getString("edate"),rset.getInt("ehit"),rset.getString("eip"));
			
		} catch (SQLException e) { e.printStackTrace(); 
		} finally {
			if (rset != null) {try { rset.close(); } catch (SQLException e) { e.printStackTrace(); }}
			if (pstmt != null) {try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }}
			if (con != null) {try { con.close(); } catch (SQLException e) { e.printStackTrace(); }}
		} 
		
		return result;
	}
	
	public int update_ehit(EventDto dto) {
		PreparedStatement pstmt = null;
		
		String sql = "update event_board set ehit=ehit+1 where eno = ?";
		int result = -1;
		
		WDBManager db = new WDBManager();
		
		try {
			con = db.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, dto.getEno());
			result = pstmt.executeUpdate();
			 
		} catch (SQLException e) { e.printStackTrace(); 
		} finally {
			if (pstmt != null) {try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }}
			if (con != null) {try { con.close(); } catch (SQLException e) { e.printStackTrace(); }}
		} 
		
		return result;
	}
	
	public int update(EventDto dto) {
		PreparedStatement pstmt = null;
		
		String sql = "update event_board set etitle = ?, econtent = ?, eimg = ?, eip = ?, edate = current_timestamp where eno = ? and epass = ?";
		int result = -1;
		
		WDBManager db = new WDBManager();
		
		try {
			con = db.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getEtitle());
			pstmt.setString(2, dto.getEcontent());
			pstmt.setString(3, dto.getEimg());
			pstmt.setString(4, dto.getEip());
			pstmt.setInt(5, dto.getEno());
			pstmt.setString(6, dto.getEpass());
			result = pstmt.executeUpdate();
			 
		} catch (SQLException e) { e.printStackTrace(); 
		} finally {
			if (pstmt != null) {try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }}
			if (con != null) {try { con.close(); } catch (SQLException e) { e.printStackTrace(); }}
		} 
		
		return result;
	}
	
	public int delete(EventDto dto) {
		PreparedStatement pstmt = null;
		
		String sql = "delete from event_board where eno = ? and epass = ?";
		int result = -1;
		
		WDBManager db = new WDBManager();
		
		try {
			con = db.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, dto.getEno());
			pstmt.setString(2, dto.getEpass());
			result = pstmt.executeUpdate();
		
		} catch (SQLException e) { e.printStackTrace(); 
		} finally {
			if (pstmt != null) {try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }}
			if (con != null) {try { con.close(); } catch (SQLException e) { e.printStackTrace(); }}
		} 
		
		return result;
	}
}
