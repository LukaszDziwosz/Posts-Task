//
//  PostCell.swift
//  Posts_Task
//
//  Created by Lukasz Dziwosz on 30/09/2021.
//

import SwiftUI

struct PostCell: View {
    
    var post: Post
    
    var body: some View {
        VStack {
            Text(post.title)
            Text(post.body)
        }
    }
}

struct PostCell_Previews: PreviewProvider {
    static var previews: some View {
        PostCell(post: Post(userId: 1, id: 2, title: "lklklklk", body: "kmdkdkdkdkdkkdmdkdm"))
    }
}
