<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page import="java.net.URLDecoder"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Lobster&display=swap"/>
    <title>会員登録</title>

    <style>
        * { box-sizing:border-box; }
        a { text-decoration: none; }


        input[type='text'], input[type='password'], input[type='email'] {
            width: 300px;
            height: 40px;
            border : 1px solid rgb(177, 210, 99);
            border-radius:5px;
            padding: 0 10px;
            margin-bottom: 3px;
        }

        div .item-text {
            width:500px;
            height:580px;
            display : flex;
            flex-direction: column;
            align-items:center;
            position : absolute;
            top:50%;
            left:50%;
            transform: translate(-50%, -50%) ;
            border-radius: 13px;
            border: 3px solid transparent;
            background-image: linear-gradient(#fff, #fff),
            linear-gradient(to right, #fbfcb9be, #ffcdf3aa, #65d3ffaa);
            background-origin: border-box;
            background-clip: content-box, border-box;
            margin: 10px auto;
        }

        h1 {
            text-align: center;
            height: 45px;
            margin-top: 45px;
        }

        .item-text {
            margin: 0 auto;
            text-align: center;
        }

        body {
            background-color: rgba(252, 255, 255, 0.842);
        }

        .ookisa{
            width: 300px;
            height: 30px;
            border: 1.5px solid black;
        }

        .account-box {

            background-color: rgb(178, 222, 76);
            width: 350px;
            height: 40px;
            margin-top: 25px;
            font-size: 15px;
            font-weight: bold;
        }

        .sns-chk{
            display: flex;
            justify-content: center;
        }

        .test .sns-chk label{
            margin-right: 35px;
        }

        .msg {
            height: 30px;
            text-align:center;
            font-size:16px;
            color:red;
            margin-bottom: 20px;
        }

        i {
            margin-top: 28px;
        }

        .logo {
            text-align: center;
            margin-top: 50px;
        }

        .logo .N {
            font-family: "Lobster", cursive;
            font-size: 85px;
            color: skyblue;
        }
        .logo .C {
            font-family: "Lobster", cursive;
            font-size: 85px;
            color: greenyellow;
        }
        .logo .inside {
            font-family: "Lobster", cursive;
            font-size: 85px;
            color: orange;
        }

        .inner {
            margin: 0 auto;
            width: 310px;
        }


        .registerForm {
            width: 100%;
        }


    </style>
    <title>Register</title>
</head>
<body>
<div class="registerForm">
    <div class="inner">
    <a href="<c:url value='/'/> ">
        <div class="logo">
            <span class="N">N</span>
            <span class="C">C</span>
            <span class="inside">inside</span>
        </div>
    </a>

    <div class="item-text">
        <form action="<c:url value='/register/save'/>" method="post" onsubmit="return formCheck(this)">
            <%--    <form:form modelAttribute="user">--%>
            <div id="msg" class="msg"><form:errors path="user.id"></form:errors></div>
            <div class="text-all">
                <p>
                    <label for="userID" class="id"><span style="font-weight: bold;">ユーザID</span></label><br>
                    <input id="userID" type="text" name="id" class="ookisa" placeholder="8 ~ 12桁の英語の大文字、小文字と数字の組み合わせ">
                </p>
                <p>
                    <label for="password"><span style="font-weight: bold;">パスワード</span></label><br>
                    <input id="password" type="password" name="pwd" class="ookisa" placeholder="8 ~ 12桁の英語の大文字、小文字と数字の組み合わせ">
                </p>
                <p>
                    <label for="name" class="name"><span style="font-weight: bold;">名前</span></label><br>
                    <input id="name" type="text" name="name" class="ookisa" placeholder="木村拓哉">
                </p>
                <p>
                    <label for="email"><span style="font-weight: bold;">メールアドレス</span></label><br>
                    <input id="email" type="email" name="email" class="ookisa" placeholder="example@gmail.com">
                </p>
                <p>
                    <label><span style="font-weight: bold;">生年月日</span></label><br>
                    <input class="ookisa" type="text" name="birth" placeholder="2023-1-1">
                <div class="test">
                    <div class="sns-chk">
                        <label><input type="checkbox" name="sns" value="facebook"/>facebook</label>
                        <label><input type="checkbox" name="sns" value="line"/>line</label>
                        <label><input type="checkbox" name="sns" value="instagram"/>instagram</label>
                    </div>
                </div>
                <input type="submit" value="新規登録" class="account-box"/>
                </p>
            </div>
            <a href="<c:url value='/login'/>">すでにアカウントお持ちの方（ログインページ）</a>
            <%--  </form:form>--%>
        </form>
    </div>
    </div>
</div>
</div>
<script>
    function formCheck(frm) {
        let msg ='';
        if(frm.id.value.length<3) {
            setMessage('IDは３桁以上入力して下さい', frm.id);
            return false;
        }
        if(frm.pwd.value.length<3) {
            setMessage('パスワードは３桁以上入力して下さい', frm.pwd);
            return false;
        }
        if(frm.name.value.length == 0) {
            setMessage('名前を入力して下さい', frm.pwd);
            return false;
        }
        if(frm.email.value.length == 0) {
            setMessage('メールアドレスを入力して下さい', frm.pwd);
            return false;
        }
        return true;
    }
    function setMessage(msg, element){
        document.getElementById("msg").innerHTML = `<i class="fa fa-exclamation-circle"> ${'${msg}'}</i>`;
        if(element) {
            element.select();
        }
    }
</script>
</body>
</html>
