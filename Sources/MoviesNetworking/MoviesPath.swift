//
//  File.swift
//  
//
//  Created by Vlad Kozlov on 24.04.2023.
//

import Foundation
import CoreNetworking

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
      return "movie/\(id)"
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
