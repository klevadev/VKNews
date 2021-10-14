//
//  NewsfeedInteractor.swift
//  VKNews
//
//  Created by Lev Kolesnikov on 16.08.2019.
//  Copyright (c) 2019 Lev Kolesnikov. All rights reserved.
//

import UIKit

protocol NewsfeedBusinessLogic {
  func makeRequest(request: Newsfeed.Model.Request.RequestType)
}

class NewsfeedInteractor: NewsfeedBusinessLogic {

  var presenter: NewsfeedPresentationLogic?
  var service: NewsfeedService?
  
  func makeRequest(request: Newsfeed.Model.Request.RequestType) {
    if service == nil {
      service = NewsfeedService()
    }
    
    switch request {
        
    case .getNewsFeed:
        service?.getFeed(completion: { [weak self] (revealtedPostIds, feed) in
            self?.presenter?.presentData(response: Newsfeed.Model.Response.ResponseType.presentNewsFeed(feed: feed, revealedPostIds: revealtedPostIds))
        })
    case .getUser:
        service?.getUser(completion: { [weak self] (user) in
            self?.presenter?.presentData(response: Newsfeed.Model.Response.ResponseType.presentUserInfo(user: user))
        })
    case .revealPostIds(let postId):
        service?.revealPostIds(forPostId: postId, completion: { [weak self] (revealedPostIds, feed) in
            self?.presenter?.presentData(response: Newsfeed.Model.Response.ResponseType.presentNewsFeed(feed: feed, revealedPostIds: revealedPostIds))
        })

    case .getNextBatch:
        presenter?.presentData(response: Newsfeed.Model.Response.ResponseType.presentFooterLoader)
        service?.getNextBatch(completion: { (revealtedPostIds, feed) in
            self.presenter?.presentData(response: Newsfeed.Model.Response.ResponseType.presentNewsFeed(feed: feed, revealedPostIds: revealtedPostIds))
        })
    }

  
  }

}
