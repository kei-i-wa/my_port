// ターボリンクの個別無効化
$(document).on('turbolinks:load', function(){
// このアプリ（document)で、searc_inputで入力されるごとに、eという引数受け取る
  $(document).on('keyup', '.search_input_posts', function(e){
// キャンセル可能なイベントをキャンセル
    e.preventDefault();
// 入力された言葉を取得し、前後の余白をtrimで取り除き、inputに代入する
    var input = $.trim($(this).val());
// 値の受け渡しができるかの確認用
    console.log('test2');

// 非同期通信・行う場所・メソッド等、jsonで渡す
    $.ajax({
      url: '/posts/searches',
      type: 'GET',
// コントローラーに渡す値を入力された値にする
      data: ('posts_keyword=' + input),
      processData: false,
      contentType: false,
      dataType: 'json'
    })
// 通信が成功した時の処理が以下
    .done(function(data){
    // $('.js-users li').remove();
// idがresultの子要素liを削除する
    $('#result_posts').find('li').remove();
// dateをuserという変数に代入し以下を繰り返し処理する
    $(data).each(function(i,post) {
    $('#result_posts').append(`<li class="post"><a href="/posts/${post.id}">${post.title}</a></li>`)

});
    })
  });
});
