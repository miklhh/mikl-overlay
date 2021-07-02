# mikl-overlay

Gentoo overlay with some good packages.

## Configuration

To add this repository to Portage, put a file with the following content into
`/etc/portage/repos.conf/mikl-overlay.conf`:

```ini
[mikl-overlay]
location = /var/db/repos/mikl-overlay
sync-type = git
sync-uri = https://github.com/miklhh/mikl-overlay.git
auto-sync = yes
```

