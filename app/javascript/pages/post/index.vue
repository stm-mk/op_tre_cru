<template>
  <v-container fluid>
    <v-row justify="center">

      <v-row
        class="mx-4 mt-2"
        id="search-form"
      >
        <v-col>
          <v-text-field
            v-model="searchPost.title"
            label="検索ワード"
            type="text"
          >
            <template v-slot:append-outer>
              <v-btn 
                icon
              >
                <v-icon>mdi-magnify</v-icon>
              </v-btn>
            </template>
          </v-text-field>
        </v-col>

        <v-expansion-panels
          popout
          multiple
        >
          <v-expansion-panel>
            <v-expansion-panel-header>海賊レベルを選択</v-expansion-panel-header>
            <v-expansion-panel-content>
              <v-row>
                <v-col
                  cols="12"
                  sm="6"
                  md="6"
                >
                  <v-text-field
                    v-model="searchPost.level"
                    label="あなたの海賊レベル"
                    suffix="レベル"
                  />
                </v-col>
                <v-col
                  cols="12"
                  sm="6"
                  md="6"
                >
                  <v-text-field
                    v-model="searchPost.friend_level"
                    label="フレンド海賊レベル"
                    suffix="レベル"
                  />
                </v-col>
              </v-row>
            </v-expansion-panel-content>
          </v-expansion-panel>

          <v-expansion-panel>
            <v-expansion-panel-header>キャラクターを選択</v-expansion-panel-header>
            <v-expansion-panel-content>
              Some content
            </v-expansion-panel-content>
          </v-expansion-panel>

          <v-expansion-panel>
            <v-expansion-panel-header>タグを選択</v-expansion-panel-header>
            <v-expansion-panel-content>
              Some content
            </v-expansion-panel-content>
          </v-expansion-panel>
        </v-expansion-panels>
      </v-row>

      <PostList
        class="my-8"
        :posts="filteredPosts"
        @copy-clipboard="copyToClipboard"
      />
    </v-row>
  </v-container>
</template>

<script>
import PostList from "./components/PostList.vue"
import { mapActions, mapGetters } from 'vuex';

export default {
  name: "PostIndex",
  components: {
    PostList
  },
  data() {
    return {
      noimage_src: require("../../../assets/images/noimage.jpg"),
      searchPost: {
        title: "",
        level: "",
        friend_level: ""
      }
    }
  },
  computed: {
    ...mapGetters("posts", ["posts"]),
    filteredPosts() {
      return this.posts.filter(post => {
        return post.title.indexOf(this.searchPost.title) != -1 &&
        post.friend_level >= this.searchPost.level &&
        post.user.level >= this.searchPost.friend_level
      })
    }
  },
  created() {
    this.fetchPosts();
  },
  methods: {
    ...mapActions("posts", [
      "fetchPosts",
    ]),
    copyToClipboard(text) {
      navigator.clipboard.writeText(text)
      .then(() => {
        this.flashMessage.success({
          message: 'Game IDをコピーしました',
          time: 5000,
          blockClass: 'custom-block-class'
      });
      })
      .catch(e => {
        this.flashMessage.error({
          message: 'コピーに失敗しました',
          time: 5000,
          blockClass: 'custom-block-class'
        });
      })
    }
  }
}
</script>