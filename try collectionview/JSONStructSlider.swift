//
//  File.swift
//  try collectionview
//
//  Created by Arsalan Hashemi on 4/8/19.
//  Copyright © 2019 ArSaLaNhashemi. All rights reserved.
//

import Foundation

struct ImgaeSlider: Codable {
    let data: [SliderDatum]
    let result: Bool
    let error: String
}

struct SliderDatum: Codable {
    let id, slideText: String
    let slideImage: String
    
    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case slideText = "SlideText"
        case slideImage = "SlideImage"
    }
}
