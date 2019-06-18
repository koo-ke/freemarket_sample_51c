$(function() {
  $(document).on('turbolinks:load', function() { 

    var mySwiper = new Swiper('.swiper-container', {
      autoHeight: true,
      loop: true,
      speed: 800,
      autoplay: {
        delay: 3500,
        disableOnInteraction: false,
        reverseDirection: false
      },
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev'
      },
      pagination: {
        el: '.swiper-pagination',
        type: 'bullets',
        clickable: true
      }
    });

  });
});