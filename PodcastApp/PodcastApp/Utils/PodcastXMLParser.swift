//
//  PodcastXMLParser.swift
//  PodcastApp
//
//  Created by Jhonata Jackson on 02/03/25.
//

import Foundation

class PodcastParser: NSObject, XMLParserDelegate {
    private var currentElement = ""
    private var currentText = ""

    private var podcast = PodcastModel()
    private var currentItem: PodcastItem?
    
    func parse(data: Data) -> PodcastModel? {
        let parser = XMLParser(data: data)
        parser.delegate = self
        return parser.parse() ? podcast : nil
    }

    func parser(_ parser: XMLParser, didStartElement elementName: String,
                namespaceURI: String?, qualifiedName qName: String?,
                attributes attributeDict: [String : String] = [:]) {
        currentElement = elementName
        currentText = ""
        
        if elementName == "item" {
            currentItem = PodcastItem()
        }
        
        if elementName == "itunes:image", let url = attributeDict["href"] {
            if currentItem != nil {
                currentItem?.imageUrl = url
            } else {
                podcast.imageUrl = url
            }
        }
        
        if elementName == "itunes:category", let category = attributeDict["text"] {
            podcast.category = category
        }
    }

    func parser(_ parser: XMLParser, foundCharacters string: String) {
        currentText += string.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    func parser(_ parser: XMLParser, didEndElement elementName: String,
                namespaceURI: String?, qualifiedName qName: String?) {
        
        switch elementName {
        case "title":
            if currentItem != nil {
                currentItem?.title = currentText
            } else {
                podcast.title = currentText
            }
        case "description":
            if currentItem != nil {
                currentItem?.description = currentText
            } else {
                podcast.description = currentText
            }
        case "dc:creator":
            currentItem?.creator = currentText
        case "itunes:duration":
            currentItem?.duration = currentText
        case "item":
            if let item = currentItem {
                podcast.items.append(item)
            }
            currentItem = nil
        default:
            break
        }
    }
}
