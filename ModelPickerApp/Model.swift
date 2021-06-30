//
//  Model.swift
//  ModelPickerApp
//
//  Created by Erik Leon on 6/29/21.
//

import UIKit
import RealityKit
import Combine

class Model {
    var modelName: String
    var image: UIImage
    var modelEntity: ModelEntity?
    
    //asynchronsly Combine
    private var cancellable: AnyCancellable? = nil
    
    //create initializer
    init(modelName: String) {
        self.modelName = modelName
        self.image = UIImage(named: modelName)!
        
    //load model asynchrnolsy
        let filename = modelName + ".usdz"
        self.cancellable = ModelEntity.loadModelAsync(named: filename).sink(receiveCompletion: { loadCompletion in
            //handle our error
            print("DEBUG: Unable to load modelEntity for modelName: \(self.modelName)")
        }, receiveValue: { modelEntity in
            //Get our modelEntity
            self.modelEntity = modelEntity
            print("DEBUG: Successful load modelEntity for modelName: \(self.modelName)")
        }
    )}
}
