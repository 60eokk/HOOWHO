// UserService.swift

// UserService.swift

import FirebaseFirestore
import FirebaseAuth

class UserService {
    let db = Firestore.firestore()
    
    func saveUserProfileDetails(name: String, grade: String, school: String) {
            guard let userId = Auth.auth().currentUser?.uid else { return }

            let userRef = db.collection("users").document(userId)
            userRef.updateData([
                "name": name,
                "grade": grade,
                "school": school
            ]) { error in
                if let error = error {
                    print("Error updating user profile details: \(error)")
                } else {
                    print("User profile details updated successfully")
                }
            }
        }

    func updateUserCoinBalance(coinsEarned: Int, completion: @escaping () -> Void) {
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
                completion() // Call the completion handler after the update
            }
        }


    func fetchUserProfile(completion: @escaping (UserProfile?) -> Void) {
        guard let userId = Auth.auth().currentUser?.uid else {
            completion(nil)
            return
        }

        let userRef = db.collection("users").document(userId)
        userRef.getDocument { (document, error) in
            if let document = document, document.exists, let data = document.data() {
                let coins = data["coins"] as? Int ?? 0
                let name = data["name"] as? String ?? ""
                let grade = data["grade"] as? String ?? ""
                let school = data["school"] as? String ?? ""
                let userProfile = UserProfile(userId: userId, coins: coins, name: name, grade: grade, school: school)
                completion(userProfile)
            } else {
                completion(nil)
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

    private func createUserProfile(for userId: String, name: String = "", grade: String = "", school: String = "", completion: @escaping (UserProfile?) -> Void) {
            let userRef = db.collection("users").document(userId)
            userRef.setData([
                "coins": 0,
                "name": name,
                "grade": grade,
                "school": school
            ]) { error in
                if let error = error {
                    print("Error creating user profile: \(error)")
                    completion(nil)
                } else {
                    let newUserProfile = UserProfile(userId: userId, coins: 0, name: name, grade: grade, school: school)
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
