//
//  DataViewModel.swift
//  ProjectSwift
//
//  Created by Marina Huber on 9/24/20.
//  Copyright © 2020 Marina Huber. All rights reserved.
//

import  UIKit

class DataViewModel {
    
    var datas: [CityWeather] = [CityWeather]()
    var reloadTableView: (()->())?
    var showError: (()->())?
    var showLoading: (()->())?
    var hideLoading: (()->())?
    
    private var cellViewModels: [DataListCellViewModel] = [DataListCellViewModel]() {
        didSet {
            self.reloadTableView?()
        }
    }
    
    func getData(){
        showLoading?()
        APIService.getCityToday("", completion: { [weak self] result in
            guard self != nil else { return }
            self?.hideLoading?()
            switch result {
                case .success(let repo):
                    self?.createCell(datas: repo)
                    self?.reloadTableView?()
                
                case .failure:
                    self?.showError?()
            }
        })
    }
    
    var numberOfCells: Int {
        return cellViewModels.count
    }
    
    func getCellViewModel( at indexPath: IndexPath ) -> DataListCellViewModel {
        return cellViewModels[indexPath.row]
    }
    
    func didSelect(at indexPath: Int) -> CityWeather {
        return datas[indexPath]
    }
    
    func createCell(datas: [CityWeather]){
        self.datas = datas
        var vms = [DataListCellViewModel]()
        _ = datas.map {
            vms.append(DataListCellViewModel(titleText: $0.name ?? ""))
        }
        cellViewModels = vms
    }
}

struct DataListCellViewModel {
    let titleText: String
}
