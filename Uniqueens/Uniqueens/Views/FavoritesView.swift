//
//  FavoritesView.swift
//  Uniqueens
//
//  Created by Emrah Karabulut on 27.08.2022.
//

import SwiftUI

struct FavoritesView: View {
    
    @EnvironmentObject var vm: ProductViewModel
    
    var body: some View {
        
        if vm.favoriteCart.count > 0 {
        ScrollView {
            VStack{
                ForEach(vm.favoriteCart) { product in
                    FavoritesListView(product: product)
                        .environmentObject(vm)
                }
            }
            .padding()
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.MyTheme.customLightPink)
        } else {
            HStack {
                Image(systemName: "heart.fill")
                Text("You have no favorites")
                    .fontWeight(.heavy)
            }
            .foregroundColor(Color.MyTheme.customGray)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.MyTheme.customLightPink)
        }
  }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
            .environmentObject(ProductViewModel())
    }
}
