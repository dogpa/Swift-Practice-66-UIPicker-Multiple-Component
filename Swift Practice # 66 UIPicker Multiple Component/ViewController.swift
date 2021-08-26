//
//  ViewController.swift
//  Swift Practice # 66 UIPicker Multiple Component
//
//  Created by Dogpa's MBAir M1 on 2021/8/25.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    //PickerView的Outlet
    @IBOutlet weak var cityAndDistPickerView: UIPickerView!
    //Label的Outlet
    @IBOutlet weak var selectCityDistLabel: UILabel!
    
    //網路用法先建立空Array再到下面的viewDidLoad去append
    //var cityAndDist = [NameCityAndDist]()
    
    
    var cityAndDistArray = [
        //透過自定義NameCityAndDist 建立台北市名與其行政區名稱
        NameCityAndDist(city: "台北市棒", district: ["中正區", "大同區", "中山區", "萬華區", "信義區", "松山區", "大安區", "南港區", "北投區", "內湖區", "士林區", "文山區"]),
        
        //透過自定義NameCityAndDist 建立新北市名與其行政區名稱
        NameCityAndDist(city: "新北市讚", district: ["板橋區", "新莊區", "泰山區", "林口區", "淡水區", "金山區", "八里區", "萬里區", "石門區", "三芝區", "瑞芳區", "汐止區", "平溪區", "貢寮區", "雙溪區", "深坑區", "石碇區", "新店區", "坪林區", "烏來區", "中和區", "永和區", "土城區", "三峽區", "樹林區", "鶯歌區", "三重區", "蘆洲區", "五股區"]),
        
        //透過自定義NameCityAndDist 建立高雄市名與其行政區名稱
        NameCityAndDist(city: "高雄市好", district: ["楠梓區", "左營區", "鼓山區", "三民區", "鹽埕區", "前金區", "新興區", "苓雅區", "前鎮區", "小港區", "旗津區", "鳳山區", "大寮區", "鳥松區", "林園區", "仁武區", "大樹區", "大社區", "岡山區", "路竹區", "橋頭區", "梓官區", "彌陀區", "永安區", "燕巢區", "田寮區", "阿蓮區", "茄萣區", "湖內區", "旗山區", "美濃區", "內門區", "杉林區", "甲仙區", "六龜區", "茂林區", "桃源區", "那瑪夏區"])
        
    ]
    
    
    
    var carAndProductArray = [
        CarBrandAndType(brand: "Toyato", productType: ["Altis","Vivos","Rav4"]),
        CarBrandAndType(brand: "BMW", productType: ["series1","series3","series5","series7","X1","X3","X5"]),
        CarBrandAndType(brand: "Benz", productType: ["A Class","C Class","G Class","S Class"])
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cityAndDistPickerView.delegate = self
        cityAndDistPickerView.dataSource = self
        
        selectCityDistLabel.backgroundColor = .clear
        
        
        /*
        cityAndDist.append(NameCityAndDist(city: "台北市棒", district: ["中正區", "大同區", "中山區", "萬華區", "信義區", "松山區", "大安區", "南港區", "北投區", "內湖區", "士林區", "文山區"]))
        cityAndDist.append(NameCityAndDist(city: "新北市讚", district: ["板橋區", "新莊區", "泰山區", "林口區", "淡水區", "金山區", "八里區", "萬里區", "石門區", "三芝區", "瑞芳區", "汐止區", "平溪區", "貢寮區", "雙溪區", "深坑區", "石碇區", "新店區", "坪林區", "烏來區", "中和區", "永和區", "土城區", "三峽區", "樹林區", "鶯歌區", "三重區", "蘆洲區", "五股區"]))

        cityAndDist.append(NameCityAndDist(city: "高雄市好", district: ["楠梓區", "左營區", "鼓山區", "三民區", "鹽埕區", "前金區", "新興區", "苓雅區", "前鎮區", "小港區", "旗津區", "鳳山區", "大寮區", "鳥松區", "林園區", "仁武區", "大樹區", "大社區", "岡山區", "路竹區", "橋頭區", "梓官區", "彌陀區", "永安區", "燕巢區", "田寮區", "阿蓮區", "茄萣區", "湖內區", "旗山區", "美濃區", "內門區", "杉林區", "甲仙區", "六龜區", "茂林區", "桃源區", "那瑪夏區"]))
        */
        

        
    }

    
    //通知UIPickerView需要顯示的Components區域數量
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    
    
    
    //城市與行政區
    //通知UIPickerView各自Components區域所需顯示的Row數量
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {             //第0個區域的Row
            return cityAndDistArray.count    //顯示cityAndDist裡面的總數（目前為3 (台北新北高雄3個) ）
        }else{
            //第1個區域所需要顯示的數量
            //定義selectCity，其值為UIPickerView第0個區域內的Row
            let selectCity = cityAndDistPickerView.selectedRow(inComponent: 0)
            
            //第1個區域顯示的Row數等於cityAndDist透過剛剛第0個的Row的值的Array內的值
            //先取得 cityAndDist Array的值後
            //再去找到cityAndDist Array的值裡面的.district的數量
            return cityAndDistArray[selectCity].district.count
        }
    }
    
    
    //通知UIPickerView需要顯示的內容為何
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {                             //第0個區域
            return cityAndDistArray[row].city           //顯示內容為cityAndDist的Array
        }else{
            //第1個區域所需要顯示的名字
            //定義selectCity，其值為UIPickerView第0個區域內的Row
            
            let selectCity = cityAndDistPickerView.selectedRow(inComponent: 0)
            //取得selectCity後，顯示的內容為cityAndDistArray選定的值
            //裡面的行政區的[row]的名字
            
            return cityAndDistArray[selectCity].district[row]
            
            
        }
        
    }
    
    
    
    
    
    //檢查component1的總數後再取值以免閃退的Func
    func checkArrayCount (selectCity: Int, selectDistrict:Int ) {
        if cityAndDistArray[selectCity].district.count >= selectDistrict {
            //指派city，內容為cityAndDistArray[selectCity]選到的城市的名稱
            let city = cityAndDistArray[selectCity].city
            
            //district ， 內容為cityAndDistArray裡面透過[selectCity]選取道的值裡面的.district的第[selectDistrict]的值的名稱
            let district = cityAndDistArray[selectCity].district[selectDistrict]
            print("city\(selectCity) district\(selectDistrict)")
            
            //剛剛取得的城市名與行政區域名指派到selectCityDistLabel的顯示text內
            selectCityDistLabel.text = "城市為\(city)\n行政區為\(district)"
            
        }else{
            selectCityDistLabel.text = "幫忙重選喔"
        }
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
     
        
        //選擇完第0個值後重新載入第1個Component區域的值
        cityAndDistPickerView.reloadComponent(1)
        
        //指派selectCity為第0個Component內所選到的值
        let selectCity = cityAndDistPickerView.selectedRow(inComponent: 0)
        

        //指派selectDistrict為第ㄅ個Component內所選到的值
        let selectDistrict = cityAndDistPickerView.selectedRow(inComponent: 1)
        
        //執行檢查的Function
        checkArrayCount(selectCity: selectCity, selectDistrict: selectDistrict)
        
        
        
        
        
        
        
        
        
        /*舊的取值做法會導致某些狀況閃退
        //指派city，內容為cityAndDistArray[selectCity]選到的城市的名稱
        let city = cityAndDistArray[selectCity].city
        
        //district ， 內容為cityAndDistArray裡面透過[selectCity]選取道的值裡面的.district的第[selectDistrict]的值的名稱
        let district = cityAndDistArray[selectCity].district[selectDistrict]
        print("city\(selectCity) district\(selectDistrict)")
        
        //剛剛取得的城市名與行政區域名指派到selectCityDistLabel的顯示text內
        selectCityDistLabel.text = "城市為\(city)\n行政區為\(district)"
        */
    }
    
 
    
    
    
    
    
    
    

    
    /*
    //汽車
    //通知UIPickerView各自Components區域所需顯示的Row數量
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return carAndProductArray.count
        }else{
            
            let selectBrand = cityAndDistPickerView.selectedRow(inComponent: 0)
    
            return carAndProductArray[selectBrand].productType.count
        }
    }
    
    //通知UIPickerView需要顯示的內容為何
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return carAndProductArray[row].brand
        }else{

            let selectType = cityAndDistPickerView.selectedRow(inComponent: 0)

            return carAndProductArray[selectType].productType[row]
            
        }
        
    }
    
    
    func checkArrayCount (selectBrand: Int, selectType:Int) {
        if carAndProductArray[selectBrand].productType.count >= selectType {
            let Brand = carAndProductArray[selectBrand].brand
            
            let Type = carAndProductArray[selectBrand].productType[selectType]
            
            print("Brand\(selectBrand) ProductType\(selectType)")

            selectCityDistLabel.text = "品牌為\(Brand)\n車種為\(Type)"

            
            
        }else{
            selectCityDistLabel.text = "幫忙重選喔"
        }

        
    }
    
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        cityAndDistPickerView.reloadComponent(1)
        
        
        
        let selectBrand = cityAndDistPickerView.selectedRow(inComponent: 0)
        
       
        let selectType = cityAndDistPickerView.selectedRow(inComponent: 1)
        
        checkArrayCount(selectBrand: selectBrand, selectType: selectType)
         }
       
        */
 



    }
