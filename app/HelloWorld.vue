<script setup>
import { version as vueVersion } from 'vue'
import { computed } from 'vue'
import { useRoute } from 'vue-router'

const route = useRoute()
const name = computed(() => route.query.name?.trim() || route.params.name?.trim() || 'World')
</script>

<template>
  <h1>Hello {{ name }}!</h1>
  <h5>(Vue {{ vueVersion }})</h5>
</template>
