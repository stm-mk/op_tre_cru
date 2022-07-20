<template>
  <v-expansion-panels popout>
    <v-expansion-panel
      v-for="(item,i) in 20"
      :key="i"
      hide-actions
    >
      <v-expansion-panel-header>
        <v-row
          align="center"
          class="spacer"
          no-gutters
        >
          <v-col
            sm="5"
            md="3"
          >
            <strong>
              キャラクターネーム
            </strong>
          </v-col>

          <v-col
            class="text-no-wrap"
            cols="12"
            sm="12"
            md="8"
          >
            <v-chip
              :color="`red lighten-4`"
              class="ml-0 mr-2 black--text"
              label
              small
            >
              属性
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
