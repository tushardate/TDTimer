//
//  TestView.swift
//  TDTimer
//
//  Created by TUSHAR DATE on 3/4/24.
//

import SwiftUI

struct TimerTest {
    
    var minutes: Int
    var seconds: Int
    
    var displayTime: String {
        let total = minutes * 60 + seconds
        var mins = total / 60
        var secs = total % 60
        return String(format: "%02d:%02d", mins, secs)
    }

    
    func normalizeTime() -> String {
        let total = minutes * 60 + seconds
        var mins = total / 60
        var secs = total % 60
        return "\(mins):\(secs)"
    }
    
}

struct TestView: View {
    
    @State var timer: TimerTest = TimerTest(minutes: 1, seconds: 34)
    
    
    var body: some View {
        Text("\(timer.minutes)")
        Text("\(timer.seconds)")
        Text(timer.displayTime)
        
        Button {
            timer.minutes = Int.random(in: 1..<5)
            timer.seconds = Int.random(in: 1..<100)
        } label: {
            Text("Change")
        }
        
    }
}

#Preview {
    TestView()
}
