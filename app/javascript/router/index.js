import Vue from 'vue';
import Router from 'vue-router';

import TopIndex from '../pages/top/index.vue';
import ToremaCalculation from '../pages/torema_calculation/index.vue';

Vue.use(Router)

const router = new Router({
  mode: 'history',
  routes: [
    {
      path: '/',
      name: 'TopIndex',
      component: TopIndex
    },
    {
      path: '/torema_calculations',
      name: 'ToremaCalculation',
      component: ToremaCalculation,
    }
  ]
})

export default router