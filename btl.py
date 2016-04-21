from bottle import route , template , run , static_file , response , request
import json

#API用のデータ
test_ary = []

#テスト用ページを表示させる
@route('/')
def toppage():
    return template('index')

#jsファイルなど静的ファイルを表示させる
@route('/static/<filename:path>')
def static(filename):
    return static_file(filename, root="./static")


#JSONを返すAPIの部分
@route('/ichiran' , method='GET')
def ichiran():
    #URLパラメータを取得する
    wd = request.query.word
    #JSONで返すときはこうする
    response.content_type = 'application/json'

    #配列をJSONに変化、パラメータの文字列が入っているものだけを返すようにリスト内包表記で書いた
    return json.dumps([x for x in test_ary if x.find(wd) > -1])

if __name__ == '__main__':

    #ajax用のAPIのデータ。本来ならDBとかからとってくるけど、試しなのでテキストで
    f = open('ichiran.txt','r')
    for line in f:
        test_ary.append(line)
    f.close()

    #bottleのデバッグサーバー起動
    run(host='127.0.0.1', port=8080 , reloader=True , debug=True)
