{ ... }: {
  # Enable the X11 windowing system
  services.xserver = {
    enable = true;

    # Configure keymap in X11
    xkb = {
      layout = "us";
      variant = "";
    };

    # Enable touchpad support (enabled by default in most desktop managers)
    # libinput.enable = true;
  };
}
