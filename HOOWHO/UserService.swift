// UserService.swift



import FirebaseFirestore
import FirebaseAuth

class UserService {
    let db = Firestore.firestore()
    
    func saveUserProfileDetails(name: String?, grade: String?, school: String?) {
        guard let userId = Auth.auth().currentUser?.uid else { return }

        let userRef = db.collection("users").document(userId)

        // Check if the document exists
        userRef.getDocument { (document, error) in
            if let document = document, document.exists {
                // If the document exists, update it
                var updateData = [String: Any]()
                if let name = name { updateData["name"] = name }
                if let grade = grade { updateData["grade"] = grade }
                if let school = school { updateData["school"] = school }

                userRef.updateData(updateData) { error in
                    if let error = error {
                        print("Error updating user profile details: \(error)")
                    } else {
                        print("User profile details updated successfully")
                    }
                }
            } else {
                // If the document does not exist, create it
                var newData = [String: Any]()
                newData["coins"] = 0 // Initialize coins to 0
                if let name = name { newData["name"] = name }
                if let grade = grade { newData["grade"] = grade }
                if let school = school { newData["school"] = school }

                userRef.setData(newData) { error in
                    if let error = error {
                        print("Error creating user document: \(error)")
                    } else {
                        print("User document created successfully")
                    }
                }
            }
        }
    }


    func updateUserCoinBalance(coinsEarned: Int, completion: @escaping () -> Void) {
        guard let userId = Auth.auth().currentUser?.uid else { return }

        let userRef = db.collection("users").document(userId)

        // Corrected debugging statement
        print("Updating coin balance for user: \(userId) with coins earned: \(coinsEarned)")

        createUserDocumentIfNeeded(userRef) {
            userRef.updateData([
                "coins": FieldValue.increment(Int64(coinsEarned))
            ]) { error in
                if let error = error {
                    print("Error updating coins: \(error)")
                } else {
                    print("Coins successfully updated")
                }
                completion()
            }
        }
    }

    
    
    // Helper function to create a document if it doesn't exist
    private func createUserDocumentIfNeeded(_ userRef: DocumentReference, completion: @escaping () -> Void) {
        userRef.getDocument { (document, error) in
            if let document = document, !document.exists {
                userRef.setData(["coins": 0]) { error in
                    if let error = error {
                        print("Error creating user document: \(error)")
                    } else {
                        print("User document created successfully")
                    }
                    completion()
                }
            } else {
                completion()
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
            if let document = document, document.exists, let data = document.data() {
                let coins = data["coins"] as? Int ?? 0
                let name = data["name"] as? String ?? ""
                let grade = data["grade"] as? String ?? ""
                let school = data["school"] as? String ?? ""
                print("Fetched UserProfile: Name: \(name), Grade: \(grade), School: \(school), Coins: \(coins)") //Added debugging statement
                let userProfile = UserProfile(userId: userId, coins: coins, name: name, grade: grade, school: school)
                completion(userProfile)
            } else {
                print("Error fetching user profile: \(error?.localizedDescription ?? "Unknown error")") //Added debugging statement
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
