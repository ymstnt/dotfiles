{ pkgs, ... }:

{
  hm.home.packages = with pkgs; [
    nur.repos.ymstnt.how-to-convert
  ];
}
