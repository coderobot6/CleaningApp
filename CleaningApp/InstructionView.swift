//
//  InstructionView.swift
//  CleaningApp
//
//  Created by Triet Tran on 5/2/24.
//

import SwiftUI

struct ResizedImage: View {
    let imageName: String

    var body: some View {
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 335, height: 260)
            .clipShape(RoundedRectangle(cornerRadius: 40))
    }
}


struct InstructionView: View {
    var body: some View {
      
      VStack {
        Text("What You'll Need:")
            .font(.system(size: 30))
            .fontWeight(.heavy)
            .padding(.bottom, 10)
            .padding(.top, 90)
            .padding(.trailing, 80)
            .foregroundColor(Color(hex: "CD6A52")) 
        
        Image("supplies")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 200, height: 200)
            .padding(.bottom, 20)

        Text("Instructions:")
            .font(.system(size: 30))
            .fontWeight(.heavy)
            .padding(.trailing, 150)
            .foregroundColor(Color(hex: "CD6A52"))    
        
        TabView{
            ResizedImage(imageName: "instr1")
            ResizedImage(imageName: "instr2")
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always)) 
        Spacer()
            .frame(height: 10)
        .padding(.bottom, 20)
        
        Text("Important Tip!")
            .font(.system(size: 30))
            .fontWeight(.heavy)
            .padding(.trailing, 120)
            .foregroundColor(Color(hex: "CD6A52")) 
        
        HStack{
            Text("*")
                .font(.system(size: 80))
                .padding(.leading, 30)
                .padding(.bottom, 20)
                .fontWeight(.heavy)
                .foregroundColor(Color(hex: "CD6A52")) 

            Text("When dealing with chemicals, use gloves 🧤")
                .font(.system(size: 23))
                .padding(.trailing, 40)
                .padding(.bottom, 24)
                .fontWeight(.heavy)
                .foregroundColor(Color(hex: "FFFDFD")) 
        }
      }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(hex: "B1CEAA"))
        .edgesIgnoringSafeArea(.all)
        
    }
}

struct InstructionView_Previews: PreviewProvider {
    static var previews: some View {
        InstructionView()
            
    }
}


#Preview {
    InstructionView()
    
}
