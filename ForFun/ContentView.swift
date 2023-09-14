//
//  ContentView.swift
//  ForFun
//
//  Created by Alexander Boakye on 14/09/2023.
//

import SwiftUI

struct Chats: Identifiable{
    var id = UUID()
    let name: String
    let message: String
    let profilePicture: String
    let unread: Int?
    let type: ChatType
    let time: Date
}

enum ChatType{
    case pinned
    case normal
}

struct ContentView: View {
    @State private var selected = 1
    var body: some View {
        ZStack {
            TabView(selection: $selected) {
                ZStack(alignment: .bottomTrailing){
                    ChatView()
                    Image(systemName: "plus")
                        .padding()
                        .foregroundStyle(.white)
                        .background(.appBlue)
                        .clipShape(Circle())
                        .shadow(color: .appBlue.opacity(0.5), radius: 10, x: 0, y: 10)
                        .padding()
                }
                    .tabItem {
                        Image(selected == 1 ? "message_active" : "message_inactive")
                            .renderingMode(.template)
                        Text("Chat")
                    }
                    .tag(1)
                ChatView()
                    .tabItem {
                        Image(selected == 2 ? "cash_active" : "cash_inactive")
                            .renderingMode(.template)
                        Text("Cash")
                    }
                    .tag(2)
                ChatView()
                    .tabItem {
                        Image(selected == 3 ? "task_active" : "task_inactive")
                            .renderingMode(.template)
                        Text("Task")
                    }
                    .tag(3)
                ChatView()
                    .tabItem {
                        Image(selected == 4 ? "settings_active" : "settings_inactive")
                            .renderingMode(.template)
                        Text("Settings")
                    }
                    .tag(4)
            }
        }
        
    }
}

#Preview {
    ContentView()
}

struct ChatView: View {
    @State private var selected = 0
    let chats: [Chats] = [
        Chats(name: "Kwame Dross", message: "Don Drossy things", profilePicture: "profile2", unread: nil, type: .normal, time: Date()),
        Chats(name: "Chingilingi", message: "Chingilingi things", profilePicture: "profile3", unread: 2, type: .normal, time: Date()),
        Chats(name: "Neil Armstrong", message: "Why air me?", profilePicture: "profile4", unread: nil, type: .normal, time: Date()),
        Chats(name: "JJ Okocha", message: "JJ Okocha is Typing...", profilePicture: "profile4", unread: nil, type: .normal, time: Date()),
        Chats(name: "Jobless Lunatic", message: "Chale I dey search money oo", profilePicture: "profile1", unread: nil, type: .normal, time: Date()),
        Chats(name: "Bae<3", message: "I miss you so much baby", profilePicture: "profile2", unread: 6, type: .normal, time: Date()),
        Chats(name: "Angular Man", message: "Chale, you no get gari for there?", profilePicture: "profile3", unread: 10, type: .normal, time: Date()),
        Chats(name: "MR. B", message: "You no go come work?", profilePicture: "profile4", unread: nil, type: .normal, time: Date()),
        Chats(name: "IAM", message: "I dey love controversy pass", profilePicture: "profile1", unread: nil, type: .normal, time: Date()),
    ]
    
    var pinnedChats: [Chats]{
        chats.filter{$0.type == .pinned}
    }
    
    var allChats: [Chats]{
        chats.filter{$0.type == .normal}
    }
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color(Color.appBlue)
                .ignoresSafeArea()
            ZStack {
                RectangleGradients(color: Color.firstRect)
                    .offset(x: UIScreen.main.bounds.maxX - 250, y:  UIScreen.main.bounds.minY + 25)
                RectangleGradients(color: Color.secondRect)
                    .offset(x: UIScreen.main.bounds.maxX - 230, y:  UIScreen.main.bounds.minY + 50)
                RectangleGradients(color: Color.thirdRect)
                    .offset(x: UIScreen.main.bounds.maxX - 210, y:  UIScreen.main.bounds.minY + 75)
            }
            .ignoresSafeArea()
            
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    HStack {
                        Image("profile1")
                            .resizable()
                            .frame(width: 55, height: 55)
                            .aspectRatio(contentMode: .fill)
                            .clipShape(Circle())
                            .clipped()
                        
                        VStack(alignment:.leading) {
                            Text("Good Morning,")
                                .font(.subheadline)
                            
                            Text("Alexander Boakye👋")
                                .font(.body.bold())
                        }
                        .foregroundStyle(.white)
                        
                        Spacer()
                        
                        Image("notification")
                            .renderingMode(.template)
                            .foregroundStyle(.white)
                            .padding(10)
                            .background(.black.opacity(0.3))
                            .clipShape(Circle())
                        
                        
                    }
                    .padding(.bottom)
                    
