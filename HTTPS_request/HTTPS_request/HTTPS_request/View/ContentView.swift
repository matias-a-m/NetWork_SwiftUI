//
//  ContentView.swift
//  HTTPS_request
//
//  Created by matias on 10/12/2023.
//
import SwiftUI

struct ContentView: View{
    
    @StateObject var viewModel: ViewModel = ViewModel()
    let manager = Manager()
    
    var body: some View {
        NavigationView{
            Form {
                if viewModel.isLoading {
                    manager.customProgressView()
                } else {
                    ForEach(viewModel.pokemons, id: \.name) { pokemon in
                        Text(pokemon.name)
                            .font(.title3)
                    }
                }
            }
            .navigationTitle("Pokemons list")
            .font(.largeTitle)
            
        }.onAppear{
            viewModel.getPokemons()
        }
    }
}

struct ContentView_Previews: PreviewProvider{
    static var previews: some View{
        ContentView()
    }
}


 
#Preview {
    ContentView()
}
