<template>
  <v-main class="grey lighten-2">
    <v-container fluid fill-height>
      <v-row no-gutters>
        <v-col cols="12"
        >
          <v-card>
            <v-toolbar class="title" elevation="2">
              フレンド募集要項作成
              <v-spacer></v-spacer>
              <v-btn
                fab
                dark
                small
                class="ml-4"
                @click.stop="handleShowExplanationModal"
              >
                <v-icon>mdi-help</v-icon>
              </v-btn>
            </v-toolbar>

            <v-card-text v-if="myPost">
              <h3 class="mt-4">フレンド募集要項詳細</h3>
              <v-row class="mt-2">
                <v-col cols="12">
                  <v-text-field v-model="myPost.title" label="Title" readonly></v-text-field>
                </v-col>
                <v-col cols="12" sm="6" md="6">
                  <v-text-field v-model="myPost.friend_level" label="Friend Lvel" suffix="レベル" readonly></v-text-field>
                </v-col>
                <v-col cols="12" sm="6" md="6">
                  <v-text-field v-model="character2" label="募集キャラクター" readonly></v-text-field>
                </v-col>
                <v-col cols="12">
                  <v-textarea v-model="myPost.description" label="あいさつ" auto-grow readonly></v-textarea>
                </v-col>
              </v-row>
            </v-card-text>

            <v-card-text v-else>
              <h3>フレンド募集要項がありません。</h3>
            </v-card-text>

            <v-divider></v-divider>
        
            <v-card-actions v-if="!myPost">
              <v-btn
                outlined
                rounded
                text
                class="mx-2 my-2"
                @click="handleShowPostCreateModal"
              >
                新規作成
              </v-btn>
            </v-card-actions>

            <v-card-actions v-else>
              <v-btn
                outlined
                rounded
                text
                class="mx-2 my-2"
                @click="handleShowPostEditModal"
              >
                編集
              </v-btn>
              <v-btn
                outlined
                rounded
                text
                class="mx-2 my-2"
                @click="handleDeletePost"
              >
                削除
              </v-btn>
            </v-card-actions>
          </v-card>
        </v-col>
      </v-row>

      <v-dialog v-model="isVisibleExplanationModal">
        <ExplanationModal
          @close-modal="handleCloseExplanationModal"
        />
      </v-dialog>
        
      <v-dialog v-model="isVisiblePostCreateModal">
        <PostCreateModal
          @close-modal="handleClosePostCreateModal"
          @create-post="handleCreatePost"
        />
      </v-dialog>

      <v-dialog v-model="isVisiblePostEditModal">
        <PostEditModal
          :post="myPost"
          @close-modal="handleClosePostEditModal"
          @update-post="handleUpdatePost"
        />
      </v-dialog>
    </v-container>
  </v-main>
</template>

<script>
import PostCreateModal from "./components/PostCreateModal"
import ExplanationModal from "./components/ExplanationModal.vue"
import PostEditModal from "./components/PostEditModal.vue"
import { mapActions, mapGetters } from 'vuex'

export default {
  name: 'PostIndex',
  components: {
    PostCreateModal,
    ExplanationModal,
    PostEditModal
  },
  data: function() {
    return {
      isVisibleExplanationModal: false,
      isVisiblePostCreateModal: false,
      isVisiblePostEditModal: false,
      character1: '超フェス・ルフィ/技/格闘・自由',
      character2: '超フェス・カイドウ/力/強靭・打突',
      myPost: {}
    }
  },
  computed: {
    ...mapGetters("users", [
      'authUser'
    ]),
    ...mapGetters("posts", [
      'posts'
    ]),
    setMyPost() {
      this.posts.filter(post => {
        return post.user_id == this.authUser.id
      })
      return this.myPost = this.posts[0]
    }
  },
  created() {
    this.fetchPosts();
  },
  methods: {
    ...mapActions("posts", [
      'createPost',
      'fetchPosts',
      'updatePost',
      'deletePost'
    ]),
    handleShowExplanationModal() {
      this.isVisibleExplanationModal = true;
    },
    handleCloseExplanationModal() {
      this.isVisibleExplanationModal = false;
    },
    handleShowPostCreateModal() {
      this.isVisiblePostCreateModal = true;
    },
    handleClosePostCreateModal() {
      this.isVisiblePostCreateModal = false;
    },
    handleShowPostEditModal() {
      this.isVisiblePostEditModal = true;
    },
    handleClosePostEditModal () {
      this.isVisiblePostEditModal = false;
    },
    async handleCreatePost(post) {
      try {
        await this.createPost(post)
        this.handleClosePostCreateModal()
      } catch (error) {
        console.log(error)
      }
    },
    async handleUpdatePost(post) {
      try {
        await this.updatePost(post)
        this.handleClosePostEditModal()
      } catch (error) {
        console.log(error)
      }
    },
    handleDeletePost() {
      try {
        this.deletePost(this.myPost)
      } catch (error) {
        console.log(error)
      }
    }
  }
}
</script>