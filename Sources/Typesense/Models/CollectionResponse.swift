//
// CollectionResponse.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



public struct CollectionResponse: Codable {

    /** Name of the collection */
    public var name: String
    /** A list of fields for querying, filtering and faceting */
    public var fields: [Field]
    /** The name of an int32 / float field that determines the order in which the search results are ranked when a sort_by clause is not provided during searching. This field must indicate some kind of popularity. */
    public var defaultSortingField: String?
    /** List of symbols or special characters to be used for  splitting the text into individual words in addition to space and new-line characters.  */
    public var tokenSeparators: [String]
    /** List of symbols or special characters to be indexed.  */
    public var symbolsToIndex: [String]
    /** Number of documents in the collection */
    public var numDocuments: Int64
    /** Timestamp of when the collection was created */
    public var createdAt: Int64
    public var numMemoryShards: Int64

    public init(name: String, fields: [Field], defaultSortingField: String? = nil, tokenSeparators: [String], symbolsToIndex: [String], numDocuments: Int64, createdAt: Int64, numMemoryShards: Int64) {
        self.name = name
        self.fields = fields
        self.defaultSortingField = defaultSortingField
        self.tokenSeparators = tokenSeparators
        self.symbolsToIndex = symbolsToIndex
        self.numDocuments = numDocuments
        self.createdAt = createdAt
        self.numMemoryShards = numMemoryShards
    }

    public enum CodingKeys: String, CodingKey { 
        case name
        case fields
        case defaultSortingField = "default_sorting_field"
        case tokenSeparators = "token_separators"
        case symbolsToIndex = "symbols_to_index"
        case numDocuments = "num_documents"
        case createdAt = "created_at"
        case numMemoryShards = "num_memory_shards"
    }

}
