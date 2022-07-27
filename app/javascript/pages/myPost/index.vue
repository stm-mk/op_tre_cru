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
          <v-card id="my-post-detail-modal">
            <v-toolbar
              class="title"
              elevation="2"
            >
              フレンド募集要項作成
              <v-spacer />
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
              <h3 class="mt-4">
                フレンド募集要項詳細
              </h3>
              <v-row class="mt-2">
                <v-col cols="12">
                  <v-text-field
                    v-model="myPost.title"
                    label="Title"
                    readonly
                  />
                </v-col>
                <v-col
                  cols="12"
                  sm="6"
                  md="6"
                >
                  <v-text-field
                    v-model="myPost.friend_level"
                    label="Friend Level"
                    suffix="レベル"
                    readonly
                  />
                </v-col>
                <v-col
                  cols="12"
                >
                  <v-select
                    v-model="myPost.characters"
                    :items="characters"
                    item-text="name"
                    attach
                    chips
                    label="募集キャラクター"
                    multiple
                    readonly
                    hint="最後に選択された３体が表示されます。"
                  >
                    <template v-slot:selection="{ item, index }">
                      <v-chip v-if="index < 3">
                        <span>{{ item.name }}</span>
                      </v-chip>
                      <span
                        v-if="index === 3"
                        class="grey--text text-caption"
                      >
                        (他{{ myPost.characters.length - 3 }}体)
                      </span>
                    </template>
                  </v-select>
                </v-col>
                <v-col cols="12">
                  <v-textarea
                    v-model="myPost.description"
                    label="あいさつ"
                    auto-grow
                    readonly
                  />
                </v-col>

                <v-col cols="12">
                  <v-select
                    v-model="myPost.tags"
                    :items="tags"
                    item-text="name"
                    :item-value="tags.name"
                    attach
                    chips
                    label="Tags"
                    readonly
                    multiple
                  ></v-select>
                </v-col>
              </v-row>
            </v-card-text>

            <v-card-text v-else>
              <h3>フレンド募集要項がありません。</h3>
            </v-card-text>

            <v-divider />
        
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
          :tags="tags"
          :characters="characters"
          @close-modal="handleClosePostCreateModal"
          @create-post="handleCreatePost"
        />
      </v-dialog>

      <v-dialog v-model="isVisiblePostEditModal">
        <PostEditModal
          :post="postEdit"
          :tags="tags"
          :characters="characters"
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
      postEdit: {}
    }
  },
  computed: {
    ...mapGetters("users", [
      'authUser'
    ]),
    ...mapGetters("posts", [
      'myPost'
    ]),
    ...mapGetters("tags", [
      "tags"
    ]),
    ...mapGetters("characters", [
      "characters"
    ]),
  },
  created() {
    if(this.authUser.post) { this.fetchMyPost(); }
    this.fetchTags();
    this.fetchCharacters();
  },
  methods: {
    ...mapActions("posts", [
      'createPost',
      'updatePost',
      'deletePost',
      'fetchMyPost'
    ]),
    ...mapActions("tags", [
      'fetchTags'
    ]),
    ...mapActions("characters", [
      "fetchCharacters"
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
      this.postEdit = Object.assign({}, this.myPost)
      this.isVisiblePostEditModal = true;
    },
    handleClosePostEditModal () {
      this.isVisiblePostEditModal = false;
      this.postEdit = {};
    },
    async handleCreatePost(post) {
      try {
        await this.createPost(post)
        this.handleClosePostCreateModal()
        this.flashMessage.success({
            message: 'フレンド募集要項を作成しました',
            time: 5000,
            blockClass: 'custom-block-class'
        })
      } catch (error) {
        console.log(error)
      }
    },
    async handleUpdatePost(post) {
      try {
        await this.updatePost(post)
        this.handleClosePostEditModal()
        this.flashMessage.success({
            message: 'フレンド募集要項を更新しました',
            time: 5000,
            blockClass: 'custom-block-class'
        })
      } catch (error) {
        console.log(error)
      }
    },
    async handleDeletePost() {
      try {
        await this.deletePost(this.myPost)
        this.flashMessage.success({
            message: 'フレンド募集要項を削除しました',
            time: 5000,
            blockClass: 'custom-block-class'
        })
      } catch (error) {
        console.log(error)
      }
    }
  }
}
</script>