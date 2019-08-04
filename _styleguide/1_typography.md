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

* **Font-size:** {{ site.BASE_FONT_SIZE }} (16px = 100%)
* **Interligne:** {{ site.BASE_LINE_HEIGHT }} ({{ BASE_LINE_HEIGHT | divided_by:BASE_FONT_SIZE | round:4 }}em)

## Fonts families

{% for link in site.FONT_FAMILIES %}
* **{{ link[0] }}:** <span style="font-family:{{ link[1] }}">{{ link[1] }}</span> {% endfor %}

{% if site.FONT_FAMILIES.BODY != site.FONT_FAMILIES.HEADLINE %}
<h2>BODY: {{ site.FONT_FAMILIES.BODY }}</h2>
{% else %}
<h2>{{ site.FONT_FAMILIES.BODY }}</h2>
{% endif %}
<div class="pvl mvl clearfix">
  <div class="row row-sm-height" style="font-family: {{ site.FONT_FAMILIES.BODY }}">
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

{% if site.FONT_FAMILIES.BODY != site.FONT_FAMILIES.HEADLINE %}
<h2>HEADLINE: {{ site.FONT_FAMILIES.HEADLINE }}</h2>
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

## Heading Size

{% assign base_line = site.BASE_FONT_SIZE | replace: 'px', '' %}
{% assign base_pixel = base_line | times:1.5 %}

| Clé | Taille | Interligne
|-----|--------|------------ {% for font_size in site.FONT_SIZE %}
| **```<{{ font_size[0] | downcase }}>```** | {{ font_size[1] }} | 1.5em {% endfor %}
{: .table.table-bordered }

{% for font_size in site.FONT_SIZE %}

{% if font_size[0] == 'H1' %}
# .{{ font_size[0] | downcase }} ({{ font_size[1] }} / 1.5em) -- Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cumque, quibusdam, harum animi nisi temporibus error.
{% endif %}

{% if font_size[0] == 'H2' %}
## .{{ font_size[0] | downcase }} ({{ font_size[1] }} / 1.5em) -- Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cumque, quibusdam, harum animi nisi temporibus error.
{% endif %}

{% if font_size[0] == 'H3' %}
### .{{ font_size[0] | downcase }} ({{ font_size[1] }} / 1.5em) -- Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cumque, quibusdam, harum animi nisi temporibus error.
{% endif %}

{% if font_size[0] == 'H4' %}
#### .{{ font_size[0] | downcase }} ({{ font_size[1] }} / 1.5em) -- Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cumque, quibusdam, harum animi nisi temporibus error.
{% endif %}

{% if font_size[0] == 'H5' %}
##### .{{ font_size[0] | downcase }} ({{ font_size[1] }} / 1.5em) -- Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cumque, quibusdam, harum animi nisi temporibus error.
{% endif %}

{% if font_size[0] == 'H6' %}
###### .{{ font_size[0] | downcase }} ({{ font_size[1] }} / 1.5em) -- Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cumque, quibusdam, harum animi nisi temporibus error.
{% endif %}

{% endfor %}

## Texte exemple

Vivamus pretium placerat lorem, in tempor massa convallis sit amet. Aliquam sed quam eget ligula luctus aliquam sed vitae nulla. Aliquam dui dolor, ullamcorper eget rutrum ut, hendrerit ac lorem. Donec magna est, sollicitudin vel ultrices vel, mattis ut odio. Integer vel felis laoreet purus sollicitudin varius sed id ipsum. Suspendisse potenti.

### Thrid level 1

Lorem ipsum dolor sit amet, consectetur adipisicing elit. Velit vero doloremque illo distinctio harum sed adipisci quis tenetur. Necessitatibus, sit reprehenderit. Cum dolorem quo ullam, deleniti expedita blanditiis veniam possimus deserunt.

Quae amet eos ut, quisquam dignissimos ducimus magnam soluta nam, ea nemo, minus. Esse voluptatem, odit. **Est explicabo pariatur eligendi consectetur in, quam provident fugiat corporis officiis atque**, necessitatibus aliquam asperiores, doloribus saepe voluptas assumenda libero neque? Delectus, ex, sequi? Ipsa ipsum architecto iusto aliquid, sint ad. Nostrum repellat tempore minima omnis harum labore esse sint nam non blanditiis! **Ducimus, dolorum similique.** Labore accusamus aut reiciendis velit ea alias.

  > **Blockquote**: Lorem ipsum dolor sit amet, consectetur adipisicing elit. Velit vero doloremque illo distinctio harum sed adipisci quis tenetur. Necessitatibus, sit reprehenderit. Cum dolorem quo ullam, deleniti expedita blanditiis veniam possimus deserunt.

### Thrid level 2

Praesent ut justo vitae metus luctus vehicula a et purus. Suspendisse potenti. Sed viverra, quam non hendrerit laoreet, massa odio blandit arcu, ac molestie metus diam eu tortor. Donec erat arcu, ultrices sit amet placerat non, feugiat in arcu. Mauris eros quam, varius eget volutpat vel, tristique sed est. In faucibus feugiat urna sit amet elementum. Integer consequat rhoncus libero, in molestie augue posuere et. Phasellus ac eleifend magna. Proin vulputate dui ac justo pharetra consequat. In vel iaculis ligula.

## Default markup

<p>
<a href="#">link element</a> example<br>
<a href="#" class="external">link element external</a><br>
<cite>cite element</cite> example<br>
The <code>code element</code> example<br>
The <del>del element</del> example<br>
The <dfn>dfn element</dfn> and <dfn title="Title text">dfn element with title</dfn> examples<br>
The <abbr>abbr element</abbr> and <abbr title="Title text">abbr element with title</abbr> examples<br>
The <em>em element</em> example<br>
The <i>i element</i> example<br>
The img element <img alt="" width="16" height="16" src="http://placehold.it/16"> example<br>
The <ins>ins element</ins> example<br>
The <kbd>kbd element</kbd> example<br>
The <mark>mark element</mark> example or <code class="highlight">.highlight</code><br>
The <q>q element <q>inside</q> a q element</q> example<br>
The <s>s element</s> example<br>
The <samp>samp element</samp> example<br>
The <small>small element</small> example<br>
The <span>span element</span> example<br>
The <strong>strong element</strong> example<br>
The <sub>sub element</sub> example<br>
The <sup>sup element</sup> example<br>
The <u>u element</u> example<br>
The <var>var element</var> example
</p>

<p>To take a screenshot on your Mac, press <kbd>Cmd</kbd> + <kbd>Shift</kbd> + <kbd>3</kbd>.</p>
<p>The coordinate of the <var>i</var>th point is (<var>x<sub><var>i</var></sub></var>, <var>y<sub><var>i</var></sub></var>). For example, the 10th point has coordinate (<var>x<sub>10</sub></var>, <var>y<sub>10</sub></var>).</p>

<p>f(<var>x</var>, <var>n</var>) = log<sub>4</sub><var>x</var><sup><var>n</var></sup></p>
<p>The <span class="caps">caps element</span>. The <span class="small-caps">small-caps element</span>. The <span class="no-caps">no-caps element</span>. The <span class="regular">regular element</span>. The <span class="bold">bold element</span>. The <span class="italic">italic element</span>.</p>
