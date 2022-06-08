<template>
  <v-app>
    <v-app-bar app>
      <v-app-bar-nav-icon @click="drawer = !drawer"></v-app-bar-nav-icon>

      <v-toolbar-title>トレクルフレンド（仮）</v-toolbar-title>

      <v-spacer></v-spacer>

      <v-menu dark>
        <template v-slot:activator="{ on }">
          <v-btn icon v-on="on">
            <v-icon>mdi-dots-vertical</v-icon>
          </v-btn>
        </template>

        <v-list>
          <v-list-item v-for="item in items" :key="item.title" :to="item.url">
            <v-list-item-icon>
              <v-icon large color="white">{{ item.icon }}</v-icon>
            </v-list-item-icon>
            <v-list-item-content>
              <v-list-item-title>{{ item.title }}</v-list-item-title>
            </v-list-item-content>
          </v-list-item>
        </v-list>
      </v-menu>
    </v-app-bar>

    <v-navigation-drawer
      v-model="drawer"
      fixed
      temporary
    >
      <v-list>
        <v-list-item v-for="menu in menus" :key="menu.title" :to="menu.url">
          <v-list-item-icon>
            <v-icon large>{{ menu.icon }}</v-icon>
          </v-list-item-icon>
          <v-list-item-content>
            <v-list-item-title>{{ menu.title }}</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
      </v-list>
    </v-navigation-drawer>

    <v-main class="grey lighten-2">
      <v-container fluid fill-height>
        <v-row no-gutters>
          <v-col cols="12" sm="12" md="6">
            <h2>トレクル</h2>
            <h2>フレンド（仮）</h2>
          </v-col>
          <v-col cols="12" sm="12" md="6">
            <v-row no-gutters>
              <v-col cols="12"
                v-for="card in cards"
                :key="card.title"
              >
                <v-card elevation="6"  class="mt-4"  :to="card.url" style="height: 150px;">
                  <v-card-title class="my-2">
                    {{ card.title }}
                    <v-spacer></v-spacer>
                    <v-icon large>{{ card.icon }}</v-icon>
                  </v-card-title>
                  <v-card-subtitle>{{ card.subtitle }}</v-card-subtitle>
                </v-card>
              </v-col>
            </v-row>
          </v-col>
        </v-row>
      </v-container>
    </v-main>
    <v-footer
     padless
    >
      <v-row
        justify="center"
        no-gutters
      >
        <v-btn
          v-for="footerLink in footerLinks"
          :key="footerLink.link"
          :to="footerLink.url"
          class="my-2"
          text
          rounded
        >
          {{ footerLink.link }}
        </v-btn>
        <v-col
          class="py-4 text-center"
          cols="12"
        >
          @2022 - <strong>タイトル</strong>
        </v-col>
      </v-row>
    </v-footer>
  </v-app>
</template>

<script>
export default {
  data: function() {
    return {
      drawer: null,
      menus: [
        { title: 'ホーム', icon: 'mdi-home', url: '/'},
        { title: 'トレマ周回数計算', icon: 'mdi-calculator', url: '#'},
        { title: 'フレンド募集要項', icon: 'mdi-card-account-details', url: '#'},
        { title: 'フレンド検索', icon: 'mdi-magnify', url: '#'},
        { title: 'フェス限データ', icon: 'mdi-database', url: '#'},
        { title: 'ニュース', icon: 'mdi-bell', url: '#'},
        { title: 'フィードバック送信', icon: 'mdi-send', url: '#'}
      ],
      items: [
        { title: 'ログイン', icon: 'mdi-login-variant', url: '#'},
        { title: 'サインイン', icon: 'mdi-account-plus', url: '#'}
      ],
      footerLinks: [
        { link: '利用規約', url: '#'},
        { link: 'プライバシーポリシー', url: '#'}
      ],
      cards: [
        { title: 'トレマ周回数計算', icon: 'mdi-calculator', url: '#', subtitle: '倍率・所持キャラからトレマ周回数を計算することができます。'
        },
        { title: 'フレンド募集要項', icon: 'mdi-card-account-details', url: '#', subtitle: 'フレンド募集要項を作成することができます。この機能には、ユーザー登録が必要です。'},
        { title: 'フレンド検索', icon: 'mdi-magnify', url: '#', subtitle: 'フレンドを検索することができます。'},
        { title: 'フェス限データ', icon: 'mdi-database', url: '#', subtitle: 'フェス限データを閲覧することができます。'},
      ]
    }
  }
}
</script>