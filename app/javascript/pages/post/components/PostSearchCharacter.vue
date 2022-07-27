<template>
  <v-row>
    <v-col
      cols="12"
      sm="6"
      md="6"
    >
      <v-autocomplete
        v-model="searchCharacter"
        :items="characters"
        item-text="name"
        :item-value="characters.name"
        attach
        chips
        label="Characters"
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
</template>

<script>
export default {
  name: "PostSearchCharacter",
  props: {
    searchCharacter: {
      type: Object,
      required: true
    },
    characters: {
      type: Array,
      required: true
    }
  }
}
</script>