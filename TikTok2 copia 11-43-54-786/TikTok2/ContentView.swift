//
//  ContentView.swift
//  TikTok2
//
//  Created by Fabiana Falgiano on 09/12/21.
//DEFINITIVOOOOOOO

import SwiftUI
import AVKit

var isVideoPlaying : Bool = false

struct ContentView: View {
    
    //Videos to be loaded
    let video1 = AVPlayer(url:  Bundle.main.url(forResource: "gianni", withExtension: "MOV")!)
    let video2 = AVPlayer(url:  Bundle.main.url(forResource: "earth", withExtension: "mp4")!)
    let video3 = AVPlayer(url:  Bundle.main.url(forResource: "positano", withExtension: "MOV")!)
    let video4 = AVPlayer(url:  Bundle.main.url(forResource: "stazione", withExtension: "MOV")!)
    let video5 = AVPlayer(url:  Bundle.main.url(forResource: "adavideo", withExtension: "MOV")!)
    let video6 = AVPlayer(url:  Bundle.main.url(forResource: "kitty", withExtension: "mp4")!)


    @State var structutente:[utente] = [utente(descrizione: "I made a new friend today 🦆", foto: "pp", nomeutente: "@giuanncachitarr",cazzate: "#lake #animals #followme", audiotiktok: "musica3"),utente(descrizione: "our home 🌎🌱", foto: "stark", nomeutente: "@beautylover",cazzate: "#respectNature", audiotiktok: "musica2"),utente(descrizione: "I am in love with Positano 😍", foto: "pp", nomeutente: "@worldtraveller",cazzate: "#cheorridoquestocodice", audiotiktok: "musica"),utente(descrizione: "What a beautiful sky today! 🌤", foto: "pp", nomeutente: "@falgiusss",cazzate: "#station #train", audiotiktok: "musica"), utente(descrizione: "Having fun at the Academy!", foto: "developer", nomeutente: "@appledeveloperacademy",cazzate: "#xcode #stressed #aiuto", audiotiktok: "musica"), utente(descrizione: "aaaaa", foto: "developer", nomeutente: "@cuteanimals",cazzate: "#cute #cat #animals", audiotiktok: "musica")  ]
    
    //States
    @State private var showModal = false
    @State var rotation = false
    @State private var isLiked = false
    @State private var isFollowed = false
    @State var showLike = false
    @State private var showHashtags = false
    @State var doubleTapped = false
     
    
    var opacityButton : Double {
        if showHashtags == true {
            return 0.5
        } else {
            return 1
        }
    }
    
    var opacity : Double {
        if showHashtags == true {
            return 1
        } else {
            return 0
        }
    }
    
    var numero : Int {
        if showHashtags == true {
            return -1
        } else {
            return 30
        }
    }
    
    let delay = 1
    var opacityLike : Double {
        if doubleTapped == true {
            
            return 1
        } else {
            return 0
        }
    }
    
