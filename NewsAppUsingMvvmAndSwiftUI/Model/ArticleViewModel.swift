//
//  ArticleViewModel.swift
//  NewsAppUsingMvvmAndSwiftUI
//
//  Created by ChamanGurjar on 21/12/19.
//  Copyright © 2019 ChamanGurjar. All rights reserved.
//

import Foundation

class ArticleViewModel: Identifiable {
    let id = UUID()
    
    let article: Article
    
    init(article: Article) {
        self.article = article
    }
    
    var title: String {
        self.article.title
    }
    
    var description: String {
        self.article.description ?? ""
    }
    
}
