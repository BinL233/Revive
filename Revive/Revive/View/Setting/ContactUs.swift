//
//  ContactUs.swift
//  Revive
//
//  Created by Kaile Ying on 12/5/23.
//

import SwiftUI

struct ContactUs: View {
    @State private var isEmailCopied : Bool = false
    
    var body: some View {
        Section {
            List {
                HStack {
                    Text("Email Address")
                    Spacer()
                    Button(action: {
                        copyText()
                        isEmailCopied = true
                    }) {
                        Text(isEmailCopied ? "Copied!" : "Copy")
                            .font(.subheadline)
                            .foregroundStyle(.white)
                            .padding(8)
                    }
                    .background(Color.cDarkBrown)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                }
            }
        }
        header: {
           Text("Contact Us")
        } footer: {
           Text("Contact us if you have any problem.")
        }
    }
    
    func copyText() {
        let pasteboard = UIPasteboard.general
        pasteboard.string = "ljreviveapp@gmail.com"
    }
}
