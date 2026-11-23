// External JavaScript File - Assignment 2
// Covers: Functions, Events, Form Validation, Control Statements (if/else), Repetition (for loop), Changing HTML & CSS

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

// 1. Change HTML elements and CSS Styles using script (Dark Mode Toggle with Loop & If/Else)
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

    // Repetition (for loop) to update all box elements dynamically
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

// 2. Dynamic Picture & Text using Function and Event
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

// 3. Dynamic Elements + Repetition (Generate Exercises List using a for loop)
function loadRecommendedExercises() {
    const exercises = [
        "1. Barbell Bench Press - 4 sets x 8-10 reps",
        "2. Lat Pulldown - 4 sets x 10-12 reps",
        "3. Barbell Squat - 4 sets x 8 reps",
        "4. Overhead Dumbbell Press - 3 sets x 10 reps",
        "5. Plank Core Hold - 3 sets x 60 seconds"
    ];

    const listContainer = document.getElementById("dynamic-exercise-list");
    if (!listContainer) return;

    listContainer.innerHTML = ""; // Clear existing items

    // Using repetition (for loop) to dynamically create HTML elements
    for (let i = 0; i < exercises.length; i++) {
        const li = document.createElement("li");
        li.innerText = exercises[i];
        li.style.padding = "6px 0";
        li.style.borderBottom = "1px solid #ccc";
        listContainer.appendChild(li);
    }
}

// 4. Form Validation using script (Login Form)
function handleLogin(event) {
    event.preventDefault();
    const emailInput = document.getElementById("userEmail");
    const passInput = document.getElementById("userPass");
    const errorBox = document.getElementById("loginError");

    const email = emailInput.value.trim();
    const pass = passInput.value.trim();

    // Control statements (if / else if / else) for validation
    if (email === "" || !email.includes("@")) {
        errorBox.style.display = "block";
        errorBox.innerText = "Error: Please enter a valid email address containing '@'.";
        emailInput.style.borderColor = "#d90429";
        return false;
    } else if (pass.length < 6) {
        errorBox.style.display = "block";
        errorBox.innerText = "Error: Password must be at least 6 characters long.";
        emailInput.style.borderColor = "#bbb";
        passInput.style.borderColor = "#d90429";
        return false;
    } else {
        errorBox.style.display = "none";
        emailInput.style.borderColor = "#2d6a4f";
        passInput.style.borderColor = "#2d6a4f";
        alert("Login Successful! Welcome back to FitTrack, " + email + "!");
        return true;
    }
}

// 5. Form Validation using script (Sign Up Form)
function handleSignup(event) {
    event.preventDefault();
    const nameInput = document.getElementById("userName");
    const emailInput = document.getElementById("regEmail");
    const passInput = document.getElementById("regPass");
    const errorBox = document.getElementById("signupError");

    const name = nameInput.value.trim();
    const email = emailInput.value.trim();
    const pass = passInput.value.trim();

    // Control statements (if / else) for validation
    if (name.length < 3) {
        errorBox.style.display = "block";
        errorBox.innerText = "Error: Full name must be at least 3 characters.";
        nameInput.style.borderColor = "#d90429";
        return false;
    } else if (!email.includes("@") || !email.includes(".")) {
        errorBox.style.display = "block";
        errorBox.innerText = "Error: Please enter a valid email address.";
        nameInput.style.borderColor = "#bbb";
        emailInput.style.borderColor = "#d90429";
        return false;
    } else if (pass.length < 6) {
        errorBox.style.display = "block";
        errorBox.innerText = "Error: Password must be at least 6 characters long.";
        emailInput.style.borderColor = "#bbb";
        passInput.style.borderColor = "#d90429";
        return false;
    } else {
        errorBox.style.display = "none";
        alert("Registration Successful! Welcome to FitTrack, " + name + "!");
        return true;
    }
}
