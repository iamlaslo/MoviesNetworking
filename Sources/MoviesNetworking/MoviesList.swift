//
//  MoviesList.swift
//  
//
//  Created by Vlad Kozlov on 24.04.2023.
//

import Foundation

public struct MoviesList: Codable {
  
  public var page: Int
  public var totalPages: Int
  public var totalResults: Int
  public var movies: [Movie]
  
  enum CodingKeys: String, CodingKey {
    case page
    case totalPages = "total_pages"
    case totalResults = "total_results"
    case movies = "results"
  }
}
