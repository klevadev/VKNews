//
//  API.swift
//  VKNews
//
//  Created by Lev Kolesnikov on 16.08.2019.
//  Copyright © 2019 Lev Kolesnikov. All rights reserved.
//

import Foundation

struct API {
    static let scheme = "https"
    static let host = "api.vk.com"
    static let version = "5.101"
    
    static let newsFeed = "/method/newsfeed.get"
    static let user = "/method/users.get"
    
}
