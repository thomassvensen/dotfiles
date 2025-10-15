https://askubuntu.com/questions/1015416/use-fingerprint-authentication-not-only-for-login
https://github.com/hluk/CopyQ/issues/1243 - fix issue with Wayland
https://starship.rs
https://github.com/rvaiya/keyd
https://itsfoss.com/disable-ubuntu-dock/

Install windows fonts:
```shell
sudo apt install ttf-mscorefonts-installer
```

To reload `keyd` after updating `/etc/keyd/default.conf`
with

```
[ids]
*

[main]

# Normal behavior
capslock = layer(nav)

# When Caps Lock is held
[nav]
j = down
k = up
l = right
h = left
```

run 

```shell
sudo journalctl -eu keyd
sudo keyd reload
```
