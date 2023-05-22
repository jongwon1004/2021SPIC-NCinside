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
  <link href="https://fonts.googleapis.com/css2?family=M+PLUS+2:wght@500&display=swap" rel="stylesheet"/>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/destyle.css@1.0.15/destyle.css"/>
  <link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet"/>
  <link href="https://fonts.googleapis.com/css2?family=BIZ+UDPGothic:wght@700&display=swap" rel="stylesheet"/>
  <link href="https://fonts.googleapis.com/css2?family=Sono:wght@600&display=swap" rel="stylesheet"/>
  <link href="https://fonts.googleapis.com/css2?family=M+PLUS+1p:wght@700&display=swap" rel="stylesheet"/>
  <link href="https://fonts.googleapis.com/css2?family=M+PLUS+1p:wght@700&display=swap" rel="stylesheet"/>
  <link href="https://fonts.googleapis.com/css2?family=Kiwi+Maru:wght@500&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="<c:url value='/css/main-style.css?after'/>">

  <!-- 폰트 마지막 추가 -->
  <link href="https://fonts.googleapis.com/css2?family=Varela+Round&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Kosugi&display=swap" rel="stylesheet">
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
    .search-container {
      width: 100%;
      height: 80px;
      margin-top : 10px;
      margin-bottom: 30px;
      display: flex;
      justify-content: center;
      align-items: center;
    }
    .search-form {
      height: 37px;
      display: flex;
    }
    .search-option {
      width: 135px;
      height: 100%;
      outline: none;
      margin-right: 5px;
      border: 1px solid #ccc;
      color: gray;
    }
    .search-option > option {
      text-align: center;
    }
    .search-input {
      color: gray;
      background-color: white;
      border: 1px solid #ccc;
      height: 100%;
      width: 300px;
      font-size: 15px;
      padding: 5px 7px;
    }
    .search-input::placeholder {
      color: gray;
    }
    .search-button {
      /* 메뉴바의 검색 버튼 아이콘  */
      width: 20%;
      height: 100%;
      background-color: rgb(22, 22, 22);
      color: rgb(209, 209, 209);
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 15px;
    }
    .search-button:hover {
      color: rgb(165, 165, 165);
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

    .page {
      color: black;
      padding: 6px;
      margin-right: 10px;
    }

    .btn-write:hover {
      text-decoration: underline;
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
<div class="inner">
  <div class="board-title">
    ${typeName}ギャラリー
  </div>
  <table border="1" style="margin-top: 20px">
    <colgroup>
      <col style="width: 7%">
      <col>
      <col style="width: 20%">
      <col style="width: 12%">
      <col style="width: 7%">
    </colgroup>
    <thead>
      <tr>
        <th>番号</th>
        <th>タイトル</th>
        <th>名前</th>
        <th>投稿日</th>
        <th>ビュー</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach var="boardDto" items="${list}">
        <tr>
          <td>${boardDto.bno}</td>
          <td><a href="<c:url value='/board/read${ph.sc.queryString}&bno=${boardDto.bno}'/>">${boardDto.title}
            <span style="color: red; font-weight: bold">[${boardDto.comment_cnt}]</span></a></td>
          <td>${boardDto.writer}</td>
          <td>
            <c:choose>
              <c:when test="${boardDto.reg_date.time >= startOfToday}">
                <fmt:formatDate value="${boardDto.reg_date}" pattern="HH:mm" type="time"/></td>
              </c:when>
              <c:otherwise>
                <fmt:formatDate value="${boardDto.reg_date}" pattern="yyyy-MM-dd" type="date"/></td>
              </c:otherwise>
            </c:choose>
          </td>
          <td>${boardDto.view_cnt}</td>
        </tr>
      </c:forEach>
    </tbody>
  </table>
    <br>
    <button id="writeBtn" class="btn-write" onclick="location.href='<c:url value="/board/write${ph.sc.queryString}"/>'"><i class="fa fa-pencil"></i>書き込み</button>
  <br>
  <div class="paging-bar" style="text-align: center; font-size: 27px">
    <c:if test="${totalCnt!=null && totalCnt!=0}">
      <c:if test="${ph.showPrev}">
        <a class="page" href="<c:url value="/board/list${ph.sc.getQueryString(ph.beginPage-1)}"/>">&lt;</a>
      </c:if>
      <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
        <a class="page ${i==ph.sc.page? "paging-active" : ""}" href="<c:url value="/board/list${ph.sc.getQueryString(i)}"/>">
          <c:choose>
            <c:when test="${i == ph.sc.page}">
              <span style="font-weight: bold; font-size: 40px">${i}</span>
            </c:when>
            <c:otherwise>
              ${i}
            </c:otherwise>
          </c:choose>
      </c:forEach>
      <c:if test="${ph.showNext}">
        <a class="page" href="<c:url value="/board/list${ph.sc.getQueryString(ph.endPage+1)}"/>">&gt;</a>
      </c:if>


<%--      <c:if test="${ph.showPrev}">--%>
<%--        <a class="page" href="<c:url value="/board/list?${ph.sc.getQueryString(ph.beginPage-1)}&typeNo=${typeNo}"/>">&lt;</a>--%>
<%--      </c:if>--%>
<%--      <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">--%>
<%--        <a class="page ${i==ph.sc.page? "paging-active" : ""}" href="<c:url value="/board/list${ph.sc.getQueryString(i)}&typeNo=${typeNo}"/>">${i}</a>--%>
<%--&lt;%&ndash;        <a href="<c:url value='/board/list?${ph.sc.getQueryString(i)}&typeNo=${typeNo}'/>">${i}</a>&ndash;%&gt;--%>
<%--      </c:forEach>--%>
<%--      <c:if test="${ph.showNext}">--%>
<%--        <a class="page" href="<c:url value="/board/list?${ph.sc.getQueryString(ph.endPage+1)}&typeNo=${typeNo}"/>">&gt;</a>--%>
<%--      </c:if>--%>
    </c:if>
  </div>


  <div class="search-container">
    <form action="<c:url value="/board/list"/>" class="search-form" method="get" id="form">
      <select class="search-option" name="option">
        <option value="A" ${ph.sc.option=='A' || ph.sc.option=='' ? "selected" : ""}>タイトル＋内容</option>
        <option value="T" ${ph.sc.option=='T' ? "selected" : ""}>タイトル</option>
        <option value="W" ${ph.sc.option=='W' ? "selected" : ""}>作成者</option>
      </select>

      <input type="hidden" name="typeNo" value="${ph.sc.typeNo}" />
      <input type="text" name="keyword" class="search-input" type="text" value="${ph.sc.keyword}" placeholder="検索する言葉を入れて下さい">
      <input type="submit" id="subBtn" class="search-button" value="検索">
    </form>
  </div>

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
