import SwiftUI

struct FavoriteView: View {
    @EnvironmentObject var favorite: Favorite
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(favorite.items) { item in
                        NavigationLink(destination: ItemDetail(item: item)) {
                            ItemRow(item: item)
                        }
                    }
                    .onDelete(perform: deleteItems)
                }
            }
            .navigationTitle("Favorite")
            .listStyle(InsetGroupedListStyle())
            .toolbar {
                EditButton()
                    .disabled(favorite.items.isEmpty)
            }
        }
    }
    
    func deleteItems(at offsets: IndexSet) {
        favorite.items.remove(atOffsets: offsets)
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView().environmentObject(Favorite())
    }
}
