<template>
  <v-card-text>
    <v-row>
      <v-col
        cols="12"
        sm="6"
        md="6"
      >
        <h4>目標ポイント</h4>
        <ValidationProvider
          v-slot="{ errors }"
          rules="required|min_value:1"
          name="目標ポイント"
        >
          <v-text-field
            v-model="TargetPoint"
            label="目標を入力してください"
            type="number"
            min="1"
            suffix="ポイント"
            :error-messages="errors"
          >
            <template v-slot:append-outer>
              <v-btn class="mx-1"
                icon
                @click="plusTargetPoint"
              >
                <v-icon
                  large
                >
                  mdi-plus-box-outline
                </v-icon>
              </v-btn>
              <v-btn 
                icon
                @click="minusTargetPoint"
              >
                <v-icon
                  large
                >
                  mdi-minus-box-outline
                </v-icon>
              </v-btn>
            </template>
          </v-text-field>
        </ValidationProvider>
      </v-col>
    </v-row>

    <v-row>
      <v-col
        cols="12"
        sm="12"
        md="4"
      >
        <ValidationProvider
          v-slot="{ errors }"
          rules="required|min_value:1"
          name="倍率"
        >
          <v-text-field
            v-model="bossPoint1"
            label="BOSS戦"
            type="number"
            min="1"
            suffix="倍"
            :error-messages="errors"
          />
        </ValidationProvider>

        <v-checkbox
          v-model="bossPartyCheck"
          label="乱入戦でも同じ倍率を使用する"
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
        <ValidationProvider
          v-slot="{ errors }"
          rules="required|min_value:1"
          name="倍率"
        >
          <v-text-field
            v-model="bossPoint2"
            label="乱入戦"
            type="number"
            min="1"
            suffix="倍"
            :disabled="bossPartyCheck"
            :error-messages="errors"
          />
        </ValidationProvider>
      </v-col>
    </v-row>

    <v-row>
      <v-col
        cols="12"
        sm="12"
        md="4"
      >
        <ValidationProvider
          v-slot="{ errors }"
          rules="required|min_value:1"
          name="倍率"
        >
          <v-text-field
            v-model="encountPoint1"
            label="遭遇戦①"
            type="number"
            min="1"
            suffix="倍"
            :error-messages="errors"
          />
        </ValidationProvider>
        <v-checkbox
          v-model="encountPartyCheck"
          label="全ての遭遇戦で同じ倍率を使用する"
          type="checkbox"
        ></v-checkbox>
      </v-col>

      <v-col
        cols="12"
        sm="12"
        md="4"
      >
        <ValidationProvider
          v-slot="{ errors }"
          rules="required|min_value:1"
          name="倍率"
        >
          <v-text-field
            v-model="encountPoint2"
            label="遭遇戦②"
            type="number"
            min="1"
            suffix="倍"
            :disabled="encountPartyCheck"
            :error-messages="errors"
          />
        </ValidationProvider>
      </v-col>

      <v-col
        cols="12"
        sm="12"
        md="4"
      >
        <ValidationProvider
          v-slot="{ errors }"
          rules="required|min_value:1"
          name="倍率"
        >
          <v-text-field
            v-model="encountPoint3"
            label="遭遇戦③"
            type="number"
            min="1"
            suffix="倍"
            :disabled="encountPartyCheck"
            :error-messages="errors"
          />
        </ValidationProvider>
      </v-col>

      <v-col
        cols="12"
        sm="12"
        md="4"
      >
        <ValidationProvider
          v-slot="{ errors }"
          rules="required|min_value:1"
          name="倍率"
        >
          <v-text-field
            v-model="encountPoint4"
            label="遭遇戦④"
            type="number"
            min="1"
            suffix="倍"
            :disabled="encountPartyCheck"
            :error-messages="errors"
          />
        </ValidationProvider>
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
          @click="exactCalculation"
        >
          計算
        </v-btn>
      </v-col>
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
  </v-card-text>
</template>

<script>
export default {
  data() {
    return {
      TargetPoint: "",
      bossPoint1: "",
      bossPoint2: "",
      encountPoint1: "",
      encountPoint2: "",
      encountPoint3: "",
      encountPoint4: "",
      bossPartyCheck: true,
      encountPartyCheck: true,
      birdCheck: true,
      subPoint: '5.08',
      exact: {
        result: 0,
        count: 0
      }
    }
  },
  computed: {
    resultBoss1() {
      if(this.bossPoint1) {
        return this.bossPoint1
      } else {
        return 1
      }
    },
    resultBoss2() {
      if(this.bossPoint2 && !this.bossPartyCheck) {
        return this.bossPoint2
      } else {
        return this.resultBoss1
      }
    },
    resultEncount1() {
      if(this.encountPoint1) {
        return this.encountPoint1
      } else {
        return 1
      }
    },
    resultEncount2() {
      if(this.encountPoint2 && !this.encountPartyCheck) {
        return this.encountPoint2
      } else {
        return this.resultEncount1
      }
    },
    resultEncount3() {
      if(this.encountPoint3 && !this.encountPartyCheck) {
        return this.encountPoint3
      } else {
        return this.resultEncount1
      }
    },
    resultEncount4() {
      if(this.encountPoint4 && !this.encountPartyCheck) {
        return this.encountPoint4
      } else {
        return this.resultEncount1
      }
    },
  },
  methods: {
    resetBtn() {
      this.bossPoint1 = "",
      this.bossPoint2 = "",
      this.encountPoint1 = "",
      this.encountPoint2 = "",
      this.encountPoint3 = "",
      this.encountPoint4 = "",
      this.friendCheck = true,
      this.birdCheck = true,
      this.TargetPoint = "",
      this.flashMessage.success({
        message: 'リセットしました',
        time: 5000,
        blockClass: 'custom-block-class'
      })
      this.resetCalculation();
    },
    calculation() {
      this.$emit('calculation-point', this.exact.count, this.exact.result, this.TargetPoint)
    },
    resetCalculation() {
      this.$emit('reset-calculation')
    },
    exactCalculation() {
      this.exact.count = 0
      this.exact.result = 0
      if(this.birdCheck) {
        for(var i = 0; this.exact.result < this.TargetPoint; i++) {
          this.exact.count += 1
          this.exact.result = this.exact.result 
                            + ((4000 + i * 200) * this.resultBoss1 
                            + (4000 + i * 200) * this.resultBoss2
                            + (1000 + i * 50) * this.resultEncount1
                            + (1000 + i * 50) * this.resultEncount2
                            + (1000 + i * 50) * this.resultEncount3
                            + (1000 + i * 50) * this.resultEncount4) * 1.5
        }
      } else {
        for(var i = 0; this.exact.result < this.TargetPoint; i++) {
          this.exact.count += 1
          this.exact.result = this.exact.result 
                            + (4000 + i * 200) * this.resultBoss1 
                            + (4000 + i * 200) * this.resultBoss2
                            + (1000 + i * 50) * this.resultEncount1
                            + (1000 + i * 50) * this.resultEncount2
                            + (1000 + i * 50) * this.resultEncount3
                            + (1000 + i * 50) * this.resultEncount4
        }
      }
      this.calculation();
    },
    plusTargetPoint() {
      this.TargetPoint = Number(this.TargetPoint) + 1000000
    },
    minusTargetPoint() {
      this.TargetPoint = Number(this.TargetPoint) - 1000000
    }
  }
}
</script>

<style scoped>
#result-bairitu {
  z-index: 2;
}
</style>