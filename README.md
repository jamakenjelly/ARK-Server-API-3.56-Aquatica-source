# ARK-Server-API 3.56 (Aquatica build)

A C++ SDK for writing native plugins for ARK: Survival Evolved dedicated
servers (**ASE**, not Ascended). It hooks into the game server process to
expose engine classes, functions, and fields to plugin code, and provides
the loader (`version.dll`) that ARK's own DLL-hijacking mechanism picks up
on startup.

This is a build of [ArkServerApi](https://github.com/ArkServerApi/ASE-Plugins)'s
`AseApi`, targeting ARK server version **361.7**, built and verified against
an Aquatica DLC server install. See `HOW-WE-BUILT-AND-INSTALLED-ARKAPI.md`
for the exact build/install steps used.

## Credit

Forked from and built on top of [ArkServerApi](https://github.com/ArkServerApi/ASE-Plugins)
(MIT licensed - see `LICENSE`), itself building on earlier work by
Game Servers Hub (2022-2024) and Michidu (2017-2022). All credit for the
SDK's design and reverse-engineering work belongs to those projects; this
repo is a specific compiled/verified build plus the plugins written
against it.

## Layout

- `version/Core/Public` - the actual SDK: headers plugins `#include` to
  access ARK's engine classes (`API/ARK/*.h`), plus bundled third-party
  headers (`json.hpp`, a MySQL client, spdlog).
- `lib/`, `out_lib/` - prebuilt import libraries (OpenSSL, Poco, and the
  compiled `ArkApi.lib`/`AtlasApi.lib`) needed to link a plugin against
  this SDK.
- `version/version.vcxproj` - the loader project itself (`version.dll`).
- `Plugins/` - empty; not part of the SDK. See the release notes below for
  a ready-to-deploy package, and https://github.com/jamakenjelly/Ark-api
  for the actual plugin source built against this SDK.

Build output (`x64/`, `.obj`, `.pdb`, etc.) is intentionally not tracked -
see `.gitignore`.

## Building

See `HOW-WE-BUILT-AND-INSTALLED-ARKAPI.md` for the full walkthrough
(Visual Studio 2022, `Ark | x64` configuration, `version.sln`).

## Releases

Tagged releases contain a ready-to-deploy package (`version.dll` +
`config.json` + an empty `ArkApi/Plugins/` folder) for copying straight
into a server's `Win64` folder - without any plugins bundled in, since
those are their own separate project/repo.
