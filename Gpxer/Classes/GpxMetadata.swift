//
//  GpxMetadata.swift
//  Gpxer
//
//  Created by Alex Liu on 2019/4/26.
//

import SwiftyXML

public class GpxMetadata: XmlElement {
    public var name: String?
    public var desc: String?
    public var author: String?
    public var copyright: String?
    public var time: Date?
    public var keywords: String?

    public init() {
    }

    init(xml: XML) {
        name = xml["name"].string
        desc = xml["desc"].string
        author = xml["author"].string
        copyright = xml["copyright"].string
        keywords = xml["keywords"].string
        if let iso8601String = xml["time"].string {
            time = Date(iso8601String: iso8601String)
        }
    }

    func xml(tag: String = "metadata") -> XML {
        let xml = XML(name: tag)
        
        name.on {
            xml.addChild($0.xml(tag: "name"))
        }
        desc.on {
            xml.addChild($0.xml(tag: "desc"))
        }
        author.on {
            xml.addChild($0.xml(tag: "author"))
        }
        copyright.on {
            xml.addChild($0.xml(tag: "copyright"))
        }
        time.on {
            xml.addChild($0.xml(tag: "time"))
        }
        keywords.on {
            xml.addChild($0.xml(tag: "keywords"))
        }
        
        return xml
    }
}
