//
//  Extensions.swift
//  SwiftUI TinderClone
//
//  Created by Kerim Civelek on 23.05.2022.
//

import SwiftUI

extension View{
    
    @ViewBuilder
    
    func `if` <Transform: View>( _ condition: Bool, transform: (Self) -> Transform) -> some View{
        
        if condition{
            transform(self)
        }else{
            self
        }
    }
}

extension Color{
    
    static let textPrimary = Color.gray.opacity(0.9)
    static let textTitle = Color.black.opacity(0.8)

}

extension View{
    
    func endEditing(_ force : Bool){
        UIApplication.shared.windows.forEach { $0.endEditing(force)}
    }
}


struct HideNavigationView:ViewModifier{
    func body(content: Content) -> some View {
        content
            .navigationTitle("")
            .navigationBarHidden(true)
    }
}
