package com.project.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginDao {
	String sql="select *from register where name=? and password=?";
	public boolean check(String name,String password) {
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","system");
			PreparedStatement st=con.prepareStatement(sql);
			st.setString(1,name);
			st.setString(2,password);
			ResultSet rs=st.executeQuery();
			if(rs.next())
			{
				return true;
			}
			con.close();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return false;
		
	}

}
