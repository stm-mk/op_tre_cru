<template>
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
</template>

<script>
export default {
  data: function() {
    return {
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