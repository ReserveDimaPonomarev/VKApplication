//
//  DataFetcher.swift
//  VKApplication
//
//  Created by Дмитрий Пономарев on 17.06.2023.
//

import Foundation

protocol DataFetcherProtocol {
    func getFeed(response: @escaping (FeedResponse?) -> Void)
}

struct NetworkDataFetcher: DataFetcherProtocol {
    
    private let network: Networking
    
    init(network: Networking) {
        self.network = network
    }
    
    func getFeed(response: @escaping (FeedResponse?) -> Void) {
        let params = ["filters": "post"]

        network.request(path: API.newsFeed, params: params) { data, error in
            if let error = error {
                print("Error recieve requesting data \(error.localizedDescription)")
                response(nil)
            }
            guard let data = data else { return }
            let decoded = decodeJson(type: FeedResponeWrapped.self, from: data)
            response(decoded?.response)
        }
    }
    
    private func decodeJson<T: Decodable>(type: T.Type, from data: Data?) -> T? {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        guard let data = data, let response = try? decoder.decode(type.self, from: data) else { return nil }
            return response
    }
}
