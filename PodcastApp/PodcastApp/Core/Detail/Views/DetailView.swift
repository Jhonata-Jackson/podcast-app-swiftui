//
//  DetailView.swift
//  PodcastApp
//
//  Created by Jhonata Jackson on 04/03/25.
//

import SwiftUI

struct DetailView: View {
    var body: some View {
        NavigationView {
            List {
                CustomCard(
                    imageUrl: "https://d3t3ozftmdmh3i.cloudfront.net/staging/podcast_uploaded_episode/1180263/1180263-1722288240585-cdf1d6c9eae4c.jpg",
                    title: "Professora aponta 5 dicas para uma educação antirracista na escola",
                    author: "Instituto Claro",
                    description: "A professora de educação infantil da rede pública de São Paulo Josy Asca está lançando seu terceiro livro. Depois de dois títulos destinados à educação antirracista voltados ao público infantil.",
                    duration: "00:07:56"
                )
            }
        }
    }
}

#Preview {
    DetailView()
}
