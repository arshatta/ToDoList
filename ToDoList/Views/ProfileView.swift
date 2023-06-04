//
//  ProfileView.swift
//  ToDoList
//
//  Created by Аршат Талап on 25.05.2023.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user {
                    profile(user: user)
                } else {
                    Text("profil jüktelude...")
                }
            }
            .navigationTitle("profil")
        }
        .onAppear {
            viewModel.fetchUser()
        }
    }
    @ViewBuilder
    func profile(user: User) -> some View {
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(Color.blue)
            .frame(width: 125, height: 125)
            .padding()
        // Info: Name, Email, Member since
        VStack(alignment: .leading) {
            HStack {
                Text("atynyz: ")
                    .bold()
                Text(user.name)
            }
            .padding()
            HStack {
                Text("postanyz: ")
                    .bold()
                Text(user.email)
            }
            .padding()
            HStack {
                Text("bizben birge: ")
                    .bold()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
            .padding()
        }
        .padding()
        
        // Sign out
        Button("shygu") {
            viewModel.logOut()
        }
        .tint(.red)
        .padding()
        
        Spacer()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
