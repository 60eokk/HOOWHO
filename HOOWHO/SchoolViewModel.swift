//
//  SchoolViewModel.swift
//  HOOWHO
//
//  Created by Keith Jung on 12/21/23.
//

// SchoolViewModel.swift

import Foundation

// Response structure to match the API response
struct SchoolResponse: Codable {
    let dataSearch: Content
}

struct Content: Codable {
    let content: [School]
}

// Define your School model
struct School: Codable, Identifiable {
    let seq: String
    let schoolName: String
    // Include other fields from the API response as needed

    // Conform to Identifiable
    var id: String { seq }
}

class SchoolViewModel: ObservableObject {
    @Published var schools: [School] = []

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
