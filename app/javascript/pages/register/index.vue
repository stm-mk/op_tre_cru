<template>
  <v-main class="grey lighten-2">
    <v-container
      fluid
      fill-height
    >
      <v-card
        id="register-form"
        class="mx-auto my-12"
        width="400"
      >
        <ValidationObserver v-slot="{ invalid }">
          <v-card-title class="grey grey lighten-2">
            ユーザー登録
          </v-card-title>

          <v-card-text>
            <v-container>
              <v-row class="mt-2">
                <v-col cols="12">
                  <ValidationProvider
                    v-slot="{ errors }"
                    rules="required"
                    name="名前"
                  >
                    <v-text-field
                      v-model="user.name" 
                      label="Name*" 
                      placeholder="username"
                      :error-messages="errors"
                    />
                  </ValidationProvider>
                </v-col>

                <v-col cols="12">
                  <ValidationProvider
                    v-slot="{ errors }"
                    rules="required|email"
                    name="メールアドレス"
                  >
                    <v-text-field 
                      v-model="user.email" 
                      label="Email*" 
                      type="email"
                      placeholder="test@example.com"
                      :error-messages="errors"
                    />
                  </ValidationProvider>
                </v-col>

                <v-col cols="12">
                  <ValidationProvider
                    v-slot="{ errors }"
                    rules="required|min:6"
                    name="パスワード"
                    vid="password"
                  >
                    <v-text-field 
                      v-model="user.password" 
                      label="Password*" 
                      type="password"
                      placeholder="password"
                      :error-messages="errors"
                    />
                  </ValidationProvider>
                </v-col>

                <v-col cols="12">
                  <ValidationProvider
                    v-slot="{ errors }"
                    rules="required|min:6|password_confirmed:@password"
                    name="確認用パスワード"
                  >
                    <v-text-field 
                      v-model="user.password_confirmation" 
                      label="Password（確認）*" 
                      type="password"
                      placeholder="password"
                      :error-messages="errors"
                    />
                  </ValidationProvider>
                </v-col>

                <v-col cols="12">
                  <validation-provider
                    v-slot="{ errors }"
                    rules="required"
                    name="チェック"
                  >
                    <v-checkbox
                      v-model="policyCheck"
                      :error-messages="errors"
                      value="1"
                      label="プライバシーポリシー/利用規約に同意*"
                      type="checkbox"
                      required
                    ></v-checkbox>
                  </validation-provider>
                </v-col>
              </v-row>
            </v-container>
            <small>*必須項目</small>
          </v-card-text>
          
          <v-card-actions>
            <v-spacer />
            <v-btn
              outlined
              rounded
              text
              class="mx-2 my-2"
              type="submit"
              @click="register"
              :disabled="invalid"
            >
              登録
            </v-btn>
          </v-card-actions>
        </ValidationObserver>
      </v-card>
    </v-container>
  </v-main>
</template>

<script>
export default {
  name: 'RegisterIndes',
  data() {
    return {
      user: {
        name: '',
        email: '',
        password: '',
        password_confirmation: ''
      },
      policyCheck: null
    }
  },
  methods: {
    register() {
      this.$axios.post('users', { user: this.user })
        .then(res => {
          this.$router.push({ name: 'LoginIndex' })
          this.flashMessage.success({
            message: 'ユーザー登録に成功しました',
            time: 5000,
            blockClass: 'custom-block-class'
        });
        })
        .catch(error => {
          // console.log(error.response.status)
          if (error.response.status == 400) {
          this.flashMessage.error({
            message: 'ユーザー登録に失敗しました',
            time: 5000,
            blockClass: 'custom-block-class'
          });
        }
        })
    }
  }
}

</script>

<style scoped>
</style>