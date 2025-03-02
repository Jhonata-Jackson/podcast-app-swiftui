//
//  PodcastModel.swift
//  PodcastApp
//
//  Created by Jhonata Jackson on 01/03/25.
//

import Foundation

struct PodcastModel: Codable {
    let channel: Channel
    
    enum CodingKeys: String, CodingKey {
        case channel
    }
}

struct Channel: Codable {
    let title: String
    let description: String
    let itunesImage: ItunesImage
    let itunesCategory: ItunesCategory
    let items: [Item]
    
    enum CodingKeys: String, CodingKey {
        case title
        case description
        case itunesImage = "itunes:image"
        case itunesCategory = "itunes:category"
        case items = "item"
    }
}

struct ItunesImage: Codable {
    let href: String
    
    enum CodingKeys: String, CodingKey {
        case href = "href"
    }
}

struct ItunesCategory: Codable {
    let text: String
    
    enum CodingKeys: String, CodingKey {
        case text = "text"
    }
}

struct Item: Codable {
    let title: String
    let description: String
    let dcCreator: String
    let itunesDuration: String
    let itunesImage: ItunesImage
    
    enum CodingKeys: String, CodingKey {
        case title
        case description
        case dcCreator = "dc:creator"
        case itunesDuration = "itunes:duration"
        case itunesImage = "itunes:image"
    }
}
