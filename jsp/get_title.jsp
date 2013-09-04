<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar" %>
<%@ page import= "java.sql.*"%>
<%@ page import= "java.net.*"%>
<%@ page import= "java.io.*"%>
<%@page import="org.json.simple.*"%>
<%

    Class.forName("com.mysql.jdbc.Driver");
    String DB_URL="jdbc:mysql://localhost/car_management";
	String DB_USER="root";
	String DB_PASSWD="logic1234";
	Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWD);
	Statement stmt = conn.createStatement();
	
	String get_str = request.getParameter("type");

	String query = "";
	if(get_str.equals("car")){
		query = "SELECT CAR_NUM FROM car GROUP BY CAR_NUM;";
	}
	else if(get_str.equals("date")){
		query = "SELECT DATE FROM car GROUP BY DATE;";
	}
	ResultSet rs = stmt.executeQuery(query);
	
	//JSONObject obj=new JSONObject();
	
	String result = "";
	while(rs.next()){
		result = result+rs.getString(1)+"/";
	}

	out.print(result);
	out.flush();
%>