import SwiftUI

@main
struct iDineApp: App {
    @StateObject var order = Order()
    @StateObject var favorite = Favorite()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(order)
                .environmentObject(favorite)
        }
    }
}
