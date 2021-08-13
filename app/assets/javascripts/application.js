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


//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

//= require chartkick
//= require Chart.bundle

//= require summernote/summernote-bs4.min
//= require summernote-init


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






const scrollEvent = function () {
    window.addEventListener("scroll", function () {
        // スクロール量の取得
        let scrollValue = window.pageYOffset;

        // 要素の取得
        let scrollEle = document.getElementsByClassName("animationTarget");
        console.log(scrollEle)
        // 画面の高さを取得
        let windowHeight = window.innerHeight;
        console.log(windowHeight)
        // はみ出させる値（お好みで設定）
        let value = 100;

        // 条件設定
        for (let a = 0; a < scrollEle.length; a++) {
            // 取得した要素のtop値の取得 + スクロール量
            let scrollTop = scrollEle[a].getBoundingClientRect().top + scrollValue;
            if (scrollValue > scrollTop - windowHeight + value) {
                scrollEle[a].classList.add("js-fade");
            }
        }
    });
};

scrollEvent();

