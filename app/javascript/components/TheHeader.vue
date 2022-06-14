<template>
  <div>
    <v-app-bar>
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
          <v-list-item v-for="item in items" :key="item.title" :to="{name: item.url}">
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
        <v-list-item :to="{name: home.url}" exact>
          <v-list-item-icon>
            <v-icon large>{{ home.icon }}</v-icon>
          </v-list-item-icon>
          <v-list-item-content>
            <v-list-item-title>{{ home.title }}</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
        <v-list-item v-for="menu in menus" :key="menu.title" :to="{name: menu.url}">
          <v-list-item-icon>
            <v-icon large>{{ menu.icon }}</v-icon>
          </v-list-item-icon>
          <v-list-item-content>
            <v-list-item-title>{{ menu.title }}</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
      </v-list>
    </v-navigation-drawer>
  </div>
</template>

<script>
export default {
  data: function() {
    return {
      drawer: null,
      menus: [
        { title: 'トレマ周回数計算', icon: 'mdi-calculator', url: 'ToremaCalculation'},
        { title: 'フレンド募集要項', icon: 'mdi-card-account-details', url: '#'},
        { title: 'フレンド検索', icon: 'mdi-magnify', url: '#'},
        { title: 'フェス限データ', icon: 'mdi-database', url: '#'},
        { title: 'ニュース', icon: 'mdi-bell', url: '#'},
        { title: 'フィードバック送信', icon: 'mdi-send', url: '#'}
      ],
      items: [
        { title: 'ログイン', icon: 'mdi-login-variant', url: 'LoginIndex'},
        { title: 'サインイン', icon: 'mdi-account-plus', url: 'RegisterIndex'}
      ],
      home: {
        title: 'ホーム',
        icon: 'mdi-home', 
        url: 'TopIndex'
      }
    }
  }
}
</script>
