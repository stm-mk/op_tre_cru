import Vue from 'vue';
import Router from 'vue-router';

import TopIndex from '../pages/top/index.vue';

Vue.use(Router)

const router = new Router({
  mode: 'history',
  routes: [
    {
      path: '/',
      name: 'TopIndex',
      component: TopIndex
    }
  ]
})

export default router