# Android build tools

This repository is a helper workspace for Android NDK and CMake builds.

## Toolchain packages

This repository provides Android NDK `30.0.16248370` and Android SDK CMake
`3.31.6`. The packages are stored as 40 MiB chunks under `packages/` to fit
GitHub's per-file limit. Download/clone the repository, then join each
package's numbered `.partNNNN` files in order before extracting its archive.
For example:

```sh
cat packages/android-ndk-r30-linux.zip.parts/android-ndk-r30-linux.zip.part* \
  > android-ndk-r30-linux.zip
unzip android-ndk-r30-linux.zip
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
