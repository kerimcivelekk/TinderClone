//
//  TabBarButtonView.swift
//  SwiftUI TinderClone
//
//  Created by Kerim Civelek on 23.05.2022.
//

import SwiftUI


enum TabBarButtonType : String{
    
    case fire = "flame.fill"
    case star = "star.fill"
    case message = "message.fill"
    case profile = "person.fill"
}

struct TabBarButtonView: View {
    
    var type: TabBarButtonType
        
    @EnvironmentObject var appState:AppStateManager
    
    var body: some View {
        Button(action: {appState.selectedTab = type}) {
            
            Image(systemName: type.rawValue)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .if(appState.selectedTab == type, transform: {
                    $0.foregroundColor(type == .star ? .yellow : .red)
                })
                .foregroundColor(.gray.opacity(0.5))
                
        }.frame(width: 30, height: 30)
    }
}

struct TabBarButtonView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarButtonView(type: .profile)
    }
}
