// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require jquery
//= require jquery3
//= require popper
//= require bootstrap-sprockets

//= require summernote/summernote-bs4.min
//= require summernote-init


//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

//= require chartkick
//= require Chart.bundle




// 以下で、４つの要素を取得している
const targetElement = document.getElementsByClassName("animationTarget");
// ４件取得できる
// console.log(targetElement);
console.log("画面の高さ",window.innerHeight)

// 以下スクロールで検知します　の記述
document.addEventListener("scroll",function(){
  // ４件分上からの距離を取得する　for文で回す
  for (let i = 0; i < targetElement.length; i++){
  // 上からの距離と、その要素がある程度たっしてから　６割くらい見えたら
  const getElementDistance = targetElement[i].getBoundingClientRect().top + targetElement[i].clientHeight *.6
// 距離の取得ができない。
  // console.log(getElementDistance);
// いまのブラウザの高さ取得
//   if (i === 1){
//     console.log(getElementDistance)
// }
  if(window.innerHeight > getElementDistance) {
    // これにより、表示されたanimation targetのクラスにshowがつく
    targetElement[i].classList.add("show")
  }
  }
})

document.addEventListener("turbolinks:load", function() {
const tabs = document.getElementsByClassName("nav-link");
const tab_contents = document.getElementsByClassName("tab_contents_item");
// console.log(tabs);
// console.log(tab_contents);
for (let i = 0; i < tabs.length; i++){
tabs[i].addEventListener("click",function(e){
  e.preventDefault();

  for (let j = 0; j < tabs.length; j++){
    tabs[j].classList.remove("active");
  }
  for (let j = 0; j < tabs.length; j++){
    tab_contents[j].classList.remove("active");
  }
  tabs[i].classList.add("active");
  tab_contents[i].classList.add("active");
});
}
})

document.addEventListener("turbolinks:load", function() {
const forms = document.getElementsByClassName("form-group");
console.log(forms);
for (let k = 0; k < forms.length; k++){
  forms[k].addEventListener("blur", TurnOffValid);
  function TurnOffValid(){
  forms[k].classList.add('was-validated');
}}  
});
// const mail_div = document.getElementById('mail_div');


// addEventListener('focus', TurnOffValid);
// function TurnOffValid() {
//   mail.classList.remove('was-validated');
// }
