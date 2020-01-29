//
//  searchResponse.swift
//  FlickerDraft
//
//  Created by Chuck.Zhou on 1/27/20.
//  Copyright © 2020 Haibo Family. All rights reserved.
//

import Foundation

struct PhotoResults: Codable {
    let page: Int
    let pages: Int
    let perpage: Int
    let total: String
    let photo: [Photo]
}
