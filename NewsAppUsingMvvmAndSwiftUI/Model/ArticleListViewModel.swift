//
//  ArticleListViewModel.swift
//  NewsAppUsingMvvmAndSwiftUI
//
//  Created by ChamanGurjar on 21/12/19.
//  Copyright © 2019 ChamanGurjar. All rights reserved.
//

import Foundation
import Combine

class ArticleListViewModel: ObservableObject {
    
    let willChange = PassthroughSubject<ArticleListViewModel, Never>()
    
    init() {
        fetchTopHeadlines()
    }
    
    @Published var articles = [ArticleViewModel]()
    
    /// This method will fetch latest news.
    private func fetchTopHeadlines() {
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=91087059c1d947dab420de3c65e94abb") else {
            fatalError("URL is not correct!")
        }
        WebService().loadTopHeadlines(url: url) { (articles) in
            if let articles = articles {
                self.articles = articles.map(ArticleViewModel.init)
            }
        }
    }
}
