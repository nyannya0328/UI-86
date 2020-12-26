//
//  ContentView.swift
//  UI-86
//
//  Created by にゃんにゃん丸 on 2020/12/26.
//

import SwiftUI

let gradient = LinearGradient(gradient: .init(colors: [Color.red.opacity(0.3),Color.purple.opacity(0.3)]), startPoint: .topTrailing, endPoint: .bottomTrailing)



struct ContentView: View {
    var body: some View {
        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home : View {
    var body: some View{
        
        VStack{
            
            
            HStack{
                
                Text("All EVERYONE")
                    .font(.system(size: 30, weight: .bold))
                    .foregroundColor(.black)
                
                Spacer()
            }
            .padding()
           .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)
            .background(Color.white)
            .shadow(color: Color.black.opacity(0.18), radius: 5, x: 0, y: 5)
            .zIndex(0)
            
            GeometryReader{mainView in
                
                ScrollView{
                    VStack(spacing:15){
                        
                        
                        ForEach(albums,id:\.name){index in
                            
                            GeometryReader{item in
                                AlbumView(album: index)
                                    .scaleEffect(scaleValue(mainFrame: mainView.frame(in: .global).minY, minY: item.frame(in: .global).minY),anchor:.topTrailing)
                                
                                    .opacity(Double(scaleValue(mainFrame: mainView.frame(in: .global).minY, minY: item.frame(in: .global).minY)))
                                
                                
                            }
                            .frame(height: 100)



                        }
                    }
                    .padding(.horizontal)
                    .padding(.top,25)
                    
                    
                    
                }
                .zIndex(1)
            }
        }
        .background(Color.white.opacity(0.3).edgesIgnoringSafeArea(.all))
        .ignoresSafeArea(edges: .top)
    
        
    }
    
    func scaleValue(mainFrame : CGFloat,minY : CGFloat) -> CGFloat{
        
       
            
            let scale = (minY - 25) / mainFrame
            
        if scale > 1{
            
            return 1
        }
        else{return scale}
            
            
           
            
        
        
        
        
    }
}

struct AlbumView : View {
    
    var album : album
    var body: some View{
        HStack{
            
            Image(album.cover)
                .resizable()
                .frame(width: 100, height: 100)
                .cornerRadius(10)
            
            VStack{
                
                
                Text(album.name)
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
                
                Text(album.author)
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
                
                
            }
            .padding(.leading)
            
            Spacer(minLength: 0)
            
            
        }
        .background(gradient)
        .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 5)
        
        
    }
}
struct album {
    var name : String
    var author : String
    var cover : String
}

var albums = [

    album(name: "Hey Baby", author: "Kid", cover: "p1"),
    album(name: "rever", author: "Risa", cover: "p2"),
    album(name: "あ〜ん", author: "Baby", cover: "p3"),
    album(name: "2020", author: "Fire", cover: "p4"),
    album(name: "Cool", author: "Ema", cover: "p5"),
    album(name: "にゃんクリスマス", author: "Cat", cover: "p6"),
    album(name: "えさくれ", author: "lion", cover: "p7"),
    album(name: "Guys", author: "Lions", cover: "p8"),
    album(name: "じ〜", author: "Catman", cover: "p9"),
    album(name: "青春", author: "チーター", cover: "p10"),
    album(name: "みかんfire", author: "みかんGirl", cover: "p11"),
    album(name: "ぐる〜", author: "Eye lion", cover: "p12"),
    album(name: "ダラ〜", author: "Dog", cover: "p13"),
    album(name: "ディズニー", author: "ハロウィン", cover: "p14"),
    album(name: "Kiss", author: "Cuple", cover: "p15"),
    
    
    
    
    
    
]

