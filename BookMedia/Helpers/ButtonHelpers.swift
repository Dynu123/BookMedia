//
//  ButtonHelpers.swift
//  BookMedia
//
//  Created by Dyana Varghese on 28/10/22.
//

import SwiftUI

struct SolidButton: View {
    var title: String
    var action: () -> Void
    var body: some View {
        Button(action: action, label: {
            Text(title)
                .font(.system(.body, design: .rounded))
                .foregroundColor(.white)
                .bold()
                .padding()
                .frame(minWidth: 0, maxWidth: .infinity)
                .background(Color.theme)
                .cornerRadius(10)
        })
    }
}
