# Publish a NPM package to a Verdaccio registry

Test the integrity of a package publishing in [Verdaccio](https://verdaccio.org/).

This is a based in Docker GitHub Action.

See in action in a full example:

```
name: Release and Publish

on:
  push:
    branches: [main]
  pull_request:
    branches: [main]

jobs:
  publish:
    runs-on: ubuntu-latest
    steps:
    - name: Checkout
      uses: actions/checkout@v2
    - name: Publish Package
      uses: Greyborn/verdaccio-github-actions/publish@master
      with:
        registry: ${{ secrets.VERDACCIO_REGISTRY }}
        username: ${{ secrets.VERDACCIO_USERNAME }}
        password: ${{ secrets.VERDACCIO_PASSWORD }}
        email: ${{ secrets.VERDACCIO_EMAIL }}
        args: -d
```

## Inputs

### Optional Inputs

| Property   | Description                       | Default Value         |
| ---------- | --------------------------------- | --------------------- |
| `registry` | Registry URL (and port)           | `http://0.0.0.0:4873` |
| `username` | Registry account username         | `test`                |
| `password` | Registry account password         | `test`                |
| `email`    | Registry account email address    | `user@example.com`    |
| `debug`    | npm debug level                   | `-ddd`                |
| `args`     | Additional command line arguments | Same as `debug`       |
