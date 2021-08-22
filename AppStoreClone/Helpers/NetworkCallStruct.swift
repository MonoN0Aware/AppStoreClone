//
//  NetworkCallStruct.swift
//  AppStoreClone
//
//  Created by Decagon on 17/08/2021.
//

import Foundation
import UIKit

struct SearchResult:Codable{
    let resultCount:Int
    let results: [Result]
}

struct Result:Codable {
    let trackName:String
    let primaryGenreName:String
    var averageUserRating:Float?
    let artworkUrl100:String
    let screenshotUrls:[String]
}
