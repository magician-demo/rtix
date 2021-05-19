module.exports = {
  purge: [
    "./app/**/*.html.erb",
    "./app/helpers/**/*.rb",
    "./app/javascript/**/*.js",
    "./app/javascript/**/*.vue",
  ],
  darkMode: false, // or 'media' or 'class'
  theme: {
    height:{
      "9/10": '90%',
      "1/10": '10%',
      "screen": '100vh'
    },
    extend: {},
  },
  variants: {
    extend: {},
  },
  plugins: [],
}
