package com.app.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.app.utils.DBConnection;

public class UserDAO {
	
	public boolean authenticateUser(String email,String secrets) {
		Connection con=DBConnection.getDBConnection();
		boolean result=false;
		if(con==null) {
			System.out.println("Unable to create Connection");
			return false;
		}
		Statement st=null;
		ResultSet rd=null;
		String query="select * from admin_user where email_id='"+email+"' and secrets='"+secrets+"';";
		System.out.println(query);
		try {
			st=con.createStatement();
			rd=st.executeQuery(query);
			if(rd.next()) {
				result=true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				con.close();
				st.close();
				rd.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return result;
		
	}

}
