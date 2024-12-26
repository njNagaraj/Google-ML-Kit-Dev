FROM gitpod/workspace-full

# Install Java
RUN sudo apt-get update && sudo apt-get install -y openjdk-11-jdk

# Install Android SDK and tools
RUN wget https://dl.google.com/android/repository/commandlinetools-linux-8512546_latest.zip -O /tmp/android-tools.zip
RUN unzip /tmp/android-tools.zip -d /opt/android-sdk
RUN rm /tmp/android-tools.zip

# Set environment variables for Android SDK
ENV ANDROID_HOME /opt/android-sdk
ENV PATH $PATH:/opt/android-sdk/cmdline-tools/latest/bin:/opt/android-sdk/platform-tools

# Install Android SDK packages
RUN yes | sdkmanager --licenses
RUN sdkmanager "platforms;android-30" "build-tools;30.0.3" "tools" "platform-tools"
