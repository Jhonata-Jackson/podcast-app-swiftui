//
//  CustomCard.swift
//  PodcastApp
//
//  Created by Jhonata Jackson on 04/03/25.
//

import SDWebImageSwiftUI
import SwiftUI

struct CustomCard: View {
    let imageUrl: String
    let title: String
    let author: String
    let description: String
    var duration: String

    @State private var imageLoadingError = false

    var body: some View {
        VStack {
            HStack(spacing: 10) {
                podcastImage
                podcastInformations
            }
            .padding(.bottom, 10)
            HStack {
                Text(self.description)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 230)
        .padding(.horizontal, 20)
        .onAppear {
        }
    }
}

struct CustomCard_Previews: PreviewProvider {
    static var previews: some View {
        CustomCard(
            imageUrl: "https://d3t3ozftmdmh3i.cloudfront.net/staging/podcast_uploaded_episode/1180263/1180263-1722288240585-cdf1d6c9eae4c.jpg",
            title: "Professora aponta 5 dicas para uma educação antirracista na escola",
            author: "Instituto Claro",
            description: "A professora de educação infantil da rede pública de São Paulo Josy Asca está lançando seu terceiro livro. Depois de dois títulos destinados à educação antirracista voltados ao público infantil.",
            duration: "00:07:56"
        )
        .previewLayout(.sizeThatFits)
    }
}

extension CustomCard {
    
    private var podcastImage: some View {
        VStack {
            if let url = URL(string: self.imageUrl), !imageLoadingError {
                WebImage(url: url)
                    .onSuccess { _, _, _ in
                        self.imageLoadingError = false
                    }
                    .onFailure { _ in
                        self.imageLoadingError = true
                    }
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .transition(.fade(duration: 0.3))
            } else {
                Image(systemName: "questionmark.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .transition(.fade(duration: 0.3))
            }
        }
    }
    
    private var podcastInformations: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(self.title)
                .font(.headline)
                .lineLimit(2)
                .fixedSize(horizontal: false, vertical: true)
                .multilineTextAlignment(.leading)
            Text(self.author)
                .font(.subheadline)
            Text(self.duration)
                .font(.headline)
        }
    }
}
