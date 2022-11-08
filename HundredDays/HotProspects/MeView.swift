//
//  MeView.swift
//  HundredDays
//
//  Created by Codebucket on 07/11/22.
//
import CoreImage
import CoreImage.CIFilter
import SwiftUI

struct MeView: View {
    @State private var name = "Dipak"
    @State private var emailAddress = "info@dipak.co.in"
    
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    
    var body: some View {
        NavigationView {
            Form{
                TextField("Name", text: $name)
                    .textContentType(.name)
                    .font(.title)
                TextField("Email address", text: $emailAddress)
                    .textContentType(.emailAddress)
                    .font(.title)
                
                Image(uiImage: generateQRCode(from: "\(name)\n\(emailAddress)"))
                    .resizable()
                    .interpolation(.none)
                    .scaledToFit()
                    .frame(width: 200, height: 200)
            }
            .navigationTitle("Your code")
        }
    }
    
    func generateQRCode(from string: String) -> UIImage{
        filter.message = Data(string.utf8)
        
        if let outputImage = filter.outputImage{
            if let cgimg = context.createCGImage(outputImage, from: outputImage.extent){
                return UIImage(cgImage: cgimg)
            }
        }
        return UIImage(systemName: "xmark.circle") ?? UIImage()
    }
    
    
}

struct MeView_Previews: PreviewProvider {
    static var previews: some View {
        MeView()
    }
}
