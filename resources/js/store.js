import Vue from 'vue'
import Vuex from 'vuex'
Vue.use(Vuex)

export default new Vuex.Store({
    state : {
        counter : 1000,
        deleteModalObj : {
            showDeleteModal : false,
            deleteUrl : '',
            data : null,
            deletingIndex : -1,
            isDeleted : false,
        },
        // tags : [],
    },
    getters : {
        getCounter(state) {
            // if(state.counter > 1000) return 'o my god, this is big...'
            // return 'ok that is small'
            return state.counter
        },
        getDeleteModalObj(state) {
            return state.deleteModalObj
        }
        // getCounterByHalf(state) {
        //     return state.counter/2
        // },
    },
    mutations : {
        changeTheCounter(state, data){
            // console.log(data)
            state.counter += data
        },
        setDeleteModal(state, data){
            const deleteModalObj = {
                showDeleteModal : false,
                deleteUrl : '',
                data : null,
                deletingIndex : -1,
                isDeleted : data,
            }
            state.deleteModalObj = deleteModalObj
            // state.deleteModalObj.isDeleted = data

            // state.tags.splice
        },
        setDeletingModalObj(state, data){
            state.deleteModalObj = data
        }
    },
    actions : {
        changeCounterAction({commit}, data){
            // console.log(commit)
            commit('changeTheCounter', data)
        }
    }
})
