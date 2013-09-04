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
	
	String type_str = request.getParameter("type");
	String title_str = request.getParameter("title");
	
//	out.print(title_str);
//	out.print(type_str);

	String query = "";
	if(type_str.equals("car")){
		query = "SELECT IMG_NAME FROM car WHERE CAR_NUM='"+title_str+"';";
	}
	else if(type_str.equals("date")){
		query = "SELECT IMG_NAME FROM car WHERE DATE='"+title_str+"';";
	}
	ResultSet rs = stmt.executeQuery(query);

	String result = "";
	while(rs.next()){
		result = result+rs.getString(1)+"/";
	}

	out.print(result);
	out.flush();

%>