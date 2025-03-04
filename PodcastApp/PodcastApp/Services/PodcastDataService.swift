//
//  PodcastDataService.swift
//  PodcastApp
//
//  Created by Jhonata Jackson on 02/03/25.
//

import Foundation

class PodcastDataService {
    static let shared = PodcastDataService()

    func getPodcast(urlString: String) async throws -> PodcastModel? {
        guard let url = URL(string: urlString) else { return nil }

        let (data, response) = try await URLSession.shared.data(from: url)

        if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode >= 300 {
            print("PodcastDataService.getPodcast.error: \((response as? HTTPURLResponse)?.statusCode ?? 0)")
        }

        let parser = PodcastParser()

        return parser.parse(data: data)
    }
}
