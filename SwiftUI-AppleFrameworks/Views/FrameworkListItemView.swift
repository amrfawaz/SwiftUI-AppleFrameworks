//
//  FrameworkListItemView.swift
//  SwiftUI-AppleFrameworks
//
//  Created by Amr Fawaz on 27/09/2023.
//

import SwiftUI

struct FrameworkListItemView: View {
    let framework: Framework
    var body: some View {
        HStack {
            Image(framework.imageName)
                .resizable()
                .frame(width: 90, height: 90)
            
            Text(framework.name)
                .font(.title2)
                .fontWeight(.semibold)
                .scaledToFit()
                .minimumScaleFactor(0.6)
        }
        .padding()
    }
}

#Preview {
    FrameworkListItemView(framework: MockData.sampleFramework)
}
