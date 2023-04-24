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
  
  var asEndpoint: Endpoint {
    Endpoint(
      base: Self.base,
      path: self.path,
      method: self.method,
      query: ["api_key": Self.token]
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
