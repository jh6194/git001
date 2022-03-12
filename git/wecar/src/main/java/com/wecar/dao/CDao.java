package com.wecar.dao;

import java.net.InetAddress;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.wecar.dbmanager.WDBManager;
import com.wecar.dto.AjaxDto;
import com.wecar.dto.CDto;
import com.wecar.dto.COPDto;
import com.wecar.dto.CRVDto;
import com.wecar.dto.RDto;

public class CDao {
	private static Connection con;
	private SimpleDateFormat sdf;
	private String current_date;
	
	public CDao() { sdf = new SimpleDateFormat("yyyy-MM-dd"); current_date = sdf.format(System.currentTimeMillis()); }
	
	public List<Object> carList() {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		List<Object> list = new ArrayList<>();
		
		String sql = "select c.cno, c.model, c.vehicle_year, c.cprice, c.cdate, b.brname, t.tname, f.fname, l.lname "
				+ "from wecar_car as c "
				+ "left join car_brand as b "
				+ "on c.brand = b.brand "
				+ "left join car_type as t "
				+ "on c.type = t.type "
				+ "left join car_fuel as f "
				+ "on c.fuel = f.fuel "
				+ "left join car_location as l "
				+ "on c.lno = l.lno "
				+ "order by c.cdate desc";
		
		WDBManager db = new WDBManager();
		
		try {
			con = db.getCon();
			pstmt = con.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				String date = rset.getString("cdate");
				String cdate = rset.getString("cdate").substring(0, 10);
				
				if (current_date.equals(cdate)) {
					cdate = date.substring(0, date.length()-2);
				}
				
				Map<String,String> map = new HashMap<>();
				map.put("cno", rset.getString("cno"));
				map.put("model", rset.getString("model"));
				map.put("vehicle_year", rset.getString("vehicle_year"));
				map.put("cprice", rset.getString("cprice"));
				map.put("cdate", cdate);
				map.put("brname", rset.getString("brname"));
				map.put("tname", rset.getString("tname"));
				map.put("fname", rset.getString("fname"));
				map.put("lname", rset.getString("lname"));
				list.add(map);
			}
			
		} catch (Exception e) {  e.printStackTrace(); 
		} finally {
			if (rset != null) {try { rset.close(); } catch (SQLException e) {  e.printStackTrace(); }}
			if (pstmt != null) {try { pstmt.close(); } catch (SQLException e) {  e.printStackTrace(); }}
			if (con != null) {try { con.close(); } catch (SQLException e) {  e.printStackTrace(); }}
		}
		
