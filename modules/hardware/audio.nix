{ ... }: {
  # Disable PulseAudio (use PipeWire instead)
  services.pulseaudio.enable = false;

  # Enable rtkit for realtime priority
  security.rtkit.enable = true;

  # Enable PipeWire
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # JACK support (uncomment if needed)
    # jack.enable = true;
  };
}
