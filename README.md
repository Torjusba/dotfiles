# Dotfiles

## Usage
`create_links.sh` symlinks all files in the directory to target location (by default home directory). Ignores files specified in `.linkignore`

If a file already exists, it will be overwritten. If a subdirectory already exitsts, the content will be merged.


The script will also keep track of created symlinks in `.links` for easier cleanup. `remove_links.sh` simply unlinks all the entries in `.links`.

## Bootstrap
`bootstrap.sh` will perform initial setup on a fresh system. It will not symlink the dotfiles.

