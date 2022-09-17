//
//  ProductDetailedView.swift
//  Uniqueens
//
//  Created by Emrah Karabulut on 30.08.2022.
//

import SwiftUI

struct ProductDetailedView: View {
    
    @State var product: Product
    @EnvironmentObject var vm: ProductViewModel
    
    var body: some View {
        
        ScrollView {
            
            VStack(alignment: .leading) {
                Image(product.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                    .frame(height: 350)
                    .shadow(color: Color.MyTheme.customGray, radius: 30, x: -7, y: -7)
                
                   
                
                Text(product.name)
                    .font(.title)
                    .fontWeight(.bold)
                
                Text(String(format:"%.2f",product.price) + "€")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.bottom, 10)
                
               
                HStack {
                    Text("Product Code:")
                        .fontWeight(.bold)
                    Text(product.productCode)
                }
                .font(.callout)
                
                HStack {
                    Text("Availability:")
                        .fontWeight(.bold)
                    Text(product.availability)
                }
                .font(.callout)
                .padding(.bottom, 10)
                
                
                HStack {
                    Text("Ex Tax:")
                        .fontWeight(.bold)
                    Text(String(format:"%.2f",product.exTaxPrice) + "€")
                }
                .font(.footnote)
                .padding(.bottom, 10)
                
                HStack {
                    Text("Description:")
                        .fontWeight(.bold)
                    Text(product.description)
                        
                }
                .font(.callout)
                
                Button {
                    if !vm.cartProducts.contains(product) {

                        DispatchQueue.main.async {
                            vm.cartProducts.append(product)
                        }
                        
                        vm.totalQuantity += 1
                        vm.cartTotalAmount += product.price
                    }
                } label: {
                    HStack{
                        Image(systemName: "cart.fill")
                            
                        Text("Add To Cart")
                            .fontWeight(.bold)
                            
                    }
                    .font(.title2)
                    .foregroundColor(Color.MyTheme.customWhite)
                    .frame(width: 200, height:50)
                    .background(Color.MyTheme.customGray)
                    .cornerRadius(12)
                    .padding(.vertical, 30)
                }

                
            }
            .foregroundColor(Color.MyTheme.customGray)
            .padding()
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Color.MyTheme.customLightPink
        )
    }
}

struct ProductDetailedView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailedView(product: Product(id: UUID().uuidString, name: "Daisy of the Fairy Earrings", price: 10.00, productCode: "YNBXVD", availability: "In Stock", exTaxPrice: "", quantity: 1, productType: .earrings, imageName: "daisy", description: "lorem ipsum loram ipsum loram isum lorem ipsum loram ipsum loram isum lorem ipsum loram ipsum loram isum lorem ipsum loram ipsum loram isum", rating: 2, isOnSale: false))
            .environmentObject(ProductViewModel())
    }
}
