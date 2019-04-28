# Gpxer

[![CI Status](https://img.shields.io/travis/Alex Liu/Gpxer.svg?style=flat)](https://travis-ci.org/Alex Liu/Gpxer)
[![Version](https://img.shields.io/cocoapods/v/Gpxer.svg?style=flat)](https://cocoapods.org/pods/Gpxer)
[![License](https://img.shields.io/cocoapods/l/Gpxer.svg?style=flat)](https://cocoapods.org/pods/Gpxer)
[![Platform](https://img.shields.io/cocoapods/p/Gpxer.svg?style=flat)](https://cocoapods.org/pods/Gpxer)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Usage

```swift
let segment = GpxTrackSegment()
segment.add(point: GpxPoint(latitude: 0, longitude: 0))
segment.add(point: GpxPoint(latitude: 1, longitude: 1))
...

let track = GpxTrack()
track.name = "track name"
track.add(segment: segment)

let metadata = GpxMetadata()
metadata.author = "luan-ma"
metadata.name = "K2 hiking"

let gpx = Gpx(creator: "Gpxer")
gpx.metadata = metadata
gpx.add(track: track)

let xml = gpx.toXMLString()
if let data = xml.data(using: .utf8) {
    let fileUrl = FileManager.default.temporaryDirectory.appendingPathComponent(metadata.name).appendingPathExtension("gpx")
    try data.write(to: fileUrl)
    return fileUrl
}
```

## Requirements

## Installation

Gpxer is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'Gpxer'
```

## Author

Alex Liu, gang.liu@daimler.com

## License

Gpxer is available under the MIT license. See the LICENSE file for more info.
