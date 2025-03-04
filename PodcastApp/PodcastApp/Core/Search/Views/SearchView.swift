//
//  SearchView.swift
//  PodcastApp
//
//  Created by Jhonata Jackson on 02/03/25.
//

import SwiftUI

struct SearchView: View {
    @State private var podcastUrl: String = "https://anchor.fm/s/7a186bc/podcast/rss"

    var body: some View {
        VStack {
            HStack {
                TextField(text: $podcastUrl) {
                    Text("Informe a url do Rss")
                }
                .padding()
                .frame(height: 40)
                .textInputAutocapitalization(.never)
                .border(.secondary)

                Button(action: {
                    if let string = UIPasteboard.general.string {
                        podcastUrl = string
                    }
                }) {
                    Image(systemName: "document.on.document.fill")
                        .foregroundColor(.white)
                }
                .frame(width: 36, height: 40)
                .background(.red)
                .cornerRadius(8)
            }
            .padding(.bottom, 20)

            Button(action: {
                Task {
                    let result = try await PodcastDataService.shared.getPodcast(urlString: podcastUrl)
                    print(result ?? "")
                }
            }, label: {
                Text("Buscar")
            })
            .frame(width: 100, height: 38)
            .background(.red)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
        .padding()
    }
}

#Preview {
    SearchView()
}
