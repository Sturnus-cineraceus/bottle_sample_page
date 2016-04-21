<!DOCTYPE html>
<html>
<head>
    <title>オートコンプリートテスト</title>
    <link rel="stylesheet" type="text/css" href="/static/jquery-ui.min.css">
    <script src="/static/jquery-2.2.3.min.js"></script>
    <script src="/static/jquery-ui.min.js"></script>
    <script>
      $(function(){

        /* オートコンプリート機能を開始させる */
        $("#autc").autocomplete({
          source: function( req,res){
            $.ajax({
                //特定のURLに今テキストエリアに入力している文字をくっつけてアクセスする
                url: "/ichiran?word=" + encodeURIComponent(req.term),
                dataType: "json",
                success: function( data ) {
                    res(data);
                }
            });
      },
      autoFocus: true,
      delay: 500,
      minLength: 1
    });

    /* オートコンプリート機能を開始させる */
    $("#autc2").autocomplete({
      source: function( req,res){
        $.ajax({
            //特定のURLに今テキストエリアに入力している文字をくっつけてアクセスする
            url: "/hoge",
            dataType: "html",
            success: function( data ) {

                var ajrex = [];
                $div =  $(data).filter("#damedame");
                console.log($div);
                $("> p" , $div).each(function(){
                  var txt = $(this).text();
                  if(txt.indexOf(req.term) != -1) {
                    ajrex.push(txt);
                  }
                });

                res(ajrex);
            }
        });
    },
    autoFocus: true,
    delay: 500,
    minLength: 1
  });


    });
    </script>
</head>
<body>
  <div>
    オートコンプートテスト
    <input id="autc">
  </div>

  <div>
    オートコンプートテスト2
    <input id="autc2">
  </div>

</body>
</html>
