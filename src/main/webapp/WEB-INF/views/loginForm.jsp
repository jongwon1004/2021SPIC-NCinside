<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.net.URLDecoder" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Lobster&display=swap"/>
    <style>
        * { box-sizing:border-box;}
        a { text-decoration: none; }
        form {
            width:400px;
            height:500px;
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
        input[type='text'], input[type='password'] {
            width: 300px;
            height: 40px;
            border : 1px solid rgb(177, 210, 99);
            border-radius:5px;
            padding: 0 10px;
            margin-bottom: 10px;
        }
        button {
            background-color: rgb(178, 222, 76);
            color : white;
            width:300px;
            height:50px;
            font-size: 17px;
            border : none;
            border-radius: 5px;
            margin : 20px 0 30px 0;
        }
        #title {
            font-size : 50px;
            margin: 40px 0 30px 0;
        }
        #msg {
            height: 30px;
            text-align:center;
            font-size:16px;
            color:red;
            margin-bottom: 20px;
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


        .loginForm {
            width: 100%;
        }
    </style>
</head>
<body>
<div class="loginForm">
    <div class="inner">
        <a href="<c:url value='/'/> ">
        <div class="logo">
        <span class="N">N</span>
        <span class="C">C</span>
        <span class="inside">inside</span>
        </div>
        </a>
        <form action="<c:url value='/login/login'/>" method="post" onsubmit="return formCheck(this);">
            <h3 id="title">Login</h3>
            <div id="msg">
                ${msg}
                <c:if test="${not empty param.msg}">
                    <i class="fa fa-exclamation-circle"> ${URLDecoder.decode(param.msg)}</i>
                </c:if>
            </div>
            <input type="text" name="id" value="${cookie.id.value}" placeholder="ID入力" autofocus>
            <input type="password" name="pwd" placeholder="パスワード">
            <input type="hidden" name="toURL" value="${param.toURL}">
            <button>ログイン</button>
            <div>
            <label><input type="checkbox" name="rememberId" ${empty cookie.id.value ? "" : "checked"}>ID記憶</label> |
            <a href="">パスワード検索</a> |
            <a href="<c:url value='/register/save'/>">新規登録</a>
            </div>
            <script>
                function formCheck(frm) {
                    let msg ='';

                    if(frm.id.value.length==0) {
                        setMessage('idを入力してください。', frm.id);
                        return false;
                    }

                    if(frm.pwd.value.length==0) {
                        setMessage('パスワードを入力してください。', frm.pwd);
                        return false;
                    }
                    return true;
                }

                function setMessage(msg, element){
                    document.getElementById("msg").innerHTML = ` ${'${msg}'}`;

                    if(element) {
                        element.select();
                    }
                }
            </script>
        </form>
    </div>
</div>
</div>
</body>
</html>