<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Login_page.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #667eea, #764ba2);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .login-box {
            background: #fff;
            padding: 30px;
            width: 350px;
            border-radius: 10px;
            box-shadow: 0px 10px 25px rgba(0,0,0,0.2);
        }

        .login-box h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        .login-box label {
            font-weight: bold;
        }

        .login-box input[type=text],
        .login-box input[type=password] {
            width: 100%;
            padding: 10px;
            margin: 8px 0 15px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        .login-box button {
            width: 100%;
            padding: 10px;
            background: #667eea;
            border: none;
            color: #fff;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
        }

        .login-box button:hover {
            background: #5a67d8;
        }

        .result {
            text-align: center;
            margin-top: 15px;
            font-weight: bold;
        }
    </style>
</head>

<body>
<form id="form1" runat="server">
    <div class="login-box">
        <h2>User Login</h2>

        <label>Username</label>
        <asp:TextBox ID="txtname" runat="server"></asp:TextBox>

        <label>Password</label>
        <asp:TextBox ID="txtpass" runat="server" TextMode="Password"></asp:TextBox>

        <asp:Button ID="btn" runat="server" Text="Login" OnClick="btn_save" />

        <asp:Label ID="lblresult" runat="server" CssClass="result"></asp:Label>
    </div>
</form>
</body>
</html>
