// UserService.swift

import FirebaseFirestore
import FirebaseAuth



// UserService.swift

class UserService {
    // Example fetchUserProfile method
    func fetchUserProfile(completion: @escaping (UserProfile?) -> Void) {
        // Implement the logic to fetch user profile data from Firebase
        // Call the completion handler with the UserProfile object
    }

    // Include other methods for updating user profile data
}


//
// 이게 원래 버젼. 지우지 않았으니, 윗부분이 틀리면 아래쓰기
//class UserService {
//    let db = Firestore.firestore()
//
//    func updateUserCoinBalance(coinsEarned: Int) {
//        guard let userId = Auth.auth().currentUser?.uid else { return }
//
//        let userRef = db.collection("users").document(userId)
//        userRef.updateData([
//            "coins": FieldValue.increment(Int64(coinsEarned))
//        ]) { error in
//            if let error = error {
//                print("Error updating coins: \(error)")
//            } else {
//                print("Coins successfully updated")
//            }
//        }
//    }
//
//    // Add other methods for fetching and updating user profiles
//}
//
//
