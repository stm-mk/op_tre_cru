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
            cols="4"
            sm="2"
            md="1"
          >
            <v-avatar
              size="36px"
            >
              <img
                alt="Avatar"
                src="https://avatars0.githubusercontent.com/u/9064066?v=4&s=460"
              >
            </v-avatar>
          </v-col>

          <v-col
            class="hidden-xs-only"
            sm="5"
            md="3"
          >
            <strong v-html="post.title"></strong>
            <span
              v-if="post.description"
              class="grey--text"
            >
              &nbsp;({{ post.description }})
            </span>
          </v-col>

          <v-col
            class="text-no-wrap"
            cols="5"
            sm="3"
          >
            <v-chip
              :color="`teal lighten-4`"
              class="ml-0 mr-2 black--text"
              label
              small
            >
              Tag
            </v-chip>
            <strong v-html="post.title"></strong>
          </v-col>

          
        </v-row>
      </v-expansion-panel-header>

      <v-expansion-panel-content>
        <v-divider></v-divider>
        <v-card-text
          v-text="post.description"></v-card-text>
      </v-expansion-panel-content>
    </v-expansion-panel>
  </v-expansion-panels>
</template>

<script>
export default {
  name: "PostList",
  props: {
    posts: {
      type: Array,
      required: true
    }
  }
}
</script>