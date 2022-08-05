<template>
  <v-card-text>
    <v-row>
      <v-col
        cols="12"
      >
        <h4>目標ポイント</h4>
          <ValidationProvider
            v-slot="{ errors }"
            rules="required"
            name="目標ポイント"
          >
          <v-autocomplete
            v-model="TargetPoint"
            :items="points"
            item-text="name"
            item-value="point"
            attach
            chips
            label="目標ポイントを選択してください"
            no-data-text="候補が見つかりませんでした。"
            :error-messages="errors"
          ></v-autocomplete>
        </ValidationProvider>
      </v-col>
    </v-row>

    <v-row>
      <v-col
        cols="12"
        sm="12"
        md="4"
      >
        <h4>船長</h4>
        <v-chip-group
          v-model="sencho"
          active-class="primary--text"
          column
        >
          <v-chip
            large
            label
            v-for="item in items"
            :key="item"
            :value="item"
            class="mx-2"
          >
            {{ item }}
          </v-chip>
        </v-chip-group>

        <v-checkbox
          v-model="friendCheck"
          label="フレンド船長は同じキャラクターを使用する"
          type="checkbox"
        ></v-checkbox>
        <v-checkbox
          v-model="birdCheck"
          label="サウスバードマスを踏む"
          type="checkbox"
        ></v-checkbox>
      </v-col>

      <v-col
        cols="12"
        sm="12"
        md="4"
      >
        <h4>フレンド船長</h4>
        <v-chip-group
          v-model="friend"
          active-class="primary--text"
          column
        >
          <v-chip
            large
            label
            v-for="item in items"
            :key="item"
            :value="item"
            class="mx-2"
            :disabled="friendCheck"
          >
            {{ item }}
          </v-chip>
        </v-chip-group>
      </v-col>
    </v-row>

    <v-row>
      <v-col
        cols="12"
        sm="12"
        md="4"
      >
        <h4>船員①</h4>
        <v-chip-group
          v-model="member1"
          active-class="primary--text"
          column
        >
          <v-chip
            large
            label
            v-for="item in items"
            :key="item"
            :value="item"
            class="mx-2"
          >
            {{ item }}
          </v-chip>
        </v-chip-group>
      </v-col>

      <v-col
        cols="12"
        sm="12"
        md="4"
      >
        <h4>船員②</h4>
        <v-chip-group
          v-model="member2"
          active-class="primary--text"
          column
        >
          <v-chip
            large
            label
            v-for="item in items"
            :key="item"
            :value="item"
            class="mx-2"
          >
            {{ item }}
          </v-chip>
        </v-chip-group>
      </v-col>

      <v-col
        cols="12"
        sm="12"
        md="4"
      >
        <h4>船員③</h4>
        <v-chip-group
          v-model="member3"
          active-class="primary--text"
          column
        >
          <v-chip
            large
            label
            v-for="item in items"
            :key="item"
            :value="item"
            class="mx-2"
          >
            {{ item }}
          </v-chip>
        </v-chip-group>
      </v-col>
    </v-row>
    <v-divider />
    
    <v-row
      justify="center"
      class="mt-1"
    >
      <v-col
       cols="12"
       sm="12"
       md="4"
      >
        <v-btn
          block
          text
          outlined
          @click="resetBtn"
        >
          リセット
        </v-btn>
      </v-col>
    </v-row>

    <v-btn
      id="result-bairitu"
      dark
      fixed
      bottom
      right
      x-large
    >
      あなたの倍率：{{ approximate }}
    </v-btn>
  </v-card-text>
</template>

<script>
export default {
  data() {
    return {
      items: ['2.0', '1.8', '1.7','1.6', '1.4'],
      points: [
        { name: "100万ポイント", point: 1000000 },
        { name: "200万ポイント", point: 2000000 },
        { name: "300万ポイント", point: 3000000 },
        { name: "400万ポイント", point: 4000000 },
        { name: "500万ポイント", point: 5000000 },
        { name: "600万ポイント", point: 6000000 },
        { name: "700万ポイント", point: 7000000 },
        { name: "800万ポイント", point: 8000000 },
        { name: "900万ポイント", point: 9000000 },
        { name: "1000万ポイント", point: 10000000 },
      ],
      sencho: "",
      friend: "",
      member1: "",
      member2: "",
      member3: "",
      friendCheck: true,
      birdCheck: true,
      subPoint: '5.08',
      TargetPoint: ""
    }
  },
  computed: {
    resultSencho() {
      if(this.sencho) {
        return this.sencho
      } else {
        return 1.35
      }
    },
    resultFriend() {
      if(this.friend && !this.friendCheck) {
        return this.friend
      } else if(this.friendCheck) {
        return this.resultSencho
      } else {
        return 1.35
      }
    },
    resultMember1() {
      if(this.member1) {
        return this.member1
      } else {
        return 1.35
      }
    },
    resultMember2() {
      if(this.member2) {
        return this.member2
      } else {
        return 1.35
      }
    },
    resultMember3() {
      if(this.member3) {
        return this.member3
      } else {
        return 1.35
      }
    },
    approximate() {
      if(this.birdCheck) {
        this.subPoint = this.subPoint * 1.5
        return Math.round((this.resultSencho * this.resultFriend * this.resultMember1 * this.resultMember2 * this.resultMember3 * 1.4 * 1.5) * 100) / 100
      } else {
        return Math.round((this.resultSencho * this.resultFriend * this.resultMember1 * this.resultMember2 * this.resultMember3 * 1.4) * 100) / 100
      }
    },
  },
  created() {
    this.calculation();
  },
  watch: {
    approximate() {
      this.resetCalculation();
      this.calculation();
    },
    TargetPoint: function() {
      this.resetCalculation();
      this.calculation();
    }
  },
  methods: {
    resetBtn() {
      this.sencho = "",
      this.friend = "",
      this.member1 = "",
      this.member2 = "",
      this.member3 = "",
      this.friendCheck = true,
      this.birdCheck = true,
      this.TargetPoint = "",
      this.flashMessage.success({
        message: 'リセットしました',
        time: 5000,
        blockClass: 'custom-block-class'
      })
    },
    calculation() {
      this.$emit('calculation-point', this.approximate, this.subPoint, this.TargetPoint)
    },
    resetCalculation() {
      this.$emit('reset-calculation')
      this.subPoint = 5.08
    }
  }
}
</script>

<style scoped>
#result-bairitu {
  z-index: 2;
}
</style>