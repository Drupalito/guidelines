---
layout: asidemorph
title: "Grid Flexbox"
description: "Le système de grille utilisé permet la gestion d'un affichage responsive. Les items insérés à l'interieur ne doivent pas utiliser de taille fixe (`width:`) car l'affichage deviendra incorrect."
group: "Grille Responsive"
category: ""
weight: 2
---

**Fonctionnement de la grille Bootstrap**

<div class="styleguide">
  <h2 class="styleguide__title">Responsive Grid with</h2>
  <p>
    <b>Grille avec hauteur identique.</b>
    <br>
    Si les items ne font pas tous la même hauteur, la grille conserve un affichage conforme.
  </p>
  <div class="mt-4">
    <div class="row ">
      <div class="col-xs-12 col-sm-6">
        <div class="card pal text-left">
          Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur laboriosam quae odit at quidem fugit voluptatibus amet.
        </div>
      </div>
      <div class="col-xs-12 col-sm-6">
        <div class="card pal text-left">
          Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur laboriosam quae odit at quidem fugit voluptatibus amet. Consequuntur aut, eaque harum, totam quis assumenda et, incidunt molestias quaerat id quibusdam.
        </div>
      </div>
      <div class="col-xs-12 col-sm-6">
        <div class="card pal text-left">
          Lorem ipsum dolor sit amet, consectetur adipisicing elit.
        </div>
      </div>
      <div class="col-xs-12 col-sm-6">
        <div class="card pal text-left">
          Lorem ipsum dolor sit amet, consectetur adipisicing elit.
        </div>
      </div>
    </div>
  </div>
</div>
<div class="styleguide">
  <h2 class="styleguide__title">Responsive Grid with row-sm-eqheight</h2>
  <p>
    <b>Grille classique bootsrap.</b>
    <br>
    Si les items ne font pas tous la même hauteur, des décalages seront observés.
  </p>
  <div class="mt-4">
    <div class="row row-sm-eqheight">
      <div class="col-xs-12 col-sm-6">
        <div class="card pal text-left">
          Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur laboriosam quae odit at quidem fugit voluptatibus amet.
        </div>
      </div>
      <div class="col-xs-12 col-sm-6">
        <div class="card pal text-left">
          Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur laboriosam quae odit at quidem fugit voluptatibus amet. Consequuntur aut, eaque harum, totam quis assumenda et, incidunt molestias quaerat id quibusdam.
        </div>
      </div>
      <div class="col-xs-12 col-sm-6">
        <div class="card pal text-left">
          Lorem ipsum dolor sit amet, consectetur adipisicing elit.
        </div>
      </div>
      <div class="col-xs-12 col-sm-6">
        <div class="card pal text-left">
          Lorem ipsum dolor sit amet, consectetur adipisicing elit.
        </div>
      </div>
    </div>
  </div>
</div>
<div class="styleguide">
  <h2 class="styleguide__title">Responsive Grid with row-sm-height</h2>
  <p>
    <b>Grille avec centrage vertical</b>
    <br>
    Peu importe le nombre d'items présent, ils seront affichés alignés. Les items seront centrés par défault suivant l'item avec la plus grandeur hauteur.
    </p><p>
      Le centrage peut être modifié en utilisant les classes CSS
      <code>.col-top</code>
      et
      <code>.col-bottom</code>
    </p>
  <p></p>
  <div class="mt-4">
    <div class="row row-sm-height">
      <div class="col-xs-12 col-sm-6">
        <div class="card pal text-left">
          Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur laboriosam quae odit at quidem fugit voluptatibus amet.
        </div>
      </div>
      <div class="col-xs-12 col-sm-6">
        <div class="card pal text-left">
          Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur laboriosam quae odit at quidem fugit voluptatibus amet. Consequuntur aut, eaque harum, totam quis assumenda et, incidunt molestias quaerat id quibusdam.
        </div>
      </div>
      <div class="col-xs-12 col-sm-6">
        <div class="card pal text-left">
          Lorem ipsum dolor sit amet, consectetur adipisicing elit.
        </div>
      </div>
      <div class="col-xs-12 col-sm-6">
        <div class="card pal text-left">
          Lorem ipsum dolor sit amet, consectetur adipisicing elit.
        </div>
      </div>
    </div>
  </div>
</div>
