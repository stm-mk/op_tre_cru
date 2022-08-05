<template>
  <v-main class="grey lighten-2">
    <v-container
      fluid
      fill-height
    >
      <v-row no-gutters>
        <v-col
          cols="12"
        >
          <v-card id="my-post-detail-modal">
            <v-toolbar
              class="title"
              elevation="2"
            >
              トレマ周回数計算
              <v-spacer />
              <v-btn
                fab
                dark
                small
                class="ml-4"
                @click.stop="handleShowExplanationModal"
              >
                <v-icon>mdi-help</v-icon>
              </v-btn>
            </v-toolbar>
            <v-tabs
              v-model="tab"
              grow
            >
              <v-tab href="#tab-1">
                概算
              </v-tab>
              <v-tab href="#tab-2">
                精算
              </v-tab>
            </v-tabs>
            <v-tabs-items
              v-model="tab"
            >
              <v-tab-item value="tab-1">
                <Approximate
                  @calculation-poin="calculation"
                  @reset-calculation="resetCalculation"
                />
              </v-tab-item>
              <v-tab-item value="tab-2">
                <ExactCalculate />
              </v-tab-item>
            </v-tabs-items>
          </v-card>

          <v-card id="my-post-detail-modal">
            <v-toolbar
              class="title mt-4"
              elevation="2"
            >
              トレマ周回数計算結果
              <v-spacer />
              <v-btn
                fab
                dark
                small
                class="ml-4"
                @click.stop="handleShowExplanationModal"
              >
                <v-icon>mdi-help</v-icon>
              </v-btn>
            </v-toolbar>
            
            <v-card-text v-if="this.tab === 'tab-1' && this.approximate.targetPoint">
              <v-row>
                <v-col
                  cols="12"
                  sm="6"
                  md="6"
                >
                  <v-text-field
                    v-model="approximate.targetPoint"
                    label="目標ポイント"
                    suffix="ポイント"
                    readonly
                  />
                </v-col>
              </v-row>
              <v-row>
                <v-col
                  cols="12"
                  sm="6"
                  md="6"
                >
                  <v-text-field
                    v-model="approximate.count"
                    label="周回数"
                    suffix="周"
                    readonly
                  />
                </v-col>
              </v-row>
              <v-row>
                <v-col
                  cols="12"
                  sm="6"
                  md="6"
                >
                  <v-text-field
                    v-model="approximate.result"
                    label="最終ポイント"
                    suffix="ポイント"
                    readonly
                  />
                </v-col>
              </v-row>
            </v-card-text>

            <v-card-text v-if="this.tab === 'tab-1' && !this.approximate.targetPoint">
              <h3>目標ポイントが選択されていません。</h3>
            </v-card-text>

            <v-card-text v-if="this.tab === 'tab-2'">
              <h3>ここに精算結果表示</h3>
            </v-card-text>
          </v-card>
        </v-col>
      </v-row>

      <v-dialog v-model="isVisibleExplanationModal">
        <ExplanationModal
          @close-modal="handleCloseExplanationModal"
        />
      </v-dialog>
    </v-container>
  </v-main>
</template>

<script>
import ExplanationModal from "./components/ExplanationModal.vue";
import Approximate from "./components/Approximate.vue";
import ExactCalculate from "./components/ExactCalculate.vue";

export default {
  name: 'PostIndex',
  components: {
    ExplanationModal,
    Approximate,
    ExactCalculate
  },
  data() {
    return {
      tab: 'tab-1',
      isVisibleExplanationModal: false,
      approximate: {
        result: 0,
        count: 0,
        targetPoint: 0
      }
    }
  },
  computed: {
    resultCalculate() {
      
    }
  },
  methods: {
    handleShowExplanationModal() {
      this.isVisibleExplanationModal = true;
    },
    handleCloseExplanationModal() {
      this.isVisibleExplanationModal = false;
    },
    calculation(point, subPoint, targetPoint) {
      this.approximate.targetPoint = targetPoint
      for(var i = 0; this.approximate.result < targetPoint; i++) {
        this.approximate.count += 1
        this.approximate.result = this.approximate.result + (4000 + i * 200) * point * 2 + (1000 + i * 50) * subPoint * 4
      }
    },
    resetCalculation() {
      this.approximate.count = 0
      this.approximate.result = 0
      this.approximate.targetPoint = ""
    }
  }
}
</script>