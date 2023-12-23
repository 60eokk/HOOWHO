//
//  SchoolViewModel.swift
//  HOOWHO
//
//  Created by Keith Jung on 12/21/23.
//

import Foundation

// Define your School model
struct School: Codable, Identifiable {
    let id: String
    let schoolName: String
    // Include other fields from the API response as needed
}

class SchoolViewModel: ObservableObject {
    @Published var schools: [School] = []

    func loadSchools() {
        let apiKey = "02711c20956702e80a473846fcaaceb9"
        let urlString = "www.career.go.kr/cnet/openapi/getOpenApi?apiKey=\(apiKey)&svcType=api&svcCode=SCHOOL&contentType=json&gubun=elem_list"

        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data, error == nil {
                if let decodedResponse = try? JSONDecoder().decode([School].self, from: data) {
                    DispatchQueue.main.async {
                        self.schools = decodedResponse
                    }
                } else {
                    print("Failed to decode JSON")
                }
            } else {
                print("Network request failed: \(error?.localizedDescription ?? "Unknown error")")
            }
        }.resume()
    }
}
