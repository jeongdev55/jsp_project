package home.board;

import java.sql.*;
import java.util.*;
import javax.sql.*;
import javax.naming.*;


public class BoardDataBean {  //DAO
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	
	static DataSource ds;
	static {
		try {
			Context init =new InitialContext();
			ds=(DataSource)init.lookup("java:comp/env/jdbc/oracle");
		}catch(NamingException e) {	
			System.err.println(e.getMessage());
		}
	}

		
	public BoardDataBean() {}
	
	public ArrayList<BoardDBBean> listBoard() throws SQLException{
		String sql = "select * from jsp_board";
		try {
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			ArrayList<BoardDBBean> boardList=makeArrayList(rs);
			return boardList;
		}finally{
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) con.close();
		}	
	}
	
	public ArrayList<BoardDBBean> makeArrayList(ResultSet rs) throws SQLException{
		ArrayList<BoardDBBean> list=new ArrayList<BoardDBBean>();
		while(rs.next()) {
			BoardDBBean dto=new BoardDBBean();
			dto.setNum(rs.getInt("num"));
			dto.setWriter(rs.getString("writer"));
			dto.setEmail(rs.getString("email"));
			dto.setSubject(rs.getString("subject"));
			dto.setPasswd(rs.getString("passwd"));
			dto.setReadcount(rs.getInt("readcount"));
			dto.setReg_date(rs.getString("reg_date"));
			dto.setContent(rs.getString("content"));
			dto.setIp(rs.getString("ip"));
			list.add(dto);
		}
		return list;	
	}
	
	public int insertBoard(BoardDBBean dto) throws SQLException{
		String sql="insert into jsp_board values (jsp_board_num.nextval,?,?,?,?,?,0,?,?)";
		try {
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getWriter());
			ps.setString(2, dto.getEmail());
			ps.setString(3, dto.getSubject());
			ps.setString(4, dto.getPasswd());
			java.util.Date date=new java.util.Date();
			java.text.SimpleDateFormat sdf=new java.text.SimpleDateFormat("yyy-MM-dd");
			ps.setNString(5, sdf.format(date));
			
			ps.setString(6, dto.getContent());
			ps.setString(7, dto.getIp());
			int res = ps.executeUpdate();
			return res;
		}finally {
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
	public BoardDBBean getBoard(String cmd, int num) throws SQLException{
		if(cmd.equals("content")) {
			readCountPlus(num);
		}
		String sql="select * from jsp_board where num=?";
		try {
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			rs=ps.executeQuery();
			ArrayList<BoardDBBean> list=makeArrayList(rs);
			return list.get(0);
		}finally {
			if (ps != null) ps.close();
			if (rs != null) rs.close();
			if (con != null) con.close();
		}
	}
	
	public void readCountPlus(int num) throws SQLException{
		String sql="update jsp_board set readcount=readcount+1 where num=?";
		try {
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1,num);
			int res=ps.executeUpdate();
		}finally {
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}

	public int deleteBoard(int num,String passwd) throws SQLException{
		String sql="select passwd from jsp_board where num=?";
		try {
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1,num);
			rs=ps.executeQuery();
			rs.next();
			String dbpass=rs.getString(1);
			int res=0;
			if(dbpass.equals(passwd)) {
				sql="delete from jsp_board where num=?";
				ps = con.prepareStatement(sql);
				ps.setInt(1,num);
				res=ps.executeUpdate();
			}
			return res;
		}finally {
			if (ps != null) ps.close();
			if (rs != null) rs.close();
			if (con != null) con.close();
		}
	}
	public int updateBoard(BoardDBBean dto) throws SQLException{
		String sql="select passwd from jsp_board where num=?";
		try {
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1,dto.getNum());
			rs=ps.executeQuery();
			rs.next();
			String dbpass=rs.getString(1);
			int res=0;
			if(dbpass.equals(dto.getPasswd())) {
				sql = "update jsp_board set writer=?,subject=?, email=?, content=?, ip=? where num = ?";
				ps = con.prepareStatement(sql);
				ps.setString(1,dto.getWriter());
				ps.setString(2,dto.getSubject());
				ps.setString(3,dto.getEmail());
				ps.setString(4,dto.getContent());
				ps.setString(5,dto.getIp());
				ps.setInt(6,dto.getNum());
				res=ps.executeUpdate();
			}
			return res;
		}finally {
			if (ps != null) ps.close();
			if (rs != null) rs.close();
			if (con != null) con.close();
		}
	}
	
}
