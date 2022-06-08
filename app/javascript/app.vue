<template>
  <v-app id="app">
    <Header class="md-auto" />
    <router-view />
    <Footer class="md-auto" />
  </v-app>
</template>

<script>
import Header from './components/TheHeader'
import Footer from './components/TheFooter'

export default {
  components: {
    Header,
    Footer
  }
}
</script>

<style scoped>
</style>

