import Vue from "vue";
import Vuex from "vuex";

import users from "./modules/users"
import posts from "./modules/posts"
import tags from "./modules/tags"
import characters from "./modules/character"

Vue.use(Vuex);

const store = new Vuex.Store({
  modules: {
    users,
    posts,
    tags,
    characters
  }
});

export default store;