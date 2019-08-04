---
layout: asideleft
title: "Maquettes graphiques"
group_index: true
group: "Maquettes"
category: ""
weight: 0
---

{% comment %}

{% capture dirfolder %}{{ site.ROOT }}/{{ site.OWNER_NAME }}/{{ site.DIR }}/{% endcapture %}

{% capture files %}{{ dirfolder }}docs/extract/png{% endcapture %}

## Maquettes

{% directory path: files %}
1. [{{file.name}}](maquette-{{ file.name }}.html)
{% enddirectory %}

{% endcomment %}

## Légende

Préfix à indiquer sur les maquettes.  
Exemple: **`vv-NOM_DE_LA_MAQUETTE.psd`**

* <mark class="mark">ND</mark> : Non débuté
* <mark class="mark mark--unpublished">EC</mark> : En cours
* <mark class="mark mark--updated">AP</mark> : À présenter
* <mark class="mark mark--error">AR</mark> : À revoir
* <mark class="mark mark--new">VV</mark> : Validé
