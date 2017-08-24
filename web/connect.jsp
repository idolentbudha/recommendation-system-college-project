<%-- 
    Document   : connect
    Created on : Jun 20, 2017, 10:43:02 PM
    Author     : Lama
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Page</title>
    </head>
    <body>
        
        
        <%@ page import="java.sql.*"%>  
  
<%  
String name=request.getParameter("val");  
if(name==null||name.trim().equals("")){  
//out.print("<p>Please enter name!</p>");  
}else{  
try{  
Class.forName("com.mysql.jdbc.Driver");  
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/futsalnepal","root","");  
PreparedStatement ps=con.prepareStatement("select * from futsalarena where FutsalName like '"+name+"%'");  
ResultSet rs=ps.executeQuery();  
  
if(!rs.isBeforeFirst()) {      
 out.println("<p>No Record Found!</p>");   
}else{  
 
  
while(rs.next()){  
    out.print("<a href='#'>"+rs.getString("FutsalName")+"</a>"+"<br>");
}  
  
}//end of else for rs.isBeforeFirst  
con.close();  
}catch(Exception e){out.print(e);}  
}//end of else  
%>  
        
        
        
    </body>
</html>
