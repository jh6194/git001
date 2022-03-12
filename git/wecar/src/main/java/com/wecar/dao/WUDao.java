package com.wecar.dao;

import java.net.InetAddress;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.regex.Pattern;

import com.wecar.dbmanager.WDBManager;
import com.wecar.dto.WDto;

public class WUDao {
	private static Connection con;

	public WUDao() { super();  }
	
	public int userInsert(WDto dto) {
		PreparedStatement pstmt = null;
		
		int result = -1;
		String sql = "insert into wecar_user (id,pass,name,birth,phone,email,post,address,address_detail,ip) values (?,?,?,?,?,?,?,?,?,?)";
		
		WDBManager db = new WDBManager();
		
		try {
			con = db.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPass());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getBirth());
			pstmt.setString(5, dto.getPhone());
			pstmt.setString(6, dto.getEmail());
			pstmt.setString(7, dto.getPost());
			pstmt.setString(8, dto.getAddress());
			pstmt.setString(9, dto.getAddress_detail());
			pstmt.setString(10, InetAddress.getLocalHost().getHostAddress());
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {  e.printStackTrace(); 
		} finally {
			if (pstmt != null) {try { pstmt.close(); } catch (SQLException e) {  e.printStackTrace(); }}
			if (con != null) {try { con.close(); } catch (SQLException e) {  e.printStackTrace(); }}
		}
		
