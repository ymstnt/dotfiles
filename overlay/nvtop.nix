{ ... }:

(final: prev: {
  nvtopPackages.full = prev.nvtopPackages.nvidia.override {
    intel = true;
  };
})
