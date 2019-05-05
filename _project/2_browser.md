---
layout: asideleft
title: "Tests navigateurs"
description: "Les tests navigateurs sont menés automatiquement à l'aide de l'[API screenshots de Browserstack](https://www.browserstack.com/screenshots/api)"
group: "Project"
category: ""
weight: 2
---

{% assign collectionOS = site.browsers | group_by: "os" %}

{% for group in collectionOS %}

## {{ group.name }}

{% assign collectionOSVersion = group.items | group_by: "os_version" %}

{% for groupVersion in collectionOSVersion %}

### {{ group.name }} {{ groupVersion.name }}

{% if group.name == 'ios' or group.name == 'android' %}

{% assign itemsVersion = groupVersion.items | group_by: "device" %}

| Device
|------- {% for item in itemsVersion %}
| {{ item.name }} {% endfor %}
{: .table.table-bordered }

{% else %}

{% assign itemsVersion = groupVersion.items | group_by: "browser" %}

| Browser | Version
|---------|---------------- {% for item in itemsVersion %}
| {{ item.name }} | {% for version in item.items %} - **{{ version.browser_version }}** {% endfor %}{% endfor %}
{: .table.table-bordered }

{% comment %}
{% endcomment %}

{% endif %}

{% endfor %}

{% endfor %}
