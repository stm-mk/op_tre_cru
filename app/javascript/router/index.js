import Vue from 'vue';
import Router from 'vue-router';

import TopIndex from '../pages/top/index.vue';
import ToremaCalculation from '../pages/torema_calculation/index.vue';
import RegisterIndex from "../pages/register/index";
import LoginIndex from "../pages/login/index";

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
    },
    {
      path: "/register",
      component: RegisterIndex,
      name: "RegisterIndex",
    },
    {
      path: "/login",
      component: LoginIndex,
      name: "LoginIndex",
    }
  ]
})

export default router