<script setup>
import { version as vueVersion } from 'vue'

const params = new URLSearchParams(window.location.search)
const name = params.get('name') || 'World'
</script>

<template>
  <h1>Hello {{ name }}!</h1>
  <h5>(Vue {{ vueVersion }})</h5>
</template>
