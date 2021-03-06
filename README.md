# op_tre_cru

### サービス概要
スマホアプリゲーム「トレジャークルーズ」をプレイするユーザーに対して、
効率的なイベント周回と、自分のプレイスタイルにあったフレンド（ゲーム内の機能）募集を提供する
Webアプリケーションです。

### メインのターゲットユーザー
スマホアプリゲーム「トレジャークルーズ」（以下、トレクル）をプレイするユーザー
イベント周回の見通しを立てたい、それに伴って自分のプレイスタイルに近いフレンドを募集したい

### ユーザーが抱える課題
イベント毎に、目標となるポイントを稼ぐためどれぐらい周回する必要があるのか分からない
自分の目的にあったフレンドを作りづらい
現状でフレンド募集をできるサイトはあるが、無法地帯に近く条件を設定できない上に自分の投稿が流れやすい
トレクル自体が8年目になり、ユーザー層が広がり希望のフレンドを作りにくい

### 解決方法
目標となるポイントに到達するためのイベント周回数を計算できる機能を提供することで、明確な周回数が分かりモチベーションが上がる。
フレンドを条件毎に募集できる場を提供することで、自分のプレイスタイルに合ったフレンド作成が容易になる。

### 実装予定の機能
- イベント周回数計算
  - 自分のポイント倍率から計算できる
  - 所持しているキャラを選択し、簡易的な倍率を選択できる
  - 目標ポイントをユーザーが設定し、それをもとに周回数が算出される
- プロフィール
  - ユーザーのプレイスタイル・所持キャラクター・ランクなどを設定できる
  - 過去のイベントの周回数または順位などを記録できる
  - フレンド申請を許可する条件もここで指定
- フレンド検索
  - 登録しているユーザーのプロフィールをもとにフレンドを検索できる
  - いくつかの条件を指定できる
- 管理ユーザー
  - 新キャラデータのCRUD
  - 新キャラに対する簡単なアンケートページCRUD
  - 管理ユーザーのCRUD
  - ユーザー管理

### なぜこのサービスを作りたいのか？
私自身、トレクルユーザーで歴もそれなりに長いのですがフレンド面でかなり不便だなと感じていたためです。
上記したようにフレンド募集をできるようなサイトはあるのですが、専門ではなく掲示板の様なので無法地帯になりやすく目的のフレンドを作成することがなかなかできませんでした。
そのため自分自身で、質の高いフレンドを募集できる場所を作ろうと思いました。

イベント周回数計算においては、よりトレクルを効率的にプレイできる様にしたいと思ったからです。
毎月イベントでのポイント倍率は所持しているキャラによって変わり、周回数も異なっていました。
この毎回変わる周回数を、簡単に計算できる様になれば私自身一トレクルユーザーとしてとても便利になると感じたからです。

1番の理由としては、純粋にトレクルが好きでそれに関するアプリケーションを作成したいと思ったからです。

### スケジュール
企画〜技術調査：済
README〜ER図作成：6/2 〆切
メイン機能実装：6/2 - 7/2
β版をRUNTEQ内リリース（MVP）：7/2 〆切
本番リリース：7月中旬

### Figma_URL
https://www.figma.com/file/mHZU6TtQSGBDgOllR9gyoD/TOP?node-id=0%3A1

