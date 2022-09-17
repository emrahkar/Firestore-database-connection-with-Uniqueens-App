//
//  CartListView.swift
//  Uniqueens
//
//  Created by Emrah Karabulut on 28.08.2022.
//

import SwiftUI

struct CartListView: View {
    
    @State var product: Product
    @State var quantity: Int = 1
    @EnvironmentObject var vm: ProductViewModel
   
    var body: some View {
        
        HStack(spacing: 30) {
            Image(product.imageName)
                .resizable()
                .scaledToFit()
            Text(product.name)
                .font(.footnote)
            HStack{
                Button {
                    if quantity > 0 {
                        quantity -= 1
                        vm.totalQuantity -= 1
                    }
                    
                    if vm.cartTotalAmount >= product.price {
                        vm.cartTotalAmount -= product.price
                    }
                    
                } label: {
                    Image(systemName: "minus")
                }
                
                Text("\(quantity)")
                Button {
                    quantity += 1
                    vm.totalQuantity += 1
                    vm.cartTotalAmount += product.price
                } label: {
                  Image(systemName: "plus")
                      
                    
                
                }
               

            }
            .font(.caption)
            .frame(width: 57)
            Text(String(format:"%.2f",(product.price)) + "€")
                .font(.caption)
            Button {
                vm.removeFromCart(productToDelete: product)
                vm.totalQuantity -= quantity
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

struct CartListView_Previews: PreviewProvider {
    static var previews: some View {
        CartListView(product: Product(id: UUID().uuidString, name: "Daisy of the Fairy Earrings", price: 10.00, productCode: "", availability: "", exTaxPrice: "", quantity: 1, productType: .earrings, imageName: "daisy", description: "", rating: 2, isOnSale: false))
            .environmentObject(ProductViewModel())
    }
}
