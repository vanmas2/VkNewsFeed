//
//  NewsfeedsResponseMapper.swift
//  VkNewsFeed
//
//  Created by Иван Масальских on 05.08.2020.
//  Copyright © 2020 Masalskikh. All rights reserved.
//

import Foundation


extension NewsfeedsEntity {
    
    init(model: NewsfeedsResponse) {
        nextFrom = model.response.next_from
        items = model.response.items.map { item in
            let attachments: [Newsfeed.Attachment] = (item.attachments ?? []).compactMap {
                Newsfeed.Attachment(model: $0)
            }
            
            let postSource = Newsfeed.PostSource(model: item.post_source)
            let comments = Newsfeed.Comments(model: item.comments)
            let likes = Newsfeed.Likes(model: item.likes)
            let reposts = Newsfeed.Reposts(model: item.reposts)
            let views = Newsfeed.Views(model: item.views)
            
            return NewsfeedsEntity.Newsfeed(
                sourceId: item.source_id,
                date: item.date,
                canDoubtCategory: item.can_doubt_category,
                canSetCategory: item.can_set_category,
                type: item.type,
                postType: item.post_type,
                text: item.text,
                markedAsAds: item.marked_as_ads,
                attachments: attachments,
                postSource: postSource,
                comments: comments,
                likes: likes,
                reposts: reposts,
                views: views,
                isFavorite: item.is_favorite,
                postId: item.post_id
            )
        }
    }
}

extension NewsfeedsEntity.Newsfeed {
    
    init(model: NewsfeedsResponse.Response.Item) {
        attachments = (model.attachments ?? []).compactMap {
            Attachment(model: $0)
        }
        sourceId = model.source_id
        date = model.date
        canDoubtCategory = model.can_doubt_category
        canSetCategory = model.can_set_category
        type = model.type
        postType = model.post_type
        text = model.text
        markedAsAds = model.marked_as_ads
        postSource = .init(model: model.post_source)
        comments = .init(model: model.comments)
        likes = .init(model: model.likes)
        reposts = .init(model: model.reposts)
        views = .init(model: model.views)
        isFavorite = model.is_favorite
        postId = model.post_id
    }
}

extension NewsfeedsEntity.Newsfeed.Attachment {
    
    init?(model: NewsfeedsResponse.Response.Item.Attachment) {
        if let photo = model.photo {
            self = .photo(.init(model: photo))
        } else if let video = model.video {
            self = .video(.init(model: video))
        } else {
            return nil
        }
    }
}

extension NewsfeedsEntity.Newsfeed.Photo {
    
    init(model: NewsfeedsResponse.Response.Item.Attachment.Photo) {
        albumId = model.album_id
        date = model.date
        id = model.id
        ownerId = model.owner_id
        hasTags = model.has_tags
        accessKey = model.access_key
        postId = model.post_id
        sizes = model.sizes.map { .init(model: $0) }
        text = model.text
        userId = model.user_id
    }
}

extension NewsfeedsEntity.Newsfeed.Photo.Size {
    
    init(model: NewsfeedsResponse.Response.Item.Attachment.Photo.Size) {
        height = model.height
        url = model.url
        type = model.type
        width = model.width
    }
}

extension NewsfeedsEntity.Newsfeed.Video {
    
    init(model: NewsfeedsResponse.Response.Item.Attachment.Video) {
        ownerId = model.owner_id
        title = model.title
        canAdd = model.can_add
        duration = model.duration
        image = model.image.map( { Image(model: $0) })
        isFavorite = model.is_favorite
        views = model.views
        type = model.type
        canLike = model.can_like
        canComment = model.can_comment
        id = model.id
        date = model.date
        platform = model.platform
        trackCode = model.track_code
        canAddToFaves = model.can_add_to_faves
        accessKey = model.access_key
        comments = model.comments
        localViews = model.local_views
        canSubscribe = model.can_subscribe
        canRepost = model.can_repost
        description = model.description
    }
}

extension NewsfeedsEntity.Newsfeed.Video.Image {
    
    init(model: NewsfeedsResponse.Response.Item.Attachment.Video.Image) {
        withPadding = model.with_padding
        height = model.height
        url = model.url
        width = model.width
    }
}

extension NewsfeedsEntity.Newsfeed.Comments {
    
    init(model: NewsfeedsResponse.Response.Item.Comments) {
        count = model.count
        canPost = model.can_post
    }
}

extension NewsfeedsEntity.Newsfeed.Likes {
    
    init(model: NewsfeedsResponse.Response.Item.Likes) {
        count = model.count
        userLikes = model.user_likes
        canLike = model.can_like
        canPublish = model.can_publish
    }
}

extension NewsfeedsEntity.Newsfeed.PostSource {
    
    init(model: NewsfeedsResponse.Response.Item.PostSource) {
        type = model.type
    }
}

extension NewsfeedsEntity.Newsfeed.Reposts {
    
    init(model: NewsfeedsResponse.Response.Item.Reposts) {
        count = model.count
        userReposted = model.user_reposted
    }
}

extension NewsfeedsEntity.Newsfeed.Views {
    
    init(model: NewsfeedsResponse.Response.Item.Views) {
        count = model.count
    }
}
