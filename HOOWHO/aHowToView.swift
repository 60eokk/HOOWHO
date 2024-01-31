import SwiftUI

struct aHowToView: View {
    var body: some View {
        NavigationView{
            VStack {
                Text("HOOWHO")
                    .font(.largeTitle)
                    .padding()
                
                NavigationLink(destination: aSelectGradeView()) {
                    Text("👤")
                        .font(.system(size: 50))
                }
            }
        }
    }
}





struct aLaunchView_Previews: PreviewProvider {
    static var previews: some View {
        aHowToView()
    }
}