    var body: some View {
        
        let avPlayers : [AVPlayer] = [self.video1, self.video2, self.video3,self.video4, self.video5, self.video6]
        
        ScrollView(.vertical) {
            //                ForEach(Array(zip(avPlayers,structutente)), id: \.self) { (player,change) in
            
            ForEach(avPlayers.enumeratedArray(), id: \.0) { index, player in
                ZStack{
                    AVPlayerControllerRepresented(player: player).onTapGesture {
                        if (isVideoPlaying == true) {
                            isVideoPlaying = false
                            player.pause()
                        } else {
                            isVideoPlaying = true
                            player.play()
                        }
                    }
                    .scaledToFill()
                        .onTapGesture(count: 2){
                            doubleTapped.toggle()
                            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(Int(delay))) {
                                // set your var here
                                doubleTapped = false
                            }
                        }

                        .frame(height: 890)
                    //                            .padding(.top, -CGFloat(  numero))
                    //                    .rotationEffect(.init(degrees: -90))
                    ZStack{      DoubleTap(doubleTapped: doubleTapped)
                            .opacity(opacityLike)
                            .scaleEffect(0.1)
                        VStack {
                            
                      
                            ZStack{
                                HStack {
                                    
                                Image("\(structutente[index].foto)")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 80)
                                .clipShape(Circle())
                                .overlay(Circle()
                                        .stroke(Color.white, lineWidth: 1.2))
                                    
                                Text("\(structutente[index].nomeutente)")
                                    .font(Font.headline.weight(.bold))
                                    .frame(width: 390, height: 100, alignment: .leading)
                                    .foregroundColor(.white)
                                    
                                    
                                }.padding(.top, 700)
                                    .frame(width: 400, alignment: .leading)
                                
                                FollowButton(isFollowed: $isFollowed)
                                    .font(.system(size: 20))
                                    .animation(Animation.linear(duration: 0.3))
                                    .foregroundColor(Color(.systemPink))
                                    .font(.system(size: 18))
                                    .font(Font.headline.weight(.bold))
                                    .padding(.top, 740)
//                                    .frame(width: 380, height: 10, alignment: .leading)

                            }
                            Text("\(structutente[index].descrizione)")
                                .font(Font.headline.weight(.regular))
                                .padding(.top, -95)
                                .foregroundColor(.white)
                                .frame(width: 300, height: 100, alignment: .leading)
                            
                        }.padding(.top, CGFloat(numero))
                    }
                    
                    Text("\(structutente[index].cazzate)")
                        .font(Font.headline.weight(.semibold))
                        .foregroundColor(.white)
                        .padding(.top, 675)
                        .frame(width: 300, alignment: .leading)
                        .opacity(opacity)
                    
                    Button {
                        withAnimation {
                            showHashtags.toggle()
                        }
                    } label: {
                        Label("see more", systemImage: "")
                    } .font(Font.headline.weight(.semibold))
                        .frame(width: 320, height: 100, alignment: .leading)
                        .padding(.top, 710)
                        .foregroundColor(.white)
                    
                    HStack {
                        
                        HStack {
                            
                            Button {
                            } label: {
                                Label("Follow", systemImage: "")
                            }.foregroundColor(.white)
                                .font(Font.headline.weight(.bold))
                                .padding(.leading, 120)
                                .frame(width: 200, height: 200,alignment: .center)
                            
                            Text("|")
                                .font(Font.headline.weight(.semibold))
                            
                            Button {
                            } label: {
                                Label("For You", systemImage: "")
                            }.foregroundColor(.white)
                                .font(Font.headline.weight(.bold))
                                .frame(width: 80, alignment: .center)
                        }
                        
                        Button {
                        } label: {
                            Label("", systemImage: "tv")
                        }.foregroundColor(.white)
                        
                            .frame(width: 100, alignment: .trailing)
                        
                    }.padding(.bottom, 730)
                    
                    
                    VStack(spacing: 15) {
                        VStack(spacing: 3) {
                            HeartButton(isLiked: $isLiked , doubleTapped : $doubleTapped )
                            Text(isLiked || doubleTapped ? "23" : "22")
                                .font(.system(size: 14))
                                .font(Font.headline.weight(.bold))
                                .foregroundColor(.white)
                                .animation(Animation.linear(duration: 1))
                        }
                        VStack(spacing: 3) {
                            Button {
                            } label: {
                                Label("", systemImage: "ellipsis.bubble")
                            }.foregroundColor(.white)
                            
                            Text("7674")
                                .font(.system(size: 14))
                                .foregroundColor(.white)
                                .font(Font.headline.weight(.bold))
                                .padding(.trailing, 5)
                        }
                        
                        VStack(spacing: 3)  {
                            Button {
                            } label: {
                                Label("", systemImage: "arrowshape.turn.up.right")
                            }.foregroundColor(.white)
                            Text("5321")
                                .font(.system(size: 14))
                                .foregroundColor(.white)
                                .font(Font.headline.weight(.bold))
                                .padding(.trailing, 5)

                        }
                        Button {
                        } label: {
                            Label("", systemImage: "ellipsis")
                        }.foregroundColor(.white)
                      
                        
                        Image("\(structutente[index].audiotiktok)")
                            .onAppear(perform: {
                                rotation = true;
                            })
                            .rotationEffect(rotation ? .zero : Angle.degrees(360))
                            .animation(
                                .linear(duration: 10).repeatForever(autoreverses: false), value:rotation)

                    }.font(.system(size: 28))
                        .frame(width: 420, height: 400, alignment: .trailing)
                        .padding(.top, 200)
                    
                }
            }
            
        }.edgesIgnoringSafeArea(.all)
            .frame(width: UIScreen.main.bounds.width, height: 1000)
            .rotationEffect(.degrees(180))
            .rotationEffect(.degrees(-180))
            .padding(.top,70)
        
    }
    
}

struct AVPlayerControllerRepresented : UIViewControllerRepresentable {
    var player : AVPlayer
    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let controller = AVPlayerViewController()
        controller.player = player
        controller.showsPlaybackControls = false
        return controller
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {

    }
    
}

extension Collection {
    func enumeratedArray() -> Array<(offset: Int, element: Self.Element)> {
        return Array(self.enumerated())
    }
}
