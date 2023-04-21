//
//  MoviesNetworking.swift
//
//
//  Created by Vlad Kozlov on 20.04.2023.
//

import Foundation

import CoreNetworking

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

public struct Movie: Codable, Hashable, Identifiable {
  
  public var id: Int
  public var title: String
  public var originalTitle: String
  public var originalLanguage: String
  public var releaseDate: String
  public var adult: Bool
  public var voteAverage: Double
  
  enum CodingKeys: String, CodingKey {
    case id
    case title
    case originalTitle = "original_title"
    case originalLanguage = "original_language"
    case releaseDate = "release_date"
    case adult
    case voteAverage = "vote_average"
  }
}

enum MoviesPath {
  
  case moviesList
  case movieDetails(id: Int)
}

extension MoviesPath {
  
  static var base = "https://api.themoviedb.org/3/"
  static var token = "3c1872e6a0b97d18bc554e54a774eb92"
  
  private var path: String {
    switch self {
    case .moviesList:
      return "discover/movie"
    case .movieDetails(let id):
      return "movies/\(id)"
    }
  }
  
  private var method: RequestMethod {
    switch self {
    case .moviesList, .movieDetails:
      return .get
    }
  }
  
  private var header: [String: String]? {
    switch self {
    case .moviesList, .movieDetails:
      return [
        "Authorization": "Bearer \(Self.token)",
        "Content-Type": "application/json;charset=utf-8"
      ]
    }
  }
  
  var asEndpoint: Endpoint {
    Endpoint(
      base: Self.base,
      path: self.path,
      method: self.method,
      header: self.header,
      body: nil
    )
  }
}

@available(iOS 15.0, *)
public final class MoviesNetworkingManager {
  
  let networkManager = NetworkManager()
  
  public init() { }
  
  public func getMovies() async -> Result<MoviesList, NetworkManager.NetworkError> {
    return await self.networkManager.request(
      endpoint: MoviesPath.moviesList.asEndpoint,
      responseModel: MoviesList.self
    )
  }
}
