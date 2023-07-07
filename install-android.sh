clear_and_print()
{
  clear
  echo $1
}

clear_and_print "install android"

# java and gradle
sudo apt install openjdk-11-jdk openjdk-11-jre unzip -y
sudo update-java-alternatives --set java-1.11.0-openjdk-amd64
java -version
#sudo apt-get install gradle -y
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
yes | sdk install gradle 8.2

cd ~ && wget https://dl.google.com/android/repository/commandlinetools-linux-9477386_latest.zip
ANDROID_HOME=/home/$USER/android-sdk
mkdir -p $ANDROID_HOME/cmdline-tools
unzip commandlinetools-linux-9477386_latest.zip -d $ANDROID_HOME/cmdline-tools/

# ANDROID_HOME
echo "export ANDROID_HOME=$ANDROID_HOME" >> ~/.zshrc
echo "export ANDROID_SDK_ROOT=$ANDROID_HOME" >> ~/.zshrc
echo 'export PATH=$ANDROID_HOME/emulator:$ANDROID_HOME/platform-tools:$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/cmdline-tools/tools/bin:$PATH' >> ~/.bashrc

source ~/.bashrc

# Install Android Image version 33
yes | sdkmanager --list
yes | sdkmanager "platforms;android-33"
sdkmanager "build-tools;32.0.2"
yes | sdkmanager --list
yes | sdkmanager --update
yes | sdkmanager "system-images;android-33;google_apis_playstore;x86_64"
yes | sdkmanager --channel=3 emulator
emulator -version

sudo apt install qemu-kvm
sudo adduser $USER kvm
sudo chown $USER /dev/kvm


echo "INSTALL ANDROID SDK DONE!"

avdmanager create avd -n phone -k "system-images;android-33;google_apis_playstore;x86_64" -d pixel
avdmanager create avd -n tablet -d 34 -k "system-images;android-33;google_apis_playstore;x86_64"

echo 'alias tablet="emulator -avd tablet"' > ~/.aliases
echo "source ~/.aliases" >> ~/.zshrc
source ~/.zshrc
