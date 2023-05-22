<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="loginOutCheck" value="${pageContext.request.session.getAttribute('id') == null? 'Login' : 'Logout'}"/>
<c:set var="loginOutLink" value="${pageContext.request.session.getAttribute('id') == null? '/login/login' : '/login/logout'}"/>
<c:set var="userName" value="${pageContext.request.session.getAttribute('id') == null? '' : '様、ようこそ🤗' }"/>
<c:set var="loginId" value="${pageContext.request.getSession(false)==null ? '' : pageContext.request.session.getAttribute('id')}"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>

    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />

    <link href="https://fonts.googleapis.com/css2?family=M+PLUS+1p:wght@100;400&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Lexend+Deca:wght@700&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Kosugi&display=swap" rel="stylesheet"/>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=M+PLUS+2:wght@500&display=swap" rel="stylesheet"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/destyle.css@1.0.15/destyle.css"/>
    <link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=BIZ+UDPGothic:wght@700&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Sono:wght@600&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=M+PLUS+1p:wght@700&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Kiwi+Maru:wght@500&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Gloock&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="<c:url value='/css/main-style.css?after'/>">

    <!-- 폰트 마지막 추가 -->
    <link href="https://fonts.googleapis.com/css2?family=Varela+Round&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
    <title>Title</title>
    <style>
        a {
            text-decoration: none;
            color: black;
        }
        button,
        input {
            border: none;
            outline: none;
        }

        .search-option > option {
            text-align: center;
        }

        table {
            border-collapse: collapse;
            width: 100%;
            border-top: 2px solid rgb(39, 39, 39);
        }
        tr:nth-child(even) {
            background-color: #f0f0f070;
        }
        th,
        td {
            width:300px;
            text-align: center;
            padding: 10px 12px;
            border-bottom: 1px solid #ddd;
        }
        td {
            color: rgb(53, 53, 53);
        }

    </style>
</head>

<body>
<script>
    let msg = "${msg}"
    if(msg == "LOGOUT") alert("ログアウトしました！")
    if (msg == "DEL_OK") alert("削除しました！");
    if (msg == "DEL_ERR") alert("削除を失敗しました！");
    if (msg == "WRT_OK") alert("登録しました！")
    if (msg == "MOD_OK") alert("修正しました！")
    if (msg == "NOT_FOUND_RESULT") alert("検索した結果、見つけませんでした")
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
                <div class="search-box">
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" placeholder="検索する言葉を入れて下さい"/>
                    <button>
                        <img
                                src="../img/searchmark.png"
                                style="width: 40px; height: 40px"
                                alt=""
                                srcset=""
                        />
                    </button>
                </div>
            </li>
            <li class="Other-Funtion">
                <ul>
                    <li>
                        <a href="#">
                            <center>
                                <img src="../img/mypage.png" alt="" / width="25px"
                                height="25px">
                            </center>
                            <p style="margin-top: 5px">MyPage</p></a
                        >
                    </li>

                    <li>
                        <a href="<c:url value='${loginOutLink}'/>">
                            <center>
                                <img src="../img/login.png" alt="" / width="25px"
                                height="25px" class="img">
                            </center>
                            <p style="margin-top: 5px">${loginOutCheck}</p></a
                        >
                    </li>
                    <li>
                        <center>
                            <button id="bkBtn">
                                <img src="../img/boardBookMark.png" width="25px" height="25px">
                            </button>
                        </center>
                        <p style="margin-top: 5px">BookMark</p>
                    </li>
                    <li>
                        <a href="#">
                            <center>
                                <img src="../img/help.png" alt="" / width="25px"
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
<div class="inner">
    <div class="board-title">
        NCinsideのギャラリーリストです！
    </div>
    <c:forEach var="lists" items="${moreList}" varStatus="status">
        <div class="testBox" style="text-align: center; padding: 30px 0 30px 0; border: gray solid 2px">
        <a href="<c:url value='/board/list?typeNo=${moreList.get(status.index).type_no}'/>"><span style="font-size: 30px; font-family: 'Gloock', serif;">
                ${moreList.get(status.index).type_name}</span></a><br>
        </div>
    </c:forEach>


</div>

<script>
    $(document).ready(function (){  // main()

        $("#bkBtn").click(function () {
            if(${pageContext.request.session.getAttribute('id') == null}){
                alert("ログインが必須です！")
                location.href= "<c:url value='/login/login'/>"
            }else {
                location.href = "<c:url value='/bookmark/list'/>"
            }
        })

        $('#writeBtn').on("click",function (){
            if(${pageContext.request.session.getAttribute('id') == null}) {
                location.href = "<c:url value='/login/login'/>";
            }
        });
    });
</script>

</body>
</html>
