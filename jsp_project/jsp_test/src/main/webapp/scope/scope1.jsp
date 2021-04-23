<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- scope1.jsp-->
<jsp:useBean id="obj" class="home.count.Count" scope="session"/>
<jsp:setProperty property="count" name="obj" />
<!-- obj.setCount(request.getParameter("count")); -->
<h2>session scope</h2>
<b>obj¿« getCount() »£√‚ : </b>
<jsp:getProperty property="count" name="obj"/>
<br>
<a href="result1.jsp">result</a> 