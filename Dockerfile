FROM nvidia/cuda:12.4.1-cudnn-devel-ubuntu22.04

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

ENV DEBIAN_FRONTEND=noninteractive\
    SHELL=/bin/bash
RUN apt-get update --yes && \
    apt-get upgrade --yes && \
    apt install software-properties-common -y && \
    add-apt-repository ppa:flexiondotorg/nvtop -y && \
    apt install --yes --no-install-recommends\
    git\
    wget\
    curl\
    bash\
    aria2\
    zip\
    unzip\
    p7zip-full p7zip-rar\
    libopencv-dev libgl1-mesa-dev\
    tmux\
    nvtop\
    htop\
    cmake libncurses5-dev libncursesw5-dev libudev-dev\
    openssh-server && \
    apt-get clean && rm -rf /var/lib/apt/lists/* && \
    echo "ja_JP.UTF-8 UTF-8" > /etc/locale.gen

# tailscale
RUN curl -fsSL https://tailscale.com/install.sh | sh

# git-lfs
RUN curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash && \
    apt-get install git-lfs

ADD start.sh /
ADD setup-starship.sh /
ADD setup-uv.sh /
ADD setup-env.sh /
ADD tailscale.sh /

RUN chmod +x /start.sh &&\
    chmod +x /setup-starship.sh &&\
    chmod +x /setup-uv.sh &&\
    chmod +x /setup-env.sh &&\
    chmod +x /tailscale.sh

RUN /setup-uv.sh
RUN /setup-starship.sh

CMD [ "/bin/bash", "/start.sh" ]
