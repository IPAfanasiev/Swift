import UIKit
enum GearBoxType : String{
    case automatic = "Automatic gearbox"
    case manual = "Manual geasrbox"
}
enum EngineType : String{
    case petrol = "Petrol"
    case diesel = "Diesel"
    case electro = "Electro"
}
enum TuningType : String{
    case nos = "NO2"
    case spoiler = "Spoiler"
}
enum RoofIs : String{
    case open = "Opened"
    case close = "Closed"
}
enum DriveUnit : String{
    case front = "Front-weel"
    case rear = "Rear-weel"
    case full = "Full-weel"
    case modify = "Modify-weel"
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
class Car {
    let productYear : Int
    let label : String
    let typeEngine : EngineType
    let enginePower : Double
    let driveUnit : DriveUnit
    let weight : Double
    let lenght : Double
    let height : Double
    let width : Double
    private var engineIs : EngineIs
    private var windowIs : WindowIs
    init(productYear: Int, label: String, typeEngine: EngineType, enginePower: Double, driveUnit: DriveUnit, weight: Double, lenght: Double, height: Double, width: Double) {
        self.productYear = productYear
        self.label = label
        self.typeEngine = typeEngine
        self.enginePower = enginePower
        self.driveUnit = driveUnit
        self.weight = weight
        self.lenght = lenght
        self.height = height
        self.width = width
        self.engineIs = .stop
        self.windowIs = .close
    }
    func startEngine() {
        if engineIs == .stop {
           self.engineIs = .start
           print("The engine is",engineIs.rawValue)
        } else {
           print("The engine is alredy running")
        }
    }
    func stopEngine() {
        if engineIs == .start {
           self.engineIs = .stop
           print("The engine is",engineIs.rawValue)
        } else {
           print("The engine is alredy stoped")
        }
    }
    func openWindow() {
        if windowIs == .close {
            self.windowIs = .open
            print("The window is",windowIs.rawValue)
        } else {
            print("The window is alredy open")
        }
    }
    func closeWindow() {
        if windowIs == .open {
            self.windowIs = .close
            print("The window is",windowIs.rawValue)
        } else {
            print("The window is alredy close")
        }
    }
}
class TrunkCar: Car {
    let gearBoxSteps : Int
    let gearBoxType : GearBoxType
    let numberAxles : Int
    var volumeBody : Double
    let maxWeight : Double
    private var offVolumeSpace : Double
    init(productYear: Int, label: String, typeEngine: EngineType, enginePower: Double, driveUnit: DriveUnit, weight: Double, lenght: Double, height: Double, width: Double, gearBoxSteps: Int, gearBoxType: GearBoxType, numberAxles: Int, volumeBody: Double, maxWeight: Double) {
        self.gearBoxSteps = gearBoxSteps
        self.gearBoxType = gearBoxType
        self.numberAxles = numberAxles
        self.volumeBody = volumeBody
        self.maxWeight = maxWeight
        self.offVolumeSpace = volumeBody
        super.init(productYear: productYear, label: label, typeEngine: typeEngine, enginePower: enginePower, driveUnit: driveUnit, weight: weight, lenght: lenght, height: height, width: width)
    }
    func load(volume: Double) {
        if volume <= offVolumeSpace{
            self.offVolumeSpace -= volume
            print("You \(OffVolume.load.rawValue) body \(volume) liters")
        } else {
            print("You cannot \(OffVolume.load.rawValue) body \(volume) liters")
        }
        print("Free space left \(offVolumeSpace) liters of \(volumeBody)\nLoaded space \(volumeBody-offVolumeSpace)")
    }
    func upload(volume: Double) {
        if (offVolumeSpace < volumeBody) && ((volumeBody-offVolumeSpace)>=volume){
            self.offVolumeSpace += volume
            print("You \(OffVolume.unload.rawValue) body \(volume) liters")
        } else {
            print("You cannot \(OffVolume.unload.rawValue) body \(volume) liters")
        }
        print("Free space left \(offVolumeSpace) liters of \(volumeBody)\nLoaded space \(volumeBody-offVolumeSpace)")
    }
}
class SportCar: Car {
    var tuning : TuningType
    var rubberType : String
    var maxSpeed : Double
    private var roofIs : RoofIs
    init(productYear: Int, label: String, typeEngine: EngineType, enginePower: Double, driveUnit: DriveUnit, weight: Double, lenght: Double, height: Double, width: Double, tuning: TuningType, rubberType: String, maxSpeed: Double) {
        self.tuning = tuning
        self.rubberType = rubberType
        self.maxSpeed = maxSpeed
        self.roofIs = .close
        super.init(productYear: productYear, label: label, typeEngine: typeEngine, enginePower: enginePower, driveUnit: driveUnit, weight: weight, lenght: lenght, height: height, width: width)
    }
    func openRoof() {
        if roofIs == .close {
            self.roofIs = .open
            print("The roof is",roofIs.rawValue)
        } else {
            print("The roof is alredy open")
        }
    }
    func closeRoof() {
        if roofIs == .open {
            self.roofIs = .close
            print("The roof is",roofIs.rawValue)
        } else {
            print("The roof is alredy close")
        }
    }
}
class DecorativeSportCar : SportCar {
    override func startEngine() {
        print("This is Decorative auto, pleas don't start engine")
    }
    override func openRoof() {
        print("This is Decorative auto, pleas don't open roof")
    }
}
class DecorativeTrunkCar : TrunkCar {
    override func startEngine() {
        print("This is Decorative auto, pleas don't start engine")
    }
}
var car1 = SportCar(productYear: 2020, label: "Super", typeEngine: .petrol, enginePower: 700.0, driveUnit: .full, weight: 1000, lenght: 5000, height: 1200, width: 1500, tuning: .nos, rubberType: "Slik", maxSpeed: 300.0)
var car2 = TrunkCar(productYear: 2010, label: "BIG", typeEngine: .diesel, enginePower: 400.0, driveUnit: .front, weight: 7000, lenght: 12000, height: 3000, width: 2500, gearBoxSteps: 8, gearBoxType: .automatic, numberAxles: 6, volumeBody: 30000, maxWeight: 16000)
var car3 = DecorativeSportCar(productYear: 2020, label: "VeryFast", typeEngine: .electro, enginePower: 1000, driveUnit: .full, weight: 1100, lenght: 5000, height: 1200, width: 1500, tuning: .spoiler, rubberType: "Slik", maxSpeed: 350.0)
var car4 = DecorativeTrunkCar(productYear: 2020, label: "VeryBig", typeEngine: .diesel, enginePower: 1000, driveUnit: .full, weight: 5000, lenght: 12000, height: 3000, width: 2500, gearBoxSteps: 11, gearBoxType: .automatic, numberAxles: 6, volumeBody: 60000, maxWeight: 25000)
car1.startEngine()
car1.openRoof()
car2.startEngine()
car2.load(volume: 500)
car3.openRoof()
car4.startEngine()
print("Car label \(car1.label) rubber is \(car1.rubberType)")
print("Car label \(car2.label) gearbox steps is \(car2.gearBoxSteps)")
print("Car label \(car3.label) max speed is \(car3.maxSpeed)")
print("Car label \(car4.label) product year is \(car4.productYear)")
