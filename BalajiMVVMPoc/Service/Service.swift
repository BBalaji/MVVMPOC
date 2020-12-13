//
//  Service.swift
//  BalajiMVVMPoc
//
//  Created by Besta, Balaji (623-Extern) on 11/12/20.
//

import Foundation

//MARK:- NetworkError
enum NetworkError: Error {
    case url
    case server
    case timeout
    }

//MARK:- Service
struct Service {
    //MARK: - GCD implemented
    static func fetchServerInfoData(_ completion: @escaping (Result<InfoModel?, NetworkError>) -> ()) {
        DispatchQueue.global(qos: .utility).async {
            let result = self.makeAPICall()
          DispatchQueue.main.async {
              switch result {
              case .success(_):
                    completion(result)
                 case let .failure(error):
                    print(error)
                 }
             }
         }
    }
    //MARK:- API Call
    static func makeAPICall() -> Result<InfoModel?, NetworkError> {
        let path = "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"
            guard let url = URL(string: path) else {
                return .failure(.url)
            }
            var result: Result<InfoModel?, NetworkError>!
            
            let semaphore = DispatchSemaphore(value: 0)
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard let data = data else {
                    result = .failure(.server)
                    return}
                do{

                    let str = String(decoding: data, as: UTF8.self)
                    print(str) 
                    
                    let dict = str.toJSON() as? [String:AnyObject]
                    let json = try JSONSerialization.data(withJSONObject: dict!,   options: .prettyPrinted)

                    let infomodelObjects = try JSONDecoder().decode(InfoModel.self, from: json )
                    result = .success(infomodelObjects)
                    
                }
                catch let jsonErr{
                    print(jsonErr.localizedDescription)
                    result = .failure(.server)
                    
                }
                //Catch the error handling
                
//             catch DecodingError.keyNotFound(let key, let context) {
//                Swift.print("could not find key \(key) in JSON: \(context.debugDescription)")
//            } catch DecodingError.valueNotFound(let type, let context) {
//                Swift.print("could not find type \(type) in JSON: \(context.debugDescription)")
//            } catch DecodingError.typeMismatch(let type, let context) {
//                Swift.print("type mismatch for type \(type) in JSON: \(context.debugDescription)")
//            } catch DecodingError.dataCorrupted(let context) {
//                Swift.print("data found to be corrupted in JSON: \(context.debugDescription)")
//            } catch let error as NSError {
//                NSLog("Error in read(from:ofType:) domain= \(error.domain), description= \(error.localizedDescription)")
//            }
                
    
                semaphore.signal()
            }.resume()
        if semaphore.wait(timeout: .now() + 15) == .timedOut {
                result = .failure(.timeout)
            }
            return result
    }
}
//MARK: - Sample Data
let infoMvvmData = [
    MVVMContactModel(image: "apple", title: "Kelly Goodwin", description: "Designer Designer Designer1 Designer2 Designer3 Designer4 Designer5 Designer Designer Designer Designer Designer Designer1 Designer2 Designer3 Designer4 Designer5 Designer "),
    MVVMContactModel(image: "apple", title: "Mohammad Hussain", description: "SEO Specialist"),
    MVVMContactModel(image: "", title: "", description: ""),
    MVVMContactModel(image: "http://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/American_Beaver.jpg/220px-American_Beaver.jpg", title: "Tamilarasi Mohan", description: "Architect"),
    MVVMContactModel(image: "apple", title: "Kim Yu", description: "Economist"),
    MVVMContactModel(image: "apple", title: "Shreya Nithin", description: "Web Strategist"),
    MVVMContactModel(image: "http://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/American_Beaver.jpg/220px-American_Beaver.jpg", title: "Emily Adams", description: "Product Designer")
    
    
]
extension String {
    func toJSON() -> Any? {
        guard let data = self.data(using: .utf8, allowLossyConversion: false) else { return nil }
        return try? JSONSerialization.jsonObject(with: data, options: .mutableContainers)
    }
}

