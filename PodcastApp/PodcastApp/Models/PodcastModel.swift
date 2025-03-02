//
//  PodcastModel.swift
//  PodcastApp
//
//  Created by Jhonata Jackson on 01/03/25.
//

import Foundation

struct PodcastModel {
    var title: String = ""
    var description: String = ""
    var imageUrl: String = ""
    var category: String = ""
    var items: [PodcastItem] = []
}

struct PodcastItem {
    var title: String = ""
    var description: String = ""
    var creator: String = ""
    var duration: String = ""
    var imageUrl: String = ""
}
