//
//  PhotoLoadView.swift
//  DemoNavigation
//
//  Created by PRADYOT DHULIPALA on 1/27/22.
//

import SwiftUI

struct PhotoLoadView: View {
    
    @State var inputImage: UIImage?
    @State var image: Image?
    @State private var showSheet : Bool = false
    
    
    var body: some View {
        
        VStack {
            Text("Photo View")
                .padding(.bottom, 20)
            image?
                .resizable()
                .frame(width: 100, height: 120)
                .padding(.bottom, 20)
            
            Spacer()
            Button(action: {
                self.showSheet = true
            }) {
                Text("Load A Photo")
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.purple)
            .clipShape(RoundedRectangle(cornerRadius: 5))
        }.sheet(isPresented: $showSheet, onDismiss: nil){
            PhotoPicker(image: $inputImage)
        }.onChange(of: inputImage) {_ in loadImage()}
    }
    
    
    func loadImage() {
        guard let inputImage = inputImage else {
            return
        }
        self.image = Image(uiImage: inputImage)
    }
}

struct PhotoLoadView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoLoadView()
    }
}
