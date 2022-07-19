<template>
  <v-container fluid>
    <v-row justify="center">

      <v-row
        class="mx-4 mt-2"
        id="search-form"
      >
        <v-col>
          <v-text-field
            v-model="searchPost.keyword"
            label="検索ワード"
            type="text"
          >
            <template v-slot:append-outer>
              <v-btn 
                @click="resetBtn"
                text
                outlined
              >
                リセット
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
              <v-chip-group
                v-model="searchPost.tag"
                column
              >
                <v-chip
                  filter
                  label
                  :color="`teal lighten-4`"
                  v-for="tag in tags"
                  :key="tag.id"
                  :value="tag.id"
                >
                  {{ tag.name }}
                </v-chip>
              </v-chip-group>
            </v-expansion-panel-content>
          </v-expansion-panel>
        </v-expansion-panels>
      </v-row>

      <PostList
        class="my-8"
        :posts="this.displayPosts"
        @copy-clipboard="copyToClipboard"
      />

        <v-btn
          v-show="fab"
          v-scroll="onScroll"
          fab
          dark
          fixed
          bottom
          right
          @click="toTop"
        >
          <v-icon>mdi-arrow-up-bold-outline</v-icon>
        </v-btn>
      <v-pagination
        v-model="page.currentPage"
        :length="length"
        @input="pageChange"
      ></v-pagination>
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
        keyword: "",
        level: "",
        friend_level: "",
        tag: ""
      },
      page: {
        currentPage: 1
      },
      fab: false,
      pageSize: 20,
      displayPosts: []
    }
  },
  computed: {
    ...mapGetters("posts", [
      "posts"
    ]),
    ...mapGetters("tags", [
      "tags"
    ]),
    filteredPostsLevel() {
      return this.filteredPostsKeyword.filter(post => {
        return post.friend_level <= this.searchPost.level &&
        post.user.level >= this.searchPost.friend_level
      })
    },
    filteredPostsKeyword() {
      return this.posts.filter(post => {
        return post.title.indexOf(this.searchPost.keyword) != -1 ||
        post.description.indexOf(this.searchPost.keyword) != -1
      })
    },
    filteredPosts() {
      if(this.searchPost.tag) {
        return this.filteredPostsLevel.filter(post => {
          return post.tags.find(tag => tag.id === this.searchPost.tag)
        })
      } else {
        return this.filteredPostsLevel
      }
    },
    length() {
      return Math.ceil(this.filteredPosts.length / this.pageSize)
    },
    setDisplayPosts() {
      return this.filteredPosts.slice(0,this.pageSize)
    }
  },
  watch: {
    setDisplayPosts() {
      this.displayPosts = this.setDisplayPosts
      this.page.currentPage = 1
    }
  },
  created() {
    this.fetchPosts();
    this.fetchTags();
  },
  methods: {
    ...mapActions("posts", [
      "fetchPosts"
    ]),
    ...mapActions("tags", [
      "fetchTags"
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
    },
    resetBtn() {
      this.searchPost.keyword = ""
      this.searchPost.level = ""
      this.searchPost.friend_level = ""
      this.flashMessage.success({
        message: 'リセットしました',
        time: 5000,
        blockClass: 'custom-block-class'
      })
    },
    toTop() {
      this.$vuetify.goTo(0)
    },
    onScroll (e){
      if (typeof window === 'undefined') return
      const top = window.pageYOffset ||   e.target.scrollTop || 0
      this.fab = top > 500
    },
    pageChange(pageNumber) {
      this.displayPosts = this.filteredPosts.slice(
        this.pageSize*(pageNumber -1),
        this.pageSize*(pageNumber)
      )
    },
    tagsearch(tag) {
      console.log(tag)
      for(var i in this.filteredPosts) {
        var post = this.filteredPosts[i]
        console.log(post.tags[0].id)
      }
    }
  }
}
</script>