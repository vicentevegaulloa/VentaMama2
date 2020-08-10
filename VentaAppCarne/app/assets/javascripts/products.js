$(document).ready(function() {
  $('tr.current-product-row').on('click', function() {
    $(this).nextUntil("tr.current-product-row").toggle();
  })

})