                    HStack {
                        Text("Chat")
                            .font(.largeTitle.bold())
                            .foregroundStyle(.white)
                            .padding(.trailing, 7)
                        
                        Text("24")
                            .padding(8)
                            .foregroundStyle(.white)
                            .background(Color.extendedBg)
                            .clipShape(Circle())
                    }
                    .padding(.bottom)
                }
                .padding()
                
                ZStack(alignment: .top) {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(.extendedBg)
                    VStack(alignment: .leading){
                        HStack {
                            Text("Personal")
                                .padding(.horizontal, 20)
                                .padding(.vertical, 10)
                                .background(selected == 0 ? .appBlue : .clear)
                                .clipShape(RoundedRectangle(cornerRadius: 15.0))
                                .onTapGesture{
                                    withAnimation{
                                        selected = 0
                                    }
                                }
                            
                            Spacer()
                            
                            Text("Group")
                                .padding(.horizontal, 20)
                                .padding(.vertical, 10)
                                .background(selected == 1 ? .appBlue : .clear)
                                .clipShape(RoundedRectangle(cornerRadius: 15.0))
                                .onTapGesture{
                                    withAnimation{
                                        selected = 1
                                    }
                                }
                            
                            Spacer()
                            
                            Text("Community")
                                .padding(.horizontal, 20)
                                .padding(.vertical, 10)
                                .background(selected == 2 ? .appBlue : .clear)
                                .clipShape(RoundedRectangle(cornerRadius: 15.0))
                                .onTapGesture{
                                    withAnimation{
                                        selected = 2
                                    }
                                }
                        }
                        .font(.body.bold())
                        .foregroundStyle(.white)
                        .padding()
                        
                        ZStack(alignment: .top) {
                            RoundedRectangle(cornerRadius: 25)
                                .fill(.white)
                            VStack{
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(.appGrey)
                                    .frame(width: 100, height: 10)
                                    .padding()
                                
                                ScrollView {
                                    if !pinnedChats.isEmpty{
                                        ChatRows(heading: "PINNED", chats: pinnedChats)
                                    }
                                    
                                    if !allChats.isEmpty {
                                        ChatRows(heading: "ALL CHATS", chats: allChats)
                                    }
                                }
                                .padding(.horizontal)
                                .scrollIndicators(.hidden)
                                .padding(.bottom, 100)
                            }
                        }
                    }
                    
                }
                .ignoresSafeArea(edges: .bottom)
            }
            
        }
    }
}

struct RectangleGradients: View {
    var color: Color
    var body: some View {
        RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
            .fill(color)
            .foregroundStyle(.thinMaterial)
            .rotationEffect(Angle(degrees: 50))
            .frame(width: 400, height: 400)
    }
}

struct ChatRows: View {
    let heading: String
    let chats: [Chats]
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(heading)
                    .font(.headline)
                    .fontWeight(.medium)
                    .foregroundStyle(.appGrey)
                    
                VStack {
                    Divider()
                }
            }
            .padding(.bottom, 5)
            
            ForEach(chats){ chat in
                VStack {
                    HStack {
                        ZStack(alignment: .bottomTrailing) {
                            Image(chat.profilePicture)
                                .resizable()
                                .frame(width: 55, height: 55)
                                .aspectRatio(contentMode: .fill)
                                .clipShape(Circle())
                            .clipped()
                            
                            if chat.unread != nil {
                                Text("+\(chat.unread!)")
                                    .font(.caption2.bold())
                                    .foregroundStyle(.white)
                                    .padding(5)
                                    .background(.black)
                                    .clipShape(Circle())
                                    .overlay(Circle().stroke(.white, style: StrokeStyle(lineWidth: 2.0)))
                                
                            }
                        }
                        
                        VStack(alignment: .leading){
                            Text(chat.name)
                                .bold()
                                .padding(.bottom, 4)
                            if chat.message.contains(" is Typing...") {
                                Text(chat.message)
                                    .font(.subheadline)
                                    .italic()
                                    .foregroundStyle(.appBlue)
                            } else {
                                HStack {
                                    Image("double_tick")
                                        .renderingMode(.template)
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                        .foregroundStyle(.appBlue)
                                    
                                    Text(chat.message)
                                        .font(.subheadline)
                                        .fontWeight(.medium)
                                }
                            }
                        }
                        
                        Spacer()
                        
                        Text(chat.time.formatted(date: .omitted, time: .shortened))
                            .font(.subheadline)
                    }
                    Divider()
                }
                .padding(.bottom, 10)
            }
        }
    }
}
