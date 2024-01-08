//
//  ProfilePic.swift




import SwiftUI

struct ProfilePic: View {
    @State private var navigateToPollPage = false
    @State private var showImagePicker = false
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var selectedImage: UIImage?
    @State private var navigateToMainTabView = false  // Add this state variable
    
    @EnvironmentObject var timerManager: TimerManager

    var body: some View {
        VStack {
            // Image view or placeholder
            if let selectedImage = selectedImage {
                Image(uiImage: selectedImage)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
            } else {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .foregroundColor(.gray)
            }

            // Buttons to choose an image
            Button("Choose from Library") {
                self.sourceType = .photoLibrary
                self.showImagePicker = true
            }

            Button("Take a Picture") {
                self.sourceType = .camera
                self.showImagePicker = true
            }

            Button("Start Poll") {
                navigateToPollPage = true // Enable navigation to PollPageView
            }
            .padding()

            if navigateToPollPage {
                // Pass the new binding to PollPageView
                NavigationLink(destination: PollPageView(navigateToMainTabView: $navigateToMainTabView), isActive: $navigateToPollPage) {
                    EmptyView()
                }
            }
        }
        .navigationBarTitle("Profile Picture", displayMode: .inline)
        .sheet(isPresented: $showImagePicker) {
            ImagePicker(selectedImage: $selectedImage, sourceType: sourceType)
        }
    }
}



struct ImagePicker: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?
    var sourceType: UIImagePickerController.SourceType

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = sourceType
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        var parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.originalImage] as? UIImage {
                parent.selectedImage = image
            }

            picker.dismiss(animated: true)
        }
    }
}




//struct ProfilePic_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfilePic()
//    }
//}
