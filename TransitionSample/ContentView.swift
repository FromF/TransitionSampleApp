//
//  ContentView.swift
//  TransitionSample
//
//  Created by 藤治仁 on 2024/01/27.
//

import SwiftUI

struct ContentView: View {
    @State private var flag = true
    
    var body: some View {
        VStack {
            if flag {
                ZStack {
                    Color.orange
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 100, height: 100)
                }
            } else {
                ZStack {
                    Color.yellow
                    Circle()
                        .fill(Color.red)
                        .frame(width: 100, height: 100)
                }
            }
        }
        .transition(.opacity)
        .onAppear {
            _ = Timer.scheduledTimer(withTimeInterval: 5, repeats: true, block: { timer in
                withAnimation(.easeInOut(duration: 2)) {  // アニメーションの持続時間を2秒に設定
                    print(">>Debug \(#fileID) \(#line)  \(Date())")
                    self.flag.toggle()
                    print(">>Debug \(#fileID) \(#line)  \(Date())")
                }
            })
        }
    }
}

#Preview {
    ContentView()
}
