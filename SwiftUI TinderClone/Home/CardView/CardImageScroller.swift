//
//  CardImageScroller.swift
//  SwiftUI TinderClone
//
//  Created by Kerim Civelek on 31.05.2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct CardImageScroller: View {
    
    var person:Person
    
    @State private var imageIndex = 0
    
    @Binding var fullScreenMode : Bool
    
    func updateImageIndex(addition:Bool){
        let newIndex : Int
        
        if addition{
            newIndex = imageIndex + 1
        }else{
            newIndex = imageIndex - 1
        }
        
        imageIndex = min(max(0,newIndex), person.imageURLS.count - 1)
    }
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                ZStack{
                    
                    WebImage(url: person.imageURLS[imageIndex])
                        .placeholder{
                            
                            Color.white
                        }.resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geo.size.width, height: geo.size.height)
                        .clipped()
                    
                    HStack{
                        Rectangle()
                            .onTapGesture {
                                updateImageIndex(addition: false)
                            }
                        
                        Rectangle()
                            .onTapGesture {
                                updateImageIndex(addition: true)
                            }

                    }.foregroundColor(.white.opacity(0.01))
                }
                
                VStack{
                    HStack{
                        ForEach(0..<person.imageURLS.count){ imageIndex in
                            
                            RoundedRectangle(cornerRadius: 20)
                                .frame(height:4)
                                .foregroundColor(self.imageIndex == imageIndex ? .white : .gray.opacity(0.5))
                        }
                    }.padding(.top,6)
                        .padding(.horizontal, fullScreenMode ? 0 : 12)
                    
                    Spacer()
                    
                    if !fullScreenMode {
                        HStack{
                            VStack(alignment: .leading){
                                HStack{
                                    
                                    Text(person.name)
                                        .font(.system(size: 32, weight: .heavy))
                                    
                                    Text(String(person.age))
                                        .font(.system(size: 28, weight: .heavy))

                                }
                                
                                Text(person.bio)
                                    .font(.system(size: 18, weight: .medium))
                                    .lineLimit(2)
                            }
                            Spacer()
                            
                            Button(action: {fullScreenMode = true}) {
                                Image(systemName: "info.circle.fill")
                                    .font(.system(size: 26, weight: .medium))
                                    .foregroundColor(.white)
                            }
                        }.padding(16)
                    }
                }.foregroundColor(.white)
            }.cornerRadius(6)
                .shadow(radius: 5)
        }
    }
}

struct CardImageScroller_Previews: PreviewProvider {
    static var previews: some View {
        CardImageScroller(person: Person.example, fullScreenMode: .constant(false))
    }
}
