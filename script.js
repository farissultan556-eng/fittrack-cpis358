// External JavaScript File - FitTrack
let isDarkMode = false;
let currentBannerIndex = 0;

const banners = [
    {
        img: "https://placehold.co/650x130/1b4332/ffffff?text=FitTrack+-+Push+Day+Motivation",
        text: "Focus on progressive overload and proper form today!"
    },
    {
        img: "https://placehold.co/650x130/004d40/ffffff?text=FitTrack+-+High+Protein+Nutrition",
        text: "Hit your daily protein target: 1.6g to 2.2g per kg of body weight."
    },
    {
        img: "https://placehold.co/650x130/2d6a4f/ffffff?text=FitTrack+-+Stay+Hydrated+%26+Consistent",
        text: "Drink 3 liters of water and get 8 hours of sleep for recovery."
    }
];

function toggleTheme() {
    isDarkMode = !isDarkMode;
    const body = document.body;
    const boxes = document.getElementsByClassName("box");
    const themeBtn = document.getElementById("theme-btn");

    if (isDarkMode) {
        body.style.backgroundColor = "#121212";
        body.style.color = "#e0e0e0";
        if (themeBtn) themeBtn.innerText = "Light Mode";
    } else {
        body.style.backgroundColor = "#f8f9fa";
        body.style.color = "#212529";
        if (themeBtn) themeBtn.innerText = "Dark Mode";
    }

    for (let i = 0; i < boxes.length; i++) {
        if (isDarkMode) {
            boxes[i].style.backgroundColor = "#1e1e1e";
            boxes[i].style.color = "#e0e0e0";
            boxes[i].style.borderColor = "#2d6a4f";
        } else {
            boxes[i].style.backgroundColor = "#ffffff";
            boxes[i].style.color = "#212529";
            boxes[i].style.borderColor = "#d8f3dc";
        }
    }
}

function changeBanner() {
    currentBannerIndex = (currentBannerIndex + 1) % banners.length;
    const bannerImg = document.getElementById("dynamic-banner");
    const bannerText = document.getElementById("dynamic-text");

    if (bannerImg && bannerText) {
        bannerImg.src = banners[currentBannerIndex].img;
        bannerText.innerText = banners[currentBannerIndex].text;
        bannerText.style.color = "#2d6a4f";
    }
}

function validateLoginClient() {
    const email = document.getElementById("txtEmail").value.trim();
    const pass = document.getElementById("txtPassword").value.trim();
    if (email === "" || !email.includes("@")) {
        alert("Please enter a valid email address.");
        return false;
    }
    if (pass.length < 6) {
        alert("Password must be at least 6 characters.");
        return false;
    }
    return true;
}

function validateSignupClient() {
    const name = document.getElementById("txtFullName").value.trim();
    const email = document.getElementById("txtRegEmail").value.trim();
    const pass = document.getElementById("txtRegPass").value.trim();
    if (name.length < 3) {
        alert("Full name must be at least 3 characters.");
        return false;
    }
    if (!email.includes("@")) {
        alert("Please enter a valid email address.");
        return false;
    }
    if (pass.length < 6) {
        alert("Password must be at least 6 characters.");
        return false;
    }
    return true;
}
