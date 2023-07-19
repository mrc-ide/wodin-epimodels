## Backup

This is managed by [privateer](https://github.com/reside-ic/privateer). Config lives in the `privateer.json`
file. An ssh keypair will have to exist, and the public key added to the remote 
backup machine.

To see what backups are running:

```privateer status```

To cancel scheduled backups:

```privateer cancel```

To schedule new backups (e.g. after modifying config):

```privateer schedule . --to=annex```

To restore from a backup:

```privateer restore . --from=annex```

See privateer](https://github.com/reside-ic/privateer) for more details.