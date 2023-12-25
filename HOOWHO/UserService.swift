// UserService.swift

import FirebaseFirestore
import FirebaseAuth

class UserService {
    let db = Firestore.firestore()

    func updateUserCoinBalance(coinsEarned: Int) {
        guard let userId = Auth.auth().currentUser?.uid else { return }

        let userRef = db.collection("users").document(userId)
        userRef.updateData([
            "coins": FieldValue.increment(Int64(coinsEarned))
        ]) { error in
            if let error = error {
                print("Error updating coins: \(error)")
            } else {
                print("Coins successfully updated")
            }
        }
    }

    // Add other methods for fetching and updating user profiles
}
