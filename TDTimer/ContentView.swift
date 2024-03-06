//
//  ContentView.swift
//  TDTimer
//
//  Created by TUSHAR DATE on 3/4/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var timervm: TimerViewModel = TimerViewModel()
    @State private var currentTimer: TimerModel = TimerModel(minutes: 0, seconds: 0)
    
    var columns: [GridItem] = [GridItem.init(spacing: Config.spacing), GridItem.init(spacing: Config.spacing)]
    
    var body: some View {
        VStack(alignment: .leading, spacing: Config.spacing) {
            
            TimerDisplayView(currentTimer: $currentTimer)
        
            ScrollView {
                LazyVGrid(columns: columns, spacing: Config.spacing, content: {
                    ForEach(timervm.timers.indices, id: \.self) { index in
                        TimerButton(timer: $timervm.timers[index], currentTimer: $currentTimer)
                    }
                    AddTimerView()
                })
                
            }
            
            ResetTimerView(currentTimer: $currentTimer)
        }
        .padding(.horizontal, Config.spacing)
        .background(Color.black)
    }
}

struct TimerButton: View {
    @Binding var timer: TimerModel
    @Binding var currentTimer: TimerModel
    
    var body: some View {
        Button(action: {
            currentTimer = timer
            currentTimer.start()
        }, label: {
            Text("\(timer.displayTime)")
                .font(.title3)
                .frame(maxWidth: .infinity, minHeight: Config.buttonHeight)
                .background(Color.tdgray)
                .foregroundColor(.white)
        })
        .cornerRadius(Config.cornerRadius)
        .contextMenu(ContextMenu(menuItems: {
            Text("Menu Item 1")
            Text("Menu Item 2")
            Text("Menu Item 3")
        }))
    }
}

struct AddTimerView: View {
    var body: some View {
        Button(action: {
            print("add button")
        }, label: {
            Image(systemName: "plus")
                .font(.system(size: 25))
                .frame(maxWidth: .infinity, minHeight: Config.buttonHeight)
                .background(Color.tdgray)
                .foregroundColor(.white)
        })
        .cornerRadius(Config.cornerRadius)
    }
}

struct ResetTimerView: View {
    @Binding var currentTimer: TimerModel
    var body: some View {
        Button(action: {
            currentTimer.reset()
        }, label: {
            Text("Reset")
                .font(.title)
                .frame(maxWidth: .infinity, minHeight: Config.resetButtonHeight)
                .background(Color.tdred)
                .foregroundColor(.white)
        })
        .cornerRadius(Config.cornerRadius)
    }
}

struct TimerDisplayView: View {
    @Binding var currentTimer: TimerModel
    var body: some View {
        Text(currentTimer.displayTime)
            .frame(maxWidth: .infinity, maxHeight: Config.timerDisplayHeight)
            .foregroundColor(.white)
            .padding(.maximum(15, 0))
            .background(Color.tdred)
            .font(.system(size: 700))
            .minimumScaleFactor(0.01)
            .kerning(-5)
            .cornerRadius(Config.cornerRadius)
    }
}

#Preview {
    ContentView()
}
