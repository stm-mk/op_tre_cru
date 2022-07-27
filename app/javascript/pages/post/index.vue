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
              <v-row>
                <v-col
                  cols="12"
                  sm="6"
                  md="6"
                >
                  <v-autocomplete
                    v-model="searchPost.character"
                    :items="characters"
                    item-text="name"
                    :item-value="characters.name"
                    attach
                    chips
                    label="募集したいキャラクター"
                    clearable
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

                <v-col
                  cols="12"
                  sm="6"
                  md="6"
                >
                  <v-autocomplete
                    v-model="searchPost.r_character"
                    :items="characters"
                    item-text="name"
                    :item-value="characters.name"
                    attach
                    chips
                    label="あなたが所持しているキャラクター"
                    clearable
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
              </v-row>
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
        id="post-list"
        class="my-8"
        :posts="this.displayPosts"
        :characters="characters"
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
        tag: "",
        character: "",
        r_character: ""
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
    ...mapGetters("characters", [
      "characters"
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
    filteredPostUserCharacter() {
      if(this.searchPost.character) {
        return this.filteredPostsLevel.filter(post => {
          return post.user.characters.find(character => character.name === this.searchPost.character)
        })
      } else {
        return this.filteredPostsLevel
      }
    },
    filteredPostsCharacter() {
      if(this.searchPost.r_character) {
        return this.filteredPostUserCharacter.filter(post => {
          return post.characters.find(character => character.name === this.searchPost.r_character)
        })
      } else {
        return this.filteredPostUserCharacter
      }
    },
    filteredPosts() {
      if(this.searchPost.tag) {
        return this.filteredPostsCharacter.filter(post => {
          return post.tags.find(tag => tag.id === this.searchPost.tag)
        })
      } else {
        return this.filteredPostsCharacter
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
    this.fetchCharacters();
  },
  methods: {
    ...mapActions("posts", [
      "fetchPosts"
    ]),
    ...mapActions("tags", [
      "fetchTags"
    ]),
    ...mapActions("characters", [
      "fetchCharacters"
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
      this.searchPost.tag = ""
      this.searchPost.character = ""
      this.searchPost.r_character = ""
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

<style scoped>
#search-form {
  z-index: 2;
}
</style>