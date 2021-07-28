//
//  ListToShare.swift
//  Wollen
//
//  Created by Eduarda Senna on 28/07/21.
//

import SwiftUI

struct ListToShare: View {
    
    
    
    var body: some View {
        VStack {
            Text("OI")
            Button(action: {
                actionSheet1()
            }, label: {
                Image(systemName: "square.and.arrow.up")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 36, height: 36)
        })
        }
    }
}

func actionSheet1() {
//    guard let urlShare = URL(string: "https://developer.apple.com/xcode/swiftui/") else { return }
//    let activityVC = UIActivityViewController(activityItems: [urlShare], applicationActivities: nil)
//    UIApplication.shared.windows.first?.rootViewController?.present(activityVC, animated: true, completion: nil)
    
    var textToShare = "oi"
    let items = [textToShare]
    let activityVC = UIActivityViewController(activityItems: items, applicationActivities: nil)
    UIApplication.shared.windows.first?.rootViewController?.present(activityVC, animated: true, completion: nil)
}

struct ListToShare_Previews: PreviewProvider {
    static var previews: some View {
        ListToShare()
    }
}
