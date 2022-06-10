//
//  DoubleTap.swift
//  TikTok2
//
//  Created by Fabiana Falgiano on 15/12/21.
//

import SwiftUI

struct DoubleTap: View {
    
     var doubleTapped = false
    
    private let animationDuration: Double = 0.1
    private var animationScale: CGFloat {
        doubleTapped ? 0.7 : 1.3
    }
    @State private var animateDoubleTap = false
    
    
    
    var body: some View {
        Button(action: {
            self.animateDoubleTap = true
            
            DispatchQueue.main.asyncAfter(deadline: .now() + self.animationDuration, execute: {
                self.animateDoubleTap = false
                
            })
            
            
        }, label: {
            Image(systemName: doubleTapped ? "heart.fill" : "")
                .resizable()
                .aspectRatio(contentMode: .fit)
        })
            .scaleEffect(animateDoubleTap ? animationScale : 1)
            .animation(.easeIn(duration: animationDuration))

    }
}

struct DoubleTap_Previews: PreviewProvider {
    static var previews: some View {
        DoubleTap()
    }
}
