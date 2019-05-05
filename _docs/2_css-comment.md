---
layout: asideleft
title: "Commentaires"
group: "CSS"
category: ""
weight: 2
---

## Généralités

Les commentaires ne doivent pas contenir d’informations techniques, ni références aux exigences client.

Uitliser ce type de commentaires pour commenter les nouveaux composants et modules. Ils pourront alors être compliés pour générer le styleguide. **La façon de commenter doit être simple et similaire dans toute base de code.**

* Placer les commentaires sur une nouvelle ligne au-dessus de leur sujet ;
* Éviter les commentaires en fin de ligne, **sauf pour le LTR (left to right) `/* LTR */`** ;
* Garder une longueur de ligne de taille raisonnable, **par exemple 80 caractères** ;
* Rédiger les commentaires avec des majuscules et des minuscules et gardez une indentation constante pour le texte.

## Générer la doc

Pour automatiser la création de la documentation CSS. Il convient de renseigner correctement tous les comportements.\\
Ci-dessous, un exemple de commentaire CSS valide pour la génération de la documentation.

```css
    /*doc
    ---
    title: NOM_DU_COMPOSANT
    category: MA_CATEGORIE
    versionning:
    - version: 1.0
      update: 2017-12-23T10:00:00Z
      owner: Axel Roche
    ---

    Description du composant.
    Utiliser markdown pour la description.

    Pour ajouter un code de démo, utiliser le format ci-dessous.
    Le language peut être changé, d'autres valeurs sont possible pour coloriser le code.

    ```html
      ... CODE_HTML_DEMO
    ```

    */
```
