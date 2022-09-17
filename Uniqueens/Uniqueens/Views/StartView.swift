//
//  StartView.swift
//  Uniqueens
//
//  Created by Emrah Karabulut on 21.08.2022.
//

import SwiftUI

struct StartView: View {
    
    @State var enter_status: Bool = false

    var body: some View {
        
            VStack(spacing: 50){
                    
                    CarouselView()
                        .frame(maxWidth: .infinity)
                        .frame(height: 500)
        
                    Button {
                        enter_status.toggle()
                    } label: {
                        Text("Enter")
                            .font(.title3)
                            .foregroundColor(Color.MyTheme.customWhite)
                            .bold()

                    }
                    .frame(width: 200, height: 50)
                    .background(Color("CustomGray"))
                    .cornerRadius(12)
                    .padding(.bottom, 40)
                   
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.MyTheme.customPink)
                .overlay {
                    if enter_status {
                        withAnimation(.default) {
                            MainView()
                        }
                    }
                }
            }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
            StartView()
    }
}
