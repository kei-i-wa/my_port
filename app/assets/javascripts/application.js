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

// テストのために記述


// $(document).ready(function () {
//   $('.jquery').on('click', function(){
//     $(this).css('color','red');
//   });
// });

// /*アニメーションターゲット取得し、画面上に見えたらアニメーションする*/
const targetElement = document.querySelectorAll(".animationTarget");
// console.log(targetElement);
// 上からのきょりようし自身の高さを取得し、今どれくらいかを判断
for (let i = 0; i < targetElement.length; i++){
  const getElementDistance = targetElement[i].getBoundingClientRect().top
  // これで上からの距離をとる
  // いま見えてるとこから、その要素の画像の上までの距離
  
  console.log(getElementDistance);
}