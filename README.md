# wodin-epimodels

This is the repo for sketching out the initial deployment of the msc course to epimodels.dide.ic.ac.uk; once this is working we'll rewrite it to generally support a set of configurations.

We need to support multiple configurations easily; we'll come up with a better system later but for now we're using submodules. There are currently three:

* `config/demo`: a configuration we'll maintain to show off various wodin features
* `config/msc-idm-2022`: the 2022 MSc course
* `config/malawi-idm-2022`: a short course run in Malawi

## Deploying

```
git clone --recursive git@github.com:mrc-ide/epimodels
```

If cloned already and things are not working, consider

```
git submodule init
git submodule update
```

Configure the proxy by running:

```
./configure-proxy epimodels
```

or on staging use `./configure-proxy wodin-dev`, or for local testing use `./configure-proxy localhost`

This will copy any required ssl keys to `ssl/` and write out the required hostname into the file `hostname`.

Then deploy (or redeploy) with `./deploy`

## Adding a new configuration

Add the configuration to `config/`; the name you give it is the name that the site will be available at. So for example:

```
git submodule add https://github.com/mrc-ide/wodin-demo-config config/demo2
```

Edit [`deploy`](deploy) to list the new site within the array variable `SITES` (first line in the file basically)

Update the index page, `root/index.html` to list the new site, and probably the top of this README too!

Then deploy with `./deploy`
