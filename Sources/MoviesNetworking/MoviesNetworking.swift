//
//  MoviesNetworking.swift
//
//
//  Created by Vlad Kozlov on 20.04.2023.
//

import Foundation
import CoreNetworking

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
  
  public func getDetails(
    for movie: Movie
  ) async -> Result<MovieDetails, NetworkManager.NetworkError> {
    return await self.networkManager.request(
      endpoint: MoviesPath.movieDetails(id: movie.id).asEndpoint,
      responseModel: MovieDetails.self
    )
  }
}
