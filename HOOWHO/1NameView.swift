import SwiftUI

struct NameView: View {
    @State private var name = ""
    
    var body: some View {
        Form {
            TextField("Name", text: $name)
            NavigationLink(destination: PictureView()) {
                Text("Next")
            }
        }
        .navigationTitle("Enter Your Name")
    }
}
