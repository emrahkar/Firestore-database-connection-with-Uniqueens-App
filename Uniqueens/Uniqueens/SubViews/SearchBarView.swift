//
//  SearchBarView.swift
//  Uniqueens
//
//  Created by Emrah Karabulut on 4.09.2022.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var text: String
    
    var body: some View {
        HStack{
            Image(systemName: "magnifyingglass")
                .font(.title2)
                .foregroundColor(Color.MyTheme.customGray)
            TextField("Search", text: $text)
                .textCase(.lowercase)
                .disableAutocorrection(true)
                //.disabled(true)
                
        }
        .padding(.vertical)
        .padding(.horizontal)
        .background(
                Capsule()
                    .strokeBorder(Color.MyTheme.customGray, lineWidth: 0.5)
        
        )
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(text: .constant(""))
    }
}
