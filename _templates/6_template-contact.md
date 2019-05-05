---
layout: asideleft
title: "Contact"
description: ""
group: "Templates"
category: ""
weight: 6
---

<form class="contact-form" action="#" method="post">
  <div>
    <div class="form-item form-type--textfield">
      <label for="edit-name">Votre nom <abbr class="field-required" title="Ce champ est requis.">*</abbr></label>
      <input type="text" id="edit-name" name="name" value="{{ site.OWNER_NAME }}" size="60" maxlength="255" class="form-text required">
    </div>
    <div class="form-item form-type--textfield">
      <label for="edit-mail">Votre adresse de courriel <abbr class="field-required" title="Ce champ est requis.">*</abbr></label>
      <input type="text" id="edit-mail" name="mail" value="{{ site.OWNER_EMAIL }}" size="60" maxlength="255" class="form-text required">
      <small class="description field-required mts show">Format: nom@exemple.fr</small>
    </div>
    <div class="form-item form-type--textfield">
      <label for="edit-subject">Objet <abbr class="field-required" title="Ce champ est requis.">*</abbr></label>
      <input type="text" id="edit-subject" name="subject" value="" size="60" maxlength="255" class="form-text required">
    </div>
    <div class="form-item form-type--textarea">
      <label for="edit-message">Message <abbr class="field-required" title="Ce champ est requis.">*</abbr></label>
      <textarea id="edit-message" name="message" cols="60" rows="5" class="form-textarea required">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quidem, laborum!</textarea>
    </div>
    <div class="form-item form-type--checkbox">
      <input type="checkbox" id="edit-copy" name="copy" value="1" class="form-checkbox">  <label class="option" for="edit-copy">M'envoyer une copie.</label>
    </div>
    <div class="form-actions form-wrapper" id="edit-actions"><button id="edit-submit" name="op" value="Envoyer le message" class="btn btn--primary">Envoyer le message <span></span></button></div>
  </div>
</form>

```html
  <form class="contact-form" action="#" method="post">
    <div>
      <div class="form-item form-type--textfield">
        <label for="edit-name">Votre nom <abbr class="field-required" title="Ce champ est requis.">*</abbr></label>
        <input type="text" id="edit-name" name="name" value="{{ site.OWNER_NAME }}" size="60" maxlength="255" class="form-text required">
      </div>
      <div class="form-item form-type--textfield">
        <label for="edit-mail">Votre adresse de courriel <abbr class="field-required" title="Ce champ est requis.">*</abbr></label>
        <input type="text" id="edit-mail" name="mail" value="{{ site.OWNER_EMAIL }}" size="60" maxlength="255" class="form-text required">
        <small class="description field-required mts show">Format: nom@exemple.fr</small>
      </div>
      <div class="form-item form-type--textfield">
        <label for="edit-subject">Objet <abbr class="field-required" title="Ce champ est requis.">*</abbr></label>
        <input type="text" id="edit-subject" name="subject" value="" size="60" maxlength="255" class="form-text required">
      </div>
      <div class="form-item form-type--textarea">
        <label for="edit-message">Message <abbr class="field-required" title="Ce champ est requis.">*</abbr></label>
        <textarea id="edit-message" name="message" cols="60" rows="5" class="form-textarea required">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quidem, laborum!</textarea>
      </div>
      <div class="form-item form-type--checkbox">
        <input type="checkbox" id="edit-copy" name="copy" value="1" class="form-checkbox">  <label class="option" for="edit-copy">M'envoyer une copie.</label>
      </div>
      <div class="form-actions form-wrapper" id="edit-actions"><button id="edit-submit" name="op" value="Envoyer le message" class="btn btn--primary">Envoyer le message <span></span></button></div>
    </div>
  </form>
```
