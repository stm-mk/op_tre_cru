<template>
  <v-main class="grey lighten-2">
    <v-container
      fluid
      fill-height
    >
      <v-card
        id="login-form"
        class="mx-auto my-12"
        width="400"
      >
        <ValidationObserver v-slot="{ invalid }">
          <v-card-title class="grey grey lighten-2">
            ログイン
          </v-card-title>

          <v-card-text>
            <v-container>
              <v-row class="mt-2">
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
              :disabled="invalid"
              @click="login"
            >
              ログイン
            </v-btn>
          </v-card-actions>
        </ValidationObserver>
      </v-card>
    </v-container>
  </v-main>
</template>

<script>
import { mapActions, mapGetters } from 'vuex'

export default {
  name: 'LoginIndes',
  data() {
    return {
      user: {
        email: '',
        password: ''
      }
    }
  },
  computed: {
    ...mapGetters("users", [
      "flash"
    ])
  },
  methods: {
    ...mapActions("users", [
      "loginUser"
    ]),
    async login() {
      try {
        await this.loginUser(this.user)
        this.$router.push({ name: "TopIndex" })
        this.flashMessage.success({
            message: 'ログインに成功しました',
            time: 5000,
            blockClass: 'custom-block-class'
        });
      } catch (error) {
        // console.log(error.response.status);
        if (error.response.status == 401) {
          this.flashMessage.error({
            message: 'ログインに失敗しました',
            time: 5000,
            blockClass: 'custom-block-class'
          });
        }
      }
    }
  }
}

</script>

<style scoped>
</style>