<template>
  <v-footer
    padless
  >
    <v-row
      justify="center"
      no-gutters
    >
      <v-btn
        v-for="footerLink in footerLinks"
        :key="footerLink.link"
        :to="footerLink.url"
        class="my-2"
        text
        rounded
      >
        {{ footerLink.link }}
      </v-btn>
      <v-col
        class="py-4 text-center"
        cols="12"
      >
        @2022 - <strong>タイトル</strong>
      </v-col>
    </v-row>
  </v-footer>
</template>

<script>
export default {
  data: function() {
    return {
      footerLinks: [
        { link: '利用規約', url: '#'},
        { link: 'プライバシーポリシー', url: '#'}
      ]
    }
  }
}
</script>