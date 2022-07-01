<template>
  <ValidationObserver v-slot="{ invalid }">
    <v-card id="my-post-edit-modal">
      <v-card-title class="grey grey lighten-2">
        フレンド募集要項編集
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
              sm="6"
              md="6"
            >
              <v-autocomplete
                :items="['ルフィ', 'カイドウ', 'ヤマト/エース', 'キッド', 'ロー', '黒髭']"
                label="募集キャラクター"
                multiple
              />
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
          </v-row>
        </v-container>
        <small>*必須項目</small>
      </v-card-text>
      <v-card-actions>
        <v-spacer />
        <v-btn
          outlined
          rounded
          text
          @click="handleCloseModal"
        >
          閉じる
        </v-btn>
        <v-btn
          outlined
          rounded
          text
          @click="handleUpdatePost"
          :disabled="invalid"
        >
          更新
        </v-btn>
      </v-card-actions>
    </v-card>
  </ValidationObserver>
</template>

<script>
  export default {
    name: 'PostEditModal',
    props: {
      post: {
        type: Object,
        required: true,
        id: {
          type: Number,
          required: true
        },
        title: {
          type: String,
          required: true
        },
        friend_level: {
          type: Number,
          required: true
        },
        description: {
          type: String,
          required: true
        }
    }
    },
    methods: {
      handleCloseModal() {
        this.$emit('close-modal')
      },
      handleUpdatePost() {
        this.$emit('update-post', this.post)
      }
    }
  }
</script>