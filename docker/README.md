## Docker Installation and Configuration


**For a lightning install:**

```bash
chmod +x configuration.sh
./configuration.sh
```


**For a step by step, manual install**

### 📦 Step 1: Install Docker usin `apt` on Ubuntu or other Debian-based system

If you are using another distribution, please refer to official [documetation](https://docs.docker.com/engine/install/).

   ```bash
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
```

### 🐋 Step 2: Install the Docker packages.

```bash
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```


### 🚀 Step 3: Launch docker without `sudo`

```bash
sudo groupadd docker
sudo gpasswd -a $USER docker
newgrp docker
```

### ✅ Step 4: Verify Correct setup
```bash
docker run hello-world
```
If everything went well it shall display. If not, you might have to reboot your computer for the changes to take action.

```
Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (amd64)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
 https://hub.docker.com/

For more examples and ideas, visit:
 https://docs.docker.com/get-started/
```

### 📥 Step 5: Download MicroSim Ceram worker

```bash
docker pull adammalaoui/microsim-ceram
```

You can check if it has been successfully installed:

```bash
docker images
```
There shall be this container available:

```
REPOSITORY                           TAG       IMAGE ID       CREATED        SIZE
adammalaoui/microsim-ceram           latest    -              -              6.47GB
```
