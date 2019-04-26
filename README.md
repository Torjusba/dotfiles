# Dotfiles

## Usage
`create_links` symlinks all files in the directory to target location (by default home directory). Ignores files specified in `.linkignore`
If a file already exists, it will be overwritten. If a subdirectory already exitsts, the content will be merged.

The script will also keep track of created symlinks in `.links` for easier cleanup. `remove_links` simply unlinks all the entries in `.links`.

