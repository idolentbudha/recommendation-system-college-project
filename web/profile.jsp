<%-- 
    Document   : profile
    Created on : May 20, 2017, 7:57:19 PM
    Author     : Lama
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
<% if(session.getAttribute("user") == null || session.getAttribute("user")==""){
    response.sendRedirect("login.jsp");
%>
<% }else{%>
        Welcome <%= session.getAttribute("user")  %>
        <a href="logoutServlet">logout</a>
        <a href="index.jsp">home</a>
        <% } %>
        
        
        
    </body>
</html>
