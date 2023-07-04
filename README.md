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

There's a `tox` user and group with the UID `50674`, chosen to avoid
overlapping with anything that might be on the host system.  The default user
when entering the container is `root`, however.

## GitHub Actions

It's also possible to use this image from a workflow.  Something like:

```
jobs:
  tox:
    permissions: {}
    runs-on: ubuntu-22.04
    container: ghcr.io/allisonkarlitskaya/toxbox

    steps:
      - name: Clone repository
        uses: actions/checkout@v3

      - name: Run tox
        run: tox
```

Note: this will enter the container as root.  If you want to run the tests as
non-root, try something like:

```
runuser -u tox -- tox
```
