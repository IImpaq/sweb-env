# sweb-env
My development setup to work on the SWEB educational OS.

## Description
This repository contains all the necessary scripts to set up a more or less complete development environment
to work on the SWEB educational OS on macOS. I prepared the workspace and tried to automate as much of the process as
possible before taking the Operating Systems course at TU Graz. In my case CLion is used as an IDE. Docker and Docker
Compose are used to setup a container with the necessary packages installed. The execution of the SWEB OS itself is
done on the host system (macOS) using the provided script.

## Notes
I chose to use Ninja instead of Make due to improved build performance. Anything in this repository is highly
experimental and I expect for stuff to not work sometimes. This repository will probably receive some patches during
the next few months. Brew is recommended for installing necessary packages on the macOS host. I won't and can't
guarantee that anything works (correctly) and/or that nothing will break.

## Getting Started
### Dependencies
* zsh
* QEMU
* Docker
* Docker Compose

### Installation
* Clone this repository
* Make sure Docker is running
* Run the "setup" script
* Clone the sweb repository to the root of this folder as "src"

### Workflow
* Start the docker container by run the "run" script
* Open the local sweb repository (stored in the "src") with the IDE of your choice (CLion in my case) directory and make any changes you feel like
* When opening the project for the first time in CLion create a new toolchain and select the newly created docker container.
* Hint: for ease you can move the docker toolchain up in the hierarchy to used it as a default
* Apply the changes
* Run the "compile" script before executing
* Hint: compile can be run either in "debug" or "release" mode (passed as a parameter)

### How to run the OS?
* To start sweb via qemu: type "../emulate.sh run" in the terminal to start a qemu instance
* Hint: this expects you to be within the "src" directory

### How to debug the os?
* To debug sweb: type "../emulate.sh debug" in the terminal
* Important: run the compile script in debug mode before (and you might want to run the clean script before that)
* Hint: this expects you to be within the "src" directory
* Hint: you need to setup your IDE correctly to be able to debug sweb efficiently
* Click the debug button in your correctly configured IDE and it should connect to the qemu instance
* Hint: recompile when changing breakpoints

### How to setup an IDE for debugging?
* Important: this guide will only focus on CLion.
* Click "Edit Configurations..."
* Click the plus icon in the top-left corner and select "Remote Debug"
* Choose any logical name
* Set the value of "'target remote' args" to be "127.0.0.1:1234"
* Set the value of Symbol file to be "/tmp/sweb/kernel64.x"
* Set the value of Sysroot to be "/tmp/sweb/"
* Add a new "Path mapping": "Remote" is "/tmp/src/" and "Local" is the path to the sweb repository on your host machine
* Apply the changes

### Practical Example

```bash
# Important: Make sure you have Docker running

# First time setup:
git clone git@github.com:IImpaq/sweb-env.git
cd sweb-env
git clone https://github.com/isec-tugraz/sweb.git src # Replace with your repository
./setup.sh

# Everytime you start working:
./run.sh

# When changing code:
./compile.sh release # or debug
./emulate.sh run

# When finished working:
./stop.sh
```

## Author
Marcus Gugacs

## License
See LICENSE file

## Acknowledgments
* https://github.com/IAIK/sweb
* https://www.iaik.tugraz.at/course/operating-systems-inp32512uf-wintersemester-2022-23/
* https://www.iaik.tugraz.at/teaching/materials/os/tutorials/sweb-kernel-debuggen-mit-cgdb/
* https://brew.sh/
* https://www.qemu.org/
* https://www.zsh.org/
* https://www.docker.com/
