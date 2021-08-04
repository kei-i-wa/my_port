(function() {
    var search_list = $(".contents");

  function appendUser(user) {
    var html = `
               <div class="user_content">
                 <p class="user_name">
                   #{user.name}
                 </p>
               </div>
               `
    search_list.append(html);
   }

  function appendErrMsgToHTML(msg) {
    var html = `
　　　　　　　　　　<div class="user_content">
                 　<p class="user_name">
                  　　${ msg }
                 　</p>
                 </div>
　　　　　　　　　`
    search_list.append(html);
  }
  
  
  $(".search_input").on("keyup", function() {
    var input = $(".search_input").val();
    
        $.ajax({
      type: 'GET',
      url: '/users/searches',
      data: { keyword: input },
      dataType: 'json'
    })
    
        .done(function(users) {
      $(".contents").empty();
      if (users.length !== 0) {
        users.forEach(function(user){
          appendUser(user);
        });
      } else {
        appendErrMsgToHTML("一致するユーザーはいません");
      }
    })
    .fail(function() {
      alert('error');
    });
  });
});

