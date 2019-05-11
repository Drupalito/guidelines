---
layout: asidestyleguide
title: "Palette couleurs"
description: ""
group_index: true
group: "Design Elements"
weight: 0
---

## Global

<div class="row row-sm-noborder">
  <div class="col-xs-12 col-sm-4">
    <div class="clipboard-copy" style="height:100px;background:{{ site.BODY_COLOR }}" data-color-copy="{{ site.BODY_COLOR }}"><div class="copy bold">Cliquer pour copier</div></div>
    <p class="mvm"><strong>Default color</strong></p>
    <p class="mvm"><small><strong>scss:</strong> <code>$body-color</code></small><br/>HEX: <strong>{{ site.BODY_COLOR }}</strong><br/>RGB: <strong>{{ site.BODY_COLOR | replace_first: '#', '' | hex_to_rgb | join: ', ' }}</strong></p>
  </div>
  <div class="col-xs-12 col-sm-4">
    <div class="clipboard-copy" style="height:100px;background:{{ site.BODY_BACKGROUND }}" data-color-copy="{{ site.BODY_BACKGROUND }}"><div class="copy bold">Cliquer pour copier</div></div>
    <p class="mvm"><strong>Default background-color</strong></p>
    <p class="mvm"><small><strong>scss:</strong> <code>$body-background</code></small><br/>HEX: <strong>{{ site.BODY_BACKGROUND }}</strong><br/>RGB: <strong>{{ site.BODY_BACKGROUND | replace_first: '#', '' | hex_to_rgb | join: ', ' }}</strong></p>
  </div>
</div>

<!--
### Liens

<div class="row row-sm-noborder">
{% for link_color in site.LINK %}
  <div class="col-xs-12 col-sm-3">
    <div class="{{ link_color[0] | downcase }}-background clipboard-copy" style="height:100px;background:{{ link_color[1] }}"></div>
    <p class="mvm">lien: état <strong>{{ link_color[0] | downcase }}</strong></p>
    <p class="mvm">HEX: {{ link_color[1] }}<br/>RGB: {{ link_color[1] | replace_first: '#', '' | hex_to_rgb | join: ', ' }}</p>
    <p class="mvm"><span class="{{ link_color[0] | downcase }}-background clipboard-copy" style="padding:5px;color:#fff;background:{{ link_color[1] }}">.{{ link_color[0] | downcase }}-background</span><span class="{{ link_color[0] | downcase }}-color clipboard-copy" style="padding:5px;color:{{ link_color[1] }}">.{{ link_color[0] | downcase }}-color</span><span style="padding:5px;border:1px solid;border-color:{{ link_color[1] }};color:{{ link_color[1] }}">.{{ link_color[0] | downcase }}-border</span></p>
  </div>
{% endfor %}
</div>
 -->

## Jeu de couleurs

{% for font_color in site.COLORZ %}
  <h3>{{ font_color[0] | downcase }}</h3>
  <div class="row">
    <div class="col-xs-12 col-sm-4">
      <div class="{{ font_color[0] | downcase }}-background clipboard-copy" style="height:100px;" data-color-copy="{{ font_color[1] }}"><div class="copy bold">Cliquer pour copier</div></div>
      <p class="mtm mb-0"><strong>{{ font_color[0] | downcase }}</strong></p>
      <p class="mt-0 mbm"><small><strong>scss:</strong> <code>coloriz({{ font_color[0] | downcase }}, base)</code></small></p>
      <p class="mvm">HEX: {{ font_color[1] }}<br/>RGB: {{ font_color[1] | replace_first: '#', '' | hex_to_rgb | join: ', ' }}</p>
    </div>
    <div class="col-xs-12 col-sm-8">
      <div class="row row-sm-noborder">
        <div class="col-xs-12 col-sm-4">
          <div class="{{ font_color[0] | downcase }}-background--dark" style="height:40px;"></div>
          <p class="bold mtm mb-0"><small><code>coloriz({{ font_color[0] | downcase }}, dark)</code></small></p>
          <p class="mt-0 mbm"><small>darken 15%</small></p>
          <p class="mt-0 mb-0"><small><strong>class css:</strong></small></p>
          <p class="mt-0 mb-0"><small>.{{ font_color[0] | downcase }}-background--dark</small></p>
          <p class="mt-0 mb-0"><small>.{{ font_color[0] | downcase }}-color--dark</small></p>
        </div>
        <div class="col-xs-12 col-sm-4">
          <div class="{{ font_color[0] | downcase }}-background--light" style="height:40px;"></div>
          <p class="bold mtm mb-0"><small><code>coloriz({{ font_color[0] | downcase }}, light)</code></small></p>
          <p class="mt-0 mbm"><small>lighten 15%</small></p>
          <p class="mt-0 mb-0"><small><strong>class css:</strong></small></p>
          <p class="mt-0 mb-0"><small>.{{ font_color[0] | downcase }}-background--light</small></p>
          <p class="mt-0 mb-0"><small>.{{ font_color[0] | downcase }}-color--light</small></p>
        </div>
        <div class="col-xs-12 col-sm-4">
          <div class="{{ font_color[0] | downcase }}-background--lighter" style="height:40px;"></div>
          <p class="bold mtm mb-0"><small><code>coloriz({{ font_color[0] | downcase }}, lighter)</code></small></p>
          <p class="mt-0 mbm"><small>lighten 45%</small></p>
          <p class="mt-0 mb-0"><small><strong>class css:</strong></small></p>
          <p class="mt-0 mb-0"><small>.{{ font_color[0] | downcase }}-background--lighter</small></p>
          <p class="mt-0 mb-0"><small>.{{ font_color[0] | downcase }}-color--lighter</small></p>
        </div>
      </div>
    </div>
  </div>
{% endfor %}

## Jeu de couleurs gris

<div class="row row-sm-noborder justify-content-sm-space-between">
{% for font_color in site.COLORZ_GREY %}
  <div class="col-xs-12 col-sm-2">
    <div class="{{ font_color[0] | downcase }}-background clipboard-copy" style="height:100px;background:{{ font_color[1] }}" data-color-copy="{{ font_color[1] }}"><div class="copy bold">Cliquer pour copier</div></div>
    <p class="mvm"><small><strong>{{ font_color[0] | downcase }}</strong></small></p>
    <p class="mvm"><small><strong>scss:</strong> <code>$color-{{ font_color[0] | downcase | replace_first: '_', '-' }}</code></small><br/>
    <small>HEX: {{ font_color[1] }}<br/>RGB: {{ font_color[1] | replace_first: '#', '' | hex_to_rgb | join: ', ' }}</small></p>
  </div>
{% endfor %}
</div>

## Messages couleurs

<div class="row row-xs-noborder">
{% for message_color in site.MESSAGES %}
  <div class="col-xs-6 col-sm-2 col-md-3">
    <div class="{{ message_color[0] | downcase }}-background clipboard-copy" style="height:100px;background:{{ message_color[1] }}" data-color-copy="{{ message_color[1] }}"><div class="copy bold">Cliquer pour copier</div></div>
    <p class="mvm"><strong>{{ message_color[0] | downcase }}</strong></p>
    <p class="mvm">HEX: {{ message_color[1] }}<br/>RGB: {{ message_color[1] | replace_first: '#', '' | hex_to_rgb | join: ', ' }}</p>
  </div>
{% endfor %}
</div>

<!-- {% colorzTree A|B %} -->
