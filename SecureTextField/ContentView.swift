//
//  ContentView.swift
//  SecureTextField
//
//  Created by Takuya Aso on 2020/04/16.
//  Copyright © 2020 Takuya Aso. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    @State private var mailAddress: String = ""

    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("Login")
                    .font(.title)
                    .foregroundColor(.red)
                    .padding([.leading, .top], 20.0)
                TextField("Mail address", text: $mailAddress)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(20.0)
                PasswordView()
                Spacer()
                LoginButton()
            }
            .navigationBarTitle("SecureTextField")
        }
    }
}

struct PasswordView: View {

    @State private var password: String = ""
    @State private var isSecured: Bool = true

    var body: some View {
        HStack {
            if self.isSecured {
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.leading, 20.0)
            } else {
                TextField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.leading, 20.0)
            }
            Button(action: {
                self.isSecured.toggle()
            }) {
                self.isSecured ?
                    Image(systemName: "eye.slash.fill") :
                    Image(systemName: "eye.fill")
            }
            .foregroundColor(.gray)
            .padding(.trailing, 20.0)
        }
    }
}

struct LoginButton: View {
    var body: some View {
        Button(action: {

        }) {
            Text("Login")
                .font(Font.body.bold())
                .frame(minWidth: 0, maxWidth: .infinity)
                .frame(height: 44.0)
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(5.0)
        }
        .padding(20.0)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
