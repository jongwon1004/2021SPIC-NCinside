<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page session="false" %>
<c:set var="loginOutLink" value="${sessionScope.id == null ? 'login/login' : 'login/logout'}"/>
<c:set var="loginOutCheck" value="${pageContext.request.session.getAttribute('id') == null? 'Login' : 'Logout'}"/>
<c:set var="loginOutLink" value="${pageContext.request.session.getAttribute('id') == null? '/login/login' : '/login/logout'}"/>
<c:set var="userName" value="${pageContext.request.session.getAttribute('id') == null? '' : '様、ようこそ🤗' }"/>
<c:set var="loginId" value="${pageContext.request.getSession(false)==null ? '' : pageContext.request.session.getAttribute('id')}"/>
<c:set var="loginOut" value="${loginId== null ? 'Login' : 'ID:'+=loginId}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>NCinside</title>

    <link rel="preconnect" href="https://fonts.googleapis.com" />

    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
            href="https://fonts.googleapis.com/css2?family=M+PLUS+1p:wght@100;400&display=swap"
            rel="stylesheet"
    />
    <link
            href="https://fonts.googleapis.com/css2?family=Lexend+Deca:wght@700&display=swap"
            rel="stylesheet"
    />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
            href="https://fonts.googleapis.com/css2?family=Kosugi&display=swap"
            rel="stylesheet"
    />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
            href="https://fonts.googleapis.com/css2?family=M+PLUS+2:wght@500&display=swap"
            rel="stylesheet"
    />
    <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/destyle.css@1.0.15/destyle.css"
    />
    <link
            href="https://fonts.googleapis.com/css2?family=Lobster&display=swap"
            rel="stylesheet"
    />

    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
            href="https://fonts.googleapis.com/css2?family=BIZ+UDPGothic:wght@700&display=swap"
            rel="stylesheet"
    />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
            href="https://fonts.googleapis.com/css2?family=Sono:wght@600&display=swap"
            rel="stylesheet"
    />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
            href="https://fonts.googleapis.com/css2?family=M+PLUS+1p:wght@700&display=swap"
            rel="stylesheet"
    />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
            href="https://fonts.googleapis.com/css2?family=M+PLUS+1p:wght@700&display=swap"
            rel="stylesheet"
    />
    <link rel="stylesheet" href="<c:url value='/css/main-style.css?after'/>">

    <!-- 폰트 마지막 추가 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Varela+Round&display=swap" rel="stylesheet">
    <%--    <link rel="stylesheet" href="<c:url value='/css/main-style'/>">--%>
    <!-- jquery -->
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
</head>
<body>
    <header class="header">
        <!--/*ようこそのbox作る*/-->
        <div class="header-top">
            <div class="welcome-box">
                <div class="welcome">
                    <p style="font-family: 'M PLUS 2', sans-serif">
                        ${loginId}${userName}
                    </p>
                </div>
            </div>
        </div>
        <div class="inner">
            <ul class="treebox">
                <a href="<c:url value='/'/>">
                    <li class="logo">
                        <span class="N">N</span>
                        <span class="C">C</span>
                        <span class="inside">inside</span>
                    </li>
                </a>
                <li class="search">
                    <form action="<c:url value='/result'/>" id="searchForm">        <!-- form부분 -->
                        <div class="search-box">
                            &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" placeholder="検索する言葉を入れて下さい" id="keyword" name="keyword"/>
                            <button>
                                <img
                                        src="./img/searchmark.png"
                                        style="width: 40px; height: 40px"
                                        alt=""
                                        srcset=""
                                />
                            </button>
                        </div>
                    </form>
                </li>
                <li class="Other-Funtion">
                    <ul>
                        <li>
                            <a href="#">
                                <center>
                                    <img src="./img/mypage.png" alt="" / width="25px"
                                    height="25px">
                                </center>
                                <p style="margin-top: 5px">MyPage</p></a
                            >
                        </li>

                        <li>
                            <a href="<c:url value='${loginOutLink}'/>">
                                <center>
                                    <img src="./img/login.png" alt="" id="loginImg"/ width="25px"
                                    height="25px" class="img">
                                </center>
                                <p style="margin-top: 5px">${loginOutCheck}</p></a
                            >
                        </li>
                        <li>
                            <a href="#">
                                <center>
                                    <img src="./img/bookmark2.png" alt="" / width="25px"
                                    height="25px">
                                </center>
                                <p style="margin-top: 5px">BookMark</p></a
                            >
                        </li>
                        <li>
                            <a href="#">
                                <center>
                                    <img src="./img/help.png" alt="" / width="25px"
                                    height="25px">
                                </center>
                                <p style="margin-top: 5px">Help</p>
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </header>
    <div>
        <div style="text-align: center; font-size: 40px">
            ギャラリーリスト
        </div>

        <div style="text-align: center">
            <c:forEach var="nameList" items="${list}" varStatus="status">
                <div style="font-size: 25px; margin-top: 30px">
                    <a href="<c:url value='/board/list?typeNo=${typeList.get(typeNoList.get(status.index)-1).get("type_no")}'/>">${nameList}</a>
                </div>
            </c:forEach>
        </div>

        <div style="margin-top: 100px">
            <h1 style="text-align: center; font-size: 40px">
                内容に検索した言葉が入ってる掲示物
            </h1>
            <div class="searchContentList">
                <c:forEach var="contentList" items="${contentList}" varStatus="status">
                    <div style="font-size: 25px; margin: 30px 0 30px 0; text-align: center">
                        <a href="<c:url value='/board/read?bno=${contentList.bno}&typeNo=${contentList.type_no}'/>">タイトル：${contentList.title}</a><br>
                        内容：${contentList.content}
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</body>
</html>
