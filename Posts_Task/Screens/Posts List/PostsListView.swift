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
//             ForEach(viewModel.users, id: \.id) { user in
//                 PostCell(user: user)
//                    }
        }
    }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PostsListView()
    }
}
