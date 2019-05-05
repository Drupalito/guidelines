---
layout: asideleft
title: "Convention codage"
group_index: true
group: "HTML"
category: ""
weight: 0
---

* **Indentation : 2 espaces** ;
* Écrire tout en minuscules ;
* Utiliser les guillements doubles pour délimiter les valeurs d'attribut ;
* Validation W3C Markup - WCAG2.0 (ou justifier la non conformité) ;
* Ordre des attributs : class - id - data et le reste ;
* Employer HTML5 avec la syntaxe xHTML (exemple : `<br />`, `<meta />`, `<img alt="" />`) ;
* Omettre l'attribut `type` pour les balises `link`, `style` et `script` (valeurs par défaut) ;
* Construire des éléments modulables et facile à réutiliser ;
* Utilisation les types d'input HTML5 pour les contrôles clavier sur mobiles : `<input type="email" />`, `<input type="url" />`, `<input type="tel" />` ;
* Fermer toujours vos balises ;
* Interdire les styles en ligne, exception pour Javascript ;
* Utiliser les attributs booléens avec les valeurs (par exemple, `checked="checked"` plutôt que `checked`).

**Garder une longueur de ligne à un maximum raisonnable, par exemple, 80 colonnes.**

```html
  <div class="item">
    <a class="item__link" href="#" title="[Title]">
      <div class="item__wrapper">
        <div class="item__capture">
          <img class="item__image" src="path/to/image.png" alt="" width="100" height="100" />
        </div>
        <div class="item__content">
          <h2 class="item__title">[Title]</h2>
          <div class="item__description">
            <p>[Content Text]</p>
            <button class="btn btn--primary btn--disabled item__button" disabled="disabled">Répondre</button>
          </div>
        </div>
      </div>
    </a>
  </div>
```
