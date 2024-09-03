# Departure Widget for PATH

This is a [Kotlin Multiplatform](https://www.jetbrains.com/help/kotlin-multiplatform-dev/get-started.html) project targeting Android and iOS.

## Setup

[Android Studio](https://developer.android.com/studio) Hedgehog or newer for editing the Kotlin code and running on Android. The JDK for the IDE should be Java 17.

[Xcode](https://developer.apple.com/xcode/) 15 or newer for editing the Swift code natively.

You can run the iOS app from Android Studio, as long as your target deployment and such is already set up properly. If you encounter issues, try running from Xcode.

## App store links

[Android](https://play.google.com/store/apps/details?id=com.sixbynine.transit.path)

[iOS](https://apps.apple.com/id/app/departures-widget-for-path/id6470330823?platform=iphone)

## Localizations

English and Spanish currently. If you want to contribute something else feel free. Translations are found in the following files:

- composeApp/src/commonMain/composeResources/values-{locale}/strings.xml
- iosApp/widget/Localizable.xcstrings (edit in Xcode)
- iosApp/iosApp/InfoPlist.xcstrings (edit in Xcode)

## Schedules

I am currently maintaining alerts and schedule json files to keep the app up-to-date with schedule changes and account for things like PATH not filtering out trains at 9th and 23rd overnight when the stations are closed. Feel free to use these in your own app if you'd like.

- [Alerts](https://github.com/steviek/PathWidgetXplat/blob/main/alerts.json)
- [Regular Schedule](https://github.com/steviek/PathWidgetXplat/blob/main/schedule.json)
- [Schedule override for weekend changes](https://github.com/steviek/PathWidgetXplat/blob/main/schedule_override.json)
