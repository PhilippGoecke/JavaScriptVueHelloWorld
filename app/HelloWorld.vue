<script setup>
import { version as vueVersion } from 'vue'
import { computed } from 'vue'
import { useRoute } from 'vue-router'

const route = useRoute()
const name = computed(() => route.query.name ?? route.params.name ?? 'World')
</script>

<template>
  <main style="padding:1rem; font-family:system-ui,sans-serif">
    Hello {{ name }}! (Vue {{ vueVersion }})
  </main>
</template>
