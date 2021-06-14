import 'swiper/swiper-bundle.css';
import Swiper from 'swiper/bundle';
document.addEventListener('turbolinks:load', ()=>{
  const swiper = new Swiper('.swiper-container', {
    direction: 'horizontal',
    loop: true,
    pagination: {
      el: '.swiper-pagination',
      clickable: true
    },
    navigation: {
      nextEl: '.swiper-button-next',
      prevEl: '.swiper-button-prev',
    },
    autoplay: {
      delay: 5000,
    }
  });
})