const flashesFadeOut = () => {
  $(document).ready(function(){
    setTimeout(function(){
      $('.alert').fadeOut();
    }, 2000);
  })
};

export { flashesFadeOut };
