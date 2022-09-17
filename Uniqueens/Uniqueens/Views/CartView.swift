//
//  CartView.swift
//  Uniqueens
//
//  Created by Emrah Karabulut on 28.08.2022.
//

import SwiftUI

struct CartView: View {
    
    @EnvironmentObject var vm: ProductViewModel
    
    var body: some View {
        
        if vm.cartProducts.count > 0 {
            ScrollView {
                VStack{
                    ForEach(vm.cartProducts) { product in
                            CartListView(product: product)
                                    .environmentObject(vm)
                    }
                    
                    HStack{
                        Text("Total Amount")
                            .foregroundColor(Color.MyTheme.customGray)
                            .fontWeight(.heavy)
                        Spacer()
                        //Text(String(format:"%.2f",(product.price * Double(quantity))) + "€")
                        Text(String(format:"%.2f", vm.cartTotalAmount) + "€")
                            .foregroundColor(Color.MyTheme.customGray)
                            .fontWeight(.heavy)
                    }
                    .font(.body)
                    .padding()
                    
                }
            }
            .padding(.top, 60)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.MyTheme.customLightPink)
        } else {
            HStack {
                Image(systemName: "cart.fill")
                Text("Your cart is empty")
                    .fontWeight(.heavy)
            }
            .foregroundColor(Color.MyTheme.customGray)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.MyTheme.customLightPink)
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
            .environmentObject(ProductViewModel())
    }
}
