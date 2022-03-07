<%--
  Created by IntelliJ IDEA.
  User: kokk7
  Date: 2022-02-19
  Time: 오후 8:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="page" uri="http://www.opensymphony.com/sitemesh/page" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>


<decorator:head />
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="${pageContext.request.contextPath}resources/css/main.css">
<title>         <decorator:title default="RPS" />          </title>

<script>
    console.log(${pageContext.request.contextPath });
</script>
</head>

<body>


<div id="wrapper">
    <page:applyDecorator name="_top" />

    <div id="cntWrap">
        <page:applyDecorator name="_left" />

        <div id="cntArea">
            <decorator:body />
        </div>
    </div>

    <div id="footer">
        <page:applyDecorator name="_bottom" />
    </div>
</div>
<%--


<div>                   </div>
<div>공통헤더</div>
<hr>

밑에는 사용자의 요청에 의해서 생성된 html페이지 body부분
<div>         <decorator:body />         </div>

<hr>
<div>공통푸터</div>

--%>

</body>
</html>
