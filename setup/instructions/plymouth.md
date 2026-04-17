Add plymouth to the HOOKS array in mkinitcpio.conf.

```
HOOKS=(... plymouth ...)
```
If you are using the systemd hook, it must be before plymouth.

Furthermore make sure you place plymouth before the encrypt or sd-encrypt hook if your system is encrypted with dm-crypt.

Finally, regenerate the initramfs. 

```
mkinitcpio -P
```

Set theme by running

```
plymouth-set-default-theme -R custom
```

Append `quiet splash` to the `options` in `/boot/loader/entries/*.conf`
