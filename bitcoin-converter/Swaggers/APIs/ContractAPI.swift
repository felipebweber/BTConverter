//
// ContractAPI.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation
import Alamofire


open class ContractAPI {
    /**
     Get coin info from contract address

     - parameter _id: (path) Asset platform (only &#x60;ethereum&#x60; is supported at this moment) 
     - parameter contractAddress: (path) Token&#x27;s contract address 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func coinsIdContractContractAddressGet(_id: String, contractAddress: String, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
        coinsIdContractContractAddressGetWithRequestBuilder(_id: _id, contractAddress: contractAddress).execute { (response, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }


    /**
     Get coin info from contract address
     - GET /coins/{id}/contract/{contract_address}

     - parameter _id: (path) Asset platform (only &#x60;ethereum&#x60; is supported at this moment) 
     - parameter contractAddress: (path) Token&#x27;s contract address 

     - returns: RequestBuilder<Void> 
     */
    open class func coinsIdContractContractAddressGetWithRequestBuilder(_id: String, contractAddress: String) -> RequestBuilder<Void> {
        var path = "/coins/{id}/contract/{contract_address}"
        let _idPreEscape = "\(_id)"
        let _idPostEscape = _idPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{id}", with: _idPostEscape, options: .literal, range: nil)
        let contractAddressPreEscape = "\(contractAddress)"
        let contractAddressPostEscape = contractAddressPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{contract_address}", with: contractAddressPostEscape, options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Get historical market data include price, market cap, and 24h volume (granularity auto) from a contract address 

     - parameter _id: (path) The id of the platform issuing tokens (Only &#x60;ethereum&#x60; is supported for now) 
     - parameter contractAddress: (path) Token&#x27;s contract address 
     - parameter vsCurrency: (query) The target currency of market data (usd, eur, jpy, etc.) 
     - parameter days: (query) Data up to number of days ago (eg. 1,14,30,max) 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func coinsIdContractContractAddressMarketChartGet(_id: String, contractAddress: String, vsCurrency: String, days: String, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
        coinsIdContractContractAddressMarketChartGetWithRequestBuilder(_id: _id, contractAddress: contractAddress, vsCurrency: vsCurrency, days: days).execute { (response, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }


    /**
     Get historical market data include price, market cap, and 24h volume (granularity auto) from a contract address 
     - GET /coins/{id}/contract/{contract_address}/market_chart/

     - parameter _id: (path) The id of the platform issuing tokens (Only &#x60;ethereum&#x60; is supported for now) 
     - parameter contractAddress: (path) Token&#x27;s contract address 
     - parameter vsCurrency: (query) The target currency of market data (usd, eur, jpy, etc.) 
     - parameter days: (query) Data up to number of days ago (eg. 1,14,30,max) 

     - returns: RequestBuilder<Void> 
     */
    open class func coinsIdContractContractAddressMarketChartGetWithRequestBuilder(_id: String, contractAddress: String, vsCurrency: String, days: String) -> RequestBuilder<Void> {
        var path = "/coins/{id}/contract/{contract_address}/market_chart/"
        let _idPreEscape = "\(_id)"
        let _idPostEscape = _idPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{id}", with: _idPostEscape, options: .literal, range: nil)
        let contractAddressPreEscape = "\(contractAddress)"
        let contractAddressPostEscape = contractAddressPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{contract_address}", with: contractAddressPostEscape, options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems([
                        "vs_currency": vsCurrency, 
                        "days": days
        ])

        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Get historical market data include price, market cap, and 24h volume within a range of timestamp (granularity auto) from a contract address

     - parameter _id: (path) The id of the platform issuing tokens (Only &#x60;ethereum&#x60; is supported for now) 
     - parameter contractAddress: (path) Token&#x27;s contract address 
     - parameter vsCurrency: (query) The target currency of market data (usd, eur, jpy, etc.) 
     - parameter from: (query) From date in UNIX Timestamp (eg. 1392577232) 
     - parameter to: (query) To date in UNIX Timestamp (eg. 1422577232) 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func coinsIdContractContractAddressMarketChartRangeGet(_id: String, contractAddress: String, vsCurrency: String, from: String, to: String, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
        coinsIdContractContractAddressMarketChartRangeGetWithRequestBuilder(_id: _id, contractAddress: contractAddress, vsCurrency: vsCurrency, from: from, to: to).execute { (response, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }


    /**
     Get historical market data include price, market cap, and 24h volume within a range of timestamp (granularity auto) from a contract address
     - GET /coins/{id}/contract/{contract_address}/market_chart/range

     - parameter _id: (path) The id of the platform issuing tokens (Only &#x60;ethereum&#x60; is supported for now) 
     - parameter contractAddress: (path) Token&#x27;s contract address 
     - parameter vsCurrency: (query) The target currency of market data (usd, eur, jpy, etc.) 
     - parameter from: (query) From date in UNIX Timestamp (eg. 1392577232) 
     - parameter to: (query) To date in UNIX Timestamp (eg. 1422577232) 

     - returns: RequestBuilder<Void> 
     */
    open class func coinsIdContractContractAddressMarketChartRangeGetWithRequestBuilder(_id: String, contractAddress: String, vsCurrency: String, from: String, to: String) -> RequestBuilder<Void> {
        var path = "/coins/{id}/contract/{contract_address}/market_chart/range"
        let _idPreEscape = "\(_id)"
        let _idPostEscape = _idPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{id}", with: _idPostEscape, options: .literal, range: nil)
        let contractAddressPreEscape = "\(contractAddress)"
        let contractAddressPostEscape = contractAddressPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{contract_address}", with: contractAddressPostEscape, options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems([
                        "vs_currency": vsCurrency, 
                        "from": from, 
                        "to": to
        ])

        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

}
