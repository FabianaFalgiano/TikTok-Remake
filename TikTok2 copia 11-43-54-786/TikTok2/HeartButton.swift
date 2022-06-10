//
//  HeartButton.swift
//  TikTok2
//
//  Created by Fabiana Falgiano on 09/12/21.
//

import SwiftUI

struct HeartButton: View {
    @State var temp = false
    @Binding var isLiked : Bool
    @Binding   var doubleTapped : Bool
    let impact = UIImpactFeedbackGenerator(style: .light)
    let feedback = UINotificationFeedbackGenerator()
    private let animationDuration = 0.1
    private var animationScale: CGFloat {
        isLiked ? 0.7 : 1.3
    }
    @State private var animate = false
    
    var body: some View {
       
        Button(action: {
            feedback.notificationOccurred(.success)
            impact.impactOccurred()
            print("messo like")
            self.animate = true
            DispatchQueue.main.asyncAfter(deadline: .now() + self.animationDuration, execute: {             self.animate = false
                self.isLiked.toggle()
            })
            
        },
               label: {
            Image(systemName: isLiked || doubleTapped ? "heart.fill" : "heart")
                .foregroundColor(isLiked || doubleTapped ? .red : .white)
        }) .onChange(of: doubleTapped, perform: {item in
            isLiked = true})
            .scaleEffect(animate ? animationScale: 1)
            .animation(.easeIn(duration: animationDuration))
        
           
    }
}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
