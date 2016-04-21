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

      });
    </script>
</head>
<body>
  <div>
    オートコンプートテスト
    <input id="autc">
  </div>

</body>
</html>
