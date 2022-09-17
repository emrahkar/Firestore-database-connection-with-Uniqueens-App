//
//  FavoritesListView.swift
//  Uniqueens
//
//  Created by Emrah Karabulut on 27.08.2022.
//

import SwiftUI

struct FavoritesListView: View {
    
    @State var product: Product
    @EnvironmentObject var vm: ProductViewModel
    
    var body: some View {
        
                HStack(spacing: 10) {
                    Image(product.imageName)
                        .resizable()
                        .scaledToFit()
                    Text(product.name)
                        .font(.footnote)
                    Spacer()
                    Text(String(format:"%.2f",product.price) + "€")
                        .font(.caption)
                    
                    Spacer()
                    Spacer()
                    Button {
                        vm.removeFromFavorites(product: product)
                    } label: {
                        Image(systemName: "trash.slash")
                            .font(.caption)
                            .foregroundColor(.red)
                            
                    }
                }
                .padding()
                .frame(width: 380, height: 75)
                .foregroundColor(Color.MyTheme.customGray)
                .background(Color.MyTheme.customWhite)
                .cornerRadius(12)
                .navigationBarTitle("Favorites")
                .navigationBarTitleDisplayMode(.inline)
                
        }
    }

struct FavoritesListView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesListView(product: Product(id: UUID().uuidString, name: "Daisy of the Fairy Earrings", price: 10.00, productCode: "", availability: "", exTaxPrice: "", quantity: 1, productType: .earrings, imageName: "daisy", description: "", rating: 2, isOnSale: false))
            .environmentObject(ProductViewModel())
           
    }
}
