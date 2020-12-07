import UIKit

struct MyCar{
    var type : TypeIs
    var label : String
    var productYear : Int
    var volumeSpace : Double
    private var volumeType : VolumeType
    private var engineIs : EngineIs
    private var windowIs : WindowIs
    private var offVolumeSpace : Double
    enum TypeIs : String{
        case sportCar = "Sport Car"
        case trunkCar = "Trunk Car"
    }
    enum VolumeType : String{
        case sport = "trunk"
        case trunk = "body"
    }
    enum EngineIs : String{
        case start = "Started"
        case stop = "Stopped"
    }
    enum WindowIs : String{
        case open = "Opened"
        case close = "Closed"
    }
    enum OffVolume : String{
        case load = "loaded in"
        case unload = "unloaded of"
    }
    init(type : TypeIs, label : String, productYear : Int, volumeSpace : Double) {
        self.type = type
        if type == TypeIs.sportCar{
            volumeType = VolumeType.sport
        } else {
            volumeType = VolumeType.trunk
        }
        self.label = label
        self.productYear = productYear
        self.volumeSpace = volumeSpace
        self.offVolumeSpace = volumeSpace
        self.engineIs = EngineIs.stop
        self.windowIs = WindowIs.close
    }
    mutating func startEngine() {
        if engineIs == .stop {
           self.engineIs = .start
           print("The engine is",engineIs.rawValue)
        } else {
           print("The engine is alredy running")
        }
    }
    mutating func stopEngine() {
        if engineIs == .start {
           self.engineIs = .stop
           print("The engine is",engineIs.rawValue)
        } else {
           print("The engine is alredy stoped")
        }
    }
    mutating func openWindow() {
        if windowIs == .close {
            self.windowIs = .open
            print("The window is",windowIs.rawValue)
        } else {
            print("The window is alredy open")
        }
    }
    mutating func closeWindow() {
        if windowIs == .open {
            self.windowIs = .close
            print("The window is",windowIs.rawValue)
        } else {
            print("The window is alredy close")
        }
    }
    mutating func load(volume: Double) {
        if volume <= offVolumeSpace{
            self.offVolumeSpace -= volume
            print("You",OffVolume.load.rawValue,volumeType.rawValue,volume,"liters")
        } else {
            print("You cannot",OffVolume.load.rawValue,volumeType.rawValue,volume,"liters")
        }
        print("Free space left",offVolumeSpace,"liters of",volumeSpace,"\nLoaded space",(volumeSpace-offVolumeSpace))
    }
    mutating func upload(volume: Double) {
        if (offVolumeSpace < volumeSpace) && ((volumeSpace-offVolumeSpace)>=volume){
            self.offVolumeSpace += volume
            print("You",OffVolume.unload.rawValue,volumeType.rawValue,volume,"liters")
        } else {
            print("You cannot",OffVolume.unload.rawValue,volumeType.rawValue,volume,"liters")
        }
        print("Free space left",offVolumeSpace,"liters of",volumeSpace,"\nLoaded space",volumeSpace-offVolumeSpace)
    }
    mutating func status(){
        print("This car is - \(type.rawValue) \nLable - \(label) \nProduct Year - \(productYear) \nVolume \(volumeType.rawValue) - \(volumeSpace) liters")
        print("The engine is \(engineIs.rawValue) \nThe window is \(windowIs.rawValue) \nFree space \(volumeType.rawValue) left \(offVolumeSpace) liters \nLoaded space \(volumeType.rawValue) \(volumeSpace-offVolumeSpace) liters")
    }
}
var car1 = MyCar(type: MyCar.TypeIs.sportCar, label: "Ferrari Roma", productYear: 2020, volumeSpace: 300)
var car2 = MyCar(type: MyCar.TypeIs.trunkCar, label: "Iveco Daily", productYear: 2006, volumeSpace: 15000)
car1.closeWindow()
car1.openWindow()
car1.load(volume: 200)
car2.load(volume: 1000)
car2.startEngine()
car1.upload(volume: 15.5)
car1.startEngine()
car1.openWindow()
car1.upload(volume: 15.5)
car1.load(volume: 131)
car2.status()
car1.status()
