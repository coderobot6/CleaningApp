import SwiftUI

struct HomepageView: View {
    //@State private var isRectangle1Clicked: Bool = false
    
    var body: some View {
        NavigationView{
        VStack {
            Text("Where to clean")
                .font(.system(size: 40))
                .padding()
                .fontWeight(.heavy)
                .foregroundColor(Color(hex: "CD6A52")) 

            
            VStack {
                NavigationLink(destination: InstructionView()) {
                
                Rectangle()
                    .fill(Color(hex: "A0C397"))
                    //.border(isRectangle1Clicked ? Color.gray : Color.clear, width: 2)
                    .frame(width: 270, height: 125)
                    .cornerRadius(20)
                    .padding()
                    .overlay(
                        Image("shower")
                            .resizable()
                            .frame(width: 270 , height: 125)
                            .aspectRatio(contentMode: .fit)
                    )
                    
            }
                Rectangle()
                    .fill(Color(hex: "A0C397"))
                    .frame(width: 270, height: 125)
                    .cornerRadius(20)
                    .padding()
                    .overlay(
                        Image("bedroom")
                            .resizable()
                            .frame(width: 183 , height: 90)
                            .aspectRatio(contentMode: .fit))
                    .onTapGesture {
                        // Handle tap gesture for the second rectangle
                    }
                
                Rectangle()
                    .fill(Color(hex: "A0C397"))
                    .frame(width: 270, height: 125)
                    .cornerRadius(20)
                    .padding()
                    .overlay(
                        Image("kitchen")
                            .resizable()
                            .frame(width: 111 , height: 111)
                            .aspectRatio(contentMode: .fit))
                    .onTapGesture {
                        // Handle tap gesture for the third rectangle
                    }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(hex: "B1CEAA"))
        .edgesIgnoringSafeArea(.all)
        }
    }
}

struct HomepageView_Previews: PreviewProvider {
    static var previews: some View {
        HomepageView()
    }
}
