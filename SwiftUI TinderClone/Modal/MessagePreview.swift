//
//  MessageTheared.swift
//  SwiftUI TinderClone
//
//  Created by Kerim Civelek on 25.05.2022.
//

struct MessagePreview{
    
    var person : Person
    var lastMessage : String
    
}


extension MessagePreview{
    
    static let example = MessagePreview(person: Person.example, lastMessage: "Hello There!")
}
