# Android build tools

This repository is a helper workspace for Android NDK and CMake builds.

## Toolchain packages

This repository provides Android NDK `30.0.16248370`, Android SDK CMake
`3.31.6`, Gradle `9.3.0`, and Eclipse Temurin JDK `25.0.5+8` (Linux x64).
The packages are stored as 40 MiB chunks under `packages/` to fit GitHub's
per-file limit. Clone the repo and join the relevant numbered chunks in order.
For the NDK and CMake `.tar.zst` packages:

```sh
cat packages/android-ndk-r30-linux.tar.zst.parts/android-ndk-r30-linux.tar.zst.part* \
  > android-ndk-r30-linux.tar.zst
mkdir android-ndk-r30
tar --use-compress-program=unzstd -xf android-ndk-r30-linux.tar.zst \
  -C android-ndk-r30
```

Use the same steps with `android-cmake-3.31.6-linux.tar.zst` for CMake. Gradle
is provided as its original ZIP, and the JDK as its original gzip-compressed
tar archive. For example, reassemble and verify Gradle with:

```sh
cat packages/gradle-9.3.0-bin.zip.parts/gradle-9.3.0-bin.zip.part* \
  > packages/gradle-9.3.0-bin.zip
(cd packages && sha256sum -c SHA256SUMS)
unzip packages/gradle-9.3.0-bin.zip
```

Reassemble the JDK similarly from
`packages/temurin-25.0.5+8-linux-x64.tar.gz.parts/`, then extract with
`tar -xzf`.

For an Android CMake project, configure with the NDK toolchain file:

```sh
cmake -S . -B build \
  -DCMAKE_TOOLCHAIN_FILE="$ANDROID_NDK_HOME/build/cmake/android.toolchain.cmake" \
  -DANDROID_ABI=arm64-v8a \
  -DANDROID_PLATFORM=android-<api>
```

Check the applicable licenses for the included toolchains before redistribution.
