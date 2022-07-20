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
                  <v-chip-group
                    v-model="searchCharacter.element"
                    column
                  >
                    <v-chip
                      filter
                      large
                      label
                      :color="element.color"
                      v-for="element in elements"
                      :key="element.name"
                      :value="element.value"
                      class="mx-2"
                    >
                      {{ element.name }}
                    </v-chip>
                  </v-chip-group>
                </v-col>
              </v-row>
            </v-expansion-panel-content>
          </v-expansion-panel>

          <v-expansion-panel>
            <v-expansion-panel-header>タイプを選択</v-expansion-panel-header>
            <v-expansion-panel-content>
              Unimplemented
            </v-expansion-panel-content>
          </v-expansion-panel>
        </v-expansion-panels>
      </v-row>

      <CharacterList
        class="my-8"
        :characters="this.displayCharacters"
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
import { mapActions, mapGetters } from 'vuex'
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
        element: "",
        type: ""
      },
      page: {
        currentPage: 1
      },
      fab: false,
      pageSize: 20,
      displayCharacters: [],
      elements: [
        { name: "力", value: "chikara", color: "red lighten-4" },
        { name: "速", value: "soku", color: "blue lighten-4" },
        { name: "技", value: "waza", color: "green lighten-4" },
        { name: "心", value: "kokoro", color: "yellow lighten-4" },
        { name: "知", value: "chi", color: "purple lighten-4" }
      ]
    }
  },
  computed: {
    ...mapGetters("characters", [
      "characters"
    ]),
    filteredCharacters() {
      if(this.searchCharacter.element) {
        return this.filteredCharactersKeyword.filter(character => {
          return character.element === this.searchCharacter.element
        })
      } else {
        return this.filteredCharactersKeyword
      }
    },
    filteredCharactersKeyword() {
      return this.characters.filter(character => {
        return character.name.indexOf(this.searchCharacter.keyword) != -1
      })
    },
    length() {
      return Math.ceil(this.filteredCharacters.length / this.pageSize)
    },
    setDisplayCharacters() {
      return this.filteredCharacters.slice(0, this.pageSize)
    }
  },
  watch: {
    setDisplayCharacters() {
      this.displayCharacters = this.setDisplayCharacters
      this.page.currentPage = 1
    }
  },
  created() {
    this.fetchCharacters();
  },
  methods: {
    ...mapActions("characters", [
      "fetchCharacters"
    ]),
    resetBtn() {
      this.searchCharacter.keyword = ""
      this.searchCharacter.element = ""
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
      this.displayCharacters = this.filteredCharacters.slice(
        this.pageSize*(pageNumber -1),
        this.pageSize*(pageNumber)
      )
    }
  }
}
</script>