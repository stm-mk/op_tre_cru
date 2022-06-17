import Vue from 'vue';
import Router from 'vue-router';
import store from '../store';

import TopIndex from '../pages/top/index.vue';
import ToremaCalculation from '../pages/torema_calculation/index.vue';
import RegisterIndex from "../pages/register/index";
import LoginIndex from "../pages/login/index";
import MyPost from "../pages/myPost/index";

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
    },
    {
      path: "/mypost",
      component: MyPost,
      name: "MyPostIndex",
      meta: { requiredAuth: true }
    }
  ]
})

router.beforeEach((to, from, next) => {
  store.dispatch('users/fetchAuthUser').then((authUser) => {
    if (to.matched.some(record => record.meta.requiredAuth) && !authUser) {
      next({ name: 'LoginIndex' });
    } else {
      next();
    }
  })
});

export default router