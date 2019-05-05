/**
 * Copyright (c) 2003-2013, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.html or http://ckeditor.com/license
 */
// Enable local "abbr" plugin from /myplugins/abbr/ folder.
// CKEDITOR.plugins.addExternal( 'abbr', '../plugins/ckeditor/plugins/abbr/', 'plugin.js' );
// CKEDITOR.plugins.addExternal( 'abbr', '../plugins/ckeditor/plugins/abbr/', 'plugin.js' );

/**
 * WARNING: clear browser's cache after you modify this file.
 * If you don't do this, you may notice that browser is ignoring all your changes.
 */
CKEDITOR.editorConfig = function(config) {
  // extraPlugins: 'abbr';
  config.allowedContent = true;
  // config.allowedContent = 'div[class]; p[class]; a[class]; span[class]; a[!href](*);  caption; div; em; h1; h2; h3; h4; h5; h6; hr; i; img; li;  ol; p[*]{*}; pre; strong; sub; sup; table; thead; tbody; tfoot; td; th; tr; tt; u; ul; dl; dt; dd; iframe;';

  config.contentsCss = "../assets/corecss/base.editor.css";

  config.indentClasses = [ 'pls', 'plm', 'pll' ];
  config.justifyClasses = [ 'text-left', 'text-center', 'text-right', 'text-justify' ];

  // The minimum editor width, in pixels, when resizing it with the resize handle.
  config.resize_minWidth = 320;

  // Protect PHP code tags (<?...?>) so CKEditor will not break them when
  // switching from Source to WYSIWYG.
  // Uncommenting this line doesn't mean the user will not be able to type PHP
  // code in the source. This kind of prevention must be done in the server side
  // (as does Drupal), so just leave this line as is
  // PHP Code
  config.protectedSource.push(/<\?[\s\S]*?\?>/g);

  // Code tags
  config.protectedSource.push(/<code>[\s\S]*?<\/code>/gi);
  config.extraPlugins = 'citation,chapeau,legend,lettrine,call_action';

  /**
   * Append here extra CSS rules that should be applied into the editing area.
   * Example:
   * config.extraCss = 'body { color:#FF0000; }';
   */
  config.extraCss = '';

  /**
   * CKEditor's editing area body ID & class.
   * See http://drupal.ckeditor.com/tricks
   * This setting can be used if CKEditor does not work well
   * with your theme by default.
   */
  config.bodyClass = '';
  config.bodyId = '';

  config.stylesSet = [
    // Block Styles
    // { name: 'Paragraph', element: 'p' },
    // { name: 'Heading 2', element: 'h2' },
    // { name: 'Heading 3', element: 'h3' },
    // { name: 'Heading 4', element: 'h4' },
    // { name: 'Heading 5', element: 'h5' },
    // { name: 'Heading 6', element: 'h6' },
    // Inline Style
    // { name: 'Pre Text' , element: 'pre' },
    // { name: 'Address'  , element: 'address' },

    { name: 'Cited Work'       , element: 'cite' },
    { name: 'Computer Code'    , element: 'code' },
    { name: 'Keyboard Phrase'  , element: 'kbd' },
    { name: 'Inline Quote'     , element: 'q' },
    // { name: 'Sample Text'      , element: 'samp' },

    // Image Style
    { name: 'Image on Left', element: 'img', attributes: { 'class': 'alignleft' }},
    { name: 'Image on center', element: 'img', attributes: { 'class': 'aligncenter' }},
    { name: 'Image on Right', element: 'img', attributes: { 'class': 'alignright' }},
    { name: 'Image none', element: 'img', attributes: { 'class': 'alignnone' }},
    // Language direction
    { name: 'Language: RTL', element: 'span', attributes: { 'dir': 'rtl' }},
    { name: 'Language: LTR', element: 'span', attributes: { 'dir': 'ltr' }},

    { name: 'Color Default', element: 'span', attributes: { 'class': 'default-color' }},
    { name: 'Color Primary', element: 'span', attributes: { 'class': 'primary-color' }},
    { name: 'Color Secondary', element: 'span', attributes: { 'class': 'secondary-color' }},

    { name: 'Lettrine', element: 'span', attributes: { 'class': 'secondary-color' }},

    { name: 'Text: Uppercase',  element: ['h1', 'h2', 'h3', 'h4', 'p', 'span'], attributes: { 'class': 'caps' }},
    { name: 'Text: Small Caps', element: ['h1', 'h2', 'h3', 'h4', 'p', 'span'], attributes: { 'class': 'small-caps' }},
    { name: 'Text: Lowercases', element: ['h1', 'h2', 'h3', 'h4', 'p', 'span'], attributes: { 'class': 'lowercase' }},
    { name: 'Text: Capitalize', element: ['h1', 'h2', 'h3', 'h4', 'p', 'span'], attributes: { 'class': 'capitalize' }},
    { name: 'Text: Strike',     element: ['h1', 'h2', 'h3', 'h4', 'p', 'span'], attributes: { 'class': 'strike' }},
  ]
}
