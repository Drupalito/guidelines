---
layout: asideleft
title: "Commentaires"
description: ""
group: "Javascript"
category: ""
weight: 2
---

Utiliser des commentaires sur une seule ligne (`// …`) pour commenter la ligne d'après.

```js
  // Exemple one line comment
  var myVar = 'foo';
```

Utiliser un commentaire JSDoc (`/** … */`) avant une fonction ou un module.

```js
  /**
   * This function does something see example below
   *
   * @example
   *   var x = foo("test"); // it will show "test" message
   * @param {string} str: string argument that will be shown in message
   */
  function foo(str) {
    alert(str);
  }
```

