//
//  SchoolViewModel.swift



import Foundation //A core framework that includes essential data types, collections, and operating system services to define base layer functionality for apps. Required here for networking and data handling

// Response structure to match the API response
struct SchoolResponse: Codable { //Codable is a type that can convert itself in and out of external representation, typically JSON. SchoolResponse is conforming to Codable for easier JSON encoding
    let dataSearch: Content //Property type of Content, which is expected to match a part of the JSON structure returned from API
}

struct Content: Codable { //Represent a part of JSON response which contain an array of 'School' objects
    let content: [School]
}

// Define your School model
struct School: Codable, Identifiable { //Identifiable is used for that needs to be uniquely identified
    let seq: String
    let schoolName: String
    // Include other fields from the API response as needed

    // Conform to Identifiable
    var id: String { seq } //Provide unique id for each School instance
}

class SchoolViewModel: ObservableObject {
    @Published var schools: [School] = []

    //Function responsible for performing network request to fetch data from API
    func loadSchools() {
        let apiKey = "02711c20956702e80a473846fcaaceb9"
        let urlString = "https://www.career.go.kr/cnet/openapi/getOpenApi?apiKey=\(apiKey)&svcType=api&svcCode=SCHOOL&contentType=json&gubun=elem_list"

        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }

        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            if let data = data, error == nil {
                do {
                    let decodedResponse = try JSONDecoder().decode(SchoolResponse.self, from: data)
                    DispatchQueue.main.async {
                        self?.schools = decodedResponse.dataSearch.content
                    }
                } catch {
                    print("Failed to decode JSON: \(error)")
                }
            } else {
                print("Network request failed: \(error?.localizedDescription ?? "Unknown error")")
            }
        }.resume()
    }
}
