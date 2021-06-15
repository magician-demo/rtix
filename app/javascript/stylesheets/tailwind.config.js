const colors = require('tailwindcss/colors')

module.exports = {
  purge: [
    './app/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/javascript/**/*.vue',
  ],
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {
      spacing: {
        seats: '1.25rem',
        row: '53.625rem',
      },
      height: {
        ssm: '17px',
      },
      backgroundColor: (theme) => ({
        seat: '#444451',
        selected: '#6feaf6',
        popup: 'rgba(0, 0, 0, 0.5)',
      }),
      borderRadius: {
        xl: '10px',
      },
      width: {
        550: '550px',
        '45%': '45%',
      },
      inset: {
        30: '7.5rem',
        34: '130px'
      },
    },
  },
  variants: {
    extend: {},
  },
  plugins: [],
}
