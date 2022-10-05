//
//  BottomPopupView.swift
//  CustomPopup
//
//  Created by Inpyo Hong on 2022/10/05.
//

import SwiftUI

struct BottomPopupView<Content: View>: View {
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                content
                    .padding(.bottom, geometry.safeAreaInsets.bottom)
                    .background(Color.white)
                
            }
        }
    }
}

