---
layout: asideleft
title: "Convention développement"
group: "Docs"
category: "Les normes de conception fournissent des lignes directrices et un code de conception pour vous aider à créer rapidement des services numériques fiables, accessibles et cohérents."
weight: 3
---

Ce document doit permettre d'uniformiser la production de code, à l'aide de différentes conventions.

Le but est de disposer d'un code maintenable sur l'ensembles des projets et que n'importe quel projet soit accessible à n'importe quel intervenant connaissant ces conventions.

**Il est impératif d'appliquer les conventions suivantes de manière stricte.**

## Indentation

* **Ne jamais mélanger espaces et tabulations** (configurer son éditeur) ;
* Privilégier les espaces aussi sur Drupal : **2 espaces en CSS, HTML et CSS**.

Le fichier `.editorconfig` contient les options requises. Plus d'informations sur [editorconfig.org](http://editorconfig.org){:target="_blank"}.


<div role="alert" class="messages messages--info messages--icon clearfix">
  <h2 class="messages__title hide">Astuce</h2>
  <div class="messages__content">
    <p class="messages__description">Astuce: Configurez votre éditeur afin qu'il affiche les "caractères invisibles". Cela vous permettra de supprimer les espaces en fin de ligne, les espaces dans les lignes vides et **évitera de polluer vos commits**.</p>
  </div>
</div>

Ce que le fichier `.editorconfig` doit contenir :

``` bash
# .editorconfig
# editorconfig.org
# Install EditorConfig with Package Control and restart Sublime

root = true

[*]
indent_style = space
indent_size = 2
end_of_line = lf
charset = utf-8
trim_trailing_whitespace = true
insert_final_newline = true

[*.md]
trim_trailing_whitespace = false
```

## Commentaires

Prendre le temps de décrire les composants, comment ils fonctionnent, leurs limites, et la manière dont ils sont conçus. **Ne laissez pas les autres membres de l'équipe deviner le but d'un code inhabituel ou non trivial.**

**La façon de commenter doit être simple et similaire dans toute base de code.**

## Format

Le format de code choisi doit assurer :

* Une bonne lisibilité ;
* Des commentaires clairs ;
* Une réduction des probabilités d'insertion accidentelle d'erreurs ;
* La production de fichiers diff et de résolution des problèmes pratiques.

## Organisation

L'organisation du code est une partie importante de n'importe quelle base et devient cruciale pour les grosses bases de code.

* Utiliser des fichiers distincts (concaténés au cours de l'étape de compilation) pour aider à découper le code en différents composants, modules ;
* Séparer de manière logique les différentes parties de code (à l'aide des commentaires) ;
* Si un préprocesseur est disponible sur votre projet, stocker le code récurrent dans des variables pour la couleur, la typographie, les espacements, etc. ;
* Organiser les classes en suivant les méthodes BEM.
