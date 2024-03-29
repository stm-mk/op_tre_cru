<template>
  <v-card id="post-create-modal">
    <ValidationObserver v-slot="{ invalid }">
      <v-card-title class="grey grey lighten-2">
        フレンド募集要項作成
      </v-card-title>

      <v-card-text>
        <v-container>
          <v-row class="mt-2">
            <v-col cols="12">
              <ValidationProvider
                v-slot="{ errors }"
                rules="required|max:30"
                name="タイトル"
              >
                <v-text-field
                  v-model="post.title"
                  label="Title*"
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
                rules="max_value:2000"
                name="フレンドレベル"
              >
                <v-text-field
                  v-model="post.friend_level"
                  type="number"
                  label="Friend Level"
                  suffix="レベル"
                  :error-messages="errors"
                />
              </ValidationProvider>
            </v-col>

            <v-col
              cols="12"
            >
              <v-autocomplete
                v-model="post.post_characters"
                :items="characters"
                item-text="name"
                :item-value="characters.name"
                attach
                chips
                label="募集キャラクター(最後に選択された３体が表示されます。)"
                clearable
                multiple
                no-data-text="候補が見つかりません。"
              >
                <template v-slot:selection="data">
                  <v-chip
                    v-bind="data.attrs"
                    :input-value="data.selected"
                  >
                    {{ data.item.name }}
                  </v-chip>
                </template>
                <template v-slot:item="data">
                  <template v-if="typeof data.item !== 'object'">
                    <v-list-item-content v-text="data.item"></v-list-item-content>
                  </template>
                  <template v-else>
                    <v-list-item-content>
                      <v-list-item-title v-html="data.item.name"></v-list-item-title>
                      <v-list-item-subtitle>
                        <v-chip
                          v-if="data.item.element === 'chikara'"
                          :color="`red lighten-4`"
                          class="ml-0 mr-2 black--text"
                          label
                          small
                        >
                          力
                        </v-chip>
                        <v-chip
                          v-if="data.item.element === 'soku'"
                          :color="`blue lighten-4`"
                          class="ml-0 mr-2 black--text"
                          label
                          small
                        >
                          速
                        </v-chip>
                        <v-chip
                          v-if="data.item.element === 'waza'"
                          :color="`green lighten-4`"
                          class="ml-0 mr-2 black--text"
                          label
                          small
                        >
                          技
                        </v-chip>
                        <v-chip
                          v-if="data.item.element === 'kokoro'"
                          :color="`yellow lighten-4`"
                          class="ml-0 mr-2 black--text"
                          label
                          small
                        >
                          心
                        </v-chip>
                        <v-chip
                          v-if="data.item.element === 'chi'"
                          :color="`purple lighten-4`"
                          class="ml-0 mr-2 black--text"
                          label
                          small
                        >
                          知
                        </v-chip>
                      </v-list-item-subtitle>
                    </v-list-item-content>
                  </template>
                </template>
              </v-autocomplete>
            </v-col>
            
            <v-col cols="12">
              <ValidationProvider
                v-slot="{ errors }"
                rules="max:1000"
                name="あいさつ"
              >
                <v-textarea
                  v-model="post.description"
                  label="あいさつ"
                  auto-grow
                  :error-messages="errors"
                />
              </ValidationProvider>
            </v-col>

            <v-col cols="12">
              <v-select
                v-model="post.post_tags"
                :items="tags"
                item-text="name"
                :item-value="tags.name"
                attach
                chips
                label="Tags"
                multiple
              ></v-select>
            </v-col>
          </v-row>
        </v-container>
        <small>*必須項目</small>
      </v-card-text>
      <v-card-actions>
        <v-spacer />
        <v-btn
          text
          outlined
          rounded
          @click="handleCloseModal"
        >
          閉じる
        </v-btn>
        <v-btn
          text
          outlined
          rounded
          @click="createPostModal"
          :disabled="invalid"
        >
          追加
        </v-btn>
      </v-card-actions>
    </ValidationObserver>
  </v-card>
</template>

<script>
  export default {
    name: 'PostCreateModal',
    data() {
      return {
        post: {
          title: '',
          friend_level: '',
          description: '',
          post_tags: [],
          post_characters: []
        }
      }
    },
    props: {
      tags: {
        type: Array,
        required: true
      },
      characters: {
        type: Array,
        required: true
      }
    },
    methods: {
      handleCloseModal() {
        this.$emit('close-modal')
      },
      createPostModal() {
        this.$emit('create-post', this.post)
      }
    }
  }
</script>