# 🌐 sweb-env

## 📝 Description
This repository contains scripts to set up a complete development environment for the SWEB educational operating system on macOS. It uses Docker for the development environment and QEMU for running the OS.

## ⚠️ Disclaimer
Use at your own risk! While this setup has been tested, I cannot take responsibility for any issues that might arise from using these scripts. Development environments can be complex, and unexpected problems may occur depending on your specific system configuration. Always back up your work before making significant changes to your development environment.

## 🔧 Prerequisites
Before you begin, ensure you have the following installed on your macOS system:

1. **Homebrew** - Package manager for macOS
   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```
   
2. **Zsh** - Shell environment (comes pre-installed on newer macOS versions)

3. **QEMU** - Emulator to run the OS
   ```bash
   brew install qemu
   ```

4. **Docker Desktop** - For containerized development
   ```bash
   brew install --cask docker
   ```
   After installation, launch Docker Desktop from your Applications folder.

## 🚀 Getting Started

### Initial Setup
1. Clone this repository:
   ```bash
   git clone https://github.com/IImpaq/sweb-env.git
   cd sweb-env
   ```

2. Clone the SWEB repository:
   ```bash
   git clone https://github.com/isec-tugraz/sweb.git src
   ```
   (You can replace with your own SWEB repository URL)

3. Run the setup script:
   ```bash
   ./setup.sh
   ```

## 💻 Development Workflow

### Starting Your Development Session
1. **Start the Docker container**:
   ```bash
   ./run.sh
   ```

2. **Open the 'src' folder as a project in your IDE** (CLion recommended):
   - When opening for the first time, create a new toolchain and select the Docker container
   - Move the Docker toolchain up in the hierarchy to use it as default

3. **Make your code changes** in the ```src``` directory

4. **Compile your changes**:
   ```bash
   ../compile.sh release   # For release mode
   # OR
   ../compile.sh debug     # For debug mode
   ```

5. **Run the OS**:
   ```bash
   cd src
   ../emulate.sh run
   ```

### Debugging the OS
1. **Compile in debug mode**:
   ```bash
   ../compile.sh debug
   ```

2. **Start QEMU in debug mode**:
   ```bash
   cd src
   ../emulate.sh debug
   ```

3. **Connect your IDE debugger** to the QEMU instance

### Ending Your Session
When you're done working:
```bash
../stop.sh
```

## 🔍 Setting Up CLion for Debugging

1. Click "Edit Configurations..."
2. Click the plus icon and select "Remote Debug"
3. Configure the following settings:
   - Name: Choose any logical name
   - 'target remote' args: ```127.0.0.1:1234```
   - Symbol file: ```/tmp/sweb/kernel64.x```
   - Sysroot: ```/tmp/sweb/```
   - Path mapping:
     - Remote: ```/tmp/src/```
     - Local: Path to your local SWEB repository

## 📋 Complete Example Workflow

```bash
# First time setup:
git clone https://github.com/IImpaq/sweb-env.git
cd sweb-env
git clone https://github.com/isec-tugraz/sweb.git src
./setup.sh

# Daily development workflow:
# When starting:
./run.sh
cd src

# Make code changes in src directory
../compile.sh release
../emulate.sh run

# When finished:
cd ..
./stop.sh
```

## 🗂️ Repository Structure and Scripts

### Scripts Overview
This repository contains several utility scripts to manage your SWEB development environment:

- **```setup.sh```**: Initializes the Docker environment and prepares everything for first use
- **```run.sh```**: Starts the Docker container for development
- **```stop.sh```**: Stops the running Docker container
- **```compile.sh```**: Compiles the SWEB operating system (accepts ```debug``` or ```release``` parameter)
- **```clean.sh```**: Removes build artifacts and cleans the project
- **```emulate.sh```**: Launches QEMU to run or debug the compiled OS

### Key Files and Locations
- **```docker-compose.yml```**: Defines the Docker container configuration for the development environment
- **```src/```**: Directory containing the SWEB source code (created by cloning your SWEB repository)
- **```/tmp/sweb/```**: Location inside the Docker container where compiled SWEB files are stored
- **```/tmp/src/```**: Location inside the Docker container where source files are mounted
- **```/tmp/sweb/kernel64.x```**: The compiled kernel binary used for debugging
- **```127.0.0.1:1234```**: Default debugging port used by QEMU for GDB connection

## 👤 Author
Marcus Gugacs

## 📄 License
See LICENSE file

## 🙏 Acknowledgments
* https://github.com/isec-tugraz/sweb
* https://www.isec.tugraz.at/course/operating-systems-inp32512uf-wintersemester-2022-23/
* https://www.isec.tugraz.at/teaching/materials/os/tutorials/sweb-kernel-debuggen-mit-cgdb/
* https://brew.sh/
* https://www.qemu.org/
* https://www.zsh.org/
* https://www.docker.com/
