//
//  SerachView.swift
//  Uniqueens
//
//  Created by Emrah Karabulut on 4.09.2022.
//

import SwiftUI

struct SearchView: View {
    
    var animation: Namespace.ID
    @EnvironmentObject var vm: ProductViewModel
    @FocusState var startTF: Bool
    
    let columns = [
        GridItem(.adaptive(minimum: 180))
        
    ]
    
    var body: some View {
        
        VStack(spacing: 5){
            
            HStack(spacing: 20) {
                
                Button {
                    vm.searchIsActivated = false
                } label: {
                    Image(systemName: "arrow.left")
                        .font(.title2)
                        .foregroundColor(Color.MyTheme.customGray)
                }
                
                SearchBarView(text: $vm.searchText)
                    .focused($startTF)
                
            }
            .padding(.horizontal)
            .padding(.top)
            
            NavigationView {
                ScrollView {
                        
                            LazyVGrid(columns: columns, spacing: 10){
                                ForEach(vm.searchResults) { product in
                                  
                                    NavigationLink {
                                        ProductDetailedView(product: product)
                                    } label: {
                                        ProductView(product: product)
                                    }
                                
                                }
                            }
                            .padding(.horizontal, 10)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(
        
            Color.MyTheme.customLightPink.ignoresSafeArea()
        )
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                startTF = true
            }
        }
    }
}

struct SerachView_Previews: PreviewProvider {
    
    static var previews: some View {
        MainView()
            .environmentObject(ProductViewModel())
    }
}
