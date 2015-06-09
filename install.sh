set -e

TARGET="$HOME/.nix-defexpr/local"
SOURCE="$( cd -P "$( dirname "$0" )" && pwd )"

if [ -e "$TARGET" ]; then
  if [ "$(readlink $TARGET)" = "$SOURCE" ]; then
    echo "Already installed, exiting..."
    exit 1
  else
    echo "Target file ($TARGET) exist..."
    echo -n "Do you wanna delete it (y/n)? "
    read yesno
    if [ "$yesno" = "Y" -o "$yesno" = "y" ]; then
      rm -f "$TARGET"
    else
      echo "Aborting installation..."
      exit 1
    fi
  fi
fi

echo "Creating link for '$SOURCE' in '$TARGET'"
ln -s "$SOURCE" "$TARGET"
echo "Installation success."
