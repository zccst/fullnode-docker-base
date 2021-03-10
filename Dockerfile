FROM golang:alpine

RUN apk add --no-cache \
    make \
    git \
    libc-dev \
    bash \
    gcc \
    linux-headers \
    eudev-dev \
    g++ \
    snappy-dev \
    logrotate\
    wget


ENV GO111MODULE=on \
    GOPROXY=http://goproxy.cn


WORKDIR /root/okexchain
# Set working directory for the build
# WORKDIR $GOPATH/src/github.com/okex/okexchain

# Add okexchain source files
COPY okexchain .


# RUN git clone https://github.com/okex/okexchain.git -b dev


EXPOSE 26656 26657 26659 26660 6060 8545