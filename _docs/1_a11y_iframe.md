---
layout: asideleft
title: "Iframe"
description: "Donner à chaque cadre et chaque cadre en ligne un titre pertinent."
group: "Accessibilité"
category: ""
weight: 1
---

<h2 class="error"><span class="fa fa-times error" aria-hidden="true"></span> Incorrect</h2>

Aucun attribut `title`.

```
# Fail
<iframe src="../iframeform/"></iframe>
```

L'attribut `name` ne peut pas faire office d'attribut `titre`.

```
# Fail
<iframe src="../iframeform/" name="Page title displayed by the iframe"></iframe>
```

<h2 class="ok"><span class="fa fa-check ok" aria-hidden="true"></span> Valide</h2>

L'attribut `title` est présente.\\
**Le titre de la page affichée par l'iframe, peut être utilisé comme titre.**

[RGAA: note sur les titres de cadres](https://references.modernisation.gouv.fr/rgaa-accessibilite/glossaire.html#titre-de-cadre)

```
# Good
<iframe src="../iframeform/" title="Page title displayed by the iframe"></iframe>

# Good
<iframe src="../iframeform/" title="Contenu technique Facebook"></iframe>

# Good
<iframe src="../iframeform/" aria-hidden="true">Page title displayed by the iframe"></iframe>
```

## Critères de validation

* [Critère 2.1 [A] Chaque cadre en ligne a-t-il un titre de cadre ?](https://references.modernisation.gouv.fr/critere-21-chaque-cadre-en-ligne-t-il-un-titre-de-cadre-0)
* [Critère 2.1 [A] Chaque cadre en ligne a-t-il un titre de cadre ?](https://references.modernisation.gouv.fr/critere-21-chaque-cadre-en-ligne-t-il-un-titre-de-cadre-0)

* [Opquast - N°145 - Chaque iframe est doté d'une description.](https://checklists.opquast.com/fr/oqs-v3/criteria/chaque-iframe-est-dote-dune-description)
