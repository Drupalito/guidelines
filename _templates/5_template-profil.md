---
layout: asideleft
title: "Profil"
description: ""
group: "Templates"
category: ""
weight: 5
---

<div class="form">
  <form class="webform-form" method="post" action="#">
    <div class="row row-md-eqheight">

      <div class="col-xs-12 col-md-7">

        <div class="profil">
          <div>

            <div class="row">
              <div class="hidden-xs col-sm-4">
                <img class="profil__image" src="http://placehold.it/231x288" alt="" />
              </div>
              <div class="col-xs-12 col-sm-8">
                <h1 class="profil__title default-color my-0"><span class="caps">{{ site.OWNER_CONTACT }}</span> <small>(johndoe)</small></h1>
                <p class="profil__citation mt-0"><q>Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet.</q></p>

                <ul class="profil__list list-none">
                  <li><span class="fa fa-user prs" aria-hidden="true"></span> Homme</li>
                  <li><span class="fa fa-birthday-cake prs" aria-hidden="true"></span> 24 yo</li>
                  <li><span class="fa fa-envelope prs" aria-hidden="true"></span> {{ site.OWNER_EMAIL }}</li>
                </ul>
              </div>
            </div>
          </div>

          <div class="row mtl">
            <div class="col-xs-12 sm-text-right">
              <div class="form-actions form-wrapper">
                <button id="edit-submit" class="btn btn--primary" name="op"><span class="fa fa-pencil" aria-hidden="true"></span> Modifier mon profil</button>
              </div>
            </div>
          </div>
        </div>

      </div>
      <div class="col-xs-12 col-md-5">
        <div class="friendszone primary-background pal text-center">
          <div class="friendszone__inner ptl">
            <span class="fa fa-users size-6x" aria-hidden="true"></span>
            <p>Invitez vos amis pour agrandir votre réseau et partagez vos recommendations.</p>
            <a class="btn btn--default" href="#"><span class="fa fa-user-plus prs" aria-hidden="true"></span> Invitez vos amis</a>
          </div>
        </div>
      </div>

    </div>
  </form>
</div>
