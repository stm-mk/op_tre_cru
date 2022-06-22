<template>
  <div>
    <v-app-bar>
      <v-app-bar-nav-icon @click="drawer = !drawer" />

      <v-toolbar-title>トレクルフレンド（仮）</v-toolbar-title>

      <v-spacer />

      <v-toolbar-items
        v-if="!authUser"
        class="hidden-sm-and-down"
      >
        <v-tooltip
          v-for="item in items"
          :key="item.title"
          bottom
        >
          <template v-slot:activator="{ on, attrs }">
            <v-btn
              :id="item.id"
              icon
              width="70"
              v-bind="attrs"
              :to="{name: item.url}"
              v-on="on"
            >
              <v-icon large>
                {{ item.icon }}
              </v-icon>
            </v-btn>
          </template>
          <span>{{ item.title }}</span>
        </v-tooltip>
      </v-toolbar-items>

      <v-toolbar-items
        v-else
        class="hidden-sm-and-down"
      >
        <v-tooltip bottom>
          <template v-slot:activator="{ on, attrs }">
            <v-btn
              id="mypage-btn"
              icon
              v-bind="attrs"
              width="70"
              v-on="on"
              :to="{ name: 'ProfileIndex' }"
            >
              <v-avatar v-if="authUser.avatar_url"
                class="profile"
                size="40"
                circle
              >
                <v-img :src="authUser.avatar_url" />
              </v-avatar>
              <v-icon large v-else>
                mdi-account-circle
              </v-icon>
            </v-btn>
          </template>
          <span>マイページ</span>
        </v-tooltip>
        <v-tooltip bottom>
          <template v-slot:activator="{ on, attrs }">
            <v-btn
              id="logout-btn"
              icon
              v-bind="attrs"
              to="#"
              width="70"
              v-on="on"
              @click.native="handleLogout"
            >
              <v-icon large>
                mdi-logout
              </v-icon>
            </v-btn>
          </template>
          <span>ログアウト</span>
        </v-tooltip>
      </v-toolbar-items>

      <v-toolbar-items class="hidden-md-and-up">
        <v-menu dark>
          <template v-slot:activator="{ on }">
            <v-btn
              icon
              v-on="on"
            >
              <v-icon>mdi-dots-vertical</v-icon>
            </v-btn>
          </template>

          <v-list>
            <v-list-item
              v-for="item in items"
              :key="item.title"
              :to="{name: item.url}"
            >
              <v-list-item-icon>
                <v-icon
                  large
                  color="white"
                >
                  {{ item.icon }}
                </v-icon>
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
        <v-list-item
          :to="{name: home.url}"
          exact
        >
          <v-list-item-icon>
            <v-icon large>
              {{ home.icon }}
            </v-icon>
          </v-list-item-icon>
          <v-list-item-content>
            <v-list-item-title>{{ home.title }}</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
        <v-list-item
          v-for="menu in menus"
          :key="menu.title"
          :to="{name: menu.url}"
        >
          <v-list-item-icon>
            <v-icon large>
              {{ menu.icon }}
            </v-icon>
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
  data: function() {
    return {
      drawer: null,
      menus: [
        { title: 'トレマ周回数計算', icon: 'mdi-calculator', url: 'ToremaCalculation'},
        { title: 'フレンド募集要項', icon: 'mdi-card-account-details', url: 'MyPostIndex'},
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
  computed: {
    ...mapGetters("users", ["authUser"])
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
