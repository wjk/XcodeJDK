# XcodeJDK

This repository contains an Xcode project that builds a fat binary version of OpenJDK from the official binaries.
Doing this in pure Xcode means that it will function properly when embedded into a Mac app built using Xcode.
Furthermore, the source code for the OpenJDK binaries is automatically downloaded and copied into the
Contents/Resources directory of the *.jdk bundle, to ease GPL compliance for OpenJDK in distributed applications.

All libraries and tools in this repository bear their original OpenJDK Oracle code signature. (Apparently joining files via `lipo`
preserves the original’s signing.) The bundle itself is ad-hoc signed; you should resign it when embedding it into your app.

This repository is designed to be independent of any version of OpenJDK.
To use a different version than 22.0.1 (current as of this writing), all
you need to do is change the version number and download URLs in jdk.xcconfig.
You’ll need to strip the leading `https://` off or the file will not parse
properly. It will be re-added automatically by the scripts.

The contents of this repository are licensed under the Unlicense. Do what you will. Please remember the licensing terms
of OpenJDK when embedding it in your app.
