// UserService.swift

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

    func fetchUserProfile(completion: @escaping (UserProfile?) -> Void) {
        guard let userId = Auth.auth().currentUser?.uid else {
            print("No user ID found")
            completion(nil)
            return
        }

        let userRef = db.collection("users").document(userId)
        userRef.getDocument { [weak self] (document, error) in
            if let error = error {
                print("Error fetching user profile: \(error)")
                completion(nil)
                return
            }

            if let document = document, document.exists {
                if let data = document.data() {
                    let coins = data["coins"] as? Int ?? 0
                    let userProfile = UserProfile(userId: userId, coins: coins)
                    completion(userProfile)
                }
            } else {
                print("Document for user \(userId) does not exist. Creating a new one.")
                self?.createUserProfile(for: userId, completion: completion)
            }
        }
    }
    
    func createUserProfileIfNeeded(for userId: String, completion: @escaping (Bool) -> Void) {
            let userRef = db.collection("users").document(userId)
            userRef.getDocument { (document, error) in
                if let document = document, document.exists {
                    completion(true) // User profile already exists
                } else {
                    // Create a new profile for the user
                    self.createUserProfile(for: userId) { newUserProfile in
                        completion(newUserProfile != nil)
                    }
                }
            }
        }

        private func createUserProfile(for userId: String, completion: @escaping (UserProfile?) -> Void) {
            let userRef = db.collection("users").document(userId)
            userRef.setData(["coins": 0]) { error in
                if let error = error {
                    print("Error creating user profile: \(error)")
                    completion(nil)
                } else {
                    let newUserProfile = UserProfile(userId: userId, coins: 0)
                    completion(newUserProfile)
                }
            }
        }
}








// HARDCODED USERID
//    func fetchUserProfile(completion: @escaping (UserProfile?) -> Void) {
//        let mockProfile = UserProfile(userId: "testUserId", coins: 100)
//        completion(mockProfile)
//    }
