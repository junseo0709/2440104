<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    if (request.getMethod().equalsIgnoreCase("POST")) {
        String uid = request.getParameter("uid");
        String upw = request.getParameter("upw");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp", "root", "password");

            String query = "SELECT * FROM member1028 WHERE uid = ? AND upw = ?";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setString(1, uid);
            pstmt.setString(2, upw);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                session.setAttribute("username", rs.getString("name"));
                response.sendRedirect("dashboard.jsp");
            } else {
                out.println("<h3 style='color: red; text-align: center;'>로그인 실패! 아이디 또는 비밀번호를 확인하세요.</h3>");
            }
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h3 style='color: red; text-align: center;'>로그인 처리 중 오류 발생: " + e.getMessage() + "</h3>");
        }
    }
%>
