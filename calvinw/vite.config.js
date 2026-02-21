import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'
import tailwindcss from '@tailwindcss/vite'

// https://vite.dev/config/
export default defineConfig({
  plugins: [react(), tailwindcss()],
  server: {
    host: true,       // bind to 0.0.0.0 so Codespaces can proxy it
    port: 5173,
    strictPort: true, // fail if port is taken rather than silently incrementing
  },
})
