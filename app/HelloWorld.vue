<script setup>
import { version as vueVersion } from 'vue'
import { computed, watchEffect, watch } from 'vue'
import { useRoute } from 'vue-router'

const route = useRoute()
const name = computed(() => route?.query?.name?.trim() || route?.params?.name?.trim() || 'World')

watchEffect(() => {
  console.log('route.query:', route.query)
  console.log('route.params:', route.params)
  console.log('name:', name.value)
})

watch(() => [route.query.name, route.params.name], ([q, p]) => {
  console.log('query.name:', q, 'params.name:', p, 'computed name:', name.value)
})
</script>

<template>
  <h1>Hello {{ name }}!</h1>
  <h5>(Vue {{ vueVersion }})</h5>
</template>
