{ pkgs, ... }:

{
  # NOTE: MANUAL INSTALL REQUIRED FOR PACKET TRACER:
  # log into netacad and download packet tracer for ubuntu: https://www.netacad.com/resources/lab-downloads
  # rename downloaded file to old schema: mv Packet_Tracer822_amd64_signed.deb CiscoPacketTracer822_amd64_signed.deb
  # add it to the nix store: nix-store --add-fixed sha256 CiscoPacketTracer822_amd64_signed.deb
  hm.home.packages = [ pkgs.ciscoPacketTracer8 ];
}
