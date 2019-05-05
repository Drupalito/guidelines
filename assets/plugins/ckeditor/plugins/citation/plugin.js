/**
 * @file
 * Functionality to enable citation functionality in CKEditor.
 */

(function () {
  'use strict';

  // Register plugin.
  CKEDITOR.plugins.add('citation', {
    hidpi: true,
    icons: 'Citation',
    init: function (editor) {
      // Add single button.
      editor.ui.addButton('Citation', {
        command: 'addCitationCmd',
        icon: this.path + 'icons/citation.png',
        label: 'Insert citation'
      });

      // Add CSS for edition state.
      var cssPath = this.path + 'citation.css';
      editor.on('mode', function () {
        if (editor.mode === 'wysiwyg') {
          this.document.appendStyleSheet(cssPath);
        }
      });

      var allowedContent = 'blockquote cite(!citation)';

      // Command to insert initial structure.
      editor.addCommand('addCitationCmd', {
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
              '<div class="citation"><blockquote>' +
              '' + selOutputQuote + '<cite>' + selOutput.slice(-1)[0] + '</cite>' +
              '</blockquote></div>');
          }
          else {
            var dl = new CKEDITOR.dom.element.createFromHtml(
            '<div class="citation"><blockquote>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Est ratione placeat incidunt, dicta libero aperiam repellendus recusandae, nesciunt reiciendis veniam ab amet commodi aut sed ipsam temporibus ullam soluta eum vitae magni debitis laborum assumenda hic. Nihil, molestias, blanditiis. Numquam. <cite>Isaac Asimov</cite></blockquote></div>');
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