### Draw.io URL
https://viewer.diagrams.net/?tags=%7B%7D&highlight=0000ff&edit=_blank&layers=1&nav=1&title=PF#R7V1tk9q6Ff41%2B%2FHu4Hf7Y3eTNm2TNpPcTttPO1qsBTfGpkZkl%2Fz6a2OJFx8EZrGQzdFMJrMWRgadx8%2FBz3nRnfM4e%2FtLQebTL3lM0zt7FL%2FdOR%2FubNsPvfL%2FamBVD3i2Uw9MiiSuh6ztwPfkF%2BWDIz66TGK62DuR5XnKkvn%2B4DjPMjpme2OkKPLX%2FdNe8nT%2FqnMyoWDg%2B5ikcPTfScym9WhoB9vxTzSZTMWVLT%2BqX5kRcTL%2FJospifPXnSHn453zWOQ5q%2F%2BavT3StFo7sS71%2B%2F4seXXzwQqasTZv%2BIf1g34aj%2F62fP38v69L63URfP30GzfGT5Iu%2BRdeLmix4J%2BYrcQylB9%2BXv3JyHM19LBgpGDcWs6oHCjXn5Eko0U5YK2P05TMF8n69HpkmqTxZ7LKl0xMJI4eXpI3Gn%2BrjVWdW9rtczlZdVhN%2FlJO%2Fp1%2FmOplkiaTrPx7XH716ooPBV2Un%2BUzWTB%2BBv9atGD0Tbpe1sYKJXppPqOsWJWniDcE3HArgUifD7xugWCFfGy6AwJbDBIOvslm8q19yj%2B4ic4wlwvMJbVU%2BUVZQtJv5U1BssnaaPs2qRY2LvL576SYUMYH5nlSLenHn%2BUibVY%2FSdPHPM0r02Z5Vs3E8jl%2FMaUv4r3POWP5TFiQL8dm0vVSeA%2Flv3JxHkf33p1XftzH8tjaHpf%2FqtML9phnC1aUgKrmoKVdX2ll23Z2lSMdGpsb12lpWkeVZT1g2a9%2FP8%2B2a%2F4jW9uebbZRw2zNuy4vl%2F0lXVPYNIljml1kD%2FewPXYM4Jy5%2Fnyy7aqcPRtJS%2BxnhNGHfJnFC2DUzed8v519YOd%2FZcn%2Fl%2FSvHzRbW3Bqfe7DYk7GSTb5XL%2FTb8DBuxYc3uS3p9cpPFpNdwV8BINg%2BCZ4BsDwbZ23MoYPL7Rs53c8jRMxX%2Ff0HuCk9wgYOSMz2ndqv4rp0VG5eIQ1XN41l0e6udyyUJG5NTpsjltnc8sGZqYzkqS4%2BFxmfXyEDtUyQ%2BidELpla2f0S6W1gTG6xB43z%2BhQZ0vpT4qN0SXWx8foUI4zjN4No3vaGf1SKW1gjO4jZXSoq03IjD6Vb8LF6RL74%2BN0qMEZTu%2BG00PdnC4eE7BweoST020or9UGxsXoEuujY3RxkxtG75rRN2l2%2Bhj9Uk1tWIxefzuEjA7ltXFBy0vGT4ThonUZBPDROtTiDK13Q%2Buudlq%2FVFgbGK17SGkdamzLeYyT1iUQwEfrUJCb5wtmagrKV1xho%2FNrCmxlVD0MvayXRQU11qV%2BWHtVgZgYT1mBjVQyc6BkZgoLjgECnV92Lk1AR%2Fy4dYLntdcWOJf68GE9bjkSc9w6ybvQnVfluuhi3TL74%2BN0ExlRxenaawwcXJERB2lkxIGRkZcioVn8hDAxVQYCfMRuYiOqiF1%2FrYGDKzjiIA2OODA4EtPFuEjmLMkzZMRuoiP8Ee7SylFD7FJi115y4F76ODYsYnclwa5bJ3YXPplhTWaSQQAfrw%2BjNdsgeV172YF76dPYwHgdaW82Fz6XYc1mkkEAH6%2FDhzgyZslP%2BrRgeUEm9Ok5zZ9NctPdgeQmt63SorBh6jCC3r1MbnIljbz6ktzkwqD3jSc3uUjj3oJYTHJTS0Cgc9OekdVU8bz25CYPl6rmIVXVPKiq%2FaCrvvP7dWyPj8%2BNnKaKz7UnNnm41DQPqZrmQTWtNBTF1w9bBgB8pG42N1BF6vqTmjxc%2Bxt4SDc48KDoVinZNFs8sdUcG7ObrQ7qhRAagWH27plde1aTj2uzgxrL%2BJjdhzJbOSWJCSO4WF0GAHysbvY7UMbq2nOafFwbHvhINzzwodj2vGL0qUr%2FQEbrZtMDvhBm0wNVtK6%2Fn6qPa9cDH%2BmuBz5U28ZTOv6xWM6QsbrZ9oAvxDDauA2S1bW3Uw0u1dcGxupIm7gFUGnDWlgmgwA6Xg%2BgLNcoQCCMkfF0tmZlGUYQlSFYgizPL0NQ1mM1GIaS1ssyhPoGkDpn7WUIARTSbrwMIUCqpQVQSzNlCMcAgc9ZG2lNFc9rL0MIcClrAVJlLYDKGr6UVZnx8RG6UdVUEbr2OgRxMSyEjlRUC6GoVtBxXsQIE1ZlGEDH6yFU1Qyvd8Pr%2BksRQlyds0OJPW6e2KHwxokd234IMgTgo3XTNlsZrWuvQwhxtc0OkbbNDqHOVrVYw0fqpmU2X4hh9HAbJKlrL0MIce1cFiLt4CbEPpPZJIUAOl6PoDBXbRT9xMjEJDKVrwQi7fTszaKtSBVdR8PQzXqZyBRJzN2XRKYIymY3nsgUIVXOIqicmUSmY4DA55uNkKaK57UnMkW4dLQIqY4WQR1t%2FfMam44msz8%2BTjc6mipO157LFOGS0SKkMpo1gjoaIxN8nG40NAEIs%2FGBKlLXn8hkjS6V24ZF6xzNGHndbCl6EgQIyd3sgqCM3LWnM1kjXPsgcDRjJHezr%2BhJECAkd6jPmcg3f3Uk%2BuidH%2Fr21fH1MPSzXsa%2BOdr7G%2Fy2RlBBu%2FHoNwc0Qocs2MXEv9tCAp97toywpozttYfALQuZsGZhFdYsKKzha%2BchNT9CWjeSmjJa1x4FtyxkkpqFVVKzoKSGNl4iAwFCcjcbjCoj9x5Ewy1cW4xyOGNkd6jFoQ2YyECAj90FAe3teUIKMi4vbcImd7BgMGhb3a2u8bllD0NG62fQpDZLj4MmwpiIgiaye%2FDmnbINlTQTNDkKCYQu2qhrythef9DERqau2VjVNRuqawiDJjLzI6R1o6spo3X9QRMbmaxmY5XVbCir4WuBLjU%2FPloX1zS03j2t9yBc4lwqvQ2M1x2JRW6e1x2owhHGiuR5ybCRuwwDCMl9GFuODpPc9RcPOpcqbUMjd6R7jloOFN3QZjrJQICQ3c1Go%2BrYXXtTdMvBtdcohzNGdofaG9pMJxkIELI7FOrWrRtNutMuIFxhrnPTndS1R7dEBlbP%2FXI%2F050cye6UvUl3cqGiduvpTi5WUc2FoppJdzoKCXx%2B2jUamzK215%2Fu5CKT2FysEpsLJTaUndKlCEDI7EZfU8bs%2BjOeXGTymotVXnOhvLbRUBDSuxHYxEpcul2Cofc%2BZz4JmKHhd4lFbp7fPSjIoQ2Oy0CAj909KN0Zdu%2BK3fWnPnmXqm4DY%2FcazhjZHQpwaIPjMhAgZPcWVag0nlARASkXNmGrbzQlLMmzj9tX6jhJHSK3yq%2F%2FMGWzlN%2FCNIv%2FVBRr63389osW%2Be%2F5F5Kt7nhgffvajGTxP9f4Ka9TrP4jGKE6%2BG91cO84jhj48Lb78ofV7tFXWiTl2qzj86MNVqovIkUKH2LCM8mWrMVuaZuNxfbi5GKwWC%2Fez%2F1PcgRCXytPtgWnL2AifAho0r7Il8WY8rdtMQNmgluih42Z6sUAM3WHvhbCYMe4ektYBavfRvejkccHamjZFj%2FcAqs6WO0cvB9WtU2OrUWL7oNKcRX5TVx578RVZIOZ%2FCvjqoUk2RZXW%2By0IKt7b5eurFNUxcHI3yaQeBSGHUIusFtS3ulQllJkukEDT671TmR6zZmc5kzKkdmiPLhLZHKEWXtM5x0nOonr9U6guUtkRi2R6WkmzR5AszQ7We2cxh98lYC3hdCrxl2fw5DvZeMO8SuaAJzEr1QguNqvyabXH7nv%2FTXZmClqTqSaWsX1r4hOgTTrPKbcoPoMVu4QnZsOJKfh2SLWqRaeUQNU7%2F1N2nzWCZsPTcrR2aJ%2B%2FDx0tnT9o%2FsocveA5mh9zjmdAqsUUV7zoRe062wLqWbGvLXxj%2B%2F22JILNT%2ByuNAWo%2FWUHSMWCoZVgxNTLbFGTbhvk0PlEvZBHPueHLKXSfn%2BGR3l1kv8rSKNh2leJL8qC6V8RXfttz5%2BTWYpyegnSuLG0EMeC944IAK3jf10E6Y5KDnvqsx7BRutQHDsxpAGdQ6oxweRoC6m40NZ7dYrK2rsIwzr%2BFDqMpUVRyFxJMgTdAqRVtNdBSNn9KRD7RhGFyLuuGM4UIRxbcdwaabewIL9PtY9WQXz4O45KzM%2FPg8QnNG9zngAZR7gQLHGlT2AiPlh8QAB1g0mApjXhzaZVwYChH7gjCpc4weU%2BYFDVR0HHYGrTCwMkG0%2FEbxv%2B4ljBjjfETRnu8otD8VAtHm%2FMhCcmff7flC0mu4aqIjgAyLAwus0YfR7aZPq%2BLUg87u9kCQI8zQlXnWGOtRU0O7UUG1mu8rdC%2BXdbc2tCceJN4xEslSPupcFRnW9SjguOL7Vsv5GZwFUXW89HBdgFV5D6FdNOO4oJPDVXIVGjL3KQ%2FgJx6C%2FJ1qITIwNsYqx4QExdtN9GF%2FrHBkOELoCo8f2wRXob6IWIpNjQ6y7AYdQjl3LOAi9gNkRWKzEGR0UjRdQ5gV60GstRLZ7cIh19%2BAQaoJo0zNkIMDnCCKjDPXCEehvyxYhk4YirNJQBKUhtOkZMhAgdAQtdKG21eKl5U%2B3Miiq70KFc6ivdbre%2B%2Bj9qrZbVaPHVBi49430jLZ13CB54MBcqrsDRC3kn1tohKYPMJYdRPfWvp3DqhfC%2BzBjNRpThJ21zisPizxnu6cXZD79kse0OuMP
