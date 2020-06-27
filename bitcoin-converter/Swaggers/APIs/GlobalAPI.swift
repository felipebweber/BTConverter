//
// GlobalAPI.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation
import Alamofire


open class GlobalAPI {
    /**
     Get cryptocurrency global data

     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func globalGet(completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
        globalGetWithRequestBuilder().execute { (response, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }


    /**
     Get cryptocurrency global data
     - GET /global


     - returns: RequestBuilder<Void> 
     */
    open class func globalGetWithRequestBuilder() -> RequestBuilder<Void> {
        let path = "/global"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

}
