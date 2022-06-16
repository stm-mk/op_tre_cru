<template>
  <v-card>
    <v-card-title class="grey grey lighten-2">
      フレンド募集要項編集
    </v-card-title>
    <v-card-text>
      <v-container>
        <v-row class="mt-2">
          <v-col cols="12">
            <v-text-field v-model="post.title" label="Title"></v-text-field>
          </v-col>
          <v-col cols="12" sm="6" md="6">
            <v-text-field v-model="post.friend_level" label="Friend Lvel" suffix="レベル"></v-text-field>
          </v-col>
          <v-col cols="12" sm="6" md="6">
            <v-autocomplete
                  :items="['ルフィ', 'カイドウ', 'ヤマト/エース', 'キッド', 'ロー', '黒髭']"
                  label="募集キャラクター"
                  multiple
            />
          </v-col>
          <v-col cols="12">
            <v-textarea v-model="post.description" label="あいさつ" auto-grow></v-textarea>
          </v-col>
        </v-row>
      </v-container>
      <small>*indicates required field</small>
    </v-card-text>
    <v-card-actions>
      <v-spacer></v-spacer>
      <v-btn
        color="blue darken-1"
        text
        @click="handleCloseModal"
      >
        閉じる
      </v-btn>
      <v-btn
        color="blue darken-1"
        text
        @click="handleUpdatePost"
      >
        更新
      </v-btn>
    </v-card-actions>
  </v-card>
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