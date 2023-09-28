//
//  AFButton.swift
//  SwiftUI-AppleFrameworks
//
//  Created by Amr Fawaz on 27/09/2023.
//

import SwiftUI


struct AFButton: View {
    let title: String
    var body: some View {
        Text(title)
            .font(.title2)
            .fontWeight(.semibold)
            .frame(width: 200, height: 50)
            .foregroundStyle(.white)
            .background(Color.red)
            .cornerRadius(10)
    }
}

#Preview {
    AFButton(title: "Test")
}
