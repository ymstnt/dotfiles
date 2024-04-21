{ ... }:

(final: prev: {
  spamassassin = prev.spamassassin.overrideAttrs(old: {
    doCheck = false;
  });
})
