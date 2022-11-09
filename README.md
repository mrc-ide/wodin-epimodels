# wodin-epimodels

This is the repo for sketching out the initial deployment of the msc course to epimodels.dide.ic.ac.uk; once this is working we'll rewrite it to generally support a set of configurations.

We need to support multiple configurations easily; we'll come up with a better system later but for now we're using submodules. There are currently two:

* `config/demo`: a configuration we'll maintain to show off various wodin features
* `config/msc-idm-2022`: the 2022 MSc course

## Adding a new configuration

Update the sources:

* Add the configuration as a submodule under `config/`
* Edit `./deploy` to bring up a container mounting this configuration, and to remove the container on startup
* Edit `./proxy/nginx.conf` to add the new location (two entries - one is a redirect, the other does the proxying)

Then, deploy:

* On epimodels, run `./proxy/build` which updates the proxy image.
* If you're deploying from a branch (likely while you test) then update `PROXY_BRANCH`
