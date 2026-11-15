# Android build tools

This repository is a helper workspace for Android NDK and CMake builds.

## Toolchain packages

This repository provides Android NDK `30.0.16248370` and Android SDK CMake
`3.31.6`. The packages are stored as 40 MiB chunks under `packages/` to fit
GitHub's per-file limit. Clone the repo, join the relevant numbered chunks in
order, then extract the `.tar.zst` archive:

```sh
cat packages/android-ndk-r30-linux.tar.zst.parts/android-ndk-r30-linux.tar.zst.part* \
  > android-ndk-r30-linux.tar.zst
mkdir android-ndk-r30
tar --use-compress-program=unzstd -xf android-ndk-r30-linux.tar.zst \
  -C android-ndk-r30
```

Use the same steps with `android-cmake-3.31.6-linux.tar.zst` for CMake.

For an Android CMake project, configure with the NDK toolchain file:

```sh
cmake -S . -B build \
  -DCMAKE_TOOLCHAIN_FILE="$ANDROID_NDK_HOME/build/cmake/android.toolchain.cmake" \
  -DANDROID_ABI=arm64-v8a \
  -DANDROID_PLATFORM=android-<api>
```

Check the applicable Google SDK/NDK license before redistributing downloaded
packages. This repository intentionally does not include the toolchain.
