<template>
  <v-main class="grey lighten-2">
    <v-container fluid fill-height>
      <v-card
        class="mx-auto my-12"
        width="400"
      >
        <v-card-title class="grey grey lighten-2">
          ログイン
        </v-card-title>

        <v-card-text>
          <v-container>
            <v-row class="mt-2">
              <v-col cols="12">
                <v-text-field 
                  v-model="user.email" 
                  label="Email*" 
                  type="email"
                  placeholder="test@example.com"
                />
              </v-col>
              <v-col cols="12">
                <v-text-field 
                  v-model="user.password" 
                  label="Password*" 
                  type="password"
                  placeholder="password"
                />
              </v-col>
            </v-row>
          </v-container>
          <small>*indicates required field</small>
        </v-card-text>
        
        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn
            outlined
            rounded
            text
            class="mx-2 my-2"
            type="submit"
            @click="login"
          >
            ログイン
          </v-btn>
        </v-card-actions>
      </v-card>
    </v-container>
  </v-main>
</template>

<script>
import { mapActions } from 'vuex'

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
  methods: {
    ...mapActions("users", [
      "loginUser"
    ]),
    async login() {
      try {
        await this.loginUser(this.user)
        this.$router.push({ name: "TopIndex" })
      } catch (error) {
        console.log(error);
      }
    }
  }
}

</script>

<style scoped>
</style>