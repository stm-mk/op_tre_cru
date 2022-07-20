<template>
    <v-container fluid>
    <v-row justify="center">

      <v-row
        class="mx-4 mt-2"
        id="search-form"
      >
        <v-col>
          <v-text-field
            v-model="searchCharacter.keyword"
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
            <v-expansion-panel-header>属性を選択</v-expansion-panel-header>
            <v-expansion-panel-content>
              <v-row>
                <v-col
                  cols="12"
                >
                  属性を選択
                </v-col>
              </v-row>
            </v-expansion-panel-content>
          </v-expansion-panel>

          <v-expansion-panel>
            <v-expansion-panel-header>タイプを選択</v-expansion-panel-header>
            <v-expansion-panel-content>
              Some content
            </v-expansion-panel-content>
          </v-expansion-panel>
        </v-expansion-panels>
      </v-row>

      <CharacterList
        class="my-8"
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
        :length="5"
        @input="pageChange"
      ></v-pagination>
    </v-row>
  </v-container>
</template>

<script>
import CharacterList from "./components/CharacterList.vue"

export default {
  name: "CharacterIndex",
  components: {
    CharacterList
  },
  data() {
    return {
      searchCharacter: {
        keyword: "",
        attribete: "",
        type: ""
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

  },
  watch: {
    setDisplayPosts() {
      this.page.currentPage = 1
    }
  },
  created() {
  },
  methods: {
    resetBtn() {
      this.searchPost.keyword = ""
      this.searchPost.level = ""
      this.searchPost.friend_level = ""
      this.searchPost.tag = ""
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
    }
  }
}
</script>