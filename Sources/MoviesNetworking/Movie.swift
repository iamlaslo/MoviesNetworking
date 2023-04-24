//
//  Movie.swift
//  
//
//  Created by Vlad Kozlov on 24.04.2023.
//

import Foundation

public struct Movie: Codable, Hashable, Identifiable {
  
  static var empty: Self {
    return Movie(
      id: 0,
      title: "",
      originalTitle: "",
      originalLanguage: "",
      posterPath: "",
      releaseDate: "",
      adult: false,
      voteAverage: 0
    )
  }
  
  public var id: Int
  public var title: String
  public var originalTitle: String
  public var originalLanguage: String
  public var posterPath: String
  public var releaseDate: String
  public var adult: Bool
  public var voteAverage: Double
  
  enum CodingKeys: String, CodingKey {
    case id
    case title
    case originalTitle = "original_title"
    case originalLanguage = "original_language"
    case posterPath = "poster_path"
    case releaseDate = "release_date"
    case adult
    case voteAverage = "vote_average"
  }
  
  public func posterUrl() -> URL? {
    URL(string: "https://image.tmdb.org/t/p/w500/\(self.posterPath)")
  }
}
