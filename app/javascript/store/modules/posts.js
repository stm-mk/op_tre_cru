import axios from '../../plugins/axions';

const state = {
  posts: []
}

const getters = {
  posts: state => state.posts,
  getMyPost: (state) => (id) => {
    return state.posts.find(post => post.user_id === id)
  }
}

const mutations = {
  setPosts: (state, posts) => {
    state.posts = posts
  },
  addPost: (state, post) => {
    state.posts.push(post)
  },
  updatePost: (state, updatePost) => {
    const index = state.posts.findIndex(post => {
      return post.id == updatePost.id
    })

    state.posts.splice(index, 1, updatePost)
  },
  deletePost: (state, deletePost) => {
    state.posts = state.posts.filter(post => {
      return post.id != deletePost.id
    })
  },

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
  },
  updatePost({commit}, post) {
    return axios.patch(`posts/${post.id}`, post)
      .then(res => { commit('updatePost', res.data) })
  },
  deletePost({commit}, post) {
    return axios.delete(`posts/${post.id}`, post)
      .then(res => { commit('deletePost', res.data)})
  }
}

export default {
  namespaced: true,
  state,
  getters,
  mutations,
  actions
}