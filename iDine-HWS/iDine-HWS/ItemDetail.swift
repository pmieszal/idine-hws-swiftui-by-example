import SwiftUI

struct ItemDetail: View {
    let item: MenuItem
    
    @EnvironmentObject var order: Order
    @EnvironmentObject var favorite: Favorite
    
    private var isFavorite: Bool {
        favorite.contains(item: item)
    }
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                Image(item.mainImage)
                    .resizable()
                    .scaledToFit()
                Text("Photo: \(item.photoCredit)")
                    .padding(4)
                    .background(Color.black)
                    .font(.caption)
                    .foregroundColor(.white)
                    .offset(x: -5, y: -5)
            }
            
            Text(item.description)
                .padding()
            
            Spacer()
                
            Button("Add to order") {
                order.add(item: item)
            }
            .font(.headline)
            .padding()
            .background(Color.accentColor)
            .foregroundColor(.white)
            .cornerRadius(6)
            .shadow(color: Color.black.opacity(0.5), radius: 8)
            
            Spacer().frame(height: 20)
        }
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            Button(action: {
                if isFavorite {
                    favorite.remove(item: item)
                } else {
                    favorite.add(item: item)
                }
            }, label: {
                if isFavorite {
                    Image(systemName: "star.fill")
                } else {
                    Image(systemName: "star")
                }
            })
        }
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ItemDetail(item: MenuItem.example)
                .environmentObject(Order())
                .environmentObject(Favorite())
        }
    }
}
