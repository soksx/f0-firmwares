<picture>
    <source media="(prefers-color-scheme: dark)" srcset="/.github/assets/dark_theme_banner.png">
    <source media="(prefers-color-scheme: light)" srcset="/.github/assets/light_theme_banner.png">
    <img
        alt="A pixel art of a Dophin with text: Flipper Zero Docker Firmwares Repo"
        src="/.github/assets/light_theme_banner.png">
</picture>

# Flipper Zero Docker Firmwares
The purpose of this repository is to dynamically generate correctly taged docker images for the different existing Flipper Zero firmwares.
***"Pre-configured"* firmwares**:

 - [Official Firmware](https://github.com/flipperdevices/flipperzero-firmware). The official Fliper Zero firmware
 - [Unleashed Firmware](https://github.com/DarkFlippers/unleashed-firmware). Unleashed firmware version focusing on new features and enhancements
 - [RogueMaster Firmware](https://github.com/RogueMaster/flipperzero-firmware-wPlugins). A fork of unleashed, with more experimental functionalities.

## How does it work?
This repository has a github action configured that when a tag is created, it triggers a pipeline that executes a series of actions that builds the docker image of the desired firmware based on the tags. The result of this image is uploaded to the repository's own package manager.

**Available tags**:
 - [X] ofw-*
 - [X] unlshd-*
 - [X] RM -*

*These tags have configured variables at the repository level with the url of the tags' code, which is dynamically resolved in the pipelines.*

Once a new tag is created in the repository it dynamically resolves the firmware version used, clones the remote repository and runs the `./fbt` command to install the flipper build tool and compile the firmware. 

The docker image follows a multi-stage strategy to start from a base (containing software needed to make curl requests, parse yaml files...) that can be cached (and in the future migrated to a base image). 

## How to run it locally?
```shell
# Flipper Zero Official firmware
docker build `
    --build-arg firmware_repo=https://github.com/flipperdevices/flipperzero-firmware `
    --build-arg firmware_version=0.84.2 `
    -t bevir.io/f0-firmware:ofw-v0.84.2 --target final .
```

## TODOs
 - [ ] Create base image with **Flipper Build Tool**
 - [ ] Change image generation strategy. (config.yml with the different repositories and merge the pull request to generate all the images at once.)?