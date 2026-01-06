<script>
import { version as vueVersion } from 'vue'
import { computed } from 'vue'
import { useRoute } from 'vue-router'

export default {
  setup() {
    const route = useRoute()
    const name = computed(() => route.query.name ?? route.params.name ?? 'World')
    return { name, vueVersion }
  }
}
</script>

<template>
  <h1>Hello {{ name }}!</h1>
  <h5>(Vue {{ vueVersion }})</h5>
</template>
