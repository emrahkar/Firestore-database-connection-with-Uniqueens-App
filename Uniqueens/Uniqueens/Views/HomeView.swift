//
//  HomeView.swift
//  Uniqueens
//
//  Created by Emrah Karabulut on 25.08.2022.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var vm: ProductViewModel
    @EnvironmentObject var vmLogIn: LoginViewModel
    
   
    let columns = [
        GridItem(.adaptive(minimum: 180))
        
    ]
    
    var body: some View {
        
        VStack {
            HStack(spacing: 12) {
                        ForEach(ProductType.allCases, id: \.self) {type in
                            
                            Button {
                                vm.productType = type
                            } label: {
                                Text(type.rawValue)
                                    .font(.caption)
                                    .fontWeight(.bold)
                                    .foregroundColor(vm.productType == type ? Color.MyTheme.customPink : Color.MyTheme.customWhite)
                                    .background(
                                        Capsule()
                                            .fill(Color.MyTheme.customWhite)
                                            .opacity(0.2)
                                            .blur(radius: 3)
                                            .padding(-5)
                                            .opacity(vm.productType == type ? 1.0 : 0.0)
                                    )
                            }
                        }
                    }
                    .frame(width: 400, height: 50)
                    .background(Color.MyTheme.customGray)
            
            if vmLogIn.loggedIn {
                HStack {
                    Spacer()
                    Button {
                        vmLogIn.logOut()
                    } label: {
                        Text("Log Out")
                            .font(.caption)
                            .fontWeight(.heavy)
                            .frame(width: 100, height: 30)
                            .foregroundColor(Color.MyTheme.customWhite)
                            .background(Color.MyTheme.customGray)
                            .cornerRadius(12)
                    }
                    
                }
                .padding(.horizontal, 10)
                .frame(maxWidth: .infinity)
               
            }

           
            NavigationView {
                ScrollView {
                        
                            LazyVGrid(columns: columns, spacing: 10){
                                ForEach(vm.filteredProducts) { product in
                                  
                                    NavigationLink {
                                        ProductDetailedView(product: product)
                                    } label: {
                                        ProductView(product: product)
                                    }
                                
                                }
                            }
                            .padding(.horizontal, 10)
                }
                .background(Color.MyTheme.customLightPink)
            }
            
        }
        .background(Color.MyTheme.customLightPink)
        .onChange(of: vm.productType) { newValue in
            vm.filterProductsByType()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        
        HomeView()
            .environmentObject(ProductViewModel())
            .environmentObject(LoginViewModel())
        
    }
}
