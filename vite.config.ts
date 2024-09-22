import { defineConfig } from 'vite';
import React from '@vitejs/plugin-react';
import ViteRails from "vite-plugin-rails";

export default defineConfig({
  plugins: [
    React(),
    ViteRails({
      envVars: { RAILS_ENV: "development" },
      envOptions: { defineOn: "import.meta.env" },
      fullReload: {
        additionalPaths: [],
      },
    }),
  ],
});
