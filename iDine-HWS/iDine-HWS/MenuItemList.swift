import SwiftUI

typealias ListItem = Codable & Equatable & Identifiable

class MenuItemList<Item: ListItem>: ObservableObject {
    @Published var items = [Item]()

    func add(item: Item) {
        items.append(item)
    }

    func remove(item: Item) {
        if let index = items.firstIndex(of: item) {
            items.remove(at: index)
        }
    }
    
    func contains(item: Item) -> Bool {
        items.contains(item)
    }
}
