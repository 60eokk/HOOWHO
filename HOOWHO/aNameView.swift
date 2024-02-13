import SwiftUI

struct aNameView: View {
    @State private var name = ""
    
    var body: some View {
        Form {
            TextField("Name", text: $name)
            NavigationLink(destination: aPictureView()) {
                Text("Next")
            }
        }
        .navigationTitle("Enter Your Name")
    }
}



