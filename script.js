// External JavaScript File
function handleLogin(event) {
    event.preventDefault();
    var user = document.getElementById("userEmail").value;
    alert("Welcome back to FitTrack, " + user + "!");
}

function handleSignup(event) {
    event.preventDefault();
    var name = document.getElementById("userName").value;
    alert("Account created successfully! Welcome to FitTrack, " + name + "!");
}