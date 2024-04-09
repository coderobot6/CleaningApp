import SwiftUI

struct HomepageView: View {
    @State private var isRectangle1Clicked: Bool = false

    var body: some View {
        VStack {
            Text("Where to clean")
                .font(.title)
                .padding()
            
            VStack {
                Rectangle()
                    .fill(isRectangle1Clicked ? Color.green : Color.blue)
                    .frame(width: 150, height: 150)
                    .padding()
                    .onTapGesture {
                        // Handle tap gesture for the first rectangle
                    }
                
                Rectangle()
                    .fill(Color.green)
                    .frame(width: 150, height: 150)
                    .padding()
                    .onTapGesture {
                        // Handle tap gesture for the second rectangle
                    }
                
                Rectangle()
                    .fill(Color.orange)
                    .frame(width: 150, height: 150)
                    .padding()
                    .onTapGesture {
                        // Handle tap gesture for the third rectangle
                    }
            }
        }
    }
}

struct HomepageView_Previews: PreviewProvider {
    static var previews: some View {
        HomepageView()
    }
}