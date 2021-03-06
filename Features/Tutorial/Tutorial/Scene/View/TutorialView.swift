//
//  TutorialView.swift
//  Tutorial
//
//  Created by Phittaya Wongsuwan on 21/4/2565 BE.
//

#if !TESTING
import SwiftUI

struct TutorialView: View {
    
    var tutorial: TutorialModel

    var body: some View {
        VStack(spacing: 20) {
            Image(uiImage: self.getImage())
                .resizable()
                .scaledToFit()
                .padding()
                .cornerRadius(30)
                .background(.gray.opacity(0.1))
                .cornerRadius(10)
                .padding()
            
            VStack {
                Text(tutorial.name ?? "")
                    .font(.title)
                    .lineLimit(1)
                
                Text(tutorial.description ?? "")
                    .font(.subheadline)
                    .lineLimit(3)
            }
            .frame(width: 300)
        }
    }
    
    private func getImage() -> UIImage {
        guard let imageUrl = self.tutorial.imageUrl,
                let rawImageAsset = RawImageAsset(rawValue: imageUrl) else {
            return UIImage()
        }
        return ImageAsset.load(rawImageAsset)
    }
}

struct TutorialView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialView(tutorial: TutorialModel(id: "1",
                                             name: "name",
                                             description: "description",
                                             imageUrl: "work"))
    }
}
#endif


