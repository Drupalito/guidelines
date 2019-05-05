/**
 * @file
 * Functionality to enable lettrine functionality in CKEditor.
 */

(function () {
  'use strict';

  // Register plugin.
  CKEDITOR.plugins.add('lettrine', {
    hidpi: true,
    icons: 'lettrine',
    init: function (editor) {
      // Add single button.
      editor.ui.addButton('Lettrine', {
        command: 'addLettrineCmd',
        icon: this.path + 'icons/lettrine.png',
        label: 'Insert lettrine'
      });

      // Add CSS for edition state.
      var cssPath = this.path + 'lettrine.css';
      editor.on('mode', function () {
        if (editor.mode === 'wysiwyg') {
          this.document.appendStyleSheet(cssPath);
        }
      });

      var allowedContent = 'div p(!lettrine)';

      // Command to insert initial structure.
      editor.addCommand('addLettrineCmd', {
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

            var selOutputLinks = '';
            for ( var i = 1; i < selOutput.length; i++ ) {
              var child = selOutput[i];
              selOutputLinks += '<p>' + child + '</p>';
            }

            var dl = new CKEDITOR.dom.element.createFromHtml(
              '<div class="lettrine">' +
              '<p>' + selOutput[0] + '</p>' + selOutputLinks +
              '</div>');
          }
          else {
            var dl = new CKEDITOR.dom.element.createFromHtml(
              '<div class="lettrine">' +
              '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ullam accusamus voluptate laudantium rerum quisquam excepturi quae nam eligendi voluptatibus error delectus impedit architecto distinctio repudiandae officiis, quaerat corporis blanditiis est earum quos molestias veniam, temporibus velit. Aperiam reprehenderit impedit soluta.</p>' +
              '<p><a href="#lien_vers_une_page">Lien vers une page</a></p>' +
              '<p><a href="#lien_vers_une_autre_page">Lien vers une autre page</a></p>' +
              '</div>');
          }
          editor.insertElement(dl);
        }
      });

      // Context menu.
      if (editor.contextMenu) {

        editor.contextMenu.addListener(function (element) {
          var parentEl = element.getAscendant('div', true);
        });
      }
    }
  });
})();
