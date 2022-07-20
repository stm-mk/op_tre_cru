<template>
  <v-expansion-panels popout>
    <v-expansion-panel
      v-for="character in characters"
      :key="character.id"
      hide-actions
    >
      <v-expansion-panel-header>
        <v-row
          align="center"
          class="spacer"
          no-gutters
        >
          <v-col
            cols="12"
            sm="6"
            md="6"
          >
            <strong>
              {{ character.name }}
            </strong>
          </v-col>

          <v-col
            class="text-no-wrap"
            cols="12"
            sm="6"
            md="6"
          >
            <v-chip
              v-if="character.element === 'chikara'"
              :color="`red lighten-4`"
              class="ml-0 mr-2 black--text"
              label
              small
            >
              力
            </v-chip>
            <v-chip
              v-if="character.element === 'soku'"
              :color="`blue lighten-4`"
              class="ml-0 mr-2 black--text"
              label
              small
            >
              速
            </v-chip>
            <v-chip
              v-if="character.element === 'waza'"
              :color="`green lighten-4`"
              class="ml-0 mr-2 black--text"
              label
              small
            >
              技
            </v-chip>
            <v-chip
              v-if="character.element === 'kokoro'"
              :color="`yellow lighten-4`"
              class="ml-0 mr-2 black--text"
              label
              small
            >
              心
            </v-chip>
            <v-chip
              v-if="character.element === 'chi'"
              :color="`purple lighten-4`"
              class="ml-0 mr-2 black--text"
              label
              small
            >
              知
            </v-chip>
            <v-chip-group
              column
            >
              <v-chip
                v-for="(item,i) in 2"
                :key="i"
                :color="`teal lighten-4`"
                class="ml-0 mr-2 black--text"
                label
                small
              >
                タイプ
              </v-chip>
            </v-chip-group>
          </v-col>

          
        </v-row>
      </v-expansion-panel-header>

      <v-expansion-panel-content>
        <v-divider></v-divider>
        <v-card-text>
          <h3 class="mt-4">
            キャラクター情報
          </h3>
        </v-card-text>
      </v-expansion-panel-content>
    </v-expansion-panel>
  </v-expansion-panels>
</template>

<script>
export default {
  name: "CharacterList",
  props: {
    characters: {
      type: Array,
      required: true,
    }
  }
}
</script>