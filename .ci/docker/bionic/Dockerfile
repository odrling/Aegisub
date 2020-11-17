FROM ubuntu:bionic

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get upgrade -y && apt-get install -y dh-make build-essential libwxgtk3.0 libboost-all-dev icu-devtools libffms2-dev fontconfig libfreetype6-dev libass-dev zlib1g-dev libgl1 libssl-dev libasound2-dev libpulse-dev fftw3-dev libuchardet-dev libc6-dev intltool libhunspell-dev git python3-pip libreadline-dev ninja-build
RUN pip3 install meson

COPY . /aegisub
WORKDIR /aegisub
RUN rm -rf builddir
RUN meson -Dprefix=/usr builddir
WORKDIR builddir
RUN mv ../.ci/docker/debian_entrypoint.sh /entrypoint.sh
RUN mv ../.ci/distribution/ubuntu-bionic debian
RUN chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]

