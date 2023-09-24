//
//  News.swift
//  VKApplication
//
//  Created by Дмитрий Пономарев on 17.06.2023.
//

import UIKit

class FeedViewController: UIViewController {
     
    private var dataFetcher: DataFetcherProtocol = NetworkDataFetcher(network: NetworkService())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        dataFetcher.getFeed { (response) in
            guard let response = response else { return }
            let item = response.items.map { (feedItem) in
            }
        }
        

    }
}
