# Dotfiles

## Usage
`create_links.sh` symlinks all files in the directory to target location (by default home directory). Ignores files specified in `.linkignore`

If a file already exists, it will be overwritten. If a subdirectory already exitsts, the content will be merged.


The script will also keep track of created symlinks in `.links` for easier cleanup. `remove_links.sh` simply unlinks all the entries in `.links`.


The keyboard layout file 'gb' is not automatically copied. It should be manually moved and replace the already existing 'gb' file in `/usr/share/X11/xkb/symbols`.
This will add "æøå" to the 'English (UK, extended, with Win keys)' layout using AltGr as the modifier.


##
> Screen brightness uses [ybacklight](https://github.com/femnad/ybacklight) because xbacklight didn't work on my machine
