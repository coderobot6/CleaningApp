//
//  InstructionView.swift
//  CleaningApp
//
//  Created by Triet Tran on 5/2/24.
//

import SwiftUI

struct InstructionView: View {
    var body: some View {
      
      VStack {
            Image("supplies")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 200, height: 200)
                .padding(.bottom, 300)
          
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
