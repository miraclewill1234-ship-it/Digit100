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
