import SwiftUI
import WatchKit

struct ContentView: View {
    @State private var currentTime = Date()
    @State private var heartRate: Int? = nil
    @State private var stepCount: Int? = nil
    @State private var batteryLevel = WKInterfaceDevice.current().batteryLevel

    
    /*
        TODO: Implement health values from Apple HealthKit
     */
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text("{")
                .font(.system(size: 12, design: .monospaced))
                .foregroundColor(.green)

            HStack(spacing: 0) {
                 Text(" \"date\":")
                    .font(.system(size: 12, design: .monospaced))
                    .foregroundColor(.white)
                Text(" \"\(formattedDate)\"")
                   .font(.system(size: 12, design: .monospaced))
                   .foregroundColor(.yellow)
                Text(",")
                    .font(.system(size: 12, design: .monospaced))
                    .foregroundColor(.white)
            }
             
            HStack(spacing: 0) {
                 Text(" \"time\":")
                    .font(.system(size: 12, design: .monospaced))
                    .foregroundColor(.white)
                Text(" \"\(formattedTime)\"")
                   .font(.system(size: 12, design: .monospaced))
                   .foregroundColor(.yellow)
                Text(",")
                    .font(.system(size: 12, design: .monospaced))
                    .foregroundColor(.white)
            }
            
            HStack(spacing: 0) {
                Text(" \"battery\":")
                    .font(.system(size: 12, design: .monospaced))
                    .foregroundColor(.white)
                Text(" \"\(Int(abs(batteryLevel) * 100))%\"")
                   .font(.system(size: 12, design: .monospaced))
                   .foregroundColor(.yellow)
                Text(",")
                    .font(.system(size: 12, design: .monospaced))
                    .foregroundColor(.white)
            }
            
            HStack(spacing: 0) {
                Text(" \"mood\":")
                    .font(.system(size: 12, design: .monospaced))
                    .foregroundColor(.white)
                Text(" \"😎\"")
                   .font(.system(size: 14, design: .monospaced))
                   .foregroundColor(.yellow)
                Text(",")
                    .font(.system(size: 12, design: .monospaced))
                    .foregroundColor(.white)
            }
            
            HStack(spacing: 0) {
                Text(" \"health\":")
                    .font(.system(size: 12, design: .monospaced))
                    .foregroundColor(.white)
                Text(" {")
                    .font(.system(size: 12, design: .monospaced))
                    .foregroundColor(.green)
            }
            
            HStack(spacing: 0) {
                Text("   \"bpm\":")
                    .font(.system(size: 12, design: .monospaced))
                    .foregroundColor(.white)
                Text(" 98")
                    .font(.system(size: 12, design: .monospaced))
                    .foregroundColor(.blue)
                Text(",")
                    .font(.system(size: 12, design: .monospaced))
                    .foregroundColor(.white)
            }

            HStack(spacing: 0) {
                Text("   \"steps\":")
                    .font(.system(size: 12, design: .monospaced))
                    .foregroundColor(.white)
                Text(" 1422")
                    .font(.system(size: 12, design: .monospaced))
                    .foregroundColor(.blue)
                Text(",")
                    .font(.system(size: 12, design: .monospaced))
                    .foregroundColor(.white)
            }
            
            HStack(spacing: 0) {
                Text(" }")
                    .font(.system(size: 12, design: .monospaced))
                    .foregroundColor(.green)
                Text(",")
                    .font(.system(size: 12, design: .monospaced))
                    .foregroundColor(.white)
            }
            
 
            HStack(spacing: 0) {
                Text("}")
                    .font(.system(size: 12, design: .monospaced))
                    .foregroundColor(.green)
                Text(" // kezdev v0.3")
                    .font(.system(size: 10, design: .monospaced))
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .onAppear {
            startTimer()
        }
    }


    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE, MMM d"
        return formatter.string(from: currentTime)
    }


    var formattedTime: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        return formatter.string(from: currentTime)
    }

    func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            currentTime = Date()
            batteryLevel = WKInterfaceDevice.current().batteryLevel
        }
    }
}
