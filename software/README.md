# Provisioning

Cool software that I want on my machines


## Usage

Read the `Dockerfile`s in `./test` for commands to run...


## Testing

```bash
make test

# NOTE: individual tests rely on the up2date archlinux image
# if you change scripts, that may be out of date (e.g. have old version of scripts)
# .. so make sure to:
make up2date
make test_pkgs
```

