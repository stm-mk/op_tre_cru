<template>
  <v-container fluid>
    <v-row justify="center">
      <v-subheader>Today</v-subheader>

      <PostList
        :posts="posts"
        @copy-clipboard="copyToClipboard"
      />
    </v-row>
  </v-container>
</template>

<script>
import PostList from "./components/PostList.vue"
import { mapActions, mapGetters } from 'vuex';

export default {
  name: "PostIndex",
  components: {
    PostList
  },
  data() {
    return {
      noimage_src: require("../../../assets/images/noimage.jpg"),
      lorem: 'Lorem ipsum dolor sit amet, at aliquam vivendum vel, everti delicatissimi cu eos. Dico iuvaret debitis mel an, et cum zril menandri. Eum in consul legimus accusam. Ea dico abhorreant duo, quo illum minimum incorrupte no, nostro voluptaria sea eu. Suas eligendi ius at, at nemore equidem est. Sed in error hendrerit, in consul constituam cum.',
    }
  },
  computed: {
    ...mapGetters("posts", ["posts"]),
  },
  created() {
    this.fetchPosts();
  },
  methods: {
    ...mapActions("posts", [
      "fetchPosts",
    ]),
    copyToClipboard(text) {
      navigator.clipboard.writeText(text)
      .then(() => {
        this.flashMessage.success({
          message: 'Game IDをコピーしました',
          time: 5000,
          blockClass: 'custom-block-class'
      });
      })
      .catch(e => {
        this.flashMessage.error({
          message: 'コピーに失敗しました',
          time: 5000,
          blockClass: 'custom-block-class'
        });
      })
    }
  }
}
</script>