//
//  PurchasePopup.swift
//  SwiftUI TinderClone
//
//  Created by Kerim Civelek on 29.05.2022.
//

import SwiftUI

struct PurchasePopup: View {
    
    @Binding var isVisible : Bool
    
    let screen = UIScreen.main.bounds
    
    func processPayment(){
        
    }
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                Spacer().frame(height:40)
                VStack {
                    Text("Get Tinder Gold")
                        .foregroundColor(.yellow)
                        .font(.system(size: 24, weight: .bold))
                    
                    Text("PurchaseSwipePromo")
                        .frame(height: geo.size.height/3)
                        .background(.gray)
                    
                    Text("3 purchase Options")
                 
                    Spacer()
                    
                    Button(action: {processPayment()}) {
                        ZStack{
                            RoundedRectangle(cornerRadius: 45)
                                .foregroundColor(.yellow)
                            
                            Text("CONTINUE")
                                .foregroundColor(.white)
                                .font(.system(size: 20, weight: .heavy))
                        }
                    }.frame(height:55)
                        .padding(.horizontal,24)
                        .padding(.top,12)
                    
                    Button(action: {isVisible = false}) {
                        Text("NO THANKS")
                            .foregroundColor(.textPrimary)
                            .font(.system(size: 20, weight: .heavy))
                        
                    }.padding(.vertical,18)
                    
                
                   
                }.frame(width: geo.size.width)
                    .padding(.vertical,20)
                    .background(
                        RoundedRectangle(cornerRadius: 25, style: .continuous).foregroundColor(.white)
                    )
                
                Spacer()
                
                VStack(spacing:4){
                    
                    Text("Recurring billing, cancel anytime.")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .semibold))
                    
                    Text("This is bunch of example text that is representing the legal test found on all subscription pages, This is bunch of example text that is representing the legal test found on all subscription pages... ")
                        .foregroundColor(.white.opacity(0.5))
                        .font(.system(size: 14, weight: .semibold))
                        .multilineTextAlignment(.center)
                }
                .padding(.bottom,20)
                .padding(.horizontal,4)
                
                Spacer()
            }.background(Color.black.edgesIgnoringSafeArea(.all))
        }.frame(height:screen.height)
    }
}

struct PurchasePopup_Previews: PreviewProvider {
        
    static var previews: some View {
        PurchasePopup(isVisible: .constant(true))
        
    }
}
