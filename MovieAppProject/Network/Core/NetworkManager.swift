import Foundation
import Alamofire

class NetworkManager {
    static func request<T: Codable>(model: T.Type,
                                    endpoint: String,
                                    method: HTTPMethod = .get,
                                    parameters: Parameters? = nil,
                                    encoding: ParameterEncoding = URLEncoding.default,
                                    completion: @escaping((T?, String?) -> Void)) {
        let url = NetworkConstants.getUrl(with: endpoint)
        print("Request URL: \(url)")
        print("Parameters: \(String(describing: parameters))")

        AF.request(url,
                   method: method,
                   parameters: parameters,
                   encoding: encoding,
                   headers: NetworkConstants.header).responseDecodable(of: T.self) { response in
            switch response.result {
            case .success(let data):
                completion(data, nil)
            case .failure(let error):
                print("Request failed with error: \(error.localizedDescription)")
                completion(nil, error.localizedDescription)
            }
        }
    }
}
