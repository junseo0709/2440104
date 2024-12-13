<%@ page import="java.sql.*" %><%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("login.jsp");
    }
%>
<h2>안녕하세요, <%= username %>님!</h2>
<p>아래는 현재 데이터베이스의 내용을 표시합니다:</p>

<h3>회원 정보</h3>
<%
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp", "root", "password");
        String query = "SELECT * FROM member1028";
        PreparedStatement pstmt = conn.prepareStatement(query);
        ResultSet rs = pstmt.executeQuery();

        while (rs.next()) {
            out.println("<p>이름: " + rs.getString("name") + ", 아이디: " + rs.getString("uid") + ", 전화번호: " + rs.getString("phone") + "</p>");
        }
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<a href="logout.jsp">로그아웃</a>
