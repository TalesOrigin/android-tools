# Android build tools

This repository is a helper workspace for Android NDK and CMake builds.

## Install tools from Google

Google's direct download URLs tested for this repository currently return
HTTP 404. Install the desired NDK and CMake packages using Android SDK
Command-line Tools instead; this also avoids committing redistributable
toolchain binaries to a public repository.

```sh
sdkmanager --install "ndk;<version>" "cmake;<version>"
```

For an Android CMake project, configure with the NDK toolchain file:

```sh
cmake -S . -B build \
  -DCMAKE_TOOLCHAIN_FILE="$ANDROID_NDK_HOME/build/cmake/android.toolchain.cmake" \
  -DANDROID_ABI=arm64-v8a \
  -DANDROID_PLATFORM=android-<api>
```

Check the applicable Google SDK/NDK license before redistributing downloaded
packages. This repository intentionally does not include the toolchain.
