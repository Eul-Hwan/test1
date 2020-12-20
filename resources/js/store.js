import Vue from 'vue'
import Vuex from 'vuex'
Vue.use(Vuex)

export default new Vuex.Store({
    state : {
        counter : 1000
    },
    getters : {
        getCounter(state) {
            // if(state.counter > 1000) return 'o my god, this is big...'
            // return 'ok that is small'
            return state.counter
        },
        // getCounterByHalf(state) {
        //     return state.counter/2
        // },
    },
    mutations : {
        changeTheCounter(state, data){
            // console.log(data)
            state.counter += data
        }
    },
    actions : {
        changeCounterAction({commit}, data){
            // console.log(commit)
            commit('changeTheCounter', data)
        }
    }
})
