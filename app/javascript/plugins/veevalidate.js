import Vue from 'vue'
import { extend, ValidationProvider, ValidationObserver } from 'vee-validate'
import {
  email,
  required,
} from 'vee-validate/dist/rules'

Vue.component('ValidationObserver', ValidationObserver)
Vue.component('ValidationProvider', ValidationProvider)

extend('email', {
  ...email,
  message: '{_field_}の形式で入力してください'
});

extend('required', {
  ...required,
  message: '{_field_}は必須項目です'
});

extend('min', {
  validate(value, { length }) {
    return value.length >= length;
  },
  params: ['length'],
  message: '{_field_}は{length}文字以上で入力してください'
});

extend('password_confirmed', {
  params: ['target'],
  validate(value, { target }) {
    return value === target;
  },
  message: 'パスワードと一致しません'
});