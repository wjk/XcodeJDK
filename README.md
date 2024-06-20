# XcodeJDK

This repository contains an Xcode project that builds a fat binary version of OpenJDK from the official binaries.
Doing this in pure Xcode means that it will function properly when embedded into a Mac app built using Xcode.
Furthermore, since no OpenJDK source files are used, users of this repository do not have to distribute any GPL
source tarballs.

All libraries and tools in this repository bear their original OpenJDK Oracle code signature. (Apparently joining files via `lipo`
preserves the original’s signing.) The bundle itself is ad-hoc signed; you should resign it when embedding it into your app.

The contents of this repository are licensed under the Unlicense. Do what you will. Please remember the licensing terms
of OpenJDK when embedding it in your app.
