<template>
  <v-main class="grey lighten-2">
    <v-container fluid fill-height>
      <v-row no-gutters>
        <v-col cols="12"
        >
          <v-card>
            <v-toolbar class="title" elevation="2">
              マイページ
              <v-spacer></v-spacer>
              <v-btn
                fab
                dark
                small
                class="ml-4"
              >
                <v-icon>mdi-help</v-icon>
              </v-btn>
            </v-toolbar>

            <v-card-text>
              <v-row class="mt-2">
                <v-col cols="12" sm="4" md="4">
                  <v-row justify="center">
                    <v-avatar
                      class="profile avatar-image"
                      color="grey"
                      size="164"
                      circle
                    >
                      <v-img src="https://cdn.vuetifyjs.com/images/profiles/marcus.jpg"></v-img>
                    </v-avatar>
                  </v-row>
                </v-col>
                <v-col cols="12" sm="8" md="6">
                  <v-row>
                    <v-col cols="12">
                      <v-text-field v-model="authUser.name" label="Title" readonly></v-text-field>
                    </v-col>
                    <v-col cols="12" sm="6" md="6">
                      <v-text-field v-model="authUser.game_id" label="ID" readonly></v-text-field>
                    </v-col>
                    <v-col cols="12" sm="6" md="6">
                      <v-text-field v-model="authUser.level" label="Friend Level" suffix="レベル" readonly></v-text-field>
                    </v-col>
                  </v-row>
                </v-col>
              </v-row>
            </v-card-text>

            <v-divider></v-divider>

            <v-card-actions>
              <v-btn
                outlined
                rounded
                text
                class="mx-2 my-2"
              >
                編集
              </v-btn>
              <v-btn
                outlined
                rounded
                text
                class="mx-2 my-2"
              >
                削除
              </v-btn>
            </v-card-actions>
          </v-card>
        </v-col>
      </v-row>
    </v-container>
  </v-main>
</template>

<script>
import { mapGetters } from 'vuex'

export default {
  name: "ProfileIndex",
  data() {
    return {
      user: ""
    }
  },
  computed: {
    ...mapGetters("users", ["authUser"])
  }
}
</script>

<style scoped>
.avatar-image {
  align-items: center;
}
</style>
