//
//  CityAndDistClass.swift
//  Swift Practice # 66 UIPicker Multiple Component
//
//  Created by Dogpa's MBAir M1 on 2021/8/25.
//

import Foundation

//定義一個城市名與行政區名稱
class NameCityAndDist {
    var city: String            //定義城市名稱city是String字串型別
    var district: [String]      //定義行政區名稱district為String的Array型別
    
    //初始化city與district
    init(city:String, district:[String]) {
        self.city = city
        self.district = district
    }
}



class CarBrandAndType {
    var brand: String
    var productType: [String]
    init(brand:String, productType:[String]) {
        self.brand = brand
        self.productType = productType
    }
}


