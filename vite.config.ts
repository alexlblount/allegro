import { defineConfig } from 'vite';
import { fileURLToPath } from 'url';
import path from 'path';
import react from '@vitejs/plugin-react';
import ViteRails from 'vite-plugin-rails';

// get the resolved path to the file then get the name of the directory
const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

export default defineConfig({
  plugins: [
    react({
      jsxRuntime: 'automatic',
    }),
    ViteRails({
      envVars: { RAILS_ENV: 'development' },
      envOptions: { defineOn: 'import.meta.env' },
      fullReload: {
        additionalPaths: [],
      },
    }),
  ],
  resolve: {
    alias: {
      '@': path.resolve(__dirname, 'app/frontend'),
    },
  },
});
