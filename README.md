### cGit Dockerfile
cGit is hyperfast web frontend for git repositories written in C. This project intends to containize cgit with Docker.

### Hilights
1. CentOS7 as base image.
2. cGit provided by CentOS7 and EPEL.
3. Using dumpinit to avoid PID 1 zombie reaping problem.
4. Allowing customizing cGit using env variables.
5. Allowing mapping local git repo to the container.

### Usage
```
git clone https://github.com/luohao-brian/cgit.git
docker build --force-rm=true -t cgit .
docker run --name cgit -d -p 8888:80 -e "CGIT_VROOT=/cgit" -e "CGIT_SECTION_FROM_STARTPATH=-1"  -v /home/git:/srv/git cgit
```

### Enviroment Variables
```
CGIT_TITLE: 'My awesome git repos'
CGIT_DESC: 'Presented by Cgit on Docker'
CGIT_VROOT: '/'
# check section-from-path in cgit docs
CGIT_SECTION_FROM_STARTPATH: -1
```

### Volumes
```
/srv/git
```
