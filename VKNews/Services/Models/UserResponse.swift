//
//  UserResponse.swift
//  VKNews
//
//  Created by Lev Kolesnikov on 19.08.2019.
//  Copyright © 2019 Lev Kolesnikov. All rights reserved.
//

import Foundation

struct UserResponseWrapped: Decodable {
    let response: [UserResponse]
}

struct UserResponse: Decodable {
    let photo100: String?
}
