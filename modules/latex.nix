{ pkgs, ... }:

{
  hm.home.packages = with pkgs; [
    (texlive.withPackages (ps: with ps; [
      scheme-basic
      latexmk
      naive-ebnf
      siunitx
      steinmetz
      circuitikz
      collection-fontsrecommended
      enumitem
      environ
      listings
      pict2e
      soul
      titlesec
      wrapfig
      xstring
      dvipng # needed for anki
      algorithmicx
      algorithms
      algpseudocodex
      alg
      algxpar
      algorithm2e
      preview
      standalone
      varwidth
      scontents
    ]))
    #texlive.combined.scheme-full
  ];
}
