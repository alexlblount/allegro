/** @type {import('tailwindcss').Config} */
export default {
  content: [
    // Include all Ruby files in app/frontend/components
    './app/frontend/components/**/*.{rb,erb}',
    './app/views/**/*.{erb,haml,html,slim}',
    './app/helpers/**/*.rb',
    './app/frontend/**/*.{js,jsx,ts,tsx,vue}',
  ],
  theme: {
    extend: {},
  },
  plugins: [],
};
