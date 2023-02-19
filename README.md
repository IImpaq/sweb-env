# sweb-env
My development setup to work on the SWEB educational OS.

## Description
This repository contains all the necessary scripts to set up a more or less complete development environment
to work on the SWEB educational OS on macOS. I prepared the workspace and tried to automate as much of the process as
possible before taking the Operating Systems course at TU Graz. In my case CLion is used as an IDE. Docker and Docker
Compose are used to setup a container with the necessary packages installed. The execution of the SWEB OS itself is
done on the host system (macOS) using the provided script.

## Getting Started
### Dependencies
* zsh
* QEMU
* Docker
* Docker Compose

### Installation
* Clone this repository
* Run the "setup" script
* Clone the sweb repository to the root of this folder as "src"

### Workflow
* Start the docker container by run the "run" script
* Open the local sweb repository stored in the "src" directory and make any changes you feel like
* When opening the project for the first time in CLion create a new toolchain and select the newly created docker container.
* Run the "compile" script before executing

### Execution
* To start sweb via qemu: run the "emulate" script

### Notes
* I chose to use Ninja instead of Make due to improved build performance.

## Author
Marcus Gugacs

## License
See LICENSE file

## Acknowledgments
* https://github.com/IAIK/sweb
* https://www.iaik.tugraz.at/course/operating-systems-inp32512uf-wintersemester-2022-23/