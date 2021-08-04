$(function(){
  
  var search_list = $(".showZone");
  function appendUser(user) {
    var html = `<div class="user_box col-md-2 mr-4">
                 <a href="/users/${user.id}">
                 <div style="text-align:center;">未選択</div>
                 <div style="text-align:center;">${user.name}</div>
                 </div>`
               
    search_list.append(html);
   }

  function appendErrMsgToHTML(msg) {
    var html = `<div class='name'>${ msg }</div>`
    search_list.append(html);
  }
  console.log('test');
  // 何か入力される度に動作する
  $(".search_input").on("keyup",function() {
    console.log('test2');

  // 打ち込まれた値をinputとする
    var input = $(".search_input").val();
  // 動作確認のための出力
    console.log(input);

  // 非同期通信を行います
    $.ajax({
  // データー取得なのでGET
      type:'GET',
  // 非同期通信を行うurl
      url: '/users/searches',
  // urlに送るワード
      data: {keyword: input},
  // サーバーから値を返す時はjson index.json.builderが読まれる
      dataType:'json'
    })
  // usersを引っ張ってきた
    .done(function(users){
  // 動作かくにんのための記述
      // console.log(users);
  // 該当クラスの中の子要素削除？？
      $(".showZone").empty();
  // もし該当が１でもあったら
      if(users.length!== 0){
  // レコードを１つずつとりだして
      users.forEach(function(user){
  // 出現させる
      appendUser(user);
        });
      }else{
        appendErrMsgToHTML("一致する投稿はありません");
      }
    })
    .fail(function(){
      alert('error');
    });
    
  });
});
// コンソールログで出力ができない
// ここまでですでにうまく渡せていないきがする









// $(document).on('turbolinks:load', function(){
//   $(document).on('keyup', '.search-input', function(e){
//     e.preventDefault();
//     var input = $.trim($(this).val());
//     $.ajax({ //ajax通信で以下のことを行います
//       url: '/users/search', //urlを指定
//       type: 'GET', //メソッドを指定
//       data: ('keyword=' + input), //コントローラーに渡すデータを'keyword=input(入力された文字のことですね)'にするように指定
//       processData: false, //おまじない
//       contentType: false, //おまじない
//       dataType: 'json' //データ形式を指定
//     })
//       .done(function(data){ //データを受け取ることに成功したら、dataを引数に取って以下のことする(dataには@usersが入っている状態ですね)
//       $('#result').find('li').remove();  //idがresultの子要素のliを削除する
//       $(data).each(function(i, user){ //dataをuserという変数に代入して、以下のことを繰り返し行う(単純なeach文ですね)
//         $('#result').append('<li>' + user.name + '</li>') //resultというidの要素に対して、<li>ユーザーの名前</li>を追加する。
//       });
//     })
//   });
// });




