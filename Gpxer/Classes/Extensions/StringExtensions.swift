//
//  StringExtensions.swift
//  Gpxer
//
//  Created by Alex Liu on 2019/4/26.
//

import SwiftyXML

extension String: XmlElement {
    func xml(tag: String) -> XML {
        return XML(name: tag, value: self)
    }
}
