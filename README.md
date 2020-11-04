<div align="center">

# Containerized *Vanilla* Terraria Server

A vanilla Terraria server image! For TShock, check out the following: https://github.com/JoshuaTheMiller/Terraria

[![Discord](https://img.shields.io/discord/768637103402909716?label=Discord&style=flat-square)](https://discordapp.com/widget?id=768637103402909716&theme=dark) [![MediumLink](https://img.shields.io/badge/Read%20about%20me%20on%20-Medium-lightgrey?style=flat-square)][medium] [![MIT License](https://img.shields.io/dub/l/vibe-d.svg?style=flat-square)](https://github.com/JoshuaTheMiller/vanilla-terraria) 

[![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/trfc/vanilla-terraria?style=flat-square)][dockerHub] [![Docker Cloud Automated build](https://img.shields.io/docker/cloud/automated/trfc/vanilla-terraria?style=flat-square)][dockerHub] ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/trfc/vanilla-terraria/latest?style=flat-square) [![Docker Pulls](https://img.shields.io/docker/pulls/trfc/vanilla-terraria?style=flat-square)][dockerHub]

*A containerized version of Terraria Server running on Linux, courtesy of [Mono](https://www.mono-project.com/)!*

</div>

## Quickstart

First and foremost, you're going to need Docker. Please check out [Docker's documentation](https://docs.docker.com/engine/install/) for how to install it on the various supported platforms. While the install may be different per platform, the rest of the steps will remain the same (containers sure are nice, aren't they?).

After installing docker, just run the following command and wait a few minutes:

```bash
docker run -d -p 7777:7777 --memory=500m --mount source=terraria,target=/world --name="terraria" trfc/vanilla-terraria:latest -autocreate 1 -world /world/Terrarium.wld
```

### Explanation of the command above

| Parameter/Option | Description |
| - | - |
| `-d` | run the container in detached mode so you can go about your day. |
| `-p 7777:7777` | map port 7777 to the container's port 7777 so that you can connect to the server (since the command does not change the server from its default port). |
| `--memory=500m` | set the max amount of memory to use so that your system doesn't crash because of out of memory exceptions. |
| `--mount source=terraria,target=/world` | create (or attach to if existing) a volume so that your world persists even when the container shuts down. |
| `--name="terraria"` | name the running container "terraria" |
| `trfc/vanilla-terraria:latest` | use this image 😊 |
| `-autocreate 1 -world /world/Terrarium.wld` | create a small world named Terrarium OR use an existing world named Terrarium (default Terraria server command) |

## Quickstart with more control

After installing docker, start the container (and your server) in interactive mode:

```bash
docker run -it -p 7777:7777 --memory=500m --mount source=terraria,target=/world --name="terraria" trfc/vanilla-terraria:latest
```

Next, go through the prompts as it asks (make note of the name of your world).

Finally, after the server starts, exit by pressing `Ctrl+p` followed immediately by `Ctrl+q`. This will cause the container to switch to daemon mode, which will allow it to keep running in the background.

[dockerHub]: https://hub.docker.com/repository/docker/trfc/vanilla-terraria
[medium]: https://bit.ly/MediumTerrariaServer