		return list;
	}
	
	public int carInsert(CDto dto) {
		PreparedStatement pstmt = null;
		
		int result = -1;
		String sql = "insert into wecar_car (cno, brand, model, type, personnel, vehicle_year, fuel, lno, cprice, cimg, cip) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		WDBManager db = new WDBManager();
		
		try {
			con = db.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getCno());
			pstmt.setString(2, dto.getBrand());
			pstmt.setString(3, dto.getModel());
			pstmt.setString(4, dto.getType());
			pstmt.setString(5, dto.getPersonnel());
			pstmt.setString(6, dto.getVehicle_year());
			pstmt.setString(7, dto.getFuel());
			pstmt.setString(8, dto.getLno());
			pstmt.setInt(9, dto.getCprice());
			pstmt.setString(10, dto.getCimg());
			pstmt.setString(11, InetAddress.getLocalHost().getHostAddress());
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {  e.printStackTrace(); 
		} finally {
			if (pstmt != null) {try { pstmt.close(); } catch (SQLException e) {  e.printStackTrace(); }}
			if (con != null) {try { con.close(); } catch (SQLException e) {  e.printStackTrace(); }}
		}
		
		return result;
	}
	
	public int optionInsert(COPDto dto) {
		PreparedStatement pstmt = null;
		
		int result = -1;
		String sql = "insert into car_option (smoking, navigation, smart, rear, bluetooth, cno) values (?, ?, ?, ?, ?, ?)";
		
		WDBManager db = new WDBManager();

		try {
			con = db.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setBoolean(1, dto.isSmoking());
			pstmt.setBoolean(2, dto.isNavigation());
			pstmt.setBoolean(3, dto.isSmart());
			pstmt.setBoolean(4, dto.isRear());
			pstmt.setBoolean(5, dto.isBluetooth());
			pstmt.setString(6, dto.getCno());
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {  e.printStackTrace(); 
		} finally {
			if (pstmt != null) {try { pstmt.close(); } catch (SQLException e) {  e.printStackTrace(); }}
			if (con != null) {try { con.close(); } catch (SQLException e) {  e.printStackTrace(); }}
		}
		
		return result;
	}
	
	public List<Object> carSelect(CDto dto) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		List<Object> list = new ArrayList<>();
		
		String sql = "select c.cno, c.model, c.vehicle_year, c.personnel, c.cprice, c.cimg, c.cdate, c.cip, "
				+ "b.brand, "
				+ "t.type, "
				+ "f.fuel, "
				+ "l.lno, l.lname, l.laddress, l.laddress_detail, l.lat, l.log, "
				+ "r.state "
				+ "from wecar_car as c "
				+ "left join car_brand as b "
				+ "on c.brand = b.brand "
				+ "left join car_type as t "
				+ "on c.type = t.type "
				+ "left join car_fuel as f "
				+ "on c.fuel = f.fuel "
				+ "left join car_location as l "
				+ "on c.lno = l.lno "
				+ "left join reservation as r "
				+ "on c.cno = r.cno "
				+ "where c.cno = ?";
		
		WDBManager db = new WDBManager();
		
		try {
			con = db.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getCno());
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				Map<String,String> map = new HashMap<>();
				map.put("cno", rset.getString("cno"));
				map.put("model", rset.getString("model"));
				map.put("vehicle_year", rset.getString("vehicle_year"));
				map.put("personnel", rset.getString("personnel"));
				map.put("cprice", rset.getString("cprice"));
				map.put("cimg", rset.getString("cimg")); 
				map.put("cdate", rset.getString("cdate")); 
				map.put("cip", rset.getString("cip")); 
				map.put("brand", rset.getString("brand"));
				map.put("type", rset.getString("type"));
				map.put("fuel", rset.getString("fuel"));
				map.put("lno", rset.getString("lno"));
				map.put("lname", rset.getString("lname"));
				map.put("laddress", rset.getString("laddress"));
				map.put("laddress_detail", rset.getString("laddress_detail"));
				map.put("lat", rset.getString("lat"));
				map.put("log", rset.getString("log"));
				map.put("state", rset.getString("state"));
				list.add(map);
			}
			
		} catch (Exception e) {  e.printStackTrace(); 
		} finally {
			if (rset != null) {try { rset.close(); } catch (SQLException e) {  e.printStackTrace(); }}
			if (pstmt != null) {try { pstmt.close(); } catch (SQLException e) {  e.printStackTrace(); }}
			if (con != null) {try { con.close(); } catch (SQLException e) {  e.printStackTrace(); }}
		}
		
		return list;
	}
	
	public COPDto optionSelect(COPDto dto) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		COPDto result = null;
		String sql = "select * from car_option where cno = ?";
		
		WDBManager db = new WDBManager();

		try {
			con = db.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getCno());
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				result = new COPDto(rset.getBoolean("smoking"),rset.getBoolean("navigation"),rset.getBoolean("smart"),rset.getBoolean("rear"),rset.getBoolean("bluetooth"),rset.getString("cno"));
			}
			
		} catch (Exception e) {  e.printStackTrace(); 
		} finally {
			if (rset != null) {try { rset.close(); } catch (SQLException e) {  e.printStackTrace(); }}
			if (pstmt != null) {try { pstmt.close(); } catch (SQLException e) {  e.printStackTrace(); }}
			if (con != null) {try { con.close(); } catch (SQLException e) {  e.printStackTrace(); }}
		}
		
		return result;
	}
	
	public String imgSelect(String cno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String result = null;
		String sql = "select cimg from wecar_car where cno = ?";
		
		WDBManager db = new WDBManager();
	
		try {
			con = db.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, cno);
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				result = rset.getString("cimg");
			}
			
		} catch (Exception e) {  e.printStackTrace(); 
		} finally {
			if (rset != null) {try { rset.close(); } catch (SQLException e) {  e.printStackTrace(); }}
			if (pstmt != null) {try { pstmt.close(); } catch (SQLException e) {  e.printStackTrace(); }}
			if (con != null) {try { con.close(); } catch (SQLException e) {  e.printStackTrace(); }}
		}
		
		return result;
	}
	
	public int carUpdate(CDto dto) {
		PreparedStatement pstmt = null;
		int result = -1;
		String sql = "update wecar_car set brand = ?, model = ?, type = ?, personnel = ?, vehicle_year = ?, fuel = ?, lno = ?, cprice = ?, cimg = ?, cip = ?, cdate = current_timestamp where cno = ?";
		
		WDBManager db = new WDBManager();
		
		try {
			con = db.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getBrand());
			pstmt.setString(2, dto.getModel());
			pstmt.setString(3, dto.getType());
			pstmt.setString(4, dto.getPersonnel());
			pstmt.setString(5, dto.getVehicle_year());
			pstmt.setString(6, dto.getFuel());
			pstmt.setString(7, dto.getLno());
			pstmt.setInt(8, dto.getCprice());
			pstmt.setString(9, dto.getCimg());
			pstmt.setString(10, InetAddress.getLocalHost().getHostAddress());
			pstmt.setString(11, dto.getCno());
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {  e.printStackTrace(); 
		} finally {
			if (pstmt != null) {try { pstmt.close(); } catch (SQLException e) {  e.printStackTrace(); }}
			if (con != null) {try { con.close(); } catch (SQLException e) {  e.printStackTrace(); }}
		}
		
		return result;
	}
	
	public int optionUpdate(COPDto dto) {
		PreparedStatement pstmt = null;
		int result = -1;
		String sql = "update car_option set smoking = ?, navigation = ?, smart = ?, rear = ?, bluetooth = ? where cno = ?";
		
		WDBManager db = new WDBManager();
		
		try {
			con = db.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setBoolean(1, dto.isSmoking());
			pstmt.setBoolean(2, dto.isNavigation());
			pstmt.setBoolean(3, dto.isSmart());
			pstmt.setBoolean(4, dto.isRear());
			pstmt.setBoolean(5, dto.isBluetooth());
			pstmt.setString(6, dto.getCno());
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {  e.printStackTrace(); 
		} finally {
			if (pstmt != null) {try { pstmt.close(); } catch (SQLException e) {  e.printStackTrace(); }}
			if (con != null) {try { con.close(); } catch (SQLException e) {  e.printStackTrace(); }}
		}
		
		return result;
	}
	
	public int optionDelete(COPDto dto) {
		PreparedStatement pstmt = null;
		int result = -1;
		String sql = "delete from car_option where cno = ?";
		
		WDBManager db = new WDBManager();
		
		try {
			con = db.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getCno());
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {  e.printStackTrace(); 
		} finally {
			if (pstmt != null) {try { pstmt.close(); } catch (SQLException e) {  e.printStackTrace(); }}
			if (con != null) {try { con.close(); } catch (SQLException e) {  e.printStackTrace(); }}
		}
		
		return result;
	}
	
	public int carDelete(CDto dto) {
		PreparedStatement pstmt = null;
		int result = -1;
		String sql = "delete from wecar_car where cno = ?";
		
		WDBManager db = new WDBManager();
		
		try {
			con = db.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getCno());
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {  e.printStackTrace(); 
		} finally {
			if (pstmt != null) {try { pstmt.close(); } catch (SQLException e) {  e.printStackTrace(); }}
			if (con != null) {try { con.close(); } catch (SQLException e) {  e.printStackTrace(); }}
		}
		
		return result;
	}
	
	public List<Object> searchDetail(CDto cdto, RDto rdto) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		List<Object> list = new ArrayList<>();
		
		String sql = "select c.cno, c.model, c.cimg, c.cprice, "
				+ "l.lno, l.lname, l.laddress, l.laddress_detail, l.lat, l.log "
				+ "from wecar_car as c "
				+ "left join car_location as l "
				+ "on c.lno = l.lno "
				+ "where c.cno = ?";
		
		WDBManager db = new WDBManager();
		
		try {
			con = db.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, cdto.getCno());
			rset = pstmt.executeQuery();
			if (rset.next()) {
				Date pdate = sdf.parse(rdto.getPdate());
				Date rdate = sdf.parse(rdto.getRdate());
			    long diffSec = (rdate.getTime() - pdate.getTime()) / 1000; //초 차이
			    long diffDays = diffSec / (24*60*60); //일자수 차이
				int cprice = rset.getInt("cprice") * (int)diffDays;
				
				DecimalFormat decFormat = new DecimalFormat("###,###");
				String strprice = decFormat.format(cprice);

				Map<String,Object> map = new HashMap<>();
				map.put("cno", rset.getString("cno"));
				map.put("model", rset.getString("model"));
				map.put("cprice", cprice);
				map.put("price", strprice);
				map.put("cimg", rset.getString("cimg"));
				map.put("lno", rset.getString("lno"));
				map.put("lname", rset.getString("lname"));
				map.put("laddress", rset.getString("laddress"));
				map.put("laddress_detail", rset.getString("laddress_detail"));
				map.put("lat", rset.getString("lat"));
				map.put("log", rset.getString("log"));
				list.add(map);
			}
			
		} catch (Exception e) {  e.printStackTrace(); 
		} finally {
			if (rset != null) {try { rset.close(); } catch (SQLException e) {  e.printStackTrace(); }}
			if (pstmt != null) {try { pstmt.close(); } catch (SQLException e) {  e.printStackTrace(); }}
			if (con != null) {try { con.close(); } catch (SQLException e) {  e.printStackTrace(); }}
		}
		
		return list;
	}
	
	public ArrayList<CRVDto> reviewList(CRVDto dto) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<CRVDto> list = new ArrayList<>();
		
		String sql = "select sno, star, sname, scontent, sfile, DATE_FORMAT(sdate,'%Y-%m-%d') as sdate, sip  from review where cno = ?";
		
		WDBManager db = new WDBManager();
		
		try {
			con = db.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getCno());
			rset = pstmt.executeQuery();
			while (rset.next()) {
				list.add(new CRVDto(rset.getInt("sno"), rset.getInt("star"), rset.getString("sname"), rset.getString("scontent"), rset.getString("sfile"), rset.getString("sdate"), rset.getString("sip")));
			}
			
		} catch (Exception e) {  e.printStackTrace(); 
		} finally {
			if (rset != null) {try { rset.close(); } catch (SQLException e) {  e.printStackTrace(); }}
			if (pstmt != null) {try { pstmt.close(); } catch (SQLException e) {  e.printStackTrace(); }}
			if (con != null) {try { con.close(); } catch (SQLException e) {  e.printStackTrace(); }}
		}
		
		return list;
	}
	
	public ArrayList<String> priceSelect(int insu, int cprice) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String result = "";
		int price = 0;
		ArrayList<String> list = new ArrayList<>();
		
		String sql = "select iprice from insurance where insu = ?";
		
		WDBManager db = new WDBManager();
		
		try {
			con = db.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, insu);
			rset = pstmt.executeQuery();
			if (rset.next()) {
				price = rset.getInt("iprice");
			}
			price += cprice;
			DecimalFormat decFormat = new DecimalFormat("###,###");
			String str = decFormat.format(price);
			result += str + "원";
			
			list.add(result);
			list.add(Integer.toString(price));
			
		} catch (Exception e) {  e.printStackTrace(); 
		} finally {
			if (rset != null) {try { rset.close(); } catch (SQLException e) {  e.printStackTrace(); }}
			if (pstmt != null) {try { pstmt.close(); } catch (SQLException e) {  e.printStackTrace(); }}
			if (con != null) {try { con.close(); } catch (SQLException e) {  e.printStackTrace(); }}
		}
		
		return list;
	}
	
	public String changeSql(String str) {
		String result = "and";
		if (str == "") {
			result = "and not";
		}
		return result;
	}
	
	public ArrayList<AjaxDto> searchAjax(RDto rdto, CDto cdto, String price_start, String price_end) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<AjaxDto> list = new ArrayList<>();
		
		String sql = "SELECT DISTINCT c.cno, c.model, c.personnel, c.vehicle_year, c.cprice, c.cimg, "
				+ "f.fname, "
				+ "b.brname, "
				+ "t.tname, "
				+ "l.lname, l.laddress, l.laddress_detail, l.lat, l.log, "
				+ "o.smoking, o.navigation, o.smart, o.rear, o.bluetooth, "
				+ "(SELECT COUNT(*) from review WHERE cno = c.cno) AS cnt "
				+ "FROM wecar_car AS c "
				+ "LEFT JOIN car_fuel AS f "
				+ "USING(fuel) "
				+ "LEFT JOIN car_brand AS b "
				+ "USING(brand) "
				+ "LEFT JOIN car_type AS t "
				+ "USING(type) "
				+ "LEFT JOIN car_location AS l "
				+ "USING(lno) "
				+ "LEFT JOIN car_option AS o "
				+ "USING(cno) "
				+ "LEFT JOIN reservation AS r "
				+ "USING(cno) "
				+ "LEFT JOIN review AS s "
				+ "USING(cno) "
				+ "WHERE c.cno NOT IN (SELECT cno FROM reservation WHERE pdate BETWEEN ? AND ? or rdate BETWEEN ? AND ?) "
				+ "AND (true "+changeSql(cdto.getBrand())+" c.brand = ? "+changeSql(cdto.getModel())+" c.model like ? "+changeSql(cdto.getFuel())+" c.fuel = ? "+changeSql(cdto.getType())+" c.type = ? "+changeSql(cdto.getPersonnel())+" c.personnel = ? "+changeSql(cdto.getVehicle_year())+" c.vehicle_year = ? "+changeSql(cdto.getLno())+" c.lno = ? "+changeSql(price_end)+" c.cprice between ? and ?)";
		
		WDBManager db = new WDBManager();
		
		String getmodel = cdto.getModel();
		if (getmodel != "") {
			getmodel = "%"+getmodel+"%";
		}
		
		try {
			con = db.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, rdto.getPdate());
			pstmt.setString(2, rdto.getRdate());
			pstmt.setString(3, rdto.getPdate());
			pstmt.setString(4, rdto.getRdate());
			pstmt.setString(5, cdto.getBrand());
			pstmt.setString(6, getmodel);
			pstmt.setString(7, cdto.getFuel());
			pstmt.setString(8, cdto.getType());
			pstmt.setString(9, cdto.getPersonnel());
			pstmt.setString(10, cdto.getVehicle_year());
			pstmt.setString(11, cdto.getLno());
			pstmt.setString(12, price_start);
			pstmt.setString(13, price_end);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				StringBuffer str = new StringBuffer(rset.getString("cprice"));
				String cno = rset.getString("cno");
				String model = rset.getString("model");
				String personnel = rset.getString("personnel");
				String vehicle_year = rset.getString("vehicle_year");
				String cprice = str.insert(str.length()-3, ",") + "원";
				String cimg = rset.getString("cimg");
				String tname = rset.getString("tname");
				String fname = rset.getString("fname");
				String brname = rset.getString("brname");
				String lname = rset.getString("lname");
				Boolean smoking = rset.getBoolean("smoking");
				Boolean navigation = rset.getBoolean("navigation");
				Boolean smart = rset.getBoolean("smart");
				Boolean rear = rset.getBoolean("rear");
				Boolean bluetooth = rset.getBoolean("bluetooth");
				String cnt = rset.getString("cnt");

				list.add(new AjaxDto(cno, model, personnel, vehicle_year, cprice, cimg, tname, fname, brname, lname, smoking, navigation, smart, rear, bluetooth, cnt));
			}
					
		} catch (Exception e) {  e.printStackTrace(); 
		} finally {
			if (rset != null) {try { rset.close(); } catch (SQLException e) {  e.printStackTrace(); }}
			if (pstmt != null) {try { pstmt.close(); } catch (SQLException e) {  e.printStackTrace(); }}
			if (con != null) {try { con.close(); } catch (SQLException e) {  e.printStackTrace(); }}
		}
		
		return list;
	}
	
	public String searchAvgAjax(String cno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = "select floor(avg(star)) as star from review where cno = ?";
		String result = "0";
		
		WDBManager db = new WDBManager();
			
		try {
			con = db.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, cno);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				if (!rset.getString("star").equals(null)) {
					result = rset.getString("star");
				}
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
