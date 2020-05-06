import Foundation

extension URL{
    func withQueries(_ queries: [String:String])->URL?{
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.queryItems = queries.compactMap{URLQueryItem(name:$0.0,value:$0.1)}
        return components?.url
    }
}
let baseURL = URL(string: "https://api.nasa.gov/planetary/apod")!
let query:[String:String] = [
    "api_key":"DEMO_KEY",
    "date":"2017-07-13"
]
let url = baseURL.withQueries(query)!
let task = URLSession.shared.dataTask(with: url){(data,response,error)in
    if let data = data,
        let jasonobj = try? JSONSerialization.jsonObject(with: data, options: .mutableLeaves),
        let jsn = jasonobj as? [String:Any]
    {
        let pic_url = jsn["url"] as! String
        print(pic_url)
        
    }
}
task.resume()
