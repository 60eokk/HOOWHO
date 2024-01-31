import SwiftUI

struct aHowToView: View {
    var body: some View {
        Text("How to use the app...")
        // Add more UI components here
        NavigationLink(destination: aSelectGradeView()) {
            Text("Start")
        }
    }
}




//
//struct aLaunchView_Previews: PreviewProvider {
//    static var previews: some View {
//        aHowToView()
//    }
//}
//
