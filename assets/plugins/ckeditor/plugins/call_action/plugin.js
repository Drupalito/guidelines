/**
 * @file
 * Functionality to enable call_action functionality in CKEditor.
 */

(function () {
  'use strict';

  // Register plugin.
  CKEDITOR.plugins.add('call_action', {
    hidpi: true,
    icons: 'call_action',
    init: function (editor) {
      // Add single button.
      editor.ui.addButton('Call_action', {
        command: 'addCTACmd',
        icon: this.path + 'icons/call_action.png',
        label: 'Insert call_action'
      });

      // Add CSS for edition state.
      var cssPath = this.path + 'call_action.css';
      editor.on('mode', function () {
        if (editor.mode === 'wysiwyg') {
          this.document.appendStyleSheet(cssPath);
        }
      });

      var allowedContent = 'div p a(!frame)';

      // Command to insert initial structure.
      editor.addCommand('addCTACmd', {
        allowedContent: allowedContent,

        exec: function (editor) {
          var dl = new CKEDITOR.dom.element.createFromHtml(
            '<div class="frame text-center"><div class="frame__inner"><div class="frame__header"><h2 class="frame__title caps">Call to Action Headline</h2><p class="frame__excerpt">Vivamus nunc nunc, lacinia ac nulla eget. Vivamus nunc nunc, lacinia ac nulla eget.<br/> Pellentesque congue sodales lacinia.</p></div><div class="frame__action"><a class="btn btn--default" href="#cta1">Call To Action</a><a class="btn btn--primary" href="#cta2">Call To Action 2</a></div></div></div>');
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
