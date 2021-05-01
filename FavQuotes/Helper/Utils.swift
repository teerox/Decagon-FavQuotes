//
//  Utils.swift
//  FavQuotes
//
//  Created by Anthony Odu on 28/04/2021.
//

import Foundation

class Utils {
    static func arrayOfTopics() -> [AllTopics] {
        var result = [AllTopics]()
        let value = [
            AllTopics(topic: "Abundance"),
            AllTopics(topic: "Attitude"),
            AllTopics(topic: "Beliefs"),
            AllTopics(topic: "Believe"),
            AllTopics(topic: "Books"),
            AllTopics(topic: "Change"),
            AllTopics(topic: "Compassion"),
            AllTopics(topic: "Courage"),
            AllTopics(topic: "Forgiveness"),
            AllTopics(topic: "Friendship"),
            AllTopics(topic: "Gratitude"),
            AllTopics(topic: "Happiness"),
            AllTopics(topic: "Healing"),
            AllTopics(topic: "Hope"),
            AllTopics(topic: "Kindness"),
            AllTopics(topic: "Law of Attraction"),
            AllTopics(topic: "Leadership"),
            AllTopics(topic: "Life"),
            AllTopics(topic: "Love"),
            AllTopics(topic: "Mindfulness"),
            AllTopics(topic: "Motivational"),
            AllTopics(topic: "Peace"),
            AllTopics(topic: "Positivity"),
            AllTopics(topic: "Spiritual"),
            AllTopics(topic: "Success"),
            AllTopics(topic: "Trust"),
            AllTopics(topic: "Wisdom")
        ]
        result.append(contentsOf: value)
        return result
    }
}
