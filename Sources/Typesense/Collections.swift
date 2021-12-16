import Foundation

public struct Collections {
    var apiCall: ApiCall
    let RESOURCEPATH = "collections"
    
    public init(config: Configuration) {
        apiCall = ApiCall(config: config)
    }
    
    func create(schema: CollectionSchema) async throws -> (CollectionResponse?, URLResponse?) {
        var schemaData: Data? = nil
    
        schemaData = try encoder.encode(schema)
            
        if let validSchema = schemaData {
            let (data, response) = try await apiCall.post(endPoint: RESOURCEPATH, body: validSchema)
            if let result = data {
                if let alreadyExists = try? decoder.decode(ApiResponse.self, from: result) {
                    throw ResponseError.collectionAlreadyExists(desc: alreadyExists.message)
                }
                let fetchedCollection = try decoder.decode(CollectionResponse.self, from: result)
                return (fetchedCollection, response)
            }
        }
        return (nil, nil)
    }
    
    func retrieveAll() async throws -> ([CollectionResponse]?, URLResponse?) {
        let (data, response) = try await apiCall.get(endPoint: RESOURCEPATH)
        
        if let result = data {
            let fetchedCollections = try decoder.decode([CollectionResponse].self, from: result)
            return (fetchedCollections, response)
        }
        return (nil, response)
    }
}
