//
//  ContentView.swift
//  URLSession
//
//  Created by matias on 07/12/2023.
//

import SwiftUI

struct ContentView: View {
    
    var viewModel: ViewModel = ViewModel()
    
    var body: some View {
        VStack {
            Text("URL Session")
                .bold()
                .padding()
            Button("Petición HTTP"){
                // TO DO
                viewModel.executeAPI()
            }
            
               
        }
       
    }
}

#Preview {
    ContentView()
}
