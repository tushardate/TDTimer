//
//  TimerViewModel.swift
//  TDTimer
//
//  Created by TUSHAR DATE on 3/4/24.
//

import SwiftUI

struct TimerModel: Identifiable {
    let id: String = UUID().uuidString
    var minutes: Int
    var seconds: Int
    var totalSeconds: Int
    var displayTime: String {
        return String(format: "%02d:%02d", self.totalSeconds/60, self.totalSeconds%60)
    }
    
    private var timer = Timer()
    
    init(minutes: Int, seconds: Int) {
        self.minutes = minutes
        self.seconds = seconds
        self.totalSeconds = (self.minutes * 60) + self.seconds
    }
    
    mutating func addTime(value: Int) {
        seconds += value
    }
    
    mutating func reset() {
        print("resetting")
        timer.invalidate()
        self.totalSeconds = (self.minutes * 60) + self.seconds
    }
    
    mutating func start() {
        print("starting")
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { time in
            print("\(time)")
//            self.totalSeconds -= 1
            
//            if(self.totalSeconds <= 0) {
//                stop()
//            }
        })
    }
    
    mutating func stop() {
        timer.invalidate()
    }
    
}
//
//struct Timer: Identifiable {
//    let id: String = UUID().uuidString
//
//    var totalSeconds: Int {
//        return minutes * 60 + seconds
//    }
//
//    var minutes: Int {
//        didSet {
//            normalizeTime()
//        }
//    }
//
//    var seconds: Int {
//        didSet {
//            print("setting")
//            normalizeTime()
//            print("done")
//        }
//    }
//
//    var displayTime: String {
//        let minString = String(format: "%02d", minutes)
//        let secString = String(format: "%02d", seconds)
//        return "\(minString):\(secString)"
//    }
//
//    mutating func normalizeTime() {
//        let total = totalSeconds
//        minutes = total / 60
//        seconds = total % 60
//    }
//
//    init(minutes: Int, seconds: Int) {
//        self.minutes = minutes
//        self.seconds = seconds
//    }
//}


class TimerViewModel: ObservableObject {
    @Published var timers: [TimerModel] = [TimerModel(minutes: 0, seconds: 15), TimerModel(minutes: 0, seconds: 30), TimerModel(minutes: 0, seconds: 45), TimerModel(minutes: 1, seconds: 0), TimerModel(minutes: 1, seconds: 30)]
    
    func addTimer(timer: TimerModel) {
        timers.append(timer)
    }
}
