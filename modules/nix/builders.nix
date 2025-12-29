{ ... }: {
  # ==========================================================================
  # Remote Build Machines
  # Offload builds to faster/more powerful machines over SSH
  # Useful for slow laptops or ARM devices (cross-compile on x86)
  # ==========================================================================

  # Enable distributed builds
  # nix.distributedBuilds = true;

  # Remote builders list
  # Each machine needs SSH access from root user
  # nix.buildMachines = [
  #   {
  #     # SSH host (must be in /root/.ssh/config or use full hostname)
  #     hostName = "builder";
  #
  #     # SSH user on remote machine
  #     sshUser = "nixbuild";
  #
  #     # Path to SSH private key (must be readable by root)
  #     sshKey = "/root/.ssh/builder_ed25519";
  #
  #     # Remote system architecture
  #     # x86_64-linux, aarch64-linux, x86_64-darwin, aarch64-darwin
  #     system = "x86_64-linux";
  #
  #     # Max simultaneous builds on this machine
  #     maxJobs = 4;
  #
  #     # Relative speed (higher = prefer this builder)
  #     speedFactor = 2;
  #
  #     # Features this builder supports
  #     supportedFeatures = [
  #       "nixos-test"     # Can run NixOS VM tests
  #       "big-parallel"   # Has many cores for parallel builds
  #       "kvm"            # Has KVM for VM builds
  #       "benchmark"      # Can run benchmarks
  #     ];
  #
  #     # Architectures this builder can emulate (via QEMU/binfmt)
  #     # mandatoryFeatures = [ ];
  #   }
  #
  #   # Example: ARM builder for Raspberry Pi
  #   # {
  #   #   hostName = "arm-builder";
  #   #   sshUser = "nixbuild";
  #   #   sshKey = "/root/.ssh/arm_builder";
  #   #   system = "aarch64-linux";
  #   #   maxJobs = 2;
  #   #   speedFactor = 1;
  #   #   supportedFeatures = [ "big-parallel" ];
  #   # }
  # ];

  # ==========================================================================
  # Remote Builder Settings
  # ==========================================================================

  nix.settings = {
    # Let remote builders fetch from their own caches
    # Faster than uploading everything from local machine
    # builders-use-substitutes = true;

    # Max upload/download connections to remote builders
    # max-substitution-jobs = 16;
  };

  # ==========================================================================
  # SSH Configuration for Builders
  # Root's SSH config for connecting to builders
  # ==========================================================================

  # programs.ssh.extraConfig = ''
  #   Host builder
  #     HostName 192.168.1.100
  #     User nixbuild
  #     IdentityFile /root/.ssh/builder_ed25519
  #     IdentitiesOnly yes
  # '';

  # ==========================================================================
  # Setup Instructions
  # ==========================================================================
  #
  # On the REMOTE builder machine:
  # 1. Create build user:
  #    sudo useradd -m nixbuild
  #
  # 2. Add to trusted users in /etc/nix/nix.conf or NixOS config:
  #    nix.settings.trusted-users = [ "nixbuild" ];
  #
  # 3. Add your public key to ~nixbuild/.ssh/authorized_keys
  #
  # On the LOCAL machine:
  # 1. Generate SSH key:
  #    sudo ssh-keygen -t ed25519 -f /root/.ssh/builder_ed25519 -N ""
  #
  # 2. Copy public key to builder:
  #    sudo ssh-copy-id -i /root/.ssh/builder_ed25519.pub nixbuild@builder
  #
  # 3. Test connection:
  #    sudo ssh -i /root/.ssh/builder_ed25519 nixbuild@builder
  #
  # 4. Enable in this config and rebuild
}
