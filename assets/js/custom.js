
$(document).ready(function() {

  var $temp = $('<input class="a11y">');
  var $btnCopy = $('.clipboard-copy');

  $btnCopy.on('click', function(e) {

    var $this  = $(this);

    $this.addClass('copy-pointer');

    if ($this.data('color-copy')) {

      var $toCopy = $this.data('color-copy');
      var $text = $('.copy', $this).text();

      $('body').append($temp);
      $temp.val($toCopy).select();
      document.execCommand('copy');

      $('.copy', $this).text('Couleur copiée');

    }
    else if ($this.data('icon-fa')) {
      var $icon = $this.prev('p').find('small').text();
      var $toCopy = '<span class="fa fa-' + $icon + '" aria-hidden="true"></span>';
      var $text = $('.copy', $this).text();

      $('body').append($temp);
      $temp.val($toCopy).select();
      document.execCommand('copy');
      $('.copy', $this).text('Icon HTML copié');
    }

    setTimeout(function() {
      $this.removeClass('copy-pointer');
      $('.copy', $this).text($text);
    }, 1000);

    return false;
  });

});
