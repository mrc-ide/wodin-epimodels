# wodin-epimodels

This is the repo for sketching out the initial deployment of the msc course to epimodels.dide.ic.ac.uk; once this is working we'll rewrite it to generally support a set of sites, each with their own configuration.

We need to support multiple configurations easily, we currently do this with a script in the `wodin` image that can update the configurations on a volume. There are currently six sites:

* `config/demo`: a configuration we'll maintain to show off various wodin features
* `config/msc-idm-2022`: the 2022 MSc course
* `config/msc-idm-2023`: the 2023 MSc course
* `config/malawi-idm-2022`: a short course run in Malawi
* `config/gambia-idm-2023`: a short course run in The Gambia
* `config/acomvec-2023`: a short course run in Cameroon
* `config/infectiousdiseasemodels-2023`: The DIDE short course (2023)

## Deploying for the first time

```
git clone git@github.com:mrc-ide/wodin-epimodels.git
```

Configure the proxy by running `./configure-proxy`:

* `./configure-proxy epimodels` for use on epimodels.dide
* `./configure-proxy wodin-dev` on wodin-dev.dide
* `./configure-proxy localhost` locally for testing (no ssl)

This will copy any required ssl keys to `ssl/` and write out the required hostname into the file `hostname`.

Then deploy (or redeploy) with `./deploy`

## Adding a new site

Edit [`sites`](sites) to:

* list the new site within the array variable `SITES` (first line in the file basically)
* add an entry in `SITES_URL` just below that; the key (in square brackets) must match the new entry in `SITES` exactly
* if you need a specific reference add that as `SITES_REF[newsite]=mrc-1234`, otherwise this defaults to `main`

For example adding

```
SITES=(... newsite)
SITES_URL[newsite]=https://github.com/mrc-ide/wodin-newsite
SITES_REF[newsite]=prototype
```

would make a new site available at `http://localhost/newsite` using configuration from `https://github.com/mrc-ide/wodin-newsite` using branch `prototype`. Delete this last line to start using the `main` branch.

Update the index page, `root/index.html` to list the new site, and probably the top of this README too, as these both have manually updated lists.

Then deploy with `./deploy`

## Updating the deployment

### To update everything (containers and every site)

```
ssh epimodels # or wodin-dev
cd wodin-epimodels
./deploy
```

This updates the sites as well the containers

### To update the source of one site

```
ssh epimodels # or wodin-dev
cd wodin-epimodels
./update_source infectiousdiseasemodels-2023
```

No changes to the config will be updated.

### To try a different branch of wodin or odin.api

Edit (on the server) `./wodin-epimodels/deploy` and redeploy by running 

### To try a different branch of the config

Edit (on the server) `./wodin-epimodels/sites` and add

```
SITES_REF[infectiousdiseasemodels-2023]="mrc-1234"
```

(just put it after all the `SITE_URL` bits that are already there)

Then deploy with `./deploy`

Clean up with

```
git checkout -- .
```
