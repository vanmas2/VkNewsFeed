//
//  NewsfeedsResponse.swift
//  VkNewsFeed
//
//  Created by Иван Масальских on 04.08.2020.
//  Copyright © 2020 Masalskikh. All rights reserved.
//

import Foundation


struct NewsfeedsResponse: Decodable {
    let response: Response
    
    struct Response: Decodable {
        let items: [Item]
        let next_from: String
        
        struct Item: Decodable {
            let source_id: Int
            let date: TimeInterval
            let can_doubt_category: Bool?
            let can_set_category: Bool?
            let type: String
            let post_type: String
            let text: String
            let marked_as_ads: Int
            let attachments: [Attachment]?
            let post_source: PostSource
            let comments: Comments
            let likes: Likes
            let reposts: Reposts
            let views: Views
            let is_favorite: Bool
            let post_id: Int
            
            struct Attachment: Decodable {
                let type: String
                let photo: Photo?
                let video: Video?
                
                struct Photo: Decodable {
                    let album_id: Int
                    let date: TimeInterval
                    let id: Int
                    let owner_id: Int
                    let has_tags: Bool
                    let access_key: String
                    let post_id: Int?
                    let sizes: [Size]
                    let text: String
                    let user_id: Int?
                    
                    struct Size: Decodable {
                        let height: Int
                        let url: String
                        let type: String
                        let width: Int
                    }
                }
                
                struct Video: Decodable {
                    let owner_id: Int
                    let title: String
                    let can_add: Int
                    let duration: Int
                    let image: [Image]
                    let is_favorite: Bool
                    let views: Int
                    let type: String
                    let can_like: Int
                    let can_comment: Int
                    let id: Int
                    let date: TimeInterval
                    let platform: String?
                    let track_code: String
                    let can_add_to_faves: Int
                    let access_key: String
                    let comments: Int?
                    let local_views: Int?
                    let can_subscribe: Int
                    let can_repost: Int
                    let description: String

                    struct Image: Decodable {
                        let with_padding: Int?
                        let height: Int
                        let url: String
                        let width: Int
                    }
                }
            }
            
            struct PostSource: Decodable {
                let type: String
            }
            
            struct Comments: Decodable {
                let count: Int
                let can_post: Int
            }

            struct Likes: Decodable {
                let count: Int
                let user_likes: Int
                let can_like: Int
                let can_publish: Int
            }

            struct Reposts: Decodable {
                let count: Int
                let user_reposted: Int
            }

            struct Views: Decodable {
                let count: Int
            }
        }
    }
}
