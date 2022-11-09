# wodin-epimodels

This is the repo for sketching out the initial deployment of the msc course to epimodels.dide.ic.ac.uk; once this is working we'll rewrite it to generally support a set of configurations.

* we need to support multiple configurations easily; for now I've put the configuration in `config/msc-idm-2022` to reflect one way we might achieve this practically
* there's another configuration now at `config/demo` - this time from a submodule!

## Adding a new configuration

Update the sources:

* Add the configuration as a submodule under `config/`
* Edit `./deploy` to bring up a container mounting this configuration
* Edit `./proxy/nginx.conf` to add the new location (two entries - one is a redirect, the other does the proxying)

Then, deploy:

* On epimodels, run `./proxy/build` which updates the proxy image.
* If you're deploying from a branch (likely while you test) then update `PROXY_BRANCH`