		return result;
	}
	
	public WDto userLogin(WDto dto) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		WDto result = null;
		String sql = "select * from wecar_user where id = ? and pass = ?";
		
		WDBManager db = new WDBManager();
		
		try {
			con = db.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPass());
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				result = new WDto(rset.getInt("uno"),rset.getString("id"));
			}
			
		} catch (Exception e) {  e.printStackTrace(); 
		} finally {
			if (rset != null) {try { rset.close(); } catch (SQLException e) {  e.printStackTrace(); }}
			if (pstmt != null) {try { pstmt.close(); } catch (SQLException e) {  e.printStackTrace(); }}
			if (con != null) {try { con.close(); } catch (SQLException e) {  e.printStackTrace(); }}
		}
		
		return result;
	}
	
	public int userDouble(String id) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		int result = -1;
		String sql = "select * from wecar_user where id = ?";
		String pattern = "^[A-Za-z[0-9]]{4,20}$";
		Boolean bl = Pattern.matches(pattern, id);
		
		WDBManager db = new WDBManager();
		
		try {
			con = db.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rset = pstmt.executeQuery();
			rset.last();
			
			if (rset.getRow() > 0 || id.equals("") || id.length() < 4 || !bl) {
				result = 1;
			}
			
		} catch (Exception e) {  e.printStackTrace(); 
		} finally {
			if (rset != null) {try { rset.close(); } catch (SQLException e) {  e.printStackTrace(); }}
			if (pstmt != null) {try { pstmt.close(); } catch (SQLException e) {  e.printStackTrace(); }}
			if (con != null) {try { con.close(); } catch (SQLException e) {  e.printStackTrace(); }}
		}
		
		return result;
	}
	
	public String userFindId(WDto dto) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String result = "";
		String sql = "select id from wecar_user where name = ? and email = ?";
		
		WDBManager db = new WDBManager();
		
		try {
			con = db.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getEmail());
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				result = "회원님의 아이디는 : " + rset.getString("id") + " 입니다.";
			} else {
				result = "입력하신 정보와 일치하는 아이디가 존재하지 않습니다.";
			}
			
		} catch (Exception e) {  e.printStackTrace(); 
		} finally {
			if (rset != null) {try { rset.close(); } catch (SQLException e) {  e.printStackTrace(); }}
			if (pstmt != null) {try { pstmt.close(); } catch (SQLException e) {  e.printStackTrace(); }}
			if (con != null) {try { con.close(); } catch (SQLException e) {  e.printStackTrace(); }}
		}
		
		return result;
	}
	
	public int userFindPass(WDto dto) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		int result = -1;
		String sql = "select pass from wecar_user where id = ? and email = ?";
		
		WDBManager db = new WDBManager();
		
		try {
			con = db.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getEmail());
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				result = 1;
			} 
			
		} catch (Exception e) {  e.printStackTrace(); 
		} finally {
			if (rset != null) {try { rset.close(); } catch (SQLException e) {  e.printStackTrace(); }}
			if (pstmt != null) {try { pstmt.close(); } catch (SQLException e) {  e.printStackTrace(); }}
			if (con != null) {try { con.close(); } catch (SQLException e) {  e.printStackTrace(); }}
		}
		
		return result;
	}
	
	public int userFindPassChange(WDto dto) {
		PreparedStatement pstmt = null;
		
		int result = -1;
		String sql = "update wecar_user set pass = ? where id = ?";
		
		WDBManager db = new WDBManager();
		
		try {
			con = db.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getPass());
			pstmt.setString(2, dto.getId());
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {  e.printStackTrace(); 
		} finally {
			if (pstmt != null) {try { pstmt.close(); } catch (SQLException e) {  e.printStackTrace(); }}
			if (con != null) {try { con.close(); } catch (SQLException e) {  e.printStackTrace(); }}
		}
		
		return result;
	}
	
	public int userDelete(WDto dto) {
		PreparedStatement pstmt = null;
		
		int result = -1;
		String sql = "delete from wecar_user where uno = ? and pass = ?";
		
		WDBManager db = new WDBManager();
		
		try {
			con = db.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, dto.getUno());
			pstmt.setString(2, dto.getPass());
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {  e.printStackTrace(); 
		} finally {
			if (pstmt != null) {try { pstmt.close(); } catch (SQLException e) {  e.printStackTrace(); }}
			if (con != null) {try { con.close(); } catch (SQLException e) {  e.printStackTrace(); }}
		}
		
		return result;
	}
	
	public WDto userSelect(WDto dto) {
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
				result = new WDto(rset.getInt("uno"),rset.getString("id"),rset.getString("pass"),rset.getString("name"),rset.getString("birth"),rset.getString("date"),rset.getString("phone"),rset.getString("email"),rset.getString("post"),rset.getString("address"),rset.getString("address_detail"),rset.getInt("rank"),rset.getString("ip"),rset.getString("kakao"));
			} else {
				result = null;
			}
			
		} catch (Exception e) {  e.printStackTrace(); 
		} finally {
			if (rset != null) {try { rset.close(); } catch (SQLException e) {  e.printStackTrace(); }}
			if (pstmt != null) {try { pstmt.close(); } catch (SQLException e) {  e.printStackTrace(); }}
			if (con != null) {try { con.close(); } catch (SQLException e) {  e.printStackTrace(); }}
		}
		
		return result;
	}
	
	public int userPassUpdate(WDto dto) {
		PreparedStatement pstmt = null;
		
		int result = -1;
		String sql = "update wecar_user set pass = ? where uno = ?";
		
		WDBManager db = new WDBManager();
		
		try {
			con = db.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getPass());
			pstmt.setInt(2, dto.getUno());
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {  e.printStackTrace(); 
		} finally {
			if (pstmt != null) {try { pstmt.close(); } catch (SQLException e) {  e.printStackTrace(); }}
			if (con != null) {try { con.close(); } catch (SQLException e) {  e.printStackTrace(); }}
		}
		
		return result;
	}
	
	public int userInfoUpdate(WDto dto) {
		PreparedStatement pstmt = null;
		
		int result = -1;
		String sql = "update wecar_user set phone = ?, post = ?, address = ?, address_detail = ? where uno = ?";
		
		WDBManager db = new WDBManager();
		
		try {
			con = db.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getPhone());
			pstmt.setString(2, dto.getPost());
			pstmt.setString(3, dto.getAddress());
			pstmt.setString(4, dto.getAddress_detail());
			pstmt.setInt(5, dto.getUno());
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {  e.printStackTrace(); 
		} finally {
			if (pstmt != null) {try { pstmt.close(); } catch (SQLException e) {  e.printStackTrace(); }}
			if (con != null) {try { con.close(); } catch (SQLException e) {  e.printStackTrace(); }}
		}
		
		return result;
	}
	
	public int userEmailUpdate(WDto dto) {
		PreparedStatement pstmt = null;
		
		int result = -1;
		String sql = "update wecar_user set email = ? where uno = ?";
		
		WDBManager db = new WDBManager();
		
		try {
			con = db.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getEmail());
			pstmt.setInt(2, dto.getUno());
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {  e.printStackTrace(); 
		} finally {
			if (pstmt != null) {try { pstmt.close(); } catch (SQLException e) {  e.printStackTrace(); }}
			if (con != null) {try { con.close(); } catch (SQLException e) {  e.printStackTrace(); }}
		}
		
		return result;
	}
	
	public int userPassCheck(WDto dto) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		int result = -1;
		String sql = "select * from wecar_user where uno = ? and pass = ?";
		
		WDBManager db = new WDBManager();
		
		try {
			con = db.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, dto.getUno());
			pstmt.setString(2, dto.getPass());
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				result = 1;
			}
			
		} catch (Exception e) {  e.printStackTrace(); 
		} finally {
			if (rset != null) {try { rset.close(); } catch (SQLException e) {  e.printStackTrace(); }}
			if (pstmt != null) {try { pstmt.close(); } catch (SQLException e) {  e.printStackTrace(); }}
			if (con != null) {try { con.close(); } catch (SQLException e) {  e.printStackTrace(); }}
		}
		
		return result;
	}
	
	public int userKakaoUpdate(WDto dto) {
		PreparedStatement pstmt = null;
		
		int result = -1;
		String sql = "update wecar_user set kakao = ? where uno = ?";
		
		WDBManager db = new WDBManager();
		
		try {
			con = db.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getKakao());
			pstmt.setInt(2, dto.getUno());
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {  e.printStackTrace(); 
		} finally {
			if (pstmt != null) {try { pstmt.close(); } catch (SQLException e) {  e.printStackTrace(); }}
			if (con != null) {try { con.close(); } catch (SQLException e) {  e.printStackTrace(); }}
		}
		
		return result;
	}
	
	public WDto kakaoLogin(WDto dto) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		WDto result = null;
		String sql = "select * from wecar_user where kakao = ?";
		
		WDBManager db = new WDBManager();
		
		try {
			con = db.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getKakao());
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				result = new WDto(rset.getInt("uno"),rset.getString("id"));
			}
			
		} catch (Exception e) {  e.printStackTrace(); 
		} finally {
			if (rset != null) {try { rset.close(); } catch (SQLException e) {  e.printStackTrace(); }}
			if (pstmt != null) {try { pstmt.close(); } catch (SQLException e) {  e.printStackTrace(); }}
			if (con != null) {try { con.close(); } catch (SQLException e) {  e.printStackTrace(); }}
		}
		
		return result;
	}
}
