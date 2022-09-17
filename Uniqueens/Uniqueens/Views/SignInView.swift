//
//  SignInView.swift
//  Uniqueens
//
//  Created by Emrah Karabulut on 30.08.2022.
//

import SwiftUI

struct SignInView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    @State var reEnterPassword: String = ""
    @State var hasAccount: Bool = false
    
    @EnvironmentObject var vmLogin: LoginViewModel
    
    var body: some View {
        VStack(alignment: .center){
            
            Image("logo-uniqueens")
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 150)
                .padding(.bottom, 100)
            
            TextField("E-mail", text: $email)
                .frame(width: 300, height: 50)
                .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                .background(Color.MyTheme.customWhite)
                .cornerRadius(12)
                .autocapitalization(.none)
                .disableAutocorrection(true)
            
            SecureField("Password", text: $password)
                .frame(width: 300, height: 50)
                .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                .background(Color.MyTheme.customWhite)
                .cornerRadius(12)
                .autocapitalization(.none)
                .disableAutocorrection(true)

            
            if !hasAccount {
                SecureField("Re-Enter Password", text: $reEnterPassword)
                    .frame(width: 300, height: 50)
                    .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                    .background(Color.MyTheme.customWhite)
                    .cornerRadius(12)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)

            }
            
            Button  {
                
                guard !email.isEmpty, !password.isEmpty else {
                    return
                }
                
                if !hasAccount {
                    
                    if password == reEnterPassword {
                        vmLogin.register(email: email, password: password)
                    }
                } else {
                    vmLogin.logIn(email: email, password: password)
                }
                
            } label: {
                Text(hasAccount ? "Log In" : "Register")
                    .fontWeight(.heavy)
                    .frame(width: 300, height: 50)
                    .foregroundColor(Color.MyTheme.customWhite)
                    .background(Color.MyTheme.customGray)
                    .cornerRadius(12)
                    
            }
            .padding(.top)
            
            if !hasAccount {
                Button {
                    hasAccount.toggle()
                } label: {
                    Text("Already have an account?")
                        .font(.footnote)
                        .bold()
                        .foregroundColor(Color.MyTheme.customGray)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Color.MyTheme.customPink
        )
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
