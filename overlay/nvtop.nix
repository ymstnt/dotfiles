{ ... }:

(final: prev: {
  nvtop = prev.nvtopPackages.nvidia.override {
    intel = true;
  };
})
