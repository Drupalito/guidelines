---
layout: asideleft
title: "Images"
description: "Attribut alt."
group: "Accessibilité"
category: ""
weight: 1
---

<h2 class="error"><span class="fa fa-times error" aria-hidden="true"></span> Incorrect</h2>

Aucun attribut `alt`.

```
# Fail
<img src="[URL_IMAGE]">
```

Si il s'agit d'**une image décorative** alors l'attribut `alt` doit être vide.

```
# Fail
<img src="[URL_IMAGE]" alt="Ceci est la description de mon image">
```

<h2 class="ok"><span class="fa fa-check ok" aria-hidden="true"></span> Valide</h2>

L'attribut `title` est présente.  
**Le titre de la page affichée par l'iframe, peut être utilisé comme titre.**

[RGAA: note sur les alternatives d'images](https://references.modernisation.gouv.fr/rgaa-accessibilite/glossaire.html#alternative-textuelle-image)

```
# Good
<img src="[URL_IMAGE]" alt="">

# Good
<img src="[URL_IMAGE]" alt="Ceci est la description de mon graphique ou des personnes présentes sur une photo">
```

## Critères de validation

* [Critère 1.2 [A] Pour chaque image de décoration ayant une alternative textuelle, cette alternative est-elle vide ?](https://references.modernisation.gouv.fr/critere-12-pour-chaque-image-de-decoration-ayant-une-alternative-textuelle-cette-alternative-est-0)
* [Critère 1.3 [A] Pour chaque image porteuse d'information ayant une alternative textuelle, cette alternative est-elle pertinente (hors cas particuliers) ?](https://references.modernisation.gouv.fr/critere-13-pour-chaque-image-porteuse-dinformation-ayant-une-alternative-textuelle-cette-alternati-0)
