import { defineConfig } from 'cypress'

export default defineConfig({
  e2e: {
    supportFile: false,
    // setup baseUrl for convenience
    baseUrl: 'http://localhost:4321/', 
  }
})