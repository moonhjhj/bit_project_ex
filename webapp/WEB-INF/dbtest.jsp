<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding= "UTF-8"%>
<%@ page import="java.sql.*"%>
 
<h2> JDBC드라이버 테스트 </h2>
 
<%
  Connection conn=null;
 
  try{
     
        String jdbcUrl= "jdbc:mysql://192.168.1.74:3306/tmp4" ;
        String dbId="admin";
        String dbPass= "1234";
 
        Class.forName( "com.mysql.jdbc.Driver");
        conn=DriverManager.getConnection(jdbcUrl,dbId ,dbPass );
        out.println( "제대로 연결되었습니다." );
  }catch(Exception e){
           e.printStackTrace();
  }
%>
 


