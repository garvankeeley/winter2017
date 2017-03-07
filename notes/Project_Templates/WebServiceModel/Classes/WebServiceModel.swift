//
//  Model.swift
//  Classes
//
//  Created by Peter McIntyre on 2015-02-01.
//  Copyright (c) 2017 School of ICT, Seneca College. All rights reserved.
//

import CoreData

struct Program {
    var title = ""
    var description = ""
    var artworkUrl = ""
}

protocol WebServiceModelDelegate : class {
    func webServiceModelDidChangeContent(model: WebServiceModel)
}

class WebServiceModel {
    // Property to hold/store the fetched collection
    var programs = [Program]()

    // The delegate gets called to report that the data has changed
    weak var delegate: WebServiceModelDelegate? = nil

    init() {
        programsGet()
    }

    // Method to fetch the collection
    func programsGet() {
        let request = WebServiceRequest()
        request.urlBase = "https://itunes.apple.com"
        let queryPath = "/search?term=big+bang+theory&entity=tvEpisode&limit=10&sort=recent"
        request.sendRequest(toUrlPath: queryPath, dataKeyName: "results", completion: {
            (result: [AnyObject]) in
            for item in result {
                guard let itemDict = item as? [String:AnyObject] else {
                    continue
                }

                var program = Program()
                program.title = itemDict["trackName"] as? String ?? ""
                program.description = itemDict["shortDescription"] as? String ?? ""
                program.artworkUrl = itemDict["artworkUrl100"] as? String ?? ""
                self.programs.append(program)
            }

            // notify the delegate
            self.delegate?.webServiceModelDidChangeContent(model: self)
        })
    }
}
