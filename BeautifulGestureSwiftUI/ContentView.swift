//
//  ContentView.swift
//  BeautifulGestureSwiftUI
//
//  Created by 矢守叡 on 2019/12/12.
//  Copyright © 2019 yamolean. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var show = false
    @State var viewState = CGSize.zero
    
    var body: some View {
        ZStack {
            SimpleView()
                .background(show ? Color.blue : Color.green)
                .cornerRadius(10)
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -200 : -40)
                .offset(viewState)
                .scaleEffect(0.9)
                .rotationEffect(Angle(degrees: show ? 15 : 0))
                .animation(.easeInOut(duration: 0.6))
            
            SimpleView()
                .background(show ? Color.yellow : Color.pink)
                .cornerRadius(10)
                .shadow(radius: 20)
                .scaleEffect(0.95)
                .offset(x: 0, y: show ? -100 : -20)
                .offset(viewState)
                .rotationEffect(Angle(degrees: show ? 10 : 0))
                .animation(.easeInOut(duration: 0.4))
            
            SimpleView()
                .background(Color.black)
                .cornerRadius(10)
                .shadow(radius: 20)
                .offset(viewState)
                .animation(.spring())
                .rotationEffect(Angle(degrees: show ? 5 : 0))
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            self.viewState = value.translation
                            self.show = true
                    }
                    .onEnded {_ in
                        self.viewState = .zero
                        self.show = false
                    }
            )
        }
    }
}

//ここにcornerRadius、shadow、書いてもプロパティが反映されない
struct SimpleView : View {
    var body: some View {
        Text("SimpleView")
            .frame(width: 340, height: 220.0)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
