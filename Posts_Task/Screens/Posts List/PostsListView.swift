//
//  ContentView.swift
//  Posts_Task
//
//  Created by Lukasz Dziwosz on 30/09/2021.
//

import SwiftUI

struct PostsListView: View {

    @ObservedObject var viewModel = PostsListViewModel()

    var body: some View {
        NavigationView {
            List{
             ForEach(viewModel.posts, id: \.id) { post in
                 PostCell(post: post)
                    }
        }
    }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PostsListView()
    }
}
