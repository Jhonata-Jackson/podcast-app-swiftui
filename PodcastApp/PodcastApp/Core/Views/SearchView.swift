//
//  SearchView.swift
//  PodcastApp
//
//  Created by Jhonata Jackson on 02/03/25.
//

import SwiftUI

struct SearchView: View {
    var body: some View {
        VStack {
            Button(action: {
                print(">> tapped")
            }, label: {
                Text("update")
            })
            .frame(width: 100, height: 50)
            .background(.blue)
            .foregroundColor(.white)
        }
        .padding()
    }
}

#Preview {
    SearchView()
}
