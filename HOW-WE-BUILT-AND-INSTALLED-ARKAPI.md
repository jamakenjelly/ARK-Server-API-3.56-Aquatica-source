# ARK API 3.56 — Aquatica build notes

This API was built successfully for the ARK: Survival Evolved Aquatica server build.

## What was used

- API source: ArkServerApi AseApi 3.56
- Server folder: `I:\SteamLibrary\steamapps\common\ARK\ShooterGame\Binaries\Win64`
- Verified server version: `361.7`
- Build target: `Ark | x64`
- Build toolchain: Visual Studio 2022, C++ platform toolset v143

## Build steps

1. Install Visual Studio 2022 with **Desktop development with C++**, the v143 x64/x86 build tools, a Windows SDK, and C++ MASM.
2. Open `version.sln`.
3. Select `Ark` as the solution configuration and `x64` as the solution platform.
4. Restore NuGet packages if Visual Studio requests it.
5. Build the solution using `Ctrl+Shift+B`.
6. Confirm the result says: `Build: 1 succeeded, 0 failed`.

## Build output

The compiled loader is created here:

```text
x64\Ark\version.dll
```

Note: it is **not** inside the `version` folder.

## Server installation

Stop the server before changing files. Copy these into the server's `Win64` folder:

```text
x64\Ark\version.dll  ->  Win64\version.dll
config.json            ->  Win64\config.json
msdia140.dll           ->  Win64\msdia140.dll
```

Create these folders if missing:

```text
Win64\ArkApi\
Win64\ArkApi\Plugins\
```

`msdia140.dll` comes from the Visual Studio installation. The API needs it to read `ShooterGameServer.pdb` and discover addresses for the current game build.

## Successful verification

The server log confirmed the following:

```text
ARK: Server Api V3.56
Successfully read information from PDB
Initialized hooks
API was successfully loaded
ARK Version: 361.7
```

The installed plugins then loaded successfully, including Ark Shop, ArkShopUI, DamageControl, Dino Utilities, and ItemsPlus.

## Future updates

After an ARK update, restart the server and check `Win64\logs\ArkApi.log`. If it again reports that it read the PDB, initialized hooks, and loaded successfully, the API is compatible with that build.
