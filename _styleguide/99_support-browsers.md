---
layout: asideleft
title: "Navigateurs supportés"
description: ""
group: "Design Elements"
weight: 99
browsers: 
  - url: "https://www.google.com/intl/fr_fr/chrome/"
    version: "Latest"
    icon: "chrome"
    title: "Chrome"
  - url: "https://www.mozilla.org/fr/firefox/new/"
    version: "Latest"
    icon: "firefox"
    title: "Firefox"
  - url: "https://www.microsoft.com/fr-fr/windows/microsoft-edge"
    version: "Latest"
    icon: "edge"
    title: "Edge"
  - url: "https://support.microsoft.com/fr-fr/help/18520/download-internet-explorer-11-offline-installer"
    version: "11+"
    icon: "internet-explorer_9-11"
    title: "Internet Explorer"
  - url: "https://support.microsoft.com/fr-fr/help/18520/download-internet-explorer-11-offline-installer"
    version: "9.1+"
    icon: "safari-ios"
    title: "Internet Explorer"
  - url: "https://www.opera.com/fr"
    version: "Latest"
    icon: "opera"
    title: "Opera"
---

Le tableau répertorie les versions pour lesquelles le framework est testé. "Latest" signifie que cela fonctionne parfaitement sur toutes les versions récentes d'un navigateur.

<div class="row row-sm-noborder justify-content-sm-space-between">
{% for browser in page.browsers %}
  <div class="col-xs-12 col-sm-2 text-center">
    <div style="height:50px;width:50px;" class="ml-auto mr-auto">
      <img width="50" height="50" src="../assets/images/browsers/{{ browser.icon }}.svg" alt="">
    </div>
    <p class="mvn">
      <strong>{{ browser.title }}</strong><br/>
      <small>{{ browser.version }}</small>
    </p>
  </div>
{% endfor %}
</div>
