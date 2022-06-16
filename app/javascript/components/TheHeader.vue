<template>
  <div>
    <v-app-bar>
      <v-app-bar-nav-icon @click="drawer = !drawer"></v-app-bar-nav-icon>

      <v-toolbar-title>トレクルフレンド（仮）</v-toolbar-title>

      <v-spacer></v-spacer>

      <v-toolbar-items class="hidden-sm-and-down" v-if="!authUser">
        <v-tooltip bottom v-for="item in items" :key="item.title">
          <template v-slot:activator="{ on, attrs }">
            <v-btn
              icon
              width="70"
              v-bind="attrs"
              v-on="on"
              :to="{name: item.url}"
              :id="item.id"
            >
              <v-icon large>{{ item.icon }}</v-icon>
            </v-btn>
          </template>
          <span>{{ item.title }}</span>
        </v-tooltip>
      </v-toolbar-items>

      <v-toolbar-items class="hidden-sm-and-down" v-else>
        <v-tooltip bottom>
          <template v-slot:activator="{ on, attrs }">
            <v-btn
              icon
              v-bind="attrs"
              v-on="on"
              width="70"
              id="mypage-btn"
            >
              <v-icon large>mdi-account-circle</v-icon>
            </v-btn>
          </template>
          <span>マイページ</span>
        </v-tooltip>
        <v-tooltip bottom>
          <template v-slot:activator="{ on, attrs }">
            <v-btn
              icon
              v-bind="attrs"
              v-on="on"
              @click.native="handleLogout"
              to="#"
              width="70"
              id="logout-btn"
            >
              <v-icon large>mdi-logout</v-icon>
            </v-btn>
          </template>
          <span>ログアウト</span>
        </v-tooltip>
      </v-toolbar-items>

      <v-toolbar-items class="hidden-md-and-up">
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
      </v-toolbar-items>
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
import { mapActions, mapGetters } from 'vuex'

export default {
  name: "TheHeader",
  computed: {
    ...mapGetters("users", ["authUser"])
  },
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
        { title: 'ログイン', icon: 'mdi-login', url: 'LoginIndex', id: 'login-btn'},
        { title: 'サインイン', icon: 'mdi-account-plus', url: 'RegisterIndex', id: 'singin-btn'}
      ],
      home: {
        title: 'ホーム',
        icon: 'mdi-home', 
        url: 'TopIndex'
      }
    }
  },
  methods: {
    ...mapActions("users", ["logoutUser"]),
    async handleLogout() {
      try {
        await this.logoutUser()
        this.$router.push({name: 'TopIndex'})
      } catch (error) {
        console.log(error)
      }
    }
  }
}
</script>
