<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    if (request.getMethod().equalsIgnoreCase("POST")) {
        String uid = request.getParameter("uid");
        String upw = request.getParameter("upw");
        String upw2 = request.getParameter("upw2");
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");

        if (!upw.equals(upw2)) {
            out.println("<h3 style='color: red; text-align: center;'>패스워드가 일치하지 않습니다. 다시 시도하세요.</h3>");
        } else {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp", "root", "password");

                String query = "INSERT INTO member1028 (uid, upw, name, phone) VALUES (?, ?, ?, ?)";
                PreparedStatement pstmt = conn.prepareStatement(query);
                pstmt.setString(1, uid);
                pstmt.setString(2, upw);
                pstmt.setString(3, name);
                pstmt.setString(4, phone);
                pstmt.executeUpdate();

                out.println("<h3 style='color: green; text-align: center;'>회원가입 성공! <a href='login.html'>로그인</a>하세요.</h3>");
                conn.close();
            } catch (SQLIntegrityConstraintViolationException e) {
                out.println("<h3 style='color: red; text-align: center;'>아이디가 이미 사용 중입니다. 다른 아이디를 사용하세요.</h3>");
            } catch (Exception e) {
                e.printStackTrace();
                out.println("<h3 style='color: red; text-align: center;'>회원가입 처리 중 오류 발생: " + e.getMessage() + "</h3>");
            }
        }
    }
%>
