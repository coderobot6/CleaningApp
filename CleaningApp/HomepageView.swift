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
                    .fill(Color.blue)
                    .border(isRectangle1Clicked ? Color.gray : Color.clear, width: 2)
                    .frame(width: 270, height: 125)
                    .cornerRadius(20)
                    .padding()
                    .overlay(
                        Image("shower")
                            .resizable()
                            .frame(width: 262 , height: 120)
                            .aspectRatio(contentMode: .fit)
                    )
                    .onTapGesture {
                        isRectangle1Clicked.toggle()
                        // Handle tap gesture for the first rectangle
                    }
                
                Rectangle()
                    .fill(Color.green)
                    .frame(width: 270, height: 125)
                    .padding()
                    .overlay(
                        Image("bedroom")
                            .resizable()
                            .frame(width: 183 , height: 90)
                            .aspectRatio(contentMode: .fit)
                    )
                    .onTapGesture {
                        // Handle tap gesture for the second rectangle
                    }
                
                Rectangle()
                    .fill(Color.orange)
                    .frame(width: 250, height: 150)
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
