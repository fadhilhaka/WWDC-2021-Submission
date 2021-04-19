//
// AnimalPrediction.swift
//
// This file was automatically generated and should not be edited.
//

import CoreML


/// Model Prediction Input Type
@available(macOS 10.13, iOS 11.0, tvOS 11.0, watchOS 4.0, *)
class AnimalPredictionInput : MLFeatureProvider {

    /// previous_condition as string value
    var previous_condition: String

    /// previous_result as string value
    var previous_result: String

    /// previous_animal as double value
    var previous_animal: Double

    /// selected_animal as double value
    var selected_animal: Double

    /// result as string value
    var result: String

    var featureNames: Set<String> {
        get {
            return ["previous_condition", "previous_result", "previous_animal", "selected_animal", "result"]
        }
    }
    
    func featureValue(for featureName: String) -> MLFeatureValue? {
        if (featureName == "previous_condition") {
            return MLFeatureValue(string: previous_condition)
        }
        if (featureName == "previous_result") {
            return MLFeatureValue(string: previous_result)
        }
        if (featureName == "previous_animal") {
            return MLFeatureValue(double: previous_animal)
        }
        if (featureName == "selected_animal") {
            return MLFeatureValue(double: selected_animal)
        }
        if (featureName == "result") {
            return MLFeatureValue(string: result)
        }
        return nil
    }
    
    init(previous_condition: String, previous_result: String, previous_animal: Double, selected_animal: Double, result: String) {
        self.previous_condition = previous_condition
        self.previous_result = previous_result
        self.previous_animal = previous_animal
        self.selected_animal = selected_animal
        self.result = result
    }
}


/// Model Prediction Output Type
@available(macOS 10.13, iOS 11.0, tvOS 11.0, watchOS 4.0, *)
class AnimalPredictionOutput : MLFeatureProvider {

    /// Source provided by CoreML

    private let provider : MLFeatureProvider


    /// prediction_animal as double value
    lazy var prediction_animal: Double = {
        [unowned self] in return self.provider.featureValue(for: "prediction_animal")!.doubleValue
    }()

    var featureNames: Set<String> {
        return self.provider.featureNames
    }
    
    func featureValue(for featureName: String) -> MLFeatureValue? {
        return self.provider.featureValue(for: featureName)
    }

    init(prediction_animal: Double) {
        self.provider = try! MLDictionaryFeatureProvider(dictionary: ["prediction_animal" : MLFeatureValue(double: prediction_animal)])
    }

    init(features: MLFeatureProvider) {
        self.provider = features
    }
}


/// Class for model loading and prediction
@available(macOS 10.13, iOS 11.0, tvOS 11.0, watchOS 4.0, *)
class AnimalPrediction {
    let model: MLModel

    /// URL of model assuming it was installed in the same bundle as this class
    class var urlOfModelInThisBundle : URL {
        let bundle = Bundle(for: self)
        return bundle.url(forResource: "AnimalPrediction", withExtension:"mlmodelc")!
    }

    /**
        Construct AnimalPrediction instance with an existing MLModel object.

        Usually the application does not use this initializer unless it makes a subclass of AnimalPrediction.
        Such application may want to use `MLModel(contentsOfURL:configuration:)` and `AnimalPrediction.urlOfModelInThisBundle` to create a MLModel object to pass-in.

        - parameters:
          - model: MLModel object
    */
    init(model: MLModel) {
        self.model = model
    }

    /**
        Construct AnimalPrediction instance by automatically loading the model from the app's bundle.
    */
    @available(*, deprecated, message: "Use init(configuration:) instead and handle errors appropriately.")
    convenience init() {
        try! self.init(contentsOf: type(of:self).urlOfModelInThisBundle)
    }

    /**
        Construct a model with configuration

        - parameters:
           - configuration: the desired model configuration

        - throws: an NSError object that describes the problem
    */
    @available(macOS 10.14, iOS 12.0, tvOS 12.0, watchOS 5.0, *)
    convenience init(configuration: MLModelConfiguration) throws {
        try self.init(contentsOf: type(of:self).urlOfModelInThisBundle, configuration: configuration)
    }

    /**
        Construct AnimalPrediction instance with explicit path to mlmodelc file
        - parameters:
           - modelURL: the file url of the model

        - throws: an NSError object that describes the problem
    */
    convenience init(contentsOf modelURL: URL) throws {
        try self.init(model: MLModel(contentsOf: modelURL))
    }

