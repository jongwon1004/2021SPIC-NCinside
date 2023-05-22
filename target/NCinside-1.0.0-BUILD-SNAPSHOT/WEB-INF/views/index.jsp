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
<script>
    let msg = "${msg}";
    if(msg == "DEL_ERR") alert("修正を失敗しました！")
    if(msg == "LOGOUT") alert("ログアウトしました！")
</script>
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
                            />
                        </button>
                    </div>
                </form>
            </li>
            <li class="Other-Funtion">
                <ul>
                    <li>
                        <a href="<c:url value='/mypage'/>">
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
                        <center>
                            <button id="bkBtn">
                            <img src="./img/boardBookMark.png" width="25px" height="25px">
                            </button>
                        </center>
                        <p style="margin-top: 5px">BookMark</p>
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
<!--여기까지 헤더-->
<nav class="nav">
    <div class="container">
        <div class="container-box">
            <ul>
                <li><a href="<c:url value='/board/list?typeNo=1'/>">IT</a></li>
                <li><a href="<c:url value='/board/list?typeNo=2'/>">GAME</a></li>
                <li><a href="<c:url value='/board/list?typeNo=3'/>">FUNNY</a></li>
                <li><a href="<c:url value='/board/list?typeNo=4'/>">FOOD</a></li>
                <li><a href="<c:url value='/board/list?typeNo=5'/>">JLPT</a></li>
                <br/>
                <li><a href="<c:url value='/board/list?typeNo=6'/>">ANIMATION</a></li>
                <li><a href="<c:url value='/board/list?typeNo=7'/>">DRAMA</a></li>
                <li><a href="<c:url value='/board/list?typeNo=8'/>">COFFEE</a></li>
                <li><a href="<c:url value='/board/list?typeNo=9'/>">SOCCER</a></li>
                <li><a href="<c:url value='/board/moreList'/>">MORE</a></li>
            </ul>
        </div>
    </div>
</nav>
<div class="boarder-Box">
    <div class="board">
        <div class="main-box">
            <div class="mainboard">
                <ul>
                    <div class="boarder-top-box">
                <span
                        class="board-top-message"
                        style="font-family: 'M PLUS 1p', sans-serif"
                >最新コミュニティ</span>
                        <span><img
                                src="./img/check1.png"
                                alt=""
                                srcset=""
                                width="25px"
                                height="25px"
                        /></span>
                        <span
                                class="board-top-message"
                                style="font-family: 'M PLUS 1p', sans-serif"
                        >最新情報</span
                        >
                        <span
                        ><img
                                src="./img/check2.png"
                                alt=""
                                srcset=""
                                width="25px"
                                height="25px"
                        /></span>
                        <span
                                class="board-top-message"
                                style="font-family: 'M PLUS 1p', sans-serif"
                        >最新ニュース</span
                        >
                        <span
                        ><img
                                src="./img/check3.png"
                                alt=""
                                srcset=""
                                width="25px"
                                height="25px"
                        /></span>
                    </div>
                    <c:forEach var="boardDto" items="${list}">
                            <li>
                            <a href="<c:url value='/board/read?bno=${boardDto.bno}&page=${page}&pageSize=${pageSize}&typeNo=${boardDto.type_no}'/>" style="text-align: left">
                                <img src="./img/ahoka.png" width="80px" height="40px">
                                <span style="font-family: 'M PLUS 1p', sans-serif">${boardDto.title}</span>
                                <span style="color: red">[${boardDto.comment_cnt}]</span>
                            </a>
                            <div class="time"><p>    <!-- choose部分は後で時間ある時に書き直すこと　変更に不利-->
<%--                                <c:choose>--%>
<%--                                    <c:when test="${boardDto.type_no == status.count and boardDto.type_no == typeList.get(status.index).get('type_no')}">--%>
<%--                                        <c:set var="communityType" value="${typeList.get(status.index).get('type_name')}"/>--%>
<%--                                    </c:when>--%>

<%--                                </c:choose>--%>
                                <c:forEach var="typeListVar" items="${typeList}" varStatus="status">
                                    <c:if test="${boardDto.type_no == typeList.get(status.index).type_no}">
                                        <c:set var="communityType" value="${typeList.get(status.index).type_name}"/>
                                    </c:if>
                                </c:forEach>


                                ${communityType}　|&nbsp;&nbsp;
                                <c:choose>
                                    <c:when test="${boardDto.reg_date.time >= startOfToday}">
                                        <fmt:formatDate value="${boardDto.reg_date}" pattern="HH:mm" type="time"/></td>
                                    </c:when>
                                    <c:otherwise>
                                        <fmt:formatDate value="${boardDto.reg_date}" pattern="yyyy-MM-dd" type="date"/></td>
                                    </c:otherwise>
                                </c:choose>
                            </p></div>
                            </li>
                    </c:forEach>

            </div>
            <div class="side">
                <ul>
                    <li class="side-UP">
                        <ul>
                            <li><a href="#">コミュニティ追加要請</a></li>
                            <li style="letter-spacing: -0.8px"><a href="#">新規コミュニティを見る</a></li>
                            <li><a href="#">お知らせ</a></li>
                            <li><a href="#">掲示物申告する</a></li>
                            <li><a href="#">広告依頼</a></li>
                            <li><a href="#">夜勤モード</a></li>
                        </ul>
                    </li>
                    <li class="side-DOWN">
                        <ul>
                            <li class="title">リアルタイム人気掲示板</li>
                            <c:forEach  var="bestBoardDto" items="${bestTop10}" varStatus="status">
                                <li style="font-size: 14px">
                                <span style="
                        border: solid navy;
                        color: white;
                        background-color: navy;
                        border-width: 3px;
                      ">${status.count}</span>&nbsp;&nbsp;
                                    <a href="<c:url value='/board/read?bno=${bestBoardDto.bno}&typeNo=${bestBoardDto.type_no}'/>">
                                        <c:choose>
                                            <c:when test="${fn:length(bestBoardDto.title) > 8}">
                                                <c:out value="${fn:substring(bestBoardDto.title,0,7)}"/>...
                                            </c:when>
                                            <c:otherwise>
                                                <c:out value="${bestBoardDto.title}"/>
                                            </c:otherwise>
                                        </c:choose>

                                    </a>
                                </li>
                            </c:forEach>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
