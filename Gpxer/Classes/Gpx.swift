//
//  Gpx.swift
//  Gpxer
//
//  Created by Alex Liu on 2019/4/26.
//

import SwiftyXML

public class Gpx: XmlElement {
    public var version = "1.1"
    public var creator = "Gpxer"
    public var metadata: GpxMetadata?
    public var waypoints: [GpxPoint]?
    public var routes: [GpxRoute]?
    public var tracks: [GpxTrack]?

    public init(creator: String = "Gpxer") {
        self.creator = creator
    }

    public init?(xmlData data: Data) {
        guard let xml = XML(data: data) else {
            return nil
        }

        version = xml["@version"].stringValue
        creator = xml["@creator"].stringValue

        if let xml = xml["metadata"].xml {
            metadata = GpxMetadata(xml: xml)
        }

        if let xmlList = xml["wpt"].xmlList {
            waypoints = [GpxPoint]()
            for xml in xmlList {
                if let point = GpxPoint(xml: xml) {
                    waypoints?.append(point)
                }
            }
        }

        if let xmlList = xml["rte"].xmlList {
            routes = [GpxRoute]()
            for xml in xmlList {
                routes?.append(GpxRoute(xml: xml))
            }
        }

        if let xmlList = xml["trk"].xmlList {
            tracks = [GpxTrack]()
            for xml in xmlList {
                tracks?.append(GpxTrack(xml: xml))
            }
        }
    }

    public func add(waypoint: GpxPoint) {
        if waypoints.isSome {
            waypoints?.append(waypoint)
        } else {
            waypoints = [waypoint]
        }
    }

    public func add(route: GpxRoute) {
        if routes.isSome {
            routes?.append(route)
        } else {
            routes = [route]
        }
    }

    public func add(track: GpxTrack) {
        if tracks.isSome {
            tracks?.append(track)
        } else {
            tracks = [track]
        }
    }

    public func toXMLString() -> String {
        return xml().toXMLString()
    }

    func xml(tag: String = "gpx") -> XML {
        let xml = XML(name: tag)
        xml.addAttribute(name: "xmlns", value: "http://www.topografix.com/GPX/1/1")
        xml.addAttribute(name: "xmlns:xsi", value: "http://www.w3.org/2001/XMLSchema-instance")
        xml.addAttribute(name: "xsi:schemaLocation", value: "http://www.topografix.com/GPX/1/1 http://www.topografix.com/GPX/1/1/gpx.xsd")
        xml.addAttribute(name: "version", value: version)
        xml.addAttribute(name: "creator", value: creator)

        metadata.on {
            xml.addChild($0.xml())
        }
        waypoints?.forEach {
            xml.addChild($0.xml())
        }
        routes?.forEach {
            xml.addChild($0.xml())
        }
        tracks?.forEach {
            xml.addChild($0.xml())
        }

        return xml
    }
}
