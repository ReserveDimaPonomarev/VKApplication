//
//  PostModel.swift
//  VKApplication
//
//  Created by Дмитрий Пономарев on 17.06.2023.
//

import Foundation

struct FeedResponeWrapped: Decodable {
    let response: FeedResponse
}

struct FeedResponse: Decodable {
    let items: [FeedItems]
}
struct FeedItems: Decodable {
    let date: Int
    let sourceId: Int
    let postId: Int
    let comments: CountableItems?
    let likes: CountableItems?
    let text: String?
    let shares: CountableItems?
    let views: CountableItems?
}

struct CountableItems: Decodable {
    let count: Int

}
