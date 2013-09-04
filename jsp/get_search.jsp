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
	
	String search = request.getParameter("search");
	
//	out.print(search);
//	out.print(type_str);

	String query = "";

	query = "SELECT CAR_NUM FROM car WHERE CAR_NUM='"+search+"';";

	ResultSet rs = stmt.executeQuery(query);

	String result = "";
	while(rs.next()){
		result = result+rs.getString(1)+"/";
	}

	out.print(result);
	out.flush();

%>