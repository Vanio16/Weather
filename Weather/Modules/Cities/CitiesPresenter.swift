//
//  CitiesPresenter.swift
//  Weather
//
//  Created by Ivan Zakharov on 6/9/21.
//

import Foundation

final class CitiesPresenter {

    weak var view: CitiesViewController?
    weak var output: CitiesModuleOutput?
    var state: CitiesState
    init(state: CitiesState) {
        self.state = state
    }
}

extension CitiesPresenter: CitiesViewOutput {
    func getCityId(id: String) {
        output?.citiesModuleSendsCityId(id: id)
    }
}

extension CitiesPresenter: CitiesModuleInput {

}
