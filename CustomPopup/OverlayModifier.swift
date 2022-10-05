//
//  OverlayModifier.swift
//  CustomPopup
//
//  Created by Inpyo Hong on 2022/10/05.
//

import Foundation
import SwiftUI

struct OverlayModifier<OverlayView: View> : ViewModifier {
    @Binding var isPresented: Bool
    @ViewBuilder var overlayView: () -> OverlayView
    
    init(isPresented: Binding<Bool>, @ViewBuilder overlayView: @escaping() -> OverlayView) {
        self._isPresented = isPresented
        self.overlayView = overlayView
    }
    
    func body(content: Content) -> some View {
        content.overlay(isPresented ? overlayView() : nil)
    }
}
