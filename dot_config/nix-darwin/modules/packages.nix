# modules/packages.nix
# Configuration for system packages
{ config, pkgs, lib, ... }:

{
  # Installed packages for the entire system
  # Add or remove packages based on your needs
  environment.systemPackages = with pkgs; [
    # Development tools
    act
    ansible
    ansible-lint
    chezmoi
    diff-so-fancy
    direnv
    dotenvx
    editorconfig-checker
    git
    git-filter-repo
    git-ignore
    git-lfs
    gitleaks
    go
    pre-commit
    prettierd
    python313
    python313Packages.pip
    python313Packages.kubernetes
    python313Packages.openshift
    python313Packages.pyyaml
    python313Packages.jmespath
    python313Packages.netaddr
    python313Packages.passlib
    python313Packages.cryptography
    python313Packages.packaging
    terraform

    # Container and Kubernetes tools
    cilium-cli
    kompose
    kubectl
    kubectx
    kubernetes-helm
    lazydocker

    # CLI utilities
    atuin
    bash
    bat
    eza
    facter
    fd
    fzf
    gh
    httrack
    hugo
    imagemagick
    iperf
    jinja2-cli
    jq
    lazygit
    lexicon
    libusb1
    m-cli
    mkalias
    nanorc
    neovim
    nicotine-plus
    nix-index
    nix-update
    nmap
    packer
    pandoc
    pls
    prettyping
    qemu
    ripgrep
    rmlint
    rsync
    starship
    tcpdump
    thefuck
    tldr
    tmux
    tmuxinator
    topgrade
    tor
    treefmt
    trufflehog
    tuir
    vault
    vault-bin
    vault-unseal
    wget
    yq
    yt-dlp

    # Shell enhancements
    zoxide
    zsh
    zsh-abbr
    zsh-autocomplete
    zsh-autopair
    zsh-autosuggestions
    zsh-clipboard
    zsh-command-time
    zsh-completions
    zsh-defer
    zsh-forgit
    zsh-fzf-tab
    zsh-history-substring-search
    zsh-syntax-highlighting
    zsh-you-should-use
    zsh-z
    zsh-zhooks
  ];
} 