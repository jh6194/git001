package com.wecar.dao;

import java.net.InetAddress;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.wecar.dbmanager.WDBManager;
import com.wecar.dto.AllDto;
import com.wecar.dto.RDto;
import com.wecar.dto.WDto;

public class RDao {
	private static Connection con;
	
	public int reserveInsert(RDto dto) {
		PreparedStatement pstmt = null;
		
		int result = -1;
		String sql = "insert into reservation (rprice, pdate, rdate, rip, cno, uno, insu) values (?,?,?,?,?,?,?)";
		
		WDBManager db = new WDBManager();
		
		try {
			con = db.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, dto.getRprice());
			pstmt.setString(2, dto.getPdate());
			pstmt.setString(3, dto.getRdate());
			pstmt.setString(4, InetAddress.getLocalHost().getHostAddress());
			pstmt.setString(5, dto.getCno());
			pstmt.setInt(6, dto.getUno());
			pstmt.setString(7, dto.getInsu());
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {  e.printStackTrace(); 
		} finally {
			if (pstmt != null) {try { pstmt.close(); } catch (SQLException e) {  e.printStackTrace(); }}
			if (con != null) {try { con.close(); } catch (SQLException e) {  e.printStackTrace(); }}
		}
		
		return result;
	}
	
	public int rnoSelect(RDto dto) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		int rno = -1;
		String sql = "select rno from reservation where uno = ? order by rno desc limit 1";
		
		WDBManager db = new WDBManager();
		
