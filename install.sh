set -e

TARGET="$HOME/.nix-defexpr/local"
SOURCE="$(pwd)"

if [ -e "$TARGET" ]; then
  echo "Target file ($TARGET) exist..."
  echo -n "Do you wanna delete it (y/n)? "
  read yesno
  if [ "$yesno" = "Y" -o "$yesno" = "y" ]; then
    rm -f "$TARGET"
  else
    echo "Exiting installation..."
    exit 1
  fi
fi

echo "Creating link for '$SOURCE' in '$TARGET'"
ln -s "$SOURCE" "$TARGET"
echo "Installation success."
