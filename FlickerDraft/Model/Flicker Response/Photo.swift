//
//  Photo.swift
//  FlickerDraft
//
//  Created by Chuck.Zhou on 1/27/20.
//  Copyright © 2020 Haibo Family. All rights reserved.
//

import Foundation

struct Photo: Codable, Equatable {
    let id: String
    let owner: String
    let secret: String
    let server: String
    let farm: Int?
    let title: String
    let ispublic: Int
    let isfriend: Int
    let isfamily: Int
    let url: String?
    let height: Int?
    let width: Int?
    
    enum CodingKeys: String, CodingKey {
        case id
        case owner
        case secret
        case server
        case farm
        case title
        case ispublic
        case isfriend
        case isfamily
        case url = "url_m"
        case height = "height_m"
        case width = "width_m"
    }
}
