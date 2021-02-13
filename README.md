# setup-docker-node-for-raspberry-pi
This is a shell repository that set up docker, docker-compose, node, npm for the Raspberry Pi OS 64bit


# How to Use
## node install
- excute fllowing shell
```
./node.sh
```

## docker install
- excute fllowing shell
```
./docker-setup.sh
```
### note:
- Even if E: Sub-process / usr / bin / dpkg returned an error code (1) occurs, the installation is complete.

## docker install
- excute fllowing shell
```
./docker-compose-setup.sh
```

# Verification Software
```
pi@raspberrypi:~ $ lsb_release -a
No LSB modules are available.
Distributor ID:	Debian
Description:	Debian GNU/Linux 10 (buster)
Release:	10
Codename:	buster

pi@raspberrypi:~ $ uname -a
Linux raspberrypi 5.10.11-v8+ #1399 SMP PREEMPT Thu Jan 28 12:14:03 GMT 2021 aarch64 GNU/Linux

pi@raspberrypi:~ $ npm -v
7.5.4
pi@raspberrypi:~ $ node -v
v12.20.2
pi@raspberrypi:~ $ docker --version
Docker version 20.10.3, build 48d30b5
pi@raspberrypi:~ $ docker-compose --version
docker-compose version 1.28.2, build 67630359
```


# Verification Hardware
- Raspberry Pi 4 Model B/4GB
- SanDisk microSDHC 98MB/s 16GB Ultra SDSQUAR-016G
- SanDisk microSDHC 98MB/s 32GB Ultra SDSQUAR-032G-GN6MA
