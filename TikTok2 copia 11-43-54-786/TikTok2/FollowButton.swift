//
//  FollowButton.swift
//  TikTok2
//
//  Created by Fabiana Falgiano on 11/12/21.
//

import SwiftUI

struct FollowButton: View {
   
    @Binding var isFollowed : Bool
    private let animationDuration2 = 0.1
    private let animationDuration3 = 0.3

    private var animationScale2: CGFloat {
        isFollowed ? 0.7 : 1.3
    }
    @State private var animate2 = false
    
    var body: some View {
        ZStack{Color.white
        Button(action: {
            self.animate2 = true
            DispatchQueue.main.asyncAfter(deadline: .now() + self.animationDuration2, execute: {             self.animate2 = false
                self.isFollowed.toggle()
                
            })
            
        },
               label: {
            
            Image(systemName: isFollowed ? "checkmark.circle.fill" : "plus.circle.fill")
//                .foregroundColor(isFollowed ? .pink : .pink)
                .foregroundColor(isFollowed ? Color(.systemPink) : Color(.systemPink))
        })
            .scaleEffect(animate2 ? animationScale2: 1)
            .animation(.linear(duration: Double(animationDuration3)))
        }   .frame(width: 200, height: 20, alignment: .leading)
            .clipShape(Circle())
            .padding(.trailing,360)
    }
}
    
    
    
    
//    
//struct FollowButton_Previews: PreviewProvider {
//    static var previews: some View {
//        FollowButton()
//    }
//}
