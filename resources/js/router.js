import Vue from 'vue'
import Router from 'vue-router'
Vue.use(Router)
import firstPage from './components/pages/myFirstVuePage'
import newRoutePage from './components/pages/newRoutePage'
import hooks from './components/pages/basic/hooks'
import methods from './components/pages/basic/methods'

// vuex basic
import usecom from './vuex/usecom'

// admin project pages
import home from './components/pages/home'
import tags from './admin/pages/tags'
import category from './admin/pages/category'
import adminusers from './admin/pages/adminusers'

const routes = [
    // vuex basic
    {
        path: '/testvuex',
        component: usecom
    },

    // projects routes...
    {
        path: '/',
        component: home
    },
    {
        path: '/tags',
        component: tags
    },
    {
        path: '/category',
        component: category
    },
    {
        path: '/adminusers',
        component: adminusers
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
