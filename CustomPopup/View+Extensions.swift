//
//  View+Extensions.swift
//  CustomPopup
//
//  Created by Inpyo Hong on 2022/10/05.
//

import Foundation
import SwiftUI

struct RoundedCornerShape: Shape {
    let radius: CGFloat
    let corners: UIRectCorner
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(radius: CGFloat, corners: UIRectCorner = .allCorners) -> some View {
        clipShape(RoundedCornerShape(radius: radius, corners: corners))
    }
}


extension View {
    func popup<OverlayView: View>(isPresented: Binding<Bool>,
                                  blurRadius: CGFloat = 3,
                                  blurAnimation: Animation? = .linear,
                                  @ViewBuilder overlayView: @escaping ()-> OverlayView) -> some View {
            blur(radius: isPresented.wrappedValue ? blurRadius : 0)
            .onTapGesture {
                isPresented.wrappedValue = false
            }
            .animation(blurAnimation, value: isPresented.wrappedValue)
            //.allowsHitTesting(!isPresented.wrappedValue)
            .modifier(OverlayModifier(isPresented: isPresented, overlayView: overlayView))
    }
    
}
