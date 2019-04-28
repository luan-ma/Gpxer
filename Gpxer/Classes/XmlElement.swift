//
//  XmlElement.swift
//  Gpxer
//
//  Created by Alex Liu on 2019/4/26.
//

import SwiftyXML

protocol XmlElement {
    func xml(tag: String) -> XML
}