    /**
        Construct a model with URL of the .mlmodelc directory and configuration

        - parameters:
           - modelURL: the file url of the model
           - configuration: the desired model configuration

        - throws: an NSError object that describes the problem
    */
    @available(macOS 10.14, iOS 12.0, tvOS 12.0, watchOS 5.0, *)
    convenience init(contentsOf modelURL: URL, configuration: MLModelConfiguration) throws {
        try self.init(model: MLModel(contentsOf: modelURL, configuration: configuration))
    }

    /**
        Construct AnimalPrediction instance asynchronously with optional configuration.

        Model loading may take time when the model content is not immediately available (e.g. encrypted model). Use this factory method especially when the caller is on the main thread.

        - parameters:
          - configuration: the desired model configuration
          - handler: the completion handler to be called when the model loading completes successfully or unsuccessfully
    */
    @available(macOS 11.0, iOS 14.0, tvOS 14.0, watchOS 7.0, *)
    class func load(configuration: MLModelConfiguration = MLModelConfiguration(), completionHandler handler: @escaping (Swift.Result<AnimalPrediction, Error>) -> Void) {
        return self.load(contentsOf: self.urlOfModelInThisBundle, configuration: configuration, completionHandler: handler)
    }

    /**
        Construct AnimalPrediction instance asynchronously with URL of the .mlmodelc directory with optional configuration.

        Model loading may take time when the model content is not immediately available (e.g. encrypted model). Use this factory method especially when the caller is on the main thread.

        - parameters:
          - modelURL: the URL to the model
          - configuration: the desired model configuration
          - handler: the completion handler to be called when the model loading completes successfully or unsuccessfully
    */
    @available(macOS 11.0, iOS 14.0, tvOS 14.0, watchOS 7.0, *)
    class func load(contentsOf modelURL: URL, configuration: MLModelConfiguration = MLModelConfiguration(), completionHandler handler: @escaping (Swift.Result<AnimalPrediction, Error>) -> Void) {
        MLModel.__loadContents(of: modelURL, configuration: configuration) { (model, error) in
            if let error = error {
                handler(.failure(error))
            } else if let model = model {
                handler(.success(AnimalPrediction(model: model)))
            } else {
                fatalError("SPI failure: -[MLModel loadContentsOfURL:configuration::completionHandler:] vends nil for both model and error.")
            }
        }
    }

    /**
        Make a prediction using the structured interface

        - parameters:
           - input: the input to the prediction as AnimalPredictionInput

        - throws: an NSError object that describes the problem

        - returns: the result of the prediction as AnimalPredictionOutput
    */
    func prediction(input: AnimalPredictionInput) throws -> AnimalPredictionOutput {
        return try self.prediction(input: input, options: MLPredictionOptions())
    }

    /**
        Make a prediction using the structured interface

        - parameters:
           - input: the input to the prediction as AnimalPredictionInput
           - options: prediction options

        - throws: an NSError object that describes the problem

        - returns: the result of the prediction as AnimalPredictionOutput
    */
    func prediction(input: AnimalPredictionInput, options: MLPredictionOptions) throws -> AnimalPredictionOutput {
        let outFeatures = try model.prediction(from: input, options:options)
        return AnimalPredictionOutput(features: outFeatures)
    }

    /**
        Make a prediction using the convenience interface

        - parameters:
            - previous_condition as string value
            - previous_result as string value
            - previous_animal as double value
            - selected_animal as double value
            - result as string value

        - throws: an NSError object that describes the problem

        - returns: the result of the prediction as AnimalPredictionOutput
    */
    func prediction(previous_condition: String, previous_result: String, previous_animal: Double, selected_animal: Double, result: String) throws -> AnimalPredictionOutput {
        let input_ = AnimalPredictionInput(previous_condition: previous_condition, previous_result: previous_result, previous_animal: previous_animal, selected_animal: selected_animal, result: result)
        return try self.prediction(input: input_)
    }

    /**
        Make a batch prediction using the structured interface

        - parameters:
           - inputs: the inputs to the prediction as [AnimalPredictionInput]
           - options: prediction options

        - throws: an NSError object that describes the problem

        - returns: the result of the prediction as [AnimalPredictionOutput]
    */
    @available(macOS 10.14, iOS 12.0, tvOS 12.0, watchOS 5.0, *)
    func predictions(inputs: [AnimalPredictionInput], options: MLPredictionOptions = MLPredictionOptions()) throws -> [AnimalPredictionOutput] {
        let batchIn = MLArrayBatchProvider(array: inputs)
        let batchOut = try model.predictions(from: batchIn, options: options)
        var results : [AnimalPredictionOutput] = []
        results.reserveCapacity(inputs.count)
        for i in 0..<batchOut.count {
            let outProvider = batchOut.features(at: i)
            let result =  AnimalPredictionOutput(features: outProvider)
            results.append(result)
        }
        return results
    }
}
