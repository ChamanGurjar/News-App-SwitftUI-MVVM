//
//  ContentView.swift
//  NewsAppUsingMvvmAndSwiftUI
//
//  Created by ChamanGurjar on 20/12/19.
//  Copyright © 2019 ChamanGurjar. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var model = ArticleListViewModel()
    
    var body: some View {
        List(model.articles) { article in
            
            VStack(alignment: .leading) {
                
                Text(article.title)
                    .lineLimit(nil)
                
                Text(article.description)
                    .foregroundColor(.secondary)
                    .lineLimit(nil)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
