//
//  HomeView.swift
//  Uniqueens
//
//  Created by Emrah Karabulut on 21.08.2022.
//

import SwiftUI

struct MainView: View {
    
    @Namespace var animation
    @EnvironmentObject var vm: ProductViewModel
    @State var selectedTab: Tab = .home
    @EnvironmentObject var vmLogIn: LoginViewModel
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
       
        VStack(spacing: 0) {
            
            if selectedTab == .home {
               
                ZStack{
                    if vm.searchIsActivated {
                        SearchBarView(text: .constant(""))
                    } else {
                        SearchBarView(text: .constant(""))
                            .matchedGeometryEffect(id: "SEARCHBAR", in: animation)
                    }
                }
                .frame(width: 300, height: 8)
                .padding(.top, 60)
                .padding(.bottom, 30)
                .contentShape(Rectangle())
                .onTapGesture {
                    withAnimation (.easeInOut){
                        vm.searchIsActivated = true
                    }
                }
            }
    
            
            TabView(selection: $selectedTab) {
                
                
                HomeView()
                    .tag(Tab.home)
                FavoritesView()
                    .tag(Tab.favorites)
               
                if vmLogIn.loggedIn {
                    HomeView()
                        .tag(Tab.profile)
                } else {
                    SignInView()
                        .tag(Tab.profile)
                }

                CartView()
                    .tag(Tab.cart)
            }
            .onAppear {
                vmLogIn.loggedIn = vmLogIn.isLoggedIn
            }
            
            
            HStack(spacing: 0) {
                ForEach(Tab.allCases, id: \.self) { tab in
                    
                    Button {
                        selectedTab = tab
                    } label: {
                        ZStack(alignment: .topTrailing) {
                            VStack{
                                
                                Image(tab.rawValue)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 25, height: 25)
                                    .background(
                                        Color.MyTheme.customGray
                                            .opacity(0.3)
                                            .cornerRadius(6)
                                            .blur(radius: 6)
                                            .padding(-8)
                                            .opacity(selectedTab == tab ? 1.0 : 0.0)
                                    )
                                
                                Text(tab.rawValue)
                                    .font(.caption)
                                    .foregroundColor(Color.MyTheme.customGray)
                                    .bold()
                            }
                            .padding(.top, 6)
                            
                            if tab == .cart {
                                if vm.cartProducts.count > 0 {
                                    ZStack {
                                        Circle()
                                            .fill(Color.red)
                                            .frame(width: 18, height: 18)
                                            
                                
                                        Text("\(vm.totalQuantity)")
                                            .foregroundColor(.white)
                                            .font(.caption)
                                    }
                                }
                            }
                            
                            if tab == .favorites {
                                if vm.favoriteCart.count > 0 {
                                    ZStack {
                                        Circle()
                                            .fill(Color.red)
                                            .frame(width: 18, height: 18)
                                            
                                
                                        Text("\(vm.favoriteCart.count)")
                                            .foregroundColor(.white)
                                            .font(.caption)
                                    }
                                }
                            }
                        }
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .padding([.bottom, .horizontal])
            .padding(.bottom, 8)
        }
        .environmentObject(vm)
        .background(Color.MyTheme.customPink)
        .ignoresSafeArea()
        .overlay(

            ZStack{
                if vm.searchIsActivated {
                    SearchView(animation: animation)
                        .environmentObject(vm)
                }
            }
        )
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(LoginViewModel())
            .environmentObject(ProductViewModel())
    }
}


enum Tab: String, CaseIterable {
     case home = "Home"
     case favorites = "Favorites"
     case profile = "Profile"
     case cart = "Cart"
}
