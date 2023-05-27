clear_and_print()
{
  clear
  echo $1
}

clear_and_print "install android"

# java and gradle
sudo apt install openjdk-11-jdk openjdk-11-jre unzip -y
update-java-alternatives --set java-1.11.0-openjdk-amd64
java -version
sudo apt-get install gradle -y

cd ~ && wget https://dl.google.com/android/repository/commandlinetools-linux-9477386_latest.zip
ANDROID_HOME=/home/$USER/android-sdk
mkdir -p $ANDROID_HOME
unzip commandlinetools-linux-9477386_latest.zip -d $ANDROID_HOME

# ANDROID_HOME
echo "export ANDROID_HOME=$ANDROID_HOME" >> ~/.zshrc
echo 'export PATH=$ANDROID_HOME/emulator:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$PATH' >> ~/.bashrc

source ~/.bashrc

# Install Android Image version 29
yes | sdkmanager --list
yes | sdkmanager "platforms;android-29"
yes | sdkmanager "build-tools;29.0.3"
yes | sdkmanager --list
yes | sdkmanager --update
yes | sdkmanager "system-images;android-30;google_apis_playstore;x86_64"
yes | sdkmanager --channel=3 emulator
emulator -version

sudo apt install qemu-kvm
sudo adduser $USER kvm
sudo chown $USER /dev/kvm


echo "INSTALL ANDROID SDK DONE!"

avdmanager create avd -n phone -k "system-images;android-29;google_apis_playstore;x86_64" -d pixel
avdmanager create avd -n tablet -d 34 -k "system-images;android-29;google_apis_playstore;x86_64"

echo 'alias tablet="emulator -avd tablet"' > ~/.aliases
echo "source ~/.aliases" >> ~/.zshrc
source ~/.zshrc
