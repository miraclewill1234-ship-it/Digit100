window.addEventListener("DOMContentLoaded", init, false);

function init() {
  alert("Hi GUYSSSSSS!");

  var buttons = document.getElementsByTagName("button");

  buttons[0].addEventListener("click", changeColor, false);
  buttons[1].addEventListener("click", newFunction, false);
}

function changeColor() {
  var colorMe1 = document.getElementById("colorToggle");
  colorMe1.style.backgroundColor = "Red";
}

function newFunction() {}

function login() {
  var username = document.getElementById("username").value;
  var password = document.getElementById("password").value;
  var message = document.getElementById("message");

  if (username == "student" && password == "1234") {
    message.innerHTML = "Login successful!";
  } else {
    message.innerHTML = "Wrong username or password.";
  }
}
