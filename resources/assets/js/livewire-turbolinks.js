(function (factory) {
    typeof define === 'function' && define.amd ? define(factory) :
    factory();
}((function () { 'use strict';

    if (typeof window.livewire === 'undefined') {
      throw 'Livewire Turbolinks Plugin: window.Livewire is undefined. Make sure @livewireScripts is placed above this script include';
    }

    var firstTime = true;

    function wireTurboAfterFirstVisit() {
      // We only want this handler to run AFTER the first load.
      if (firstTime) {
        firstTime = false;
        return;
      }

      window.livewire.restart();
      window.Alpine && window.Alpine.flushAndStopDeferringMutations && window.Alpine.flushAndStopDeferringMutations();
    }

    function wireTurboBeforeCache() {
      document.querySelectorAll('[wire\\:id]').forEach(function (el) {
        const component = el.__livewire;
        const dataObject = {
        fingerprint: component && component.fingerprint ? component.fingerprint : null,
        serverMemo: component && component.serverMemo ? component.serverMemo : null,
        effects: component && component.effects ? component.effects : null,
        };
        el.setAttribute('wire:initial-data', JSON.stringify(dataObject));
      });
      window.Alpine && window.Alpine.deferMutations && window.Alpine.deferMutations();
    }

    document.addEventListener("DOMContentLoaded", wireTurboAfterFirstVisit);
    document.addEventListener("turbo:before-cache", wireTurboBeforeCache);
    document.addEventListener("turbolinks:load", wireTurboAfterFirstVisit);
    document.addEventListener("turbolinks:before-cache", wireTurboBeforeCache);
    Livewire.hook('beforePushState', state => {
      if (!state.turbolinks) state.turbolinks = {};
    });
    Livewire.hook('beforeReplaceState', state => {
      if (!state.turbolinks) state.turbolinks = {};
    });

})));
