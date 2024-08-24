# Group Order Food Example

## Overview

Group Order Food Example is a fun iOS project that demonstrates the user experience of group ordering functionality in a food app. The inspiration to create this project is taken from Swiggy app!

This project showcases the use of `UIActivityViewController` for sharing, custom URL schemes for deep linking, and iOS 17's new NameDrop like animation for sharing data.

## Features

- Create and share group food orders
- Custom URL scheme handling for deep linking
- Animated emoji display in the order acceptance view
- Support for iOS 17's NameDrop like animation for sharing data
- Clean and intuitive user interface

## Requirements

- iOS 17.0+
- Xcode 15.0+
- Swift 5.0+

## Installation

1. Clone the repository:
```
git clone https://github.com/SagarSDagdu/ios-group-order-ux.git
```
2. Open `GroupOrderFoodExample.xcodeproj` in Xcode.
3. Build and run the project on two of your iOS devices that support AirDrop tap to share.

## Usage

1. Launch the app and enter a username and restaurant name.
2. Tap the "Share Group Order" button to create and share a group order link.
3. On iOS 17 and above, you can use the tap-to-share feature to share the link with nearby devices.
4. When the recipient taps the shared link, the app will open (if installed) and display the order details.

## Project Structure

- `ViewController.swift`: Main view controller for creating and sharing group orders.
- `GroupOrderAcceptViewController.swift`: View controller for accepting group order invitations.
- `LinkProvider.swift`: Helper class for providing metadata for shared links.
- `SceneDelegate.swift`: Handles app lifecycle and deep link processing.