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
            <ValidationObserver v-slot="{ invalid }">
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
                        <ValidationProvider
                          v-slot="{ errors }"
                          ref="provider"
                          name="アバター"
                          rules="image"
                        >
                          <v-file-input
                            label="Avatar"
                            accept="image/*"
                            @change="handleChange"
                            :error-messages="errors"
                          />
                        </ValidationProvider>

                        <small class="text-center">*アバターを反映させる為には、リロードを実行してください</small>
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
                        <ValidationProvider
                          v-slot="{ errors }"
                          rules="required"
                          name="名前"
                        >
                          <v-text-field
                            v-model="user.name"
                            label="Name"
                            :error-messages="errors"
                          />
                        </ValidationProvider>
                      </v-col>

                      <v-col
                        cols="12"
                        sm="6"
                        md="6"
                      >
                        <ValidationProvider
                          v-slot="{ errors }"
                          rules="numeric"
                          name="ID"
                        >
                          <v-text-field
                            v-model="user.game_id"
                            label="ID"
                            :error-messages="errors"
                            type="number"
                          />
                        </ValidationProvider>
                      </v-col>

                      <v-col
                        cols="12"
                        sm="6"
                        md="6"
                      >
                        <ValidationProvider
                          v-slot="{ errors }"
                          rules="max_value:2000"
                          name="レベル"
                        >
                          <v-text-field
                            v-model="user.level"
                            label="Level"
                            suffix="レベル"
                            type="number"
                            :error-messages="errors"
                          />
                        </ValidationProvider>
                      </v-col>
                      
                      <v-col
                        cols="12"
                        sm="6"
                        md="6"
                      >
                        <ValidationProvider
                          v-slot="{ errors }"
                          rules="required"
                          name="プレイスタイル"
                        >
                          <v-select
                            v-model="user.play_style" 
                            label="Play Style" 
                            value="value" 
                            item-text="label"
                            :items="items"
                            :error-messages="errors"
                            required
                          />
                        </ValidationProvider>
                      </v-col>

                      <v-col cols="12">
                        <v-select
                          v-model="editcharacter"
                          :items="characters"
                          item-text="name"
                          :item-value="characters.name"
                          attach
                          chips
                          label="Characters"
                          multiple
                        >
                          <template v-slot:selection="{ item, index }">
                            <v-chip v-if="index === 0">
                              <span>{{ item.name }}</span>
                            </v-chip>
                            <span
                              v-if="index === 1"
                              class="grey--text text-caption"
                            >
                              (+{{ editcharacter.length - 1 }} others)
                            </span>
                          </template>
                        </v-select>
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
                  :disabled="invalid"
                >
                  更新
                </v-btn>
                <v-btn
                  outlined
                  rounded
                  text
                  class="mx-2 my-2"
                  @click="reload"
                >
                  リロード
                </v-btn>
              </v-card-actions>
            </ValidationObserver>
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
        play_style: '',
        characters: []
      },
      uploadAvatar: '',
      items: [
        { label: 'エンジョイ', value: 'enjoy' },
        { label: 'ガチ', value: 'gachi' }
      ],
      noimage_src: require("../../../assets/images/noimage.jpg"),
      editcharacter: []
    }
  },
  computed: {
    ...mapGetters("users", [
      "authUser"
    ]),
    ...mapGetters("characters", [
      "characters"
    ])
  },
  created() {
    this.user = Object.assign({}, this.authUser)
    this.fetchCharacters();
    this.setCharacter();
  },
  methods: {
    ...mapActions("users", ["updateUser"]),
    ...mapActions("characters", ["fetchCharacters"]),
    async handleChange(event) {
      this.uploadAvatar = event
    },
    update() {
      const formData = new FormData()
      formData.append("user[name]", this.user.name)
      formData.append("user[game_id]", this.user.game_id)
      formData.append("user[level]", this.user.level)
      formData.append("user[play_style]", this.user.play_style)
      if(this.editcharacter.length > 0) {
        this.editcharacter.forEach(character => {
          formData.append('user[user_characters]' + '[]', character)
        })
      } else {
        formData.append('user[user_characters]' + '[]', [])
      }
      if (this.uploadAvatar) formData.append("user[avatar]", this.uploadAvatar)

      try {
        this.updateUser(formData)
        this.flashMessage.success({
            message: 'プロフィールを更新しました',
            time: 5000,
            blockClass: 'custom-block-class'
        })
      } catch (error) {
        console.log(error);
      }
    },
    reload() {
      this.$router.go({path: this.$router.currentRoute.path, force: true})
    },
    setCharacter() {
      this.editcharacter = this.user.characters.map((t) => {return t.name})
    }
  }
}
</script>

<style scoped>
</style>
