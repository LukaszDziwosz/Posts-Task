//
//  PostCell.swift
//  Posts_Task
//
//  Created by Lukasz Dziwosz on 30/09/2021.
//

import SwiftUI

struct PostCell: View {
    
    var post: Post
    var user: User
    
    var body: some View {
        HStack {
            VStack{
                Text(user.username)
                Text(user.company.name)
            }
            VStack {
                Text(post.title)
                Text(post.body)
            }
        }
    }
}

struct PostCell_Previews: PreviewProvider {
    static var previews: some View {
        PostCell(post: Post(userId: 1, id: 2, title: "lklklklk", body: "kmdkdkdkdkdkkdmdkdm"), user: User(id: 1, name: "John", username: "Doe", email: "john@doe.com", address: Address(street: "1 Infinity Loop", suite: "suite 1", city: "San Francisco", zipcode: "00-009", geo: Geo(lat: "37.33182", lng: "-122.03118")), phone: "888-888-888", website: "johndoe.com", company: Company(name: "Apple", catchPhrase: "Never copy others, not", bs: "bla bla")))
    }
}
