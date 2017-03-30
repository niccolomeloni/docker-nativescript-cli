FROM ubuntu:latest

ARG ANDROID_SDK_URL="https://dl.google.com/android/repository/tools_r25.2.3-linux.zip"
ARG ANDROID_BUILD_TOOLS="build-tools-25.0.2"
ARG ANDROID_APIS="android-22,android-23,android-24,android-25"
ARG ANDROID_EXTRA_PACKAGES="extra-android-m2repository,extra-google-m2repository,extra-google-google_play_services"

RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y --no-install-recommends 	build-essential \
						curl \
						g++ \
						git \
						gradle \
						lib32z1 \
						libc6 \
						lib32ncurses5 \
						lib32stdc++6 \
						maven \
						openjdk-8-jdk \
						software-properties-common

RUN curl -sL https://deb.nodesource.com/setup_7.x | bash -

RUN apt-get update && \
    apt-get install -y --no-install-recommends 	nodejs						

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64

RUN curl -o android-sdk.zip ${ANDROID_SDK_URL} && \
    unzip -q android-sdk.zip -d /usr/local/android-sdk && \
    rm -f android-sdk.zip

RUN echo y | /usr/local/android-sdk/tools/android update sdk --all --no-ui --filter platform-tools,${ANDROID_BUILD_TOOLS},${ANDROID_APIS},${ANDROID_EXTRA_PACKAGES}

ENV ANDROID_HOME /usr/local/android-sdk
ENV PATH ${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools
RUN mkdir -p /tns
RUN chown root:root -R ${ANDROID_HOME} /tns

RUN npm install nativescript -g --unsafe-perm

WORKDIR /tns


