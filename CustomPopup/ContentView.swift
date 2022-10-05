//
//  ContentView.swift
//  CustomPopup
//
//  Created by Inpyo Hong on 2022/10/05.
//

import SwiftUI

struct ContentView: View {
    @State var isPresented = false
    
    var body: some View {
        ZStack {
            Color.gray.ignoresSafeArea()
            
            Button("Show Popup") {
                isPresented = true
            }
        }
        .popup(isPresented: $isPresented) {
            BottomPopupView {
                NamePopupView(isPresented: $isPresented)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
