<template>
  <v-main class="grey lighten-2">
    <v-container fluid fill-height>
      <v-card
        class="mx-auto my-12"
        width="400"
        id="register-form"
      >
        <v-card-title class="grey grey lighten-2">
          ユーザー登録
        </v-card-title>

        <v-card-text>
          <v-container>
            <v-row class="mt-2">
              <v-col cols="12">
                <v-text-field
                  v-model="user.name" 
                  label="Name*" 
                  placeholder="username"
                />
              </v-col>
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
              <v-col cols="12">
                <v-text-field 
                  v-model="user.password_confirmation" 
                  label="Password（確認）*" 
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
            @click="register"
          >
            登録
          </v-btn>
        </v-card-actions>
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
      }
    }
  },
  methods: {
    register() {
      this.$axios.post('users', { user: this.user })
        .then(res => {
          this.$router.push({ name: 'LoginIndex' })
        })
        .catch(err => {
          console.log(err)
        })
    }
  }
}

</script>

<style scoped>
</style>