<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="loginOutCheck" value="${pageContext.request.session.getAttribute('id') == null? 'Login' : 'Logout'}"/>
<c:set var="loginOutLink" value="${pageContext.request.session.getAttribute('id') == null? '/login/login' : '/login/logout'}"/>
<c:set var="userName" value="${pageContext.request.session.getAttribute('id') == null? '' : '様、ようこそ🤗' }"/>
<c:set var="loginId" value="${pageContext.request.getSession(false)==null ? '' : pageContext.request.session.getAttribute('id')}"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>

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
<link rel="stylesheet" href="<c:url value='/css/mypage.css?after'/>">
<link rel="stylesheet" href="<c:url value='/css/main-style.css?after'/>">

<!-- 폰트 마지막 추가 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Varela+Round&display=swap" rel="stylesheet">
<%--    <link rel="stylesheet" href="<c:url value='/css/main-style'/>">--%>
<!-- jquery -->
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<style>

  .main input {
    width: 100%;
    height: 35px;
    margin: 5px 0px 10px 0px;
    border: 1px solid #e9e8e8;
    padding: 8px;
    background: #f8f8f8;
    outline-color: #e6e6e6;
  }

  .main textarea {
    width: 100%;
    background: #f8f8f8;
    margin: 5px 0px 10px 0px;
    border: 1px solid #e9e8e8;
    resize: none;
    padding: 8px;
    outline-color: #e6e6e6;
  }

  .btn {
    background-color: rgb(236, 236, 236); /* Blue background */
    border: none; /* Remove borders */
    color: black; /* White text */
    padding: 6px 12px; /* Some padding */
    font-size: 16px; /* Set a font size */
    cursor: pointer; /* Mouse pointer on hover */
    border-radius: 5px;
  }
  .btn:hover {
    text-decoration: underline;
  }
</style>
</head>
<body>
<script>
  let msg = "${msg}";
  if(msg == "WRT_ERR") alert("登録を失敗しました。再度試して下さい。")
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
        <div class="search-box">
          &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" placeholder="検索する言葉を入れて下さい"/>
          <button>
            <img
                    src="./img/searchmark.png"
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
                <img src="./img/mypage.png" alt="" / width="25px"
                height="25px">
              </center>
              <p style="margin-top: 5px">MyPage</p></a
            >
          </li>

          <li>
            <a href="<c:url value='${loginOutLink}'/>">
              <center>
                <img src="./img/login.png" alt="" / width="25px"
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
<div class="nav">
  <div class="navInner">
    <div class="navBox">
      <div class="navBar">
        <ul>
          <li>コミュニティ追加要請</li>
          <li>新規コミュニティ</li>
          <li>お知らせ</li>
          <li>イベント</li>
          <li>夜勤モード</li>
          <li>広告依頼</li>
        </ul>
      </div>
      <div class="navMigi">
        <ul>
          <li>
            <img
                    src="./image/alram.png"
                    alt=""
                    width="30px"
                    height="30px"
            />
          </li>
          <li>
            <img
                    src="./image/message.png"
                    alt=""
                    width="30px"
                    height="30px"
            />
          </li>
          <li>
            <img
                    src="./image/singo.png"
                    alt=""
                    width="30px"
                    height="30px"
            />
          </li>
        </ul>
      </div>
    </div>
  </div>
</div>
<!-- header and nav -->

<div class="userImage">
  <div class="userImageInner">
    <img src="./image/mypage.png" alt="" width="150px" height="150px">
  </div>
</div>
<div class="welcomeBox">
  <div class="welcomeBoxInner">
    <p class="welcomeText" >ようこそ, ノボルさん</p>
  </div>
</div>
<div class="BOX">
  <div class="BoxInner">
    <div class="information">
      <div class="IDBox"><p id="ID">ID</p><p id="IDText">UserId</p></div>
      <div class="passwordBox"><p id="PW">PASSWORD</p><p id="passwordText">UserPassword</p></div>
      <!-- 아이디 비번 바꾸기 아이디 비번 이메일 -->
    </div>
    <div class="EmailIn">
      <div class="EmailBox"><p id="Email">e-mail</p><p id="EmailText">user-Email</p></div>
    </div>
    <div class="changeIN">
      <div class="changeBox"><button>IDとPW変える</button></div>
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
</body>
</html>
  