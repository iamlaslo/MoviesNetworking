//
//  MovieDetails.swift
//  
//
//  Created by Vlad Kozlov on 24.04.2023.
//

import Foundation

public struct MovieDetails: Codable, Hashable, Identifiable {
  
  public var id: Int
  public var title: String
  public var originalTitle: String
  public var originalLanguage: String
  public var releaseDate: String
  public var runtime: Int
  public var tagline: String
  public var overview: String
  
  
  enum CodingKeys: String, CodingKey {
    case id
    case title
    case originalTitle = "original_title"
    case originalLanguage = "original_language"
    case releaseDate = "release_date"
    case runtime
    case tagline
    case overview
  }
}
