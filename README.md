# SecureTextFiledForSwiftUI

This is a sample application of SwiftUI that  
switches the input-form of the secure password to the form  
that can confirm the entered character string by tapping the eye button.

## Point of this sample

The point is to separate SecureField or TextField according to the bound Bool value (isSecured).  
`isSecured` can be switched by tapping the eye button.  
We can use SF Symbols for the eye and slash-eye icon images.

```swift
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
```

## GIF

![SecureTextField](https://user-images.githubusercontent.com/8732417/79463889-60dd6c00-8034-11ea-890c-d600927987cb.gif)
