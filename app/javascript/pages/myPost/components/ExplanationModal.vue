<template>
  <v-card>
    <v-card-title class="grey grey lighten-2">解説</v-card-title>
    <v-card-text class="mt-4">
      トレマ周回数計算ができますよ！（仮文章）
    </v-card-text>

    <v-divider></v-divider>

    <v-card-actions>
      <v-spacer></v-spacer>
      <v-btn icon @click="handleCloseModal">
        <v-icon>mdi-close</v-icon>
      </v-btn>
    </v-card-actions>
  </v-card>
</template>

<script>
export default {
  methods: {
    handleCloseModal() {
      this.$emit('close-modal')
    }
  }
}
</script>
