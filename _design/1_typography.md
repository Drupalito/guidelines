---
layout: asidestyleguide
title: "Typographie"
description: ""
group: "Design Elements"
weight: 1
---

Valeurs définies par défault appliquées sur la balise CSS `body` afin de donner une taille intiale par défault.

Pour des raisons d'accessibilité, toutes les déclarations de tailles de font (`font-size`) et interligne `line-height` doivent utiliser des unités tels que `em` ou `rem` qui sont relative à la taille de l'élément parent.

{% assign BASE_FONT_SIZE = site.BASE_FONT_SIZE | replace: 'px', '' | append: '.0' %}
{% assign BASE_LINE_HEIGHT = site.BASE_LINE_HEIGHT | replace: 'px', '' | append: '.0' %}
{% assign BASE_RATIO = BASE_FONT_SIZE | divided_by:16.0 %}

<div class="row">
  <div class="col-xs-6 col-sm-3">
    <p class="card p-4">
      <strong>Font-size:</strong>
      {{ BASE_RATIO | times:100 | replace: '.0', '' }}% ({{ site.BASE_FONT_SIZE }})
    </p>
  </div>
  <div class="col-xs-6 col-sm-3">
    <p class="card p-4">
      <strong>Interligne:</strong>
      {{ site.BASE_LINE_HEIGHT }} ({{ BASE_LINE_HEIGHT | divided_by:BASE_FONT_SIZE | round:4 }}em)
    </p>
  </div>
</div>

## Fonts stack

{% for link in site.FONT_FAMILIES %}
* **{{ link[0] }}:** <span style="font-family:{{ link[1] }}">{{ link[1] }}</span> {% endfor %}

{% if site.FONT_FAMILIES.BODY != site.FONT_FAMILIES.HEADLINE %}
<h3>BODY: {{ site.FONT_FAMILIES.BODY }}</h3>
{% else %}
<h3>{{ site.FONT_FAMILIES.BODY }}</h3>
{% endif %}
<div class="pvl mvl clearfix">
  <div class="row row-sm-height" style="font-family: {{ site.FONT_FAMILIES.BODY }}">
    <div class="col-xs-12 col-sm-5">
      <div class="card p-4">
        <p class="size-8x bold mb-0">Aa</p>
        <div data-specimen="lorem">
          <span class="caps">
            ABCDEFGHIJKLMNOPQRSTUVWXYZ<br/>ÀÁÂÃÄÇÈÉÊËÌÍÎÏÑÒÓÔÕÖÙÚÛÜÝŸ
          </span><br/>
          <span>
            abcdefghijklmnopqrstuvwxyz<br/>àáâãäçèéêëìíîïñòóôõöùúûüýÿ
          </span><br/>
          <span>
            1234567890 []\{}|~`°!@#<br/>$€%^&"'^§*()_+-=;,./?<>
          </span>
        </div>
      </div>
    </div>
    <div class="col-xs-12 col-sm-7">  
      <p><span class="bold">Normal:</span><br/>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cumque, quibusdam, harum animi nisi temporibus error.</p> 
      <p style="font-weight: bold; font-style: normal;"><span class="bold">Bold:</span><br/>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cumque, quibusdam, harum animi nisi temporibus error.</p> 
      <p style="font-weight: normal; font-style: italic;"><span class="bold">Italic:</span><br/>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cumque, quibusdam, harum animi nisi temporibus error.</p>
      <p style="font-weight: bold; font-style: italic;"><span class="bold">Bold/Italic:</span><br/>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cumque, quibusdam, harum animi nisi temporibus error.</p>
    </div>
  </div>
</div>

{% if site.FONT_FAMILIES.BODY != site.FONT_FAMILIES.HEADLINE %}
<h3>HEADLINE: {{ site.FONT_FAMILIES.HEADLINE }}</h3>
<div class="pvl mvl clearfix">
  <div class="row row-sm-height" style="font-family: {{ site.FONT_FAMILIES.HEADLINE }}">
    <div class="col-xs-12 col-sm-5">
      <p class="size-8x mb-0">Aa</p>
      <div data-specimen="lorem">
        <span class="caps">
          ABCDEFGHIJKLMNOPQRSTUVWXYZ<br/>ÀÁÂÃÄÇÈÉÊËÌÍÎÏÑÒÓÔÕÖÙÚÛÜÝŸ
        </span><br/>
        <span>
          abcdefghijklmnopqrstuvwxyz<br/>àáâãäçèéêëìíîïñòóôõöùúûüýÿ
        </span><br/>
        <span>
          1234567890 []\{}|~`°!@#<br/>$€%^&"'^§*()_+-=;,./?<>
        </span>
      </div>
    </div>
    <div class="col-xs-12 col-sm-7">  
      <p><span class="bold">Normal:</span><br/>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cumque, quibusdam, harum animi nisi temporibus error.</p> 
      <p style="font-weight: bold; font-style: normal;"><span class="bold">Bold:</span><br/>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cumque, quibusdam, harum animi nisi temporibus error.</p> 
      <p style="font-weight: normal; font-style: italic;"><span class="bold">Italic:</span><br/>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cumque, quibusdam, harum animi nisi temporibus error.</p>
      <p style="font-weight: bold; font-style: italic;"><span class="bold">Bold/Italic:</span><br/>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cumque, quibusdam, harum animi nisi temporibus error.</p>
    </div>
  </div>
</div>
{% endif %}

## Échelle typographique

{% for font_size in site.FONT_SIZE %}

{% assign fontSize = font_size[1] | replace: 'px', '' %}
{% assign BASE_RATIO = fontSize | divided_by:16.0 %}

{% if font_size[0] == 'H1' %}
# .{{ font_size[0] | downcase }} -- Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cumque, quibusdam, harum animi nisi temporibus error.

```css
  h1, .h1 {
    font-size: {{ BASE_RATIO }}em; // {{ font_size[1] }}
    line-height: 1.5;
  }
```

{% endif %}

{% if font_size[0] == 'H2' %}
## .{{ font_size[0] | downcase }} -- Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cumque, quibusdam, harum animi nisi temporibus error.

```css
  h2, .h2 {
    font-size: {{ BASE_RATIO }}em; // {{ font_size[1] }}
    line-height: 1.5;
  }
```

{% endif %}

{% if font_size[0] == 'H3' %}
### .{{ font_size[0] | downcase }} -- Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cumque, quibusdam, harum animi nisi temporibus error.

```css
  h3, .h3 {
    font-size: {{ BASE_RATIO }}em; // {{ font_size[1] }}
    line-height: 1.5;
  }
```

{% endif %}

{% if font_size[0] == 'H4' %}
#### .{{ font_size[0] | downcase }} -- Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cumque, quibusdam, harum animi nisi temporibus error.

```css
  h4, .h4 {
    font-size: {{ BASE_RATIO }}em; // {{ font_size[1] }}
    line-height: 1.5;
  }
```

{% endif %}

{% if font_size[0] == 'H5' %}
##### .{{ font_size[0] | downcase }} -- Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cumque, quibusdam, harum animi nisi temporibus error.

```css
  h5, .h5 {
    font-size: {{ BASE_RATIO }}em; // {{ font_size[1] }}
    line-height: 1.5;
  }
```

{% endif %}

{% if font_size[0] == 'H6' %}
###### .{{ font_size[0] | downcase }} -- Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cumque, quibusdam, harum animi nisi temporibus error.

```css
  h6, .h6 {
    font-size: {{ BASE_RATIO }}em; // {{ font_size[1] }}
    line-height: 1.5;
  }
```

{% endif %}

{% endfor %}
