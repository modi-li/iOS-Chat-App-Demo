//
//  SampleData.swift
//  iOS-Chat-App-Demo
//
//  Created by Modi Li
//

import UIKit
import CoreData

class SampleData {
    
    static func createAndInsertSampleData() {
        let context = DataHelper.getContext()
        
        let user = User(context: context)
        user.id = UUID()
        user.name = "Demo User"
        
        let selfUser = SelfUser(context: context)
        selfUser.user = user
        
        let user1 = User(context: context)
        user1.id = UUID()
        user1.name = "Daniel"
        
        let user2 = User(context: context)
        user2.id = UUID()
        user2.name = "Michael"
        
        selfUser.addToContacts(user1)
        selfUser.addToContacts(user2)
        
        let chat1 = Chat(context: context)
        chat1.id = UUID()
        chat1.withUser = user1
        
        selfUser.addToChats(chat1)
        
        let chatMessage1 = ChatMessage(context: context)
        chatMessage1.id = UUID()
        chatMessage1.chat = chat1
        chatMessage1.fromUser = user
        chatMessage1.text = "Hello!"
        chatMessage1.date = Date(timeIntervalSince1970: 1717597200)
        
        let chatMessage2 = ChatMessage(context: context)
        chatMessage2.id = UUID()
        chatMessage2.chat = chat1
        chatMessage2.fromUser = user1
        chatMessage2.text = "Hi! How are you doing today?"
        chatMessage2.date = Date(timeIntervalSince1970: 1717597260)
        
        let chatMessage3 = ChatMessage(context: context)
        chatMessage3.id = UUID()
        chatMessage3.chat = chat1
        chatMessage3.fromUser = user
        chatMessage3.text = "I'm doing great!"
        chatMessage3.date = Date(timeIntervalSince1970: 1717597340)
        
        let chatMessage4 = ChatMessage(context: context)
        chatMessage4.id = UUID()
        chatMessage4.chat = chat1
        chatMessage4.fromUser = user
        chatMessage4.text = "I'm looking forward to seeing you next week in Seattle! What would you like to do here?"
        chatMessage4.date = Date(timeIntervalSince1970: 1717597820)
        
        chat1.lastChatMessage = chatMessage4
        
        chat1.addToChatMessages(chatMessage1)
        chat1.addToChatMessages(chatMessage2)
        chat1.addToChatMessages(chatMessage3)
        chat1.addToChatMessages(chatMessage4)
        
        do {
            try context.save()
        } catch {
            
        }
    }
    
}