		try {
			con = db.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, dto.getUno());
			rset = pstmt.executeQuery();
			if (rset.next()) {
				rno = rset.getInt("rno");
			}
			
		} catch (Exception e) {  e.printStackTrace(); 
		} finally {
			if (pstmt != null) {try { pstmt.close(); } catch (SQLException e) {  e.printStackTrace(); }}
			if (con != null) {try { con.close(); } catch (SQLException e) {  e.printStackTrace(); }}
		}
		
		return rno;
	}
	
	public HashMap<String,Object> reserveSelect(int rno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		HashMap<String,Object> map = new HashMap<>();
		
		String sql = "select r.rprice, r.pdate, r.rdate, r.state, r.date, r.rip, "
				+ "u.name, u.birth, u.phone, u.email, "
				+ "c.cno, c.model, c.personnel, c.vehicle_year, "
				+ "f.fname, "
				+ "b.brname, "
				+ "t.tname, "
				+ "o.smoking, o.navigation, o.smart, o.rear, o.bluetooth, "
				+ "i.insuname, "
				+ "l.lname, l.laddress, l.laddress_detail, l.lat, l.log "
				+ "from reservation as r "
				+ "left join wecar_user as u "
				+ "on r.uno = u.uno "
				+ "left join wecar_car as c "
				+ "on r.cno = c.cno "
				+ "left join car_fuel as f "
				+ "on c.fuel = f.fuel "
				+ "left join car_brand as b "
				+ "on c.brand = b.brand "
				+ "left join car_type as t "
				+ "on c.type = t.type "
				+ "left join car_option as o "
				+ "on c.cno = o.cno "
				+ "left join insurance as i "
				+ "on r.insu = i.insu "
				+ "left join car_location as l "
				+ "on c.lno = l.lno "
				+ "where rno = ?";
		
		WDBManager db = new WDBManager();
		
		try {
			con = db.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, rno);
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				DecimalFormat decFormat = new DecimalFormat("###,###");
				String str = decFormat.format(rset.getInt("rprice"));
				map.put("rno", rno);
				map.put("rprice", str + "원");
				map.put("pdate", rset.getString("pdate"));
				map.put("rdate", rset.getString("rdate"));
				map.put("state", rset.getInt("state"));
				map.put("date", rset.getString("date"));
				map.put("rip", rset.getString("rip"));
				map.put("name", rset.getString("name"));
				map.put("birth", rset.getString("birth"));
				map.put("phone", rset.getString("phone"));
				map.put("email", rset.getString("email")); 
				map.put("cno", rset.getString("cno")); 
				map.put("model", rset.getString("model")); 
				map.put("personnel", rset.getString("personnel"));
				map.put("vehicle_year", rset.getString("vehicle_year"));
				map.put("fname", rset.getString("fname"));
				map.put("brname", rset.getString("brname"));
				map.put("tname", rset.getString("tname"));
				map.put("smoking", rset.getString("smoking"));
				map.put("navigation", rset.getString("navigation"));
				map.put("smart", rset.getString("smart"));
				map.put("rear", rset.getString("rear"));
				map.put("bluetooth", rset.getString("bluetooth"));
				map.put("insuname", rset.getString("insuname"));
				map.put("lname", rset.getString("lname"));
				map.put("laddress", rset.getString("laddress"));
				map.put("laddress_detail", rset.getString("laddress_detail"));
				map.put("lat", rset.getString("lat"));
				map.put("log", rset.getString("log"));
			}
			
		} catch (Exception e) {  e.printStackTrace(); 
		} finally {
			if (rset != null) {try { rset.close(); } catch (SQLException e) {  e.printStackTrace(); }}
			if (pstmt != null) {try { pstmt.close(); } catch (SQLException e) {  e.printStackTrace(); }}
			if (con != null) {try { con.close(); } catch (SQLException e) {  e.printStackTrace(); }}
		}
		
		return map;
	}
	
	public List<AllDto> reserveList(int uno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		List<AllDto> list = new ArrayList<>();
		
		String where = "WHERE uno = ? ";
		if (uno == 1) {
			where = "WHERE uno != ? ";
		}
		
		String sql = "SELECT r.rno, r.rprice, r.pdate, r.rdate, r.state, "
				+ "c.model, "
				+ "l.lname "
				+ "FROM reservation AS r "
				+ "LEFT JOIN wecar_car AS c "
				+ "USING(cno) "
				+ "LEFT JOIN car_location AS l "
				+ "USING(lno) "
				+ where
				+ "ORDER BY rno DESC ";
		
		WDBManager db = new WDBManager();
		
		try {
			con = db.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, uno);
			rset = pstmt.executeQuery();
			
			while (rset.next()) {
				StringBuffer str = new StringBuffer(rset.getString("rprice"));
				String rprice = String.valueOf(str.insert(str.length()-3, ","));
				list.add(new AllDto (rset.getInt("rno"),rprice,rset.getString("pdate"),rset.getString("rdate"),rset.getInt("state"),rset.getString("model"),rset.getString("lname")));
			}
			
		} catch (Exception e) {  e.printStackTrace(); 
		} finally {
			if (rset != null) {try { rset.close(); } catch (SQLException e) {  e.printStackTrace(); }}
			if (pstmt != null) {try { pstmt.close(); } catch (SQLException e) {  e.printStackTrace(); }}
			if (con != null) {try { con.close(); } catch (SQLException e) {  e.printStackTrace(); }}
		}
		
		return list;
	}
	
	public int reserveDelete(int rno) {
		PreparedStatement pstmt = null;
		
		int result = -1;
		String sql = "delete from reservation where rno = ?";
		
		WDBManager db = new WDBManager();
		
		try {
			con = db.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, rno);
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {  e.printStackTrace(); 
		} finally {
			if (pstmt != null) {try { pstmt.close(); } catch (SQLException e) {  e.printStackTrace(); }}
			if (con != null) {try { con.close(); } catch (SQLException e) {  e.printStackTrace(); }}
		}
		
		return result;
	}
	
	public int reserveUpdate(int rno, int state) {
		PreparedStatement pstmt = null;
		
		int result = -1;
		String sql = "update reservation set state = ? where rno = ?";
		
		WDBManager db = new WDBManager();
		
		try {
			con = db.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, state);
			pstmt.setInt(2, rno);
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {  e.printStackTrace(); 
		} finally {
			if (pstmt != null) {try { pstmt.close(); } catch (SQLException e) {  e.printStackTrace(); }}
			if (con != null) {try { con.close(); } catch (SQLException e) {  e.printStackTrace(); }}
		}
		
		return result;
	}
	
	public List<RDto> userReserveList(WDto dto) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		List<RDto> list = new ArrayList<>();
		String sql = "select rno, pdate, rdate, rprice, state from reservation where uno = ? order by rno desc limit 4";
		
		WDBManager db = new WDBManager();
		
		try {
			con = db.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, dto.getUno());
			rset = pstmt.executeQuery();
			while (rset.next()) {
				list.add(new RDto(rset.getInt("rno"),rset.getInt("rprice"),rset.getInt("state"),rset.getString("pdate"),rset.getString("rdate")));
			}
			
		} catch (Exception e) {  e.printStackTrace(); 
		} finally {
			if (pstmt != null) {try { pstmt.close(); } catch (SQLException e) {  e.printStackTrace(); }}
			if (con != null) {try { con.close(); } catch (SQLException e) {  e.printStackTrace(); }}
		}
		
		return list;
	}
	
	public int check(String cno, String pdate, String rdate) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		int result = -1;
		String sql = "select count(rno) as cnt from reservation where cno = ? and pdate between ? and ? and rdate between ? and ?";
		
		WDBManager db = new WDBManager();
		
		try {
			con = db.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, cno);
			pstmt.setString(2, pdate);
			pstmt.setString(3, rdate);
			pstmt.setString(4, pdate);
			pstmt.setString(5, rdate);
			rset = pstmt.executeQuery();
			if (rset.next()) {
				result = rset.getInt("cnt");
			}
			
		} catch (Exception e) {  e.printStackTrace(); 
		} finally {
			if (pstmt != null) {try { pstmt.close(); } catch (SQLException e) {  e.printStackTrace(); }}
			if (con != null) {try { con.close(); } catch (SQLException e) {  e.printStackTrace(); }}
		}
		
		return result;
	}
}
