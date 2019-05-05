/**
 * @file
 * Functionality to enable legend functionality in CKEditor.
 */

(function () {
  'use strict';

  // Register plugin.
  CKEDITOR.plugins.add('legend', {
    hidpi: true,
    icons: 'Legend',
    init: function (editor) {
      // Add single button.
      editor.ui.addButton('Legend', {
        command: 'addLegendCmd',
        icon: this.path + 'icons/legend.png',
        label: 'Insert legend'
      });

      // Add CSS for edition state.
      var cssPath = this.path + 'legend.css';
      editor.on('mode', function () {
        if (editor.mode === 'wysiwyg') {
          this.document.appendStyleSheet(cssPath);
        }
      });

      var allowedContent = 'blockquote cite(!legend)';

      // Command to insert initial structure.
      editor.addCommand('addLegendCmd', {
        allowedContent: allowedContent,

        exec: function (editor) {
          var selection = editor.getSelection();
          var range = selection.getRanges()[0]
          // copy the range into a new var
          var fragment = range.clone().cloneContents();
          // get the child elements of the selected text:
          var childList = fragment.getChildren()

          var selOutput = [];
          for ( var i = 0; i < childList.count(); i++ ) {
            var child = childList.getItem(i).$.innerHTML;
            selOutput.push(child);
          }

          if (typeof selOutput !== 'undefined' && selOutput.length > 0) {

            var selOutputQuote = '';
            var newOutput = selOutput.slice(0,-1);
            for ( var i = 0; i < newOutput.length; i++ ) {
              selOutputQuote += '<p>' + newOutput[i] + '</p>';
            }

            var dl = new CKEDITOR.dom.element.createFromHtml(
              '<figure class="legend"><img class="legend__image" src="https://picsum.photos/400" alt="" /><figcaption class="legend__caption">' + selOutput.slice(-1)[0] + '</figcaption></figure>');
          }
          else {
            var dl = new CKEDITOR.dom.element.createFromHtml(
            '<figure class="legend"><img class="legend__image" src="https://picsum.photos/400" alt="" /><figcaption class="legend__caption">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</figcaption></figure>');
          }
          editor.insertElement(dl);
        }
      });

      // Context menu.
      if (editor.contextMenu) {
        editor.contextMenu.addListener(function (element) {
          var parentEl = element.getAscendant('blockquote', true);
        });
      }
    }
  });
})();
