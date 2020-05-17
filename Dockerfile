##### ################################################################
#####
#####    Base
#####    ====
#####      ???
#####
#####    Build
#####    -----
#####      docker build -t renshi/strobolights -f Dockerfile .
#####
#####    Run
#####    ---
#####      docker run -it renshi/strobolights /bin/bash
#####
##### ################################################################
FROM renshi/common-lisp

MAINTAINER Renshi <yanqirenshi@gmail.com>


##### ################################################################
#####  Install of zypper
##### ################################################################
USER root

RUN zypper --non-interactive install net-tools-deprecated
RUN zypper --non-interactive install libev-devel


##### ################################################################
#####  create directories
##### ################################################################
USER appl-user
WORKDIR /home/appl-user/prj/

RUN mkdir -p /home/appl-user/prj/libs/


##### ################################################################
#####  setting lib projects
##### ################################################################
USER appl-user
WORKDIR /home/appl-user/prj/libs/

###
### clone projects
###
RUN git clone https://github.com/yanqirenshi/world2world.git
RUN git clone https://github.com/yanqirenshi/sephirothic.git
RUN git clone https://github.com/yanqirenshi/takajin84key.git

RUN git clone https://github.com/yanqirenshi/s-serialization
RUN git clone https://github.com/yanqirenshi/upanishad.git
RUN git clone https://github.com/yanqirenshi/shinrabanshou.git

RUN git clone https://github.com/yanqirenshi/lack-middleware-validation.git


###
### make symbolic links for *.asd
###
RUN ln -s /home/appl-user/prj/libs/world2world/world2world.asd         /home/appl-user/.asdf/world2world.asd
RUN ln -s /home/appl-user/prj/libs/sephirothic/sephirothic.asd         /home/appl-user/.asdf/sephirothic.asd
RUN ln -s /home/appl-user/prj/libs/takajin84key/takajin84key.asd       /home/appl-user/.asdf/takajin84key.asd

RUN ln -s /home/appl-user/prj/libs/upanishad/upanishad.asd             /home/appl-user/.asdf/upanishad.asd
RUN ln -s /home/appl-user/prj/libs/s-serialization/s-serialization.asd /home/appl-user/.asdf/s-serialization.asd
RUN ln -s /home/appl-user/prj/libs/shinrabanshou/shinrabanshou.asd     /home/appl-user/.asdf/shinrabanshou.asd

RUN ln -s /home/appl-user/prj/libs/lack-middleware-validation/lack-middleware-validation.asd /home/appl-user/.asdf/lack-middleware-validation.asd


##### ################################################################
#####  setting project of strobolights
##### ################################################################
USER appl-user
WORKDIR /home/appl-user/prj/

RUN git clone https://github.com/yanqirenshi/Strobolights.git

RUN ln -s /home/appl-user/prj/Strobolights/strobolights.asd /home/appl-user/.asdf/strobolights.asd


##### ################################################################
#####  run
##### ################################################################
USER appl-user
WORKDIR /home/appl-user/prj/Strobolights

ENV STROBOLIGHTS_SERVER  woo
ENV STROBOLIGHTS_ADDRESS 0.0.0.0
ENV STROBOLIGHTS_PORT    55555

ENTRYPOINT ["/usr/bin/sbcl", "--script", "/home/appl-user/prj/Strobolights/strobolights.lisp"]
