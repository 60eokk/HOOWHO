// UserService.swift

import FirebaseFirestore
import FirebaseAuth

class UserService {
    let db = Firestore.firestore() // Properly initialize Firestore

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

    func fetchUserProfile(completion: @escaping (UserProfile?) -> Void) {
        guard let userId = Auth.auth().currentUser?.uid else {
            completion(nil)
            return
        }

        let userRef = db.collection("users").document(userId)
        userRef.getDocument { (document, error) in
            if let error = error {
                print("Error fetching user profile: \(error)")
                completion(nil)
                return
            }
            if let document = document, document.exists {
                let data = document.data()
                let coins = data?["coins"] as? Int ?? 0
                let userProfile = UserProfile(userId: userId, coins: coins)
                completion(userProfile)
            } else {
                print("Document does not exist")
                completion(nil)
            }
        }
    }
}

