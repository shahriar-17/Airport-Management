var x = document.getElementById('login');
var y = document.getElementById('register');
var z = document.getElementById('btn');
var modal = document.getElementById('login-form');
var loginButton = document.getElementById('loginButton');

function register() {
    x.style.left = '-400px';
    y.style.left = '50px';
    z.style.left = '110px';
}

function login() {
    x.style.left = '50px';
    y.style.left = '450px';
    z.style.left = '0px';
}



window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
};

window.addEventListener('load', function() {
    var loginForm = document.getElementById('login-form');
    loginForm.style.opacity = '1';
});

// This code ensures that the login form is displayed on the "admin-login.html" page
if (loginButton) {
    loginButton.onclick = function() {
        modal.style.display = "block";
    };
}

document.getElementById('downloadButton').addEventListener('click', function() {
    fetch('/buy') // Replace with your server route
        .then(response => response.blob())
        .then(blob => {
            const url = window.URL.createObjectURL(blob);
            const a = document.createElement('a');
            a.href = url;
            a.download = '/js/script.js'; // Replace with the desired file name
            document.body.appendChild(a);
            a.click();
            window.URL.revokeObjectURL(url);
        })
        .catch(error => console.error('Error downloading file:', error));
});

document.getElementById('goToUsersButton').addEventListener('click', function() {
    window.location.href = '/users'; // Redirect to the "/users" path
});




