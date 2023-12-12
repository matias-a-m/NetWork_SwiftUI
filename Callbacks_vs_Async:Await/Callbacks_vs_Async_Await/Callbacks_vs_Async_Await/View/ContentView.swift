//
//  ContentView.swift
//  Callbacks_vs_Async_Await
//
//  Created by matias on 11/12/2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ViewModel()
    
   
    
    var body: some View {
        VStack {
            Text("🛸")
            Text("🌎")
            VStack{
                AsyncImage(url: viewModel.characterBasicInfo.image)
                Text("name: \(viewModel.characterBasicInfo.name)")
                Text("first episode: \(viewModel.characterBasicInfo.firstEpisodeTitle)")
                Text("dimencion: \(viewModel.characterBasicInfo.dimension)")
            }
            .padding(.top, 32)
        }
        .onAppear{
            Task{
                await viewModel.executeRequest()
            }
            
        }
    }
}

#Preview {
    ContentView()
}
