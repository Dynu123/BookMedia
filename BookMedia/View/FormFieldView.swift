//
//  FormFieldView.swift
//  BookMedia
//
//  Created by Dyana Varghese on 26/10/22.
//

import SwiftUI

struct FormField: View {
    var fieldName = ""
    @Binding var fieldValue: String
    var isSecure = false
    var body: some View {
        VStack {
            if isSecure {
                SecureField(fieldName, text: $fieldValue)
                    .font(.system(.headline, design: .rounded))
                    .padding(.horizontal)
                    .accentColor(Color.purple)
            } else {
                TextField(fieldName, text: $fieldValue)
                    .font(.system(.headline, design: .rounded))
                    .padding(.horizontal)
                    .accentColor(Color.purple)
            }
            Divider()
                .frame(height: 1)
                .background(Color.purple.opacity(0.5))
                .padding(.horizontal)
        } }
}
