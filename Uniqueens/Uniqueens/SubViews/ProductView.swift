//
//  ProductView.swift
//  Uniqueens
//
//  Created by Emrah Karabulut on 25.08.2022.
//

import SwiftUI

struct ProductView: View {
    
    @EnvironmentObject var vm: ProductViewModel
    var product: Product
   
   
    
    var body: some View {
        
        ZStack(alignment: .topLeading) {
            
            VStack {
               
                Image(product.imageName)
                    .resizable()
                    .scaledToFill()
                    //.frame(width: 180, height: 240)
                
             Spacer()

                VStack(alignment: .leading, spacing: 5){
                    
                    HStack {
                        ForEach(1...5, id: \.self) { i in
                            if i <= product.rating{
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                            } else {
                                Image(systemName: "star")
                                    .foregroundColor(Color.MyTheme.customGray)
                            }
                        }
                        .font(.footnote)
                    }
                    
                    
                    Text(product.name)
                        .font(.footnote)
                        .bold()
                        .foregroundColor(Color.MyTheme.customGray)
                    Text(String(format:"%.2f",product.price) + "€")
                        .font(.body)
                        .foregroundColor(Color.MyTheme.customGray)
                        .bold()
                }
                .padding(.bottom, 20)
               
               
            }
            .frame(width: 180, height: 320)
            .background(Color.MyTheme.customWhite)
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.MyTheme.customGray, lineWidth: 0.3)
            )
            
            
            VStack(spacing: 2){
            
                Button {
                    
                    if !vm.cartProducts.contains(product) {
                        vm.addToCart(product: product)
                    }
                    
                } label: {
                    
                    VStack {
                        Image(systemName: "cart")
                            .padding()
                            .frame(width: 35, height: 35)
                            .foregroundColor(Color.MyTheme.customGray)
                            .background(Color.MyTheme.customPink)
                            .cornerRadius(25)
                    }
                }
    
                Button {
                    if !vm.favoriteCart.contains(product){
                        vm.addToFavorites(product: product)
                    }
                } label: {
    
                    VStack {
                        
                    Image(systemName: "heart")
                        .padding()
                        .frame(width: 35, height: 35)
                        .foregroundColor(Color.MyTheme.customGray)
                        .background(Color.MyTheme.customPink)
                        .cornerRadius(25)
                
                    }
                }
                
                if product.isOnSale{
                    Text("SALE")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(Color.MyTheme.customWhite)
                        .frame(width: 40, height: 25)
                        .background(Color.red)
                }
            }
            .padding(3)
        }
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView(product: Product(id: UUID().uuidString, name: "Daisy of the Fairy Earrings", price: 10.00, productCode: "", availability: "", exTaxPrice: "", quantity: 1, productType: .earrings, imageName: "daisy", description: "", rating: 2, isOnSale: false))
                .environmentObject(ProductViewModel())
    }
}
