<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>
<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <title>FitTrack - Home (ASP.NET)</title>
    <link rel="stylesheet" href="style.css" />
    <style>
        .hero-section {
            background-color: #d8f3dc;
            border-left: 6px solid #1b4332;
        }
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
                    <li><a href="#workout-crud">Workouts DB</a></li>
                    <li><button type="button" id="theme-btn" class="btn" onclick="toggleTheme()" style="padding: 6px 12px;">Dark Mode</button></li>
                </ul>
            </nav>
        </header>

        <div class="container">
            <!-- Session & Cookie Status Bar -->
            <div class="status-bar">
                <div>
                    <asp:Label ID="lblSessionUser" runat="server" Font-Bold="true" Text="Guest User (Not Logged In)"></asp:Label>
                    <br />
                    <asp:Label ID="lblCookieInfo" runat="server" Font-Size="Small" ForeColor="#2d6a4f"></asp:Label>
                </div>
                <asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="btn btn-danger" Visible="false" OnClick="btnLogout_Click" />
            </div>

            <!-- Image Mapping linking to About Us + Dynamic JS -->
            <div class="box" style="text-align: center;">
                <p style="margin-bottom: 8px; font-weight: bold;">Click the Banner Below to Visit About Us (Image Map)</p>
                <img id="dynamic-banner" src="https://placehold.co/650x130/1b4332/ffffff?text=FitTrack+-+Click+Here+For+About+Us"
                     alt="FitTrack Banner" usemap="#fitmap" style="border-radius: 8px; max-width: 100%;" />
                <map name="fitmap">
                    <area shape="rect" coords="0,0,650,130" href="About.aspx" alt="About Us" />
                </map>
                <p id="dynamic-text" style="margin-top: 10px; font-weight: bold;">Welcome to FitTrack ASP.NET Edition!</p>
                <button type="button" class="btn" onclick="changeBanner()" style="margin-top: 10px;">Change Picture & Tip (JS)</button>
            </div>

            <!-- Article -->
            <article class="box hero-section">
                <h1>Track Your Daily Fitness & Workouts</h1>
                <p style="margin-top: 8px;">Manage your weekly workout schedule directly in our SQL Server database using ASP.NET CRUD operations.</p>
                <p id="daily-tip" style="margin-top: 10px; font-weight: bold; color: #1b4332;"></p>
            </article>

            <!-- ASP.NET CRUD Operations Section -->
            <section id="workout-crud" class="box">
                <h2>Workout Schedule Manager (ASP.NET Database CRUD)</h2>
                <p style="margin-bottom: 12px;">Insert, Update, Delete, Retrieve, and Search workouts stored in SQL Server.</p>

                <!-- Search Bar -->
                <div class="input-group" style="display: flex; gap: 10px; align-items: center;">
                    <asp:TextBox ID="txtSearch" runat="server" placeholder="Search by Day or Muscle Group..."></asp:TextBox>
                    <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn" OnClick="btnSearch_Click" />
                    <asp:Button ID="btnShowAll" runat="server" Text="Show All" CssClass="btn" OnClick="btnShowAll_Click" />
                </div>

                <!-- Add / Update / Delete Form -->
                <div style="margin-top: 15px; border-top: 1px solid #ddd; padding-top: 15px;">
                    <div class="input-group">
                        <label>Workout ID (Required for Update / Delete only):</label>
                        <asp:TextBox ID="txtWorkoutID" runat="server" placeholder="Enter Workout ID (e.g. 1)"></asp:TextBox>
                    </div>
                    <div class="input-group">
                        <label>Day:</label>
                        <asp:TextBox ID="txtDay" runat="server" placeholder="e.g. Thursday"></asp:TextBox>
                    </div>
                    <div class="input-group">
                        <label>Muscle Group:</label>
                        <asp:TextBox ID="txtMuscle" runat="server" placeholder="e.g. Shoulders & Abs"></asp:TextBox>
                    </div>
                    <div class="input-group">
                        <label>Duration:</label>
                        <asp:TextBox ID="txtDuration" runat="server" placeholder="e.g. 45 Mins"></asp:TextBox>
                    </div>
                    <div class="input-group">
                        <label>Intensity:</label>
                        <asp:DropDownList ID="ddlIntensity" runat="server">
                            <asp:ListItem Text="High" Value="High" />
                            <asp:ListItem Text="Moderate" Value="Moderate" />
                            <asp:ListItem Text="Low" Value="Low" />
                        </asp:DropDownList>
                    </div>

                    <asp:Button ID="btnInsert" runat="server" Text="Insert Workout" CssClass="btn" OnClick="btnInsert_Click" />
                    <asp:Button ID="btnUpdate" runat="server" Text="Update Workout" CssClass="btn" OnClick="btnUpdate_Click" />
                    <asp:Button ID="btnDelete" runat="server" Text="Delete Workout" CssClass="btn btn-danger" OnClick="btnDelete_Click" />
                    <asp:Label ID="lblCrudStatus" runat="server" CssClass="msg-success"></asp:Label>
                </div>

                <!-- Retrieve Data GridView -->
                <asp:GridView ID="gvWorkouts" runat="server" AutoGenerateColumns="true" EmptyDataText="No workouts found.">
                </asp:GridView>
            </section>

            <!-- Nutrition List -->
            <section class="box">
                <h2>Core Nutrition Principles</h2>
                <ul style="margin-left: 20px; margin-top: 10px; line-height: 1.8;">
                    <li>Maintain a daily calorie deficit for fat loss or surplus for muscle gain.</li>
                    <li>Consume 1.6g to 2.2g of protein per kg of body weight daily.</li>
                    <li>Stay hydrated with at least 3 liters of water per day.</li>
                </ul>
            </section>
        </div>

        <footer>
            <p>&copy; 2026 FitTrack Project - CPIS-358 (Assignment 3)</p>
        </footer>
    </form>

    <script>
        document.getElementById("daily-tip").innerText = "Tip of the Day: Consistency beats perfection! Today is " + new Date().toDateString();
    </script>
    <script src="script.js"></script>
</body>
</html>
