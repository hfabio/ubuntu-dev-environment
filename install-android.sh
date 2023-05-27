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
echo "export ANDROID_HOME=/home/$USER/android-sdk" >> ~/.bashrc
echo 'export SDK=$ANDROID_HOME' >> ~/.bashrc
echo 'export PATH=$SDK/emulator:$SDK/tools:$SDK/tools/bin:$SDK/platform-tools:$PATH' >> ~/.bashrc
echo "export ANDROID_SDK_ROOT=$ANDROID_HOME" >> ~/.bashrc

source ~/.bashrc

# Install Android Image version 29
yes | sdkmanager --sdk_root=${ANDROID_HOME} "tools"
yes | sdkmanager "platform-tools" "platforms;android-29" "emulator"
yes | sdkmanager "system-images;android-29;google_apis;x86_64"
emulator -version

sudo apt install qemu-kvm
sudo adduser $USER kvm
sudo chown $USER /dev/kvm


echo "INSTALL ANDROID SDK DONE!"

avdmanager create avd -n phone -k "system-images;android-29;google_apis_playstore;x86_64" -d pixel
avdmanager create avd -n tablet -d 34 -k "system-images;android-29;google_apis_playstore;x86_64"
