import Vue from 'vue'
import Router from 'vue-router'
Vue.use(Router)
import firstPage from './components/pages/myFirstVuePage'
import newRoutePage from './components/pages/newRoutePage'
import hooks from './components/pages/basic/hooks'
import methods from './components/pages/basic/methods'
const routes = [
    // projects routes...

    {
        path: '/my-new-vue-route',
        component: firstPage
    },


    // basic tutorials routes...
    {
        path: '/my-new-vue-route',
        component: firstPage
    },
    {
        path: '/new-route',
        component: newRoutePage
    },

    // vue hooks
    {
        path: '/hooks',
        component: hooks
    },
    // more basics (methods)
    {
        path: '/methods',
        component: methods
    },


]

export default new Router({
    mode: 'history',
    routes
})
