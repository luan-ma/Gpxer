//
//  GpxPoint.swift
//  Gpxer
//
//  Created by Alex Liu on 2019/4/26.
//

import CoreLocation
import SwiftyXML

public class GpxPoint: XmlElement {
    public var coordinate: CLLocationCoordinate2D
    public var elevation: Double?
    public var time: Date?
    public var name: String?
    public var comment: String?
    public var desc: String?
    public var source: String?
    public var symbol: String?
    public var type: String?

    public init(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }

    public init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
    }

    init?(xml: XML) {
        guard let latString = xml["@lat"].string, let latitude = Double(latString),
            let lonString = xml["@lon"].string, let longitude = Double(lonString) else {
            return nil
        }

        coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        name = xml["name"].string
        desc = xml["desc"].string
        comment = xml["cmt"].string
        source = xml["source"].string
        symbol = xml["symbol"].string
        if let iso8601String = xml["time"].string {
            time = Date(iso8601String: iso8601String)
        }
    }

    func xml(tag: String = "wpt") -> XML {
        let xml = XML(name: tag)
        xml.addAttribute(name: "lat", value: coordinate.latitude)
        xml.addAttribute(name: "lon", value: coordinate.longitude)

        elevation.on {
            xml.addChild($0.xml(tag: "ele"))
        }
        time.on {
            xml.addChild($0.xml(tag: "time"))
        }
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
        symbol.on {
            xml.addChild($0.xml(tag: "symbol"))
        }
        type.on {
            xml.addChild($0.xml(tag: "type"))
        }

        return xml
    }
}
