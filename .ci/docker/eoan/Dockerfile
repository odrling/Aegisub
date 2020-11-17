FROM ubuntu:eoan

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y dh-make build-essential libwxgtk3.0 libboost-all-dev icu-devtools libffms2-dev fontconfig libfreetype6-dev libass-dev zlib1g-dev libgl1 libssl-dev libasound2-dev libpulse-dev fftw3-dev libuchardet-dev libc6-dev intltool libhunspell-dev git

COPY . /aegisub
WORKDIR /aegisub
RUN make clean
RUN build/version.sh .
RUN rm -rf .git
RUN mv .ci/docker/debian_entrypoint.sh /entrypoint.sh
RUN mv .ci/distribution/debian /aegisub
RUN chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]

