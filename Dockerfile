FROM gradle:6.1.1-jdk8

USER root
# Install Build Essentials
RUN apt-get update \
    && apt-get install build-essential file apt-utils -y

ENV SDK_URL="https://dl.google.com/android/repository/sdk-tools-linux-3859397.zip" \
    ANDROID_SDK_ROOT="/usr/local/android-sdk" \
    ANDROID_VERSION=29 \
    ANDROID_BUILD_TOOLS_VERSION=29.0.3 \
    ANDROID_HOME="/usr/local/android-sdk"

# Download Android SDK
RUN mkdir -p ~/.android \
    && touch ~/.android/repositories.cfg \
    && mkdir "$ANDROID_SDK_ROOT" .android \
    && cd "$ANDROID_SDK_ROOT" \
    && curl -o sdk.zip $SDK_URL \
    && unzip sdk.zip \
    && rm sdk.zip \
    && mkdir "$ANDROID_SDK_ROOT/licenses" || true \
    && echo "24333f8a63b6825ea9c5514f83c2829b004d1fee" > "$ANDROID_SDK_ROOT/licenses/android-sdk-license"

# Install Android Build Tool and Libraries
RUN $ANDROID_SDK_ROOT/tools/bin/sdkmanager --update \
    && $ANDROID_SDK_ROOT/tools/bin/sdkmanager "build-tools;${ANDROID_BUILD_TOOLS_VERSION}" \
    "platforms;android-${ANDROID_VERSION}" \
    "platform-tools"
