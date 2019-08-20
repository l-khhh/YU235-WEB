import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


class DAO {
	public Connection getConn() {
		Connection conn = null;
		try {
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:TestDB", "system", "tiger");
		} catch (SQLException sqle) {
			System.err.println("oracleSQLException : " + sqle);
		}
		return conn;
	}
	
	boolean insertItem(DO a) {
		try {
			Connection conn = getConn();
			Statement stmt = conn.createStatement();
			stmt.executeQuery("insert into cleaning (id,name,hori,vert) values(seq1.nextval, '" + a.getName() + "', '" + a.getHori()
					+ "', '" + a.getVert() + "')");
			conn.close();
		} catch (SQLException e) {
			
			
			
			
			e.printStackTrace();
		}
		return true;
	}

	boolean deleteItem(DO a) {
		try {
			Connection conn = getConn();
			Statement stmt = conn.createStatement();
			ResultSet rset = stmt.executeQuery("delete from cleaning where id =" + a.getId());
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return true;
	}

	boolean updateItem(DO a) {
		try {
			Connection conn = getConn();
			Statement stmt = conn.createStatement();
			ResultSet rset = stmt.executeQuery(" update cleaning set name='" + a.getName() + "', hori='" + a.getHori()
					+ "', vert='" + a.getVert() + "' where id=" + a.getId());
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return true;
	}

	boolean startItem(DO a) {
		try {
			Connection conn = getConn();
			Statement stmt = conn.createStatement();
			ResultSet rset = stmt.executeQuery(" update cleaning set onoff='" + a.getOnoff() + "' where id=" + a.getId());
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return true;
	}
	
	boolean reserveItem(DO a) {
		try {
			Connection conn = getConn();
			Statement stmt = conn.createStatement();
			ResultSet rset = stmt.executeQuery(" update cleaning set reservation='" + a.getReservation() + "' where id=" + a.getId());
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return true;
	}
}