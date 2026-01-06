<script setup>
import { version as vieVersion } from 'vue'
import { defineProps } from 'vue'

defineProps {(
  name: { type: String, default 'World' }
)}
</script>

<template>
  <main style="padding:1rem; font-family:system-ui,sans-serif">
    Hello {{ name }}! (Vue {{ vueVersion }})
  </main>
</template>
