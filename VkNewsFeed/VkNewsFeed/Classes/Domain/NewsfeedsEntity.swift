//
//  NewsfeedsEntity.swift
//  VkNewsFeed
//
//  Created by Иван Масальских on 04.08.2020.
//  Copyright © 2020 Masalskikh. All rights reserved.
//

import Foundation


struct NewsfeedsEntity {
    let items: [Newsfeed]
    let nextFrom: String
    
    struct Newsfeed {
        let sourceId: Int
        let date: TimeInterval
        let canDoubtCategory: Bool?
        let canSetCategory: Bool?
        let type: String
        let postType: String
        let text: String
        let markedAsAds: Int
        let attachments: [Attachment]
        let postSource: PostSource
        let comments: Comments
        let likes: Likes
        let reposts: Reposts
        let views: Views
        let isFavorite: Bool
        let postId: Int
        
        enum Attachment {
            case photo(Photo)
            case video(Video)
        }
        
        struct Photo {
            let albumId: Int
            let date: TimeInterval
            let id: Int
            let ownerId: Int
            let hasTags: Bool
            let accessKey: String
            let postId: Int?
            let sizes: [Size]
            let text: String
            let userId: Int?
            
            struct Size {
                let height: Int
                let url: String
                let type: String
                let width: Int
            }
        }
        
        struct Video {
            let ownerId: Int
            let title: String
            let canAdd: Int
            let duration: Int
            let image: [Image]
            let isFavorite: Bool
            let views: Int
            let type: String
            let canLike: Int
            let canComment: Int
            let id: Int
            let date: TimeInterval
            let platform: String?
            let trackCode: String
            let canAddToFaves: Int
            let accessKey: String
            let comments: Int?
            let localViews: Int?
            let canSubscribe: Int
            let canRepost: Int
            let description: String

            struct Image {
                let withPadding: Int?
                let height: Int
                let url: String
                let width: Int
            }
        }
        
        struct PostSource {
            let type: String
        }
        
        struct Comments {
            let count: Int
            let canPost: Int
        }

        struct Likes {
            let count: Int
            let userLikes: Int
            let canLike: Int
            let canPublish: Int
        }

        struct Reposts {
            let count: Int
            let userReposted: Int
        }

        struct Views {
            let count: Int
        }
    }
}
