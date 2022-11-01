//
//  Instafilter.swift
//  HundredDays
//
//  Created by Codebucket on 22/10/22.
//
import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI

struct Instafilter: View {
    @State private var image: Image?
    
    var body: some View {
        VStack{
            image?
                .resizable()
                .scaledToFit()
        }
        .onAppear(perform: loadImage)
        
    }
    
    func loadImage(){
        guard let inputeImage = UIImage(named: "aldrin") else { return }
        let beginImage = CIImage(image: inputeImage)
        
        let context  = CIContext()
        let currentFilter = CIFilter.sepiaTone()
        currentFilter.inputImage = beginImage
        currentFilter.intensity = 1
        
        guard let outputImage = currentFilter.outputImage else {return}
        
        if let cgimg = context.createCGImage(outputImage, from: outputImage.extent){
            let uiImage = UIImage(cgImage: cgimg)
            image = Image(uiImage: uiImage)
        }
    }
}

struct Instafilter_Previews: PreviewProvider {
    static var previews: some View {
        Instafilter()
    }
}
