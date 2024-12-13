<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("login.jsp");
    }
%>
<h2>환영합니다, <%= username %>!</h2>
<p>로그인이 성공적으로 완료되었습니다.</p>
<a href="logout.jsp">로그아웃</a>
