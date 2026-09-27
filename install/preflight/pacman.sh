if [[ -n ${ERATOSTHENES_ONLINE_INSTALL:-} ]]; then
  # Install build tools
  eratosthenes-pkg-add base-devel git

  # Configure pacman with eratosthenes custom repo
  echo "==> Configuring pacman with eratosthenes repository..."
  sudo cp -f "$ERATOSTHENES_PATH/default/pacman/pacman-stable.conf" /etc/pacman.conf
  sudo cp -f "$ERATOSTHENES_PATH/default/pacman/mirrorlist-stable" /etc/pacman.d/mirrorlist

  # Initialize pacman keyring and import eratosthenes signing key
  echo "==> Initializing pacman keyring..."
  sudo pacman-key --init
  sudo pacman-key --populate archlinux

  # Download and import eratosthenes public key so pacman can verify repo database
  sudo curl -fsSLo /usr/share/pacman/keyrings/hyprdots.gpg \
    "https://pkgs.trevorndlovu.com/stable/x86_64/hyprdots.gpg"
  sudo pacman-key --add /usr/share/pacman/keyrings/hyprdots.gpg
  sudo pacman-key --lsign-key "hyprdots-keyring"

  # Install hyprdots-keyring to populate trusted keys
  sudo pacman -Sy --noconfirm hyprdots-keyring

  # Refresh repos
  sudo pacman -Syyuu --overwrite='*' --noconfirm
fi
