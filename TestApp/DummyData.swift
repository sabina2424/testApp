//
//  DummyData.swift
//  TestApp
//
//  Created by Sabina on 28.01.21.
//

import Foundation

struct DummyData {
    
    static func getConversations() -> [Conversation] {
        return [
            Conversation(sender: "Black Widow", body: "Hi! How r u?😁", image: "blackwidow",messages: [ Message(userID: "blackwidow", message: "Hi! How r u?", isSender: false),
                Message(userID: "ironman", message: "Thank u! Everything is Ok", isSender: true),
                Message(userID: "blackwidow", message: "Me too, let's go for riding bicycle at the evening? ", isSender: false),
                Message(userID: "ironman", message: "Great idea! I'm in", isSender: true)], isActive: true),
            Conversation(sender: "The group Chat", body: "Welcome to the new group", image: "marvelLabel", messages: [
                Message(userID: "ironman", message: "Welcome to the new group", isSender: true),
                Message(userID: "thor", message: "Nice to see all of you here!", isSender: false),
                Message(userID: "witch", message: "Ohh, that's great!))", isSender: false)], isActive: false),
            Conversation(sender: "Captain America", body: "Can u call me please?", image: "capitanAmerica", messages: [
                Message(userID: "capitanAmerica", message: "Can u call me please?", isSender: false),
                Message(userID: "capitanAmerica", message: "I have some news for you", isSender: false),
                Message(userID: "ironman", message: "Sure! Give me a minute please", isSender: true)], isActive: true),
            Conversation(sender: "Doctor Strange", body: "Hey bro!😍 How is u doin'?", image: "doctorStrange", messages: [
                Message(userID: "doctorStrange", message: "Hey bro! How is u doin'?", isSender: false),
                Message(userID: "doctorStrange", message: "What'r ur plans for the Weekend?", isSender: false),
                Message(userID: "ironman", message: "Hi doc!", isSender: true),
                Message(userID: "ironman", message: "Nice to hear from you! Nothing special", isSender: true),
                Message(userID: "ironman", message: "Would you like to go for a fishing?", isSender: true)], isActive: true),
            Conversation(sender: "Wonder Woman", body: "Hey Tony! Thank u a lot, really appreciate It🎉", image: "wonderwoman", messages:[
                Message(userID: "ironman", message: "I have just watched Wonder Woman 1984! I do liked It!", isSender: true),
                Message(userID: "wonderwoman", message: "Hey Tony! Thank u a lot, really appreciate It:)", isSender: false)], isActive: true),
            Conversation(sender: "Thor", body: "We have a final scene today", image: "thor", messages: [
                Message(userID: "thor", message: "We have a final scene today", isSender: false),
                Message(userID: "ironman", message: "Hi bro! Yeah, I remember", isSender: true)], isActive: false),
            Conversation(sender: "Wanda Maximoff", body: "Hi!This is my second number🤘", image: "witch", messages: [
                Message(userID: "witch", message: "Hi Tony!This is my second number", isSender: true)], isActive: false)
        ]
    }
    
    static func getStories() -> [Story] {
        return [
            Story(image: "witch", userName: "Wanda Maximoff"),
            Story(image: "thor", userName: "Thor"),
            Story(image: "ironman", userName: "Ironman"),
            Story(image: "wonderwoman", userName: "Wonder Woman"),
            Story(image: "blackwidow", userName: "Black widow"),
            Story(image: "doctorStrange", userName: "Doctor Strange"),
            Story(image: "capitanAmerica", userName: "Captain America"),
            Story(image: "marvelLabel", userName: "Group")
        ]
    }
}







