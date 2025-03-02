//
//  SearchView.swift
//  PodcastApp
//
//  Created by Jhonata Jackson on 02/03/25.
//

import SwiftUI

struct SearchView: View {
    @State private var podcastUrl: String = ""

    var body: some View {
        VStack {
            TextField(text: $podcastUrl) {
                Text("Informe a url do Rss")
            }
            .padding()
            .frame(width: .infinity, height: 40)
            .textInputAutocapitalization(.never)
            .border(.secondary)
            .padding(.bottom, 20)

            Button(action: {
                Task {
                    let result = try await PodcastDataService.shared.getPodcast()
                    print(result)
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
