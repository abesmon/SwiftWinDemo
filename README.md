# SwiftWinDemo

## Intro
This project made to show how to start making programs with Swift on windows. 
All Examples was tested on Win10 virtual machine, so any other environments can not work. 
Feel free to create issues here, so we can know about available environments

## Let's begin

First, you need to get and prepare Swift toolchain. For now best available option is to take prebuild toolchain from @compnerd's nightly builds:
https://dev.azure.com/compnerd/windows-swift

Everything below describes steps for those, who took toolchain from @compnerd's nightlies. If you got your toolchain other way and don't know what to do next, dont hesitate to create issue in this repo, so contributors could help you to figure out

### Downloading the nightlies

At Azure's page https://dev.azure.com/compnerd/windows-swift.
Choose Pipelines > builds from the left of the dashboard.
Click the most recent successful build of Windows toolchain. (green or yellow statuses are ok)
At the top right of this page to the right of where it says All logs there is a three dot button. Under this choose Artifacts > toolchain to download the nightly toolchain to your machine.

### Installing the nightlies

1. Extract the toolchain artifact. We assume that the toolchain will be installed to `C:\Library`. Extracting it to that location should give you a hierarchy that looks like `C:\Library\Developer\Toolchains\unknown-Asserts-development.xctoolchain\usr\bin\swiftc.exe`.
2. If you interested in Windows 'native' applications, you need to do extra step. You will need an installation of the Windows SDK. The easiest way to do this is to install Visual Studio. Additionally, you will need to copy a few files into the SDK to make it usable from swift.
```
curl -L "https://raw.githubusercontent.com/apple/swift/master/stdlib/public/Platform/ucrt.modulemap" -o "%UniversalCRTSdkDir%\Include\%UCRTVersion%\ucrt\module.modulemap"
curl -L "https://raw.githubusercontent.com/apple/swift/master/stdlib/public/Platform/visualc.modulemap" -o "%VCToolsInstallDir%\include\module.modulemap"
curl -L "https://raw.githubusercontent.com/apple/swift/master/stdlib/public/Platform/visualc.apinotes" -o "%VCToolsInstallDir%\include\visualc.apinotes"
curl -L "https://raw.githubusercontent.com/apple/swift/master/stdlib/public/Platform/winsdk.modulemap" -o "%UniversalCRTSdkDir%\Include\%UCRTVersion%\um\module.modulemap"
```
Or run `InstallMaps.bat` with VS Command Prompt (extra info below)

3. You will need to add the ICU libraries for the target. The nightlies are built against ICU 63.1 from the ICU project. You can download the binaries for that from `http://download.icu-project.org/files/icu4c/63.1/icu4c-63_1-Win64-MSVC2017.zip` . In these instructions we assume you rename the extracted icu folder `icu4c-63_1-Win64-MSVC2017` to `icu63_1` and move it to `C:\Library`.

### Building and running
First, you need to add the folder containing `swiftc.exe` to the `PATH` environment variable to use the toolchain. You also need to add the folder containing the icu dlls to the `PATH` environment variable.
This can be achieved by entering the following into the command line.

```
path %PATH%;C:\Library\Developer\Toolchains\unknown-Asserts-development.xctoolchain\usr\bin
path %PATH%;C:\Library\icu63_1\bin64
```

Alternatively, to make these changes persistent go to the Windows environment variables edit dialog found in `System Properties` > `Advanced` > `Environment Variables` and edit the path variable to add the following two new items.

```
C:\Library\Developer\Toolchains\unknown-Asserts-development.xctoolchain\usr\bin
C:\Library\icu63_1\bin64
```

------

To build your first program, go to `OneFileExample` folder and run `build.bat` file. If everything ok, there would appear build folder with `.exe` file in it. This is your first program.

## What next?
- Take a look how `build.bat` works, so you can run command by yourself for your own programs
- Take a look how `.swift` works, modify them and take a look what will happen :)
- Take a look on swift forum about windows `https://forums.swift.org/tags/windows`
- Take a look on swift standart library, to know what swift can do `https://developer.apple.com/documentation/swift/swift_standard_library`


## VS Command Prompt
I found that for me easier to work with default windows CMD, also i'm not using Windows SDK in my projects, so i run into no problems.
BUT! If you want to use Windows SDK (and if you want to feel like a pro ;)) you need to run commands via VS Command Prompt. Also, some env variables, like, `%UniversalCRTSdkDir%` avaliable only there.
Seems that easiest way to find where prompt located on your machine is to do this:
`Start (Win key)` > type `Prompt` > run it :)

If there is no programs found after typing `prompt`, it seems that you has installed not everything components during VS instalation. You can reinstall it, and check if prompt there :)

## Extra!
If you run into problems or simply do not know what to do next, dont hesitate to create issue in this repo or write me a message to abesmon@gmail.com (@abesmon on telegram)
Also you can ask for help on forums.swift.org There are a lot of great people there, who can learn you many things.
