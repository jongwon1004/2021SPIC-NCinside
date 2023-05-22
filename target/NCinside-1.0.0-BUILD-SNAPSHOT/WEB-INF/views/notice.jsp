<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link rel="preconnect" href="https://fonts.googleapis.com" />
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
  <link
          href="https://fonts.googleapis.com/css2?family=Lobster&display=swap"
          rel="stylesheet"
  />
  <!--NCInside 글자폰트-->
  <link rel="preconnect" href="https://fonts.googleapis.com" />
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
  <link
          href="https://fonts.googleapis.com/css2?family=Kosugi+Maru&display=swap"
          rel="stylesheet"
  />
  <!--nav글자폰트-->

  <link rel="preconnect" href="https://fonts.googleapis.com" />
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
  <link
          href="https://fonts.googleapis.com/css2?family=Mochiy+Pop+One&display=swap"
          rel="stylesheet"
  />
  <!--コミュニティTITLE글자폰트-->
  <link rel="stylesheet" href="Notice.css" />
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Kosugi&display=swap" rel="stylesheet">
  <!--타이틀박스 글자 폰트-->
</head>
<body>
<div class="header">
  <div class="inner">
    <div class="header-box">
      <div class="logo">
        <span class="N">N</span>
        <span class="C">C</span>
        <span class="inside">inside</span>
        <span class="com" style="font-size: 17px"
        >&nbsp;&nbsp;お知らせ</span
        >
      </div>
      <div class="search">
        <div class="search-box">
          &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" style="outline: none;" placeholder="入力してください"/>
        </div>
        <div class="searchBtnBox">
          <button>
            <img
                    src="./image/searchmark.png"
                    style="width: 40px; height: 40px"
                    alt=""
                    srcset=""
            />
          </button>
        </div>
      </div>
      <div class="alarm">
        <ul>
          <li>
            <a href="#" style="text-decoration-line: none;">
              <img src="./image/mypage.png" alt="" / width="40px"
              height="40px">&nbsp;&nbsp;
              <span
                      style="margin-top: 5px, font-family= Abel, sans-serif;
                      font-family: Permanent Marker", cursive;"
              >すんす様</
            ></a
                  >
          </li>
        </ul>
      </div>
    </div>
  </div>
</div>
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
<div class="noticeText">
  <div class="noticeTextInner">
    <div class="noticeTextBox"><p class="osirase">お知らせ</p></div>
    <div class="noticesearch"><div class="titleBox"><p>title</p></div> <div class="inputBox"> <input type="text" style="outline: none"> </div><img src="./image/searchmark.png" alt="" width="40px" height="40px"></div>
  </div>
</div>
<section class="task-area">
  <div class="task-tabs" style="text-align: center;">
    <div id="all" style="border-radius: 10px;">全部</div>
    <div id="noticeName">お知らせ</div>
    <div id="inspection">点検</div>
    <div id="event" style="border-right: 1px solid lightgrey; border-radius: 10px;">イベント</div>
  </div>
</section>

<div class="list">
  <div class="listInner">
    <div class="listbox">
      <ul>
        <li>
          <a href="#" style="text-decoration-line: none;"
          ><img src="./image/inspection.png" alt="" / width="40px" height="40px">
            <span class="listText" style="padding-bottom: 10px;"
            >点検のお知らせ</span
            >
          </a>
          <div class="time"><img src="./image/clock.png" alt="" width="20px" height="20px">&nbsp;<p class="timeText">2023-02-17 04:17</p></div>
        </li>
        <li>
          <a href="#" style="text-decoration-line: none;"
          ><img src="./image/event.png" alt="" / width="40px" height="40px">
            <span class="listText" style="padding-bottom: 10px;"
            >応募するだけで10円が当たり!!</span
            >
          </a>
          <div class="time"><img src="./image/clock.png" alt="" width="20px" height="20px">&nbsp;<p class="timeText">2023-02-17 04:17</p></div>
        </li>
        <li>
          <a href="#" style="text-decoration-line: none;"
          ><img src="./image/notice.png" alt="" / width="40px" height="40px">
            <span class="listText" style="padding-bottom: 10px;"
            >掲示板を利用している皆様へ</span
            >
          </a>
          <div class="time"><img src="./image/clock.png" alt="" width="20px" height="20px">&nbsp;<p class="timeText">2023-02-17 04:17</p></div>
        </li>
        <li>
          <a href="#" style="text-decoration-line: none;"
          ><img src="./image/notice.png" alt="" / width="40px" height="40px">
            <span class="listText" style="padding-bottom: 10px;"
            >点検のお知らせ</span
            >
          </a>
          <div class="time"><img src="./image/clock.png" alt="" width="20px" height="20px">&nbsp;<p class="timeText">2023-02-17 04:17</p></div>
        </li>
        <li>
          <a href="#" style="text-decoration-line: none;"
          ><img src="./image/notice.png" alt="" / width="40px" height="40px">
            <span class="listText" style="padding-bottom: 10px;"
            >応募するだけで10円が当たり!!</span
            >
          </a>
          <div class="time"><img src="./image/clock.png" alt="" width="20px" height="20px">&nbsp;<p class="timeText">2023-02-17 04:17</p></div>
        </li>
        <li>
          <a href="#" style="text-decoration-line: none;"
          ><img src="./image/notice.png" alt="" / width="40px" height="40px">
            <span class="listText" style="padding-bottom: 10px;"
            >掲示板を利用している皆様へ</span
            >
          </a>
          <div class="time"><img src="./image/clock.png" alt="" width="20px" height="20px">&nbsp;<p class="timeText">2023-02-17 04:17</p></div>
        </li>
        <li>
          <a href="#" style="text-decoration-line: none;"
          ><img src="./image/notice.png" alt="" / width="40px" height="40px">
            <span class="listText" style="padding-bottom: 10px;"
            >点検のお知らせ</span
            >
          </a>
          <div class="time"><img src="./image/clock.png" alt="" width="20px" height="20px">&nbsp;<p class="timeText">2023-02-17 04:17</p></div>
        </li>
        <li>
          <a href="#" style="text-decoration-line: none;"
          ><img src="./image/notice.png" alt="" / width="40px" height="40px">
            <span class="listText" style="padding-bottom: 10px;"
            >応募するだけで10円が当たり!!</span
            >
          </a>
          <div class="time"><img src="./image/clock.png" alt="" width="20px" height="20px">&nbsp;<p class="timeText">2023-02-17 04:17</p></div>
        </li>
        <li>
          <a href="#" style="text-decoration-line: none;"
          ><img src="./image/notice.png" alt="" / width="40px" height="40px">
            <span class="listText" style="padding-bottom: 10px;"
            >掲示板を利用している皆様へ</span
            >
          </a>
          <div class="time"><img src="./image/clock.png" alt="" width="20px" height="20px">&nbsp;<p class="timeText">2023-02-17 04:17</p></div>
        </li>
        <li>
          <a href="#" style="text-decoration-line: none;"
          ><img src="./image/notice.png" alt="" / width="40px" height="40px">
            <span class="listText" style="padding-bottom: 10px;"
            >掲示板を利用している皆様へ</span
            >
          </a>
          <div class="time"><img src="./image/clock.png" alt="" width="20px" height="20px">&nbsp;<p class="timeText">2023-02-17 04:17</p></div>
        </li>
      </ul>
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
