import axios from '../../plugins/axions';

const state = {
  posts: []
}

const getters = {
  posts: state => state.posts
}

const mutations = {
  setPosts: (state, posts) => {
    state.posts = posts
  },
  addPost: (state, post) => {
    state.posts.push(post)
  }
}

const actions = {
  fetchPosts({commit}) {
    axios.get('posts')
      .then(res => {
        commit('setPosts', res.data)
      })
      .catch(err => console.log(err.response))
  },
  createPost({commit}, post) {
    return axios.post('posts', post)
      .then(res => {
        commit('addPost', res.data)
      })
  }
}

export default {
  namespaced: true,
  state,
  getters,
  mutations,
  actions
}