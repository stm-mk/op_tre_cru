<template>
  <v-main class="grey lighten-2">
    <v-container
      fluid
      fill-height
    >
      <v-row no-gutters>
        <v-col
          cols="12"
        >
          <v-card>
            <v-toolbar
              class="title"
              elevation="2"
            >
              マイページ
              <v-spacer />
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
                <v-col
                  cols="12"
                  sm="4"
                  md="4"
                >
                  <v-row justify="center">
                    <v-avatar v-if="user.avatar_url"
                      class="profile"
                      size="164"
                      circle
                    >
                      <v-img :src="user.avatar_url" />
                    </v-avatar>
                    <v-avatar v-else
                      class="profile"
                      size="164"
                      circle
                    >
                      <v-img :src="noimage_src" />
                    </v-avatar>
                  </v-row>
                  <v-row justify="center">
                    <v-col cols="8">
                      <v-file-input
                        label="Avatar"
                        accept="image/*"
                        @change="handleChange"
                      />
                    </v-col>
                  </v-row>
                </v-col>
                <v-col
                  cols="12"
                  sm="8"
                  md="6"
                >
                  <v-row>
                    <v-col cols="12">
                      <v-text-field
                        v-model="user.name"
                        label="Name"
                      />
                    </v-col>
                    <v-col
                      cols="12"
                      sm="6"
                      md="6"
                    >
                      <v-text-field
                        v-model="user.game_id"
                        label="ID"
                      />
                    </v-col>
                    <v-col
                      cols="12"
                      sm="6"
                      md="6"
                    >
                      <v-text-field
                        v-model="user.level"
                        label="Level"
                        suffix="レベル"
                      />
                    </v-col>
                    <v-col
                      cols="12"
                      sm="6"
                      md="6"
                    >
                      <v-select
                        v-model="user.play_style" 
                        label="Play Style" 
                        value="value" 
                        item-text="label"
                        :items="items"
                      />
                    </v-col>
                  </v-row>
                </v-col>
              </v-row>
            </v-card-text>

            <v-divider />

            <v-card-actions>
              <v-btn
                outlined
                rounded
                text
                class="mx-2 my-2"
                @click="update"
              >
                更新
              </v-btn>
            </v-card-actions>
          </v-card>
        </v-col>
      </v-row>
    </v-container>
  </v-main>
</template>

<script>
import { mapActions, mapGetters } from 'vuex'

export default {
  name: "ProfileIndex",
  data() {
    return {
      user: {
        name: '',
        level: '',
        game_id: '',
        avatar_url: '',
        play_style: ''
      },
      uploadAvatar: '',
      items: [
        { label: 'エンジョイ', value: 'enjoy' },
        { label: 'ガチ', value: 'gachi' }
      ],
      noimage_src: require("../../../assets/images/noimage.jpg")
    }
  },
  computed: {
    ...mapGetters("users", ["authUser"])
  },
  created() {
    this.user = Object.assign({}, this.authUser)
  },
  methods: {
    ...mapActions("users", ["updateUser"]),
    async handleChange(event) {
      // const { valid } = await this.$refs.provider.validate(event)
      this.uploadAvatar = event
    },
    update() {
      const formData = new FormData()
      formData.append("user[name]", this.user.name)
      if (this.user.game_id) formData.append("user[game_id]", this.user.game_id)
      if (this.user.level) formData.append("user[level]", this.user.level)
      if (this.user.play_style) formData.append("user[play_style]", this.user.play_style)
      if (this.uploadAvatar) formData.append("user[avatar]", this.uploadAvatar)

      try {
        this.updateUser(formData)
        if (this.uploadAvatar) this.$router.go({path: this.$router.currentRoute.path, force: true})
      } catch (error) {
        console.log(error);
      }
    }
  }
}
</script>

<style scoped>
</style>
