# docker-nativescript-cli
[![DockerHub Pulls](https://img.shields.io/docker/pulls/niccolomeloni/docker-nativescript-cli.svg)](https://hub.docker.com/r/niccolomeloni/docker-nativescript-cli/) [![DockerHub Stars](https://img.shields.io/docker/stars/niccolomeloni/docker-nativescript-cli.svg)](https://hub.docker.com/r/niccolomeloni/docker-nativescript-cli/) [![GitHub Stars](https://img.shields.io/github/stars/niccolomeloni/docker-nativescript-cli.svg?label=github%20stars)](https://github.com/niccolomeloni/docker-nativescript-cli) [![GitHub Forks](https://img.shields.io/github/forks/niccolomeloni/docker-nativescript-cli.svg?label=github%20forks)](https://github.com/niccolomeloni/docker-nativescript-cli) [![GitHub License](https://img.shields.io/github/license/niccolomeloni/docker-nativescript-cli.svg)](https://github.com/niccolomeloni/docker-nativescript-cli)

This [Docker](https://www.docker.com/) Image allows you to build and run Android apps created by using NativeScript development environment. Take a look around and feel free to suggest improvements.

| Dependencies | Version |
| ------ | ------ |
| NativeScript | [3.0.0](https://www.nativescript.org/) |
| Android SDK Tools | [25.2.3](https://developer.android.com/studio/releases/sdk-tools.html) |
| Android SDK Build Tools | [25.0.2](https://developer.android.com/studio/releases/platform-tools.html) |
| Android APIs | [21 22 23 24 25](https://developer.android.com/about/dashboards/index.html) |
| NodeJS | [v7](https://nodejs.org/en/download/package-manager/#debian-and-ubuntu-based-linux-distributions) |
| Java | [OpenJDK 8](http://openjdk.java.net/projects/jdk8/) |
| Ubuntu | [latest](https://hub.docker.com/_/ubuntu/) |

# Getting Started

Connect an Android device to your host by making sure USB debbugging mode is enabled. Then run following command and get an Hello World running on your device:

```
docker run -it --rm --privilged niccolomeloni/docker-nativescript-cli \
-v /dev/bus/usb:/dev/bus/usb \
bash -c "tns create hello && cd hello && tns platform add android && tns run android"
```
## CLI

Copy `tns` file into `/usr/local/bin/` path and make it executable in order to get the NativeScript CLI ready to use.

## Development

Development environment is available by using [Docker-Compose](https://docs.docker.com/compose/). Add `docker-compose.yml` file to your project and run `docker-compose up` in order to get a live sync environment ready to use.

## License

This project is licensed under the MIT license by Niccolò Meloni.

## Known issue
- This project does not provide support to Android emulator. In order to run your application you have to use a real device.

## TODO
- Add build details
