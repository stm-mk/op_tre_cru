import axios from '../../plugins/axions';

const state = {
  posts: [],
  myPost: null
}

const getters = {
  posts: state => state.posts,
  /* getMyPost: (state) => (id) => {
    return state.posts.find(post => post.user_id === id)
  } */
  myPost: state => state.myPost
}

const mutations = {
  setPosts: (state, posts) => {
    state.posts = posts
  },
  addMyPost: (state, post) => {
    state.myPost = post
  },
  updateMyPost: (state, updatePost) => {
    state.myPost = updatePost
  },
  deleteMyPost: (state) => {
    state.myPost = null
  },
  setMyPost: (state, post) => {
    state.myPost = post
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
  fetchMyPost({commit}) {
    axios.get('my_post')
      .then(res => {
        commit('setMyPost', res.data)
      })
      .catch(err => console.log(err.response))
  },
  createPost({commit}, post) {
    return axios.post('posts', {post: post})
      .then(res => {
        commit('addMyPost', res.data)
      })
  },
  updatePost({commit}, post) {
    return axios.patch(`posts/${post.id}`, {post: post})
      .then(res => { commit('updateMyPost', res.data) })
  },
  deletePost({commit}, post) {
    return axios.delete(`posts/${post.id}`, post)
      .then(res => { commit('deleteMyPost')})
  }
}

export default {
  namespaced: true,
  state,
  getters,
  mutations,
  actions
}