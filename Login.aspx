<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>
<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <title>FitTrack - Login</title>
    <link rel="stylesheet" href="style.css" />
    <style>
        .form-card { max-width: 450px; margin: 0 auto; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <header>
            <h2>FitTrack Hub</h2>
            <nav>
                <ul>
                    <li><a href="Default.aspx">Home</a></li>
                    <li><a href="Login.aspx">Login</a></li>
                    <li><a href="Signup.aspx">Sign Up</a></li>
                    <li><a href="About.aspx">About Us</a></li>
                    <li><button type="button" id="theme-btn" class="btn" onclick="toggleTheme()" style="padding: 6px 12px;">Dark Mode</button></li>
                </ul>
            </nav>
        </header>

        <div class="container">
            <div class="box" style="text-align: center;">
                <img src="https://placehold.co/650x130/1b4332/ffffff?text=FitTrack+-+Click+Here+For+About+Us"
                     alt="FitTrack Banner" usemap="#fitmap" style="border-radius: 8px; max-width: 100%;" />
                <map name="fitmap">
                    <area shape="rect" coords="0,0,650,130" href="About.aspx" alt="About Us" />
                </map>
            </div>

            <section class="box form-card">
                <h2 style="margin-bottom: 15px; color: #1b4332;">Member Login (ASP.NET)</h2>
                <div class="input-group">
                    <label for="txtEmail">Email Address:</label>
                    <asp:TextBox ID="txtEmail" runat="server" ClientIDMode="Static" placeholder="e.g. faris@fittrack.com"></asp:TextBox>
                </div>
                <div class="input-group">
                    <label for="txtPassword">Password:</label>
                    <asp:TextBox ID="txtPassword" runat="server" ClientIDMode="Static" TextMode="Password" placeholder="Enter your password"></asp:TextBox>
                </div>
                <div class="input-group">
                    <asp:CheckBox ID="chkRemember" runat="server" Text=" Remember Me (Save Email in Cookie)" />
                </div>
                <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn" OnClientClick="return validateLoginClient();" OnClick="btnLogin_Click" />
                <asp:Label ID="lblMessage" runat="server" CssClass="msg-error"></asp:Label>
                <p style="margin-top: 15px;">New to FitTrack? <a href="Signup.aspx">Create an account</a>.</p>
            </section>
        </div>

        <footer>
            <p>&copy; 2026 FitTrack Project - CPIS-358 (Assignment 3)</p>
        </footer>
    </form>
    <script src="script.js"></script>
</body>
</html>
