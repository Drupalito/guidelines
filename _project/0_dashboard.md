---
layout: asideleft
title: "Général"
description: "Informations relatives au projet."
group_index: true
group: "Project"
category: ""
weight: 0
---

{% comment %}
## Deadline

| Clé   | Valeur
|-------|----------------
| **Date début** | {{ site.DATE.BEGIN | date_to_long_string }}
| **Date recette** | {{ site.DATE.RECETTE | date_to_long_string }}
| **Date fin** | {{ site.DATE.END | date_to_long_string }}
{: .table.table-bordered }
{% endcomment %}

## Projet

| Clé   | Valeur
|-------|----------------
| **Nom du site** | {{ site.SITE_NAME }}
| **Projet** | {{ site.SITE_PROJECT }}
| **URL** | [{{ site.URL }}](http://{{ site.URL }}){:rel="external"}
| **Nom de la base SQL** | {{ site.DB_NAME }}
{% if site.REPO != 0 %}| **Repo GIT** | {{ site.REPO }}{% endif %}
{: .table.table-bordered }

## Client

| Clé   | Valeur
|-------|----------------
| **Owner** | {{ site.OWNER_NAME }}
| **URL** | [{{ site.OWNER_URL }}]({{ site.OWNER_URL }}){:rel="external"}
| **Référant** | {{ site.OWNER_CONTACT }}<br/>[{{ site.OWNER_EMAIL }}](mailto:{{ site.OWNER_EMAIL }}){:rel="external"}
| **Adresse** | {{ site.OWNER_ADDRESS }}<br/>{{ site.OWNER_ADDRESS_CODE_POSTAL }} {{ site.OWNER_ADDRESS_LOCALITY }}
| **Téléphone** | {{ site.OWNER_PHONE }}
{: .table.table-bordered }
