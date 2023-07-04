# toxbox

A trivial Fedora-based container image for running [tox](https://tox.wiki/).

## Usage example

If you want to run `tox` on the source tree in the current directory:

```sh
podman run \
    --rm \
    --interactive --tty \
    --userns=keep-id \
    --security-opt=label=disable \
    --volume="$(pwd)":/src \
    ghcr.io/allisonkarlitskaya/toxbox
```

## Notes

git is also available in the container and has been configured to ignore file
ownership issues (although none should arise with `--userns=keep-id`).

sudo has been configured that any user can run any command without
authentication.  This might be helpful for installing extra packages.
