import axios from '../../plugins/axions';

const state = {
  tags: [],
  tag: []
}

const getters = {
  tags: state => state.tags,
  tag: state => state.tag
}

const mutations = {
  setTags: (state, tags) => {
    state.tags = tags
  },
  setTag: (state, tag) => {
    state.tag = tag
  }
}

const actions = {
  fetchTags({commit}) {
    axios.get('tags')
      .then(res=> {
        commit('setTags', res.data)
      })
      .catch(err => console.log(err.response))
  },
  fetchTag({commit}, id) {
    axios.get('tags/'+ id)
    .then(res=> {
      commit('setTag', res.data)
    })
    .catch(err => console.log(err.response))
  }
}

export default {
  namespaced: true,
  state,
  getters,
  mutations,
  actions
}