<div class="bottomBox">
    <div class="bottombody">
        <div class="bo-left">
            <div class="box-top">
                <div class="bottom-minibox">
                    <ul class="box1">
                        <h4>IT ギャラリー</h4>
                        <c:forEach var="itBoardDto" items="${itList}">
                            <li>
                                <a href="<c:url value='/board/read?bno=${itBoardDto.bno}&page=${page}&pageSize=${pageSize}&typeNo=${itBoardDto.type_no}'/>" style="text-align: left">
                                    <span style="font-family: 'M PLUS 1p', sans-serif">${itBoardDto.title}</span>
                                </a>
                                <div class="time"><p>
                                </p></div>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
                <div class="bottom-minibox">
                    <ul class="box2">
                        <h4>GAME ギャラリー</h4>
                        <c:forEach var="gameBoardDto" items="${gameList}">
                            <li>
                                <a href="<c:url value='/board/read?bno=${gameBoardDto.bno}&page=${page}&pageSize=${pageSize}&typeNo=${gameBoardDto.type_no}'/>" style="text-align: left">
                                    <span style="font-family: 'M PLUS 1p', sans-serif">${gameBoardDto.title}</span>
                                </a>
                                <div class="time"><p>
                                </p></div>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
            <div class="box-bottom">
                <div class="bottom-minibox">
                    <ul class="box3">
                        <h4>FUNNY ギャラリー</h4>
                        <c:forEach var="funnyBoardDto" items="${funnyList}">
                            <li>
                                <a href="<c:url value='/board/read?bno=${funnyBoardDto.bno}&page=${page}&pageSize=${pageSize}&typeNo=${funnyBoardDto.type_no}'/>" style="text-align: left">
                                    <span style="font-family: 'M PLUS 1p', sans-serif">${funnyBoardDto.title}</span>
                                </a>
                                <div class="time"><p>
                                </p></div>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
                <div class="bottom-minibox">
                    <ul class="box4">
                        <h4>FOOD ギャラリー</h4>
                        <c:forEach var="foodBoardDto" items="${foodList}">
                            <li>
                                <a href="<c:url value='/board/read?bno=${foodBoardDto.bno}&page=${page}&pageSize=${pageSize}&typeNo=${foodBoardDto.type_no}'/>" style="text-align: left">
                                    <span style="font-family: 'M PLUS 1p', sans-serif">${foodBoardDto.title}</span>
                                </a>
                                <div class="time"><p>
                                </p></div>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
        <div class="bo-right">
            <img
                    src="./img/koukokumigi2.png"
                    alt=""
                    width="180px"
                    height="600px"
            />
        </div>
    </div>
</div>

<div class="Advertising">
    <div class="Advertising-box">
        <div class="image-box">
            <div class="imageBox1">
                <img src="./img/koukokuwakutin.png" ta; alt="" srcset="" /
                width="975px" height="230px">
            </div>
            <div class="imageBox2">
                <img src="./img/koukokuTravel.png" ta; alt="" srcset="" /
                width="180px" height="230px">
            </div>
        </div>
    </div>
</div>
<footer>
    <div class="footer-box">
        <p id="copyright">
            <small
            >Copyright &copy; 2021 slowlifecafe. All Rights Reserved.</small
            >
        </p>
    </div>
</footer>
<script>
    $(document).ready(function () {  // main()

        $("#bkBtn").click(function () {
            if(${pageContext.request.session.getAttribute('id') == null}){
                alert("ログインが必須です！")
                location.href= "<c:url value='/login/login'/>"
            }else {
                location.href = "<c:url value='/bookmark/list'/>"
            }
        })
    })
    //
    //     let showList = function (bno) {
    //         $.ajax({
    //             type: 'GET',       // 요청 메서드
    //             url: '/nc/comments?bno=' + bno,  // 요청 URI
    //             success: function (result) {
    //                 $('#commentList').html(toHtml(result));    // 서버로부터 응답이 도착하면 호출될 함수
    //             },
    //             error: function () {
    //                 alert("error")
    //             } // 에러가 발생했을 때, 호출될 함수
    //         }); // $.ajax()
    //     }
</script>
</body>
</html>
