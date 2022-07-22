<template>
  <v-expansion-panels popout>
    <v-expansion-panel
      v-for="post in posts"
      :key="post.id"
      hide-actions
    >
      <v-expansion-panel-header>
        <v-row
          align="center"
          class="spacer"
          no-gutters
        >
          <v-col
            cols="2"
            sm="2"
            md="1"
          >
            <v-avatar
              size="36px"
            >
              <img v-if="post.user.avatar_url"
                alt="Avatar"
                :src="post.user.avatar_url"
              >
              <img v-else
                alt="Avatar"
                :src="noimage_src"
              >
            </v-avatar>
          </v-col>

          <v-col
            sm="5"
            md="3"
          >
            <strong
              v-html="post.user.name"
            />
            <span
              class="grey--text"
            >
              &nbsp;{{ post.user.level }}レベル
            </span>
          </v-col>

          <v-col
            class="text-no-wrap"
            cols="12"
            sm="12"
            md="8"
          >
            <v-chip-group
              column
            >
              <v-chip
                v-if="post.user.play_style == 'gachi'"
                :color="`red lighten-4`"
                class="ml-0 mr-2 black--text"
                label
                small
              >
                ガチ
              </v-chip>
              <v-chip
                v-if="post.user.play_style == 'enjoy'"
                :color="`blue lighten-4`"
                class="ml-0 mr-2 black--text"
                label
                small
              >
                エンジョイ
              </v-chip>
              <v-chip
                v-for="tag in post.tags"
                :key="tag.id"
                :color="`teal lighten-4`"
                class="ml-0 mr-2 black--text"
                label
                small
              >
                {{ tag.name }}
              </v-chip>
            </v-chip-group>
            <strong class="hidden-xs-only" v-html="post.title"></strong>
          </v-col>

          
        </v-row>
      </v-expansion-panel-header>

      <v-expansion-panel-content>
        <v-divider></v-divider>
        <v-card-text>
          <h3 class="mt-4">
            ユーザー情報
          </h3>
          <v-row class="mt-2">
            <v-col
              cols="12"
              sm="6"
              md="6"
            >
              <v-text-field
                v-model="post.user.level"
                label="Level"
                suffix="レベル"
                readonly
              />
            </v-col>
            <v-col
              cols="12"
              sm="6"
              md="6"
            >
              <v-text-field
                v-model="post.user.game_id"
                label="Game ID"
                readonly
                :id="'post-user-game-id-' + post.id"
              >
                <template v-slot:append-outer>
                  <v-icon
                    @click="copyToClipboard(post.user.game_id)"
                  >
                    mdi-content-copy
                  </v-icon>
                </template>
              </v-text-field>
            </v-col>
            <v-col
              cols="12"
            >
              <v-select
                v-model="post.user.characters"
                :items="characters"
                item-text="name"
                attach
                chips
                label="Characters"
                multiple
                readonly
              >
                <template v-slot:selection="{ item, index }">
                  <v-chip v-if="index === 0">
                    <span>{{ item.name }}</span>
                  </v-chip>
                  <span
                    v-if="index === 1"
                    class="grey--text text-caption"
                  >
                    (+{{ post.user.characters.length - 1 }} others)
                  </span>
                </template>
              </v-select>
            </v-col>
          </v-row>

          <h3 class="mt-4">
            フレンド募集要項詳細
          </h3>
          <v-row class="mt-2">
            <v-col cols="12">
              <v-text-field
                v-model="post.title"
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
                v-model="post.friend_level"
                label="Friend Level"
                suffix="レベル"
                readonly
              />
            </v-col>
            <v-col
              cols="12"
              sm="6"
              md="6"
            >
              <v-text-field
                label="募集キャラクター"
                readonly
              />
            </v-col>
            <v-col cols="12">
              <v-textarea
                v-model="post.description"
                label="あいさつ"
                auto-grow
                readonly
              />
            </v-col>
          </v-row>
        </v-card-text>
      </v-expansion-panel-content>
    </v-expansion-panel>
  </v-expansion-panels>
</template>

<script>
export default {
  name: "PostList",
  data() {
    return {
      noimage_src: require("../../../../assets/images/noimage.jpg")
    }
  },
  props: {
    posts: {
      type: Array,
      required: true,
      user: {
        type: Object,
        required: true,
        characters: {
          types: Array,
          required: true
        }
      },
      tags: {
        type: Array,
        required: true
      }
    },
    characters: {
      type: Array,
      required: true
    }
  },
  methods: {
    copyToClipboard(text) {
      this.$emit('copy-clipboard', text)
    }
  }
}
</script>