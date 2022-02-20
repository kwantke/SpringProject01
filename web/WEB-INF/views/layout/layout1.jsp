<%--
  Created by IntelliJ IDEA.
  User: kokk7
  Date: 2022-02-19
  Time: 오후 8:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ tablib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page"%>
<html>
<head>
    //사용자의 요청에 의해 생성된 페이지의 head태그 구문을 가져온다.

<decorator:head />



<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>         <decorator:title default="RPS" />          </title>
</head>


<body>
<div>                   </div>
<div>공통헤더</div>
<hr>

밑에는 사용자의 요청에 의해서 생성된 html페이지 body부분
<div>         <decorator:body />         </div>

<hr>
<div>공통푸터</div>


</body>
</html>
