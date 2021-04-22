package model;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import utility.DBUtil;

public class RoomDAO {
	
	public List<RoomVO> selectAll(){
		List<RoomVO> roomlist=new ArrayList<RoomVO>();
		Connection conn=DBUtil.getConnection();
		Statement st=null;
		ResultSet rs=null;
		String sql="select * from room";
		try {
			st=conn.createStatement();
			rs=st.executeQuery(sql);
			while(rs.next()) {
				roomlist.add(makeRoom(rs));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.dbClose(rs, st, conn);
		}
		return roomlist;
	}
	public List<RoomVO> selectByLocation(String adress){
		List<RoomVO> roomlist=new ArrayList<RoomVO>();
		Connection conn=DBUtil.getConnection();
		PreparedStatement st=null;
		ResultSet rs=null;
		String sql="select * from room where room_location=?";
		try {
			st=conn.prepareStatement(sql);
			st.setString(1,adress);
			rs=st.executeQuery();
			while(rs.next()) {
				roomlist.add(makeRoom(rs));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.dbClose(rs, st, conn);
		}
		return roomlist;
	}
	public RoomVO selectByRoomId(int room_id){
		RoomVO roomlist=new RoomVO();
		Connection conn=DBUtil.getConnection();
		PreparedStatement st=null;
		ResultSet rs=null;
		String sql="select * from room where room_id=?";
		try {
			st=conn.prepareStatement(sql);
			st.setInt(1,room_id );
			rs=st.executeQuery();
			while(rs.next()) {
				roomlist=makeRoom(rs);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.dbClose(rs, st, conn);
		}
		return roomlist;
	}
	public List<RoomVO> selectByAdress(String adress){
		List<RoomVO> roomlist=new ArrayList<RoomVO>();
		Connection conn=DBUtil.getConnection();
		PreparedStatement st=null;
		ResultSet rs=null;
		String sql="select * from room where adress=%?%";
		try {
			st=conn.prepareStatement(sql);
			st.setString(1,adress );
			rs=st.executeQuery();
			while(rs.next()) {
				roomlist.add(makeRoom(rs));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.dbClose(rs, st, conn);
		}
		return roomlist;
	}

	
	
	private RoomVO makeRoom(ResultSet rs) throws SQLException {
		RoomVO room=new RoomVO();
		room.setRoom_id(rs.getInt("room_id"));
		room.setAdress(rs.getString("adress"));
		room.setImg(rs.getString("img"));
		room.setMapx(rs.getDouble("mapx"));
		room.setMapy(rs.getDouble("mapy"));
		room.setPhone(rs.getString("phone"));
		room.setRoom_cancel(rs.getInt("room_cancel"));
		room.setRoom_end(rs.getString("room_end"));
		room.setRoom_start(rs.getString("room_start"));
		room.setRoom_location(rs.getString("room_location"));
		room.setRoom_state(rs.getString("room_state"));
		
		
		
		return room;
	}
	public int insertRoom(RoomVO roomid) {
		String sql = " insert into room values(?,?,?,?,?,?,?,?,?,?,?)";
		Connection conn;
		PreparedStatement st = null;
		int room = 0;
		conn = DBUtil.getConnection();
		try {
			st = conn.prepareStatement(sql);
			st.setInt(1, roomid.getRoom_id());
			st.setString(2, roomid.getRoom_state());
			st.setString(3, roomid.getAdress());
			st.setDouble(4, roomid.getMapx());
			st.setDouble(5, roomid.getMapy());
			st.setString(6,roomid.getRoom_location() );
			st.setString(7, roomid.getImg());
			st.setString(8, roomid.getPhone());
			st.setString(9,  roomid.getRoom_start());
			st.setString(10, roomid.getRoom_end());
			st.setInt(11, roomid.getRoom_cancel());
			room = st.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		} finally {
			DBUtil.dbClose(null, st, conn);

		}
		
		
		
		return room;
	}
	public int updateRoom(RoomVO roomid) {
		String sql = " update room set room_state=?,adress=?,mapx=?,"
				+ " mapy=?,room_location=?,img=?,phone=?,room_start=?,room_end=?"
				+ " room_cancel=? where room_id=? ";
		Connection conn;
		PreparedStatement st = null;
		int room = 0;
		conn = DBUtil.getConnection();
		try {
			st = conn.prepareStatement(sql);
			st.setInt(11, roomid.getRoom_id());
			st.setString(1, roomid.getRoom_state());
			st.setString(2, roomid.getAdress());
			st.setDouble(3, roomid.getMapx());
			st.setDouble(4, roomid.getMapy());
			st.setString(5,roomid.getRoom_location() );
			st.setString(6, roomid.getImg());
			st.setString(7, roomid.getPhone());
			st.setString(8,  roomid.getRoom_start());
			st.setString(9,  roomid.getRoom_end());
			st.setInt(10, roomid.getRoom_cancel());
			room = st.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		} finally {
			DBUtil.dbClose(null, st, conn);
			
		}
		
		
		
		return room;
	}

	public int deleteRoom(int emp) {
		String sql = "delete from room     "+ "where room_id=?";
		Connection conn;
		PreparedStatement st = null;
		int result = 0;
		conn=DBUtil.getConnection();
		try {
			st=conn.prepareStatement(sql);
			st.setInt(1, emp);
			result=st.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.dbClose(null, st, conn);
		
		}
		return result;
	}
	
}
