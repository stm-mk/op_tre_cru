import axios from '../../plugins/axions';

const state = {
  characters: [],
  character: []
}

const getters = {
  characters: state => state.characters,
  character: state => state.character
}

const mutations = {
  setCharacters: (state, characters) => {
    state.characters = characters
  },
  setCharacter: (state, character) => {
    state.character = character
  }
}

const actions = {
  fetchCharacters({commit}) {
    axios.get('characters')
      .then(res=> {
        commit('setCharacters', res.data)
      })
      .catch(err => console.log(err.response))
  },
  fetchCharacter({commit}, id) {
    axios.get('characters/'+ id)
    .then(res=> {
      commit('setCharacter', res.data)
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