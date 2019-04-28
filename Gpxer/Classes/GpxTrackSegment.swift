//
//  GpxTrackSegment.swift
//  Gpxer
//
//  Created by Alex Liu on 2019/4/26.
//

import SwiftyXML

public class GpxTrackSegment: XmlElement {
    public var trackPoints: [GpxPoint]?

    public init() {
    }

    init(xml: XML) {
        if let xmlList = xml["trkpt"].xmlList {
            trackPoints = [GpxPoint]()
            for xml in xmlList {
                if let point = GpxPoint(xml: xml) {
                    trackPoints?.append(point)
                }
            }
        }
    }

    public func add(point: GpxPoint) {
        if trackPoints.isSome {
            trackPoints?.append(point)
        } else {
            trackPoints = [point]
        }
    }

    func xml(tag: String = "trkseg") -> XML {
        let xml = XML(name: tag)
        trackPoints?.forEach {
            xml.addChild($0.xml(tag: "trkpt"))
        }
        return xml
    }
}
