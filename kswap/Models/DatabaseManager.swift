import Foundation
import Supabase

enum DBError: Error {
    case invalidURL
}

struct DatabaseManager {
    func connectDB() throws -> SupabaseClient {
        guard let dbURL = URL(string:Constants.supabaseURL) else {
            print ("Invalid URL")
            throw DBError.invalidURL
        }
        let client = SupabaseClient(supabaseURL: dbURL, supabaseKey: Constants.supabaseKey)
        return client
    }
    
    func searchCollectible() async throws -> [searchResults] {
        var rawSearchElements: [searchResults] = []
        do{
            let testResponse: String = try await connectDB().database.rpc(fn: "swiftsearch").execute().value
//            print(testResponse)
            
            let decoder = JSONDecoder()
            let searchData = Data(testResponse.utf8)
            do {
                 rawSearchElements = try decoder.decode([searchResults].self, from: searchData)
//                print(rawSearchElements)
            } catch {
                print(error)
            }
        } catch {
            print(error)
        }
        return rawSearchElements
        
    }
    
    func checkCollection(collection_id: Int) async throws -> Int{
        let collection_amount: Int = -1;
        do{
            let checkAmount: Int? = try await connectDB().database.from("temp_users_collection")
                .select(columns: "col_id", head: true, count: .exact)
                .eq(column: "col_id", value: collection_id)
                .execute()
                .count
            if let num_collection_amount = checkAmount {
                return num_collection_amount
            }
        } catch {
            print(error)
        }
        return collection_amount
    }
    
    func insertCollectible(user_id: Int, collection_id: Int) async throws {
        do {
            let addItem = AddToCollectionStruct(uid: user_id, col_id: collection_id)
            
            let encoder = JSONEncoder()
            let encodeData = try encoder.encode(addItem)
            
            try await connectDB().database.from("temp_users_collection").insert(values: encodeData).execute()
        } catch {
            print(error)
        }
    }
    
    func getCollection() async throws -> [collectionData] {
        var rawCollectionElements: [collectionData] = []
        do{
//            let rpcParams = parameters(searchitem: searchterm)
            let testResponse: String = try await connectDB().database.rpc(fn: "swiftcollection").execute().value
//            print(testResponse)
            
            let decoder = JSONDecoder()
            let searchData = Data(testResponse.utf8)
            do {
                rawCollectionElements = try decoder.decode([collectionData].self, from: searchData)
//                print(rawCollectionElements)
            } catch {
                print(error)
            }
        } catch {
            print(error)
        }
        return rawCollectionElements
    }
    
    func deleteFromCol(colID: Int) async throws {
        do{
            try await connectDB().database.from("temp_users_collection")
                .delete()
                .eq(column: "id", value: colID)
                .execute()
        } catch {
            print(error)
        }
    }
    
    func updateUFT(status: Bool, colID: Int) async throws {
        do{
            try await connectDB().database.from("temp_users_collection")
                .update(values: ["uft":status])
                .eq(column: "id", value: colID)
                .execute()
        } catch {
            print(error)
        }
    }
    
    
    
}


