---
layout: asideleft
title: "Identifiants de connexion"
description: "Informations relatives aux identifiants de connexion."
group: "Docs"
category: ""
weight: 1
---

## Connexion Back-office

URl de connexion.

|        |       | DEVELOPMENT        | PRODUCTION
|--------|-------|--------------------|---------------------
| URL    | FRONT | [{{ site.DEV.URL }}]({{ site.DEV.URL }}) | [{{ site.PROD.URL }}]({{ site.PROD.URL }})
|        | ADMIN | [{{ site.DEV.URL_ADMIN }}]({{ site.DEV.URL_ADMIN }}) | [{{ site.PROD.URL_ADMIN }}]({{ site.PROD.URL_ADMIN }})
|--------|-------|--------------------|---------------------
{: .table.table-bordered }

Comptes utilisateurs administrateur et contributeur.

|        |       | DEVELOPMENT        | PRODUCTION
|--------|-------|--------------------|--------------- {% for users in site.DEV.USERS %} {% assign uusers = users[0] %} {% for user in users[1] %} {% assign loopindex = forloop.index %} {% assign uid = user[0] %}
| {% if loopindex == 1 %} **{{ uusers }}** {% endif %} | {{ uid }}  | {{ user[1] }} | {{ site.PROD.USERS[uusers][uid] }}{% endfor %} {% endfor %}
{: .table.table-bordered }

## Informations de connexion

|        |       | DEVELOPMENT        | PRODUCTION
|--------|-------|--------------------|--------------- {% for i in site.DEV.SSH %} {% assign key = i[0] %} {% assign loopindex = forloop.index %} {% assign uid = i[1] %}
| {% if loopindex == 1 %} **SSH** {% endif %} | {{ key }}  | {{ uid }} | {{ site.PROD.SSH[key] }}{% endfor %} {% for i in site.DEV.SQL %} {% assign key = i[0] %} {% assign loopindex = forloop.index %} {% assign uid = i[1] %}
| {% if loopindex == 1 %} **SQL** {% endif %} | {{ key }}  | {{ uid }} | {{ site.PROD.SQL[key] }}{% endfor %} {% for i in site.DEV.FTP %} {% assign key = i[0] %} {% assign loopindex = forloop.index %} {% assign uid = i[1] %}
| {% if loopindex == 1 %} **FTP** {% endif %} | {{ key }}  | {{ uid }} | {{ site.PROD.FTP[key] }}{% endfor %} {% for i in site.DEV.PMA %} {% assign key = i[0] %} {% assign loopindex = forloop.index %} {% assign uid = i[1] %}
| {% if loopindex == 1 %} **PMA** {% endif %} | {{ key }}  | {{ uid }} | {{ site.PROD.PMA[key] }}{% endfor %}
{: .table.table-bordered }
