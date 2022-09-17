//
//  CarouselView.swift
//  Uniqueens
//
//  Created by Emrah Karabulut on 21.08.2022.
//

import SwiftUI

struct CarouselView: View {
    
    @State var selection: Int = 1
    let count: Int = 5
    @State var timerOn: Bool = false
    
    var body: some View {
        TabView(selection: $selection) {
            
            ForEach(1..<count) { i in
                Image("carousel\(i)")
                    .resizable()
                    .scaledToFill()
                    .tag(i)
                    
            }
            .tabViewStyle(PageTabViewStyle())
            .animation(.default)
            .onAppear {
                if !timerOn {
                    switchTimer()
                }
            }
        }
    }
    
    func switchTimer() {
        
        timerOn = true
        
        let timer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true) { timer in
            
            if selection == (count - 1) {
                selection = 1
            } else {
                selection += 1
            }
        }
        timer.fire()
    }
}

struct CarouselView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselView()
    }
}
