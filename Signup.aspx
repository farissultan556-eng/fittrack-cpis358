<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Signup.aspx.cs" Inherits="Signup" %>
<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <title>FitTrack - Sign Up</title>
    <link rel="stylesheet" href="style.css" />
    <style>
        .form-card { max-width: 500px; margin: 0 auto; }
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
                <h2 style="margin-bottom: 15px; color: #1b4332;">Create Your FitTrack Account</h2>
                <div class="input-group">
                    <label for="txtFullName">Full Name:</label>
                    <asp:TextBox ID="txtFullName" runat="server" ClientIDMode="Static" placeholder="e.g. Faris Almutairi"></asp:TextBox>
                </div>
                <div class="input-group">
                    <label for="txtRegEmail">Email Address:</label>
                    <asp:TextBox ID="txtRegEmail" runat="server" ClientIDMode="Static" placeholder="name@example.com"></asp:TextBox>
                </div>
                <div class="input-group">
                    <label for="txtRegPass">Password (min 6 characters):</label>
                    <asp:TextBox ID="txtRegPass" runat="server" ClientIDMode="Static" TextMode="Password" placeholder="Create a password"></asp:TextBox>
                </div>
                <asp:Button ID="btnSignup" runat="server" Text="Sign Up" CssClass="btn" OnClientClick="return validateSignupClient();" OnClick="btnSignup_Click" />
                <asp:Label ID="lblSignupMsg" runat="server" CssClass="msg-success"></asp:Label>
            </section>
        </div>

        <footer>
            <p>&copy; 2026 FitTrack Project - CPIS-358 (Assignment 3)</p>
        </footer>
    </form>
    <script src="script.js"></script>
</body>
</html>
