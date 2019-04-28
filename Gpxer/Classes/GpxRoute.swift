//
//  GpxRoute.swift
//  Gpxer
//
//  Created by Alex Liu on 2019/4/26.
//

import SwiftyXML

public class GpxRoute: XmlElement {
    public var name: String?
    public var comment: String?
    public var desc: String?
    public var source: String?
    public var number: Int?
    public var type: String?
    public var routePoints: [GpxPoint]?

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

        if let xmlList = xml["rtept"].xmlList {
            routePoints = [GpxPoint]()
            for xml in xmlList {
                if let point = GpxPoint(xml: xml) {
                    routePoints?.append(point)
                }
            }
        }
    }

    public func add(point: GpxPoint) {
        if routePoints.isSome {
            routePoints?.append(point)
        } else {
            routePoints = [point]
        }
    }

    func xml(tag: String = "rte") -> XML {
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
        routePoints?.forEach {
            xml.addChild($0.xml(tag: "rtept"))
        }
        
        return xml
    }
}
