//
//  GpxTrack.swift
//  Gpxer
//
//  Created by Alex Liu on 2019/4/26.
//

import SwiftyXML

public class GpxTrack: XmlElement {
    public var name: String?
    public var comment: String?
    public var desc: String?
    public var source: String?
    public var number: Int?
    public var type: String?
    public var trackSegments: [GpxTrackSegment]?

    public init() {
    }

    init(xml: XML) {
        name = xml["name"].string
        comment = xml["cmt"].string
        desc = xml["desc"].string
        source = xml["src"].string
        if let numberString = xml["number"].string {
            number = Int(numberString)
        }
        type = xml["type"].string
        
        if let xmlList = xml["trkseg"].xmlList {
            trackSegments = [GpxTrackSegment]()
            for xml in xmlList {
                trackSegments?.append(GpxTrackSegment(xml: xml))
            }
        }
    }

    public func add(segment: GpxTrackSegment) {
        if trackSegments.isSome {
            trackSegments?.append(segment)
        } else {
            trackSegments = [segment]
        }
    }

    public func lastSegment() -> GpxTrackSegment {
        if let segment = trackSegments?.last {
            return segment
        } else {
            let segment = GpxTrackSegment()
            trackSegments = [segment]
            return segment
        }
    }

    func xml(tag: String = "trk") -> XML {
        let xml = XML(name: tag)

        name.on {
            xml.addChild($0.xml(tag: "name"))
        }
        desc.on {
            xml.addChild($0.xml(tag: "desc"))
        }
        comment.on {
            xml.addChild($0.xml(tag: "cmt"))
        }
        source.on {
            xml.addChild($0.xml(tag: "src"))
        }
        number.on {
            xml.addChild($0.xml(tag: "number"))
        }
        type.on {
            xml.addChild($0.xml(tag: "type"))
        }
        trackSegments?.forEach {
            xml.addChild($0.xml())
        }

        return xml
    }
}
