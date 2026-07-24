# Ready-to-Install

A ready-to-deploy ArkApi package for ARK: Survival Evolved server 361.7:

```text
version.dll             - the ArkApi loader
config.json              - ArkApi's own settings (plugin reload, etc.)
ArkApi/Plugins/          - empty; put built plugin DLLs here
```

## Installing

1. Stop the target server.
2. Copy `version.dll` and `config.json` into the server's `Win64` folder.
3. Copy the `ArkApi` folder into the server's `Win64` folder (merge, don't
   replace, if one already exists with plugins in it).
4. You'll also need `msdia140.dll` (from a Visual Studio install) in
   `Win64` - ArkApi uses it to read `ShooterGameServer.pdb`. See
   `../HOW-WE-BUILT-AND-INSTALLED-ARKAPI.md` for details.
5. Start the server and check the log confirms:
   `API was successfully loaded`.

Plugins are not included in this release - build them from
https://github.com/jamakenjelly/Ark-api and copy each one's staged folder
into `ArkApi\Plugins\` separately.
