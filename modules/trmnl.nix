{ pkgs, ... }:

{
  hm.home.packages = with pkgs; [
    nur.repos.ymstnt.trmnl-preview
  ];
}
