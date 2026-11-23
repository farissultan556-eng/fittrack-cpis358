<%@ Page Language="C#" AutoEventWireup="true" CodeFile="About.aspx.cs" Inherits="About" %>
<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <title> FitTrack - About Us </title>
    <link rel="stylesheet" href="style.css" />
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
            <div class="status-bar">
                <asp:Label ID="lblSessionStatus" runat="server" Font-Bold="true"></asp:Label>
            </div>

            <div class="box" style="text-align: center;">
                <img src="https://placehold.co/650x130/1b4332/ffffff?text=FitTrack+-+Click+Here+For+About+Us"
                     alt="FitTrack Banner" usemap="#fitmap" style="border-radius: 8px; max-width: 100%;" />
                <map name="fitmap">
                    <area shape="rect" coords="0,0,650,130" href="About.aspx" alt="About Us" />
                </map>
            </div>

            <article class="box">
                <h1 style="color: #1b4332; margin-bottom: 10px;">About FitTrack</h1>
                <p>FitTrack is a full-stack web application developed for CPIS-358 at King Abdulaziz University using HTML, CSS, JavaScript, and ASP.NET with SQL Server.</p>
            </article>

            <section class="box">
                <h2>Project Team Members</h2>
                <table>
                    <thead>
                        <tr>
                            <th>Student Name</th>
                            <th>Student ID</th>
                            <th>Section</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Ahmad Ghandourah</td>
                            <td>2436155</td>
                            <td>IS3</td>
                        </tr>
                        <tr>
                            <td>Faris Almutairi</td>
                            <td>2436226</td>
                            <td>IS3</td>
                        </tr>
                    </tbody>
                </table>
            </section>
        </div>

        <footer>
            <p>&copy; 2026 FitTrack Project - CPIS-358 (Assignment 3)</p>
        </footer>
    </form>
    <script src="script.js"></script>
</body>
</html>
