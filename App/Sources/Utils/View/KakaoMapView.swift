import SwiftUI
import KakaoMapsSDK

public struct Location {
    let locationX: Double
    let locationY: Double
    let address: String
    let locationDetails: String

    public init(
        locationX: Double,
        locationY: Double,
        address: String,
        locationDetails: String
    ) {
        self.locationX = locationX
        self.locationY = locationY
        self.address = address
        self.locationDetails = locationDetails
    }
}

struct KakaoMapView: UIViewRepresentable {
    @Binding var draw: Bool
    @Binding var location: Location?
    
    func makeUIView(context: Self.Context) -> KMViewContainer {
        let view = KMViewContainer()
        view.sizeToFit()
        context.coordinator.createController(view)
        return view
    }
    
    func updateUIView(_ uiView: KMViewContainer, context: Self.Context) {
        if draw {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                guard let controller = context.coordinator.controller else {
                    print("Controller is nil in updateUIView")
                    return
                }
                 if !controller.isEnginePrepared {
                    controller.prepareEngine()
                }
                
                if !controller.isEngineActive {
                    controller.activateEngine()
                }
            }
        } else {
            context.coordinator.controller?.pauseEngine()
            context.coordinator.controller?.resetEngine()
        }
    }
    
    func makeCoordinator() -> KakaoMapCoordinator {
        return KakaoMapCoordinator(location: location)
    }
    
    class KakaoMapCoordinator: NSObject, MapControllerDelegate {
        var location: Location?
        
        init(location: Location?) {
            first = true
            auth = false
            self.location = location
            super.init()
        }
        
        func createController(_ view: KMViewContainer) {
            container = view
            controller = KMController(viewContainer: view)
            controller?.delegate = self
        }
        
        func addViews() {
            let defaultPosition: MapPoint
            if let location = location {
                defaultPosition = MapPoint(longitude: location.locationX, latitude: location.locationY)
            } else {
                defaultPosition = MapPoint(longitude: 126.978365, latitude: 37.566691)
            }
            let mapviewInfo = MapviewInfo(viewName: "mapview", viewInfoName: "map", defaultPosition: defaultPosition)
            
            guard let controller = controller else {
                print("Controller is nil in addViews")
                return
            }
            
            controller.addView(mapviewInfo)
        }
        
        func addViewSucceeded(_ viewName: String, viewInfoName: String) {
            print("addViewSucceeded called for \(viewName), \(viewInfoName)")
            guard let view = controller?.getView(viewName) else {
                print("view not found in addViewSucceeded")
                return
            }
            view.viewRect = container?.bounds ?? .zero
            
            createLabelLayer()
            createPoiStyle()
            createPois()
        }
        
        func createLabelLayer() {
            guard let controller = controller else {
                print("Controller is nil in createLabelLayer")
                return
            }
            
            guard let view = controller.getView("mapview") as? KakaoMap else {
                print("view is nil or not KakaoMap type in createLabelLayer")
                return
            }
            
            let manager = view.getLabelManager()
            let layerOption = LabelLayerOptions(layerID: "PoiLayer", competitionType: .none, competitionUnit: .symbolFirst, orderType: .rank, zOrder: 0)
            let _ = manager.addLabelLayer(option: layerOption)
        }
        
        func createPoiStyle() {
            guard let view = controller?.getView("mapview") as? KakaoMap else {
                print("view is nil in createPoiStyle")
                return
            }
            let manager = view.getLabelManager()
            
            let iconStyle1 = PoiIconStyle(symbol: UIImage(named: "dd"), anchorPoint: CGPoint(x: 0.0, y: 0.5))
            let iconStyle2 = PoiIconStyle(symbol: UIImage(named: "dd"), anchorPoint: CGPoint(x: 0.0, y: 0.5))
            
            let poiStyle = PoiStyle(styleID: "PerLevelStyle", styles: [
                PerLevelPoiStyle(iconStyle: iconStyle1, level: 5),
                PerLevelPoiStyle(iconStyle: iconStyle2, level: 12)
            ])
            manager.addPoiStyle(poiStyle)
        }
        
        func createPois() {
            print("createPois")
            guard let view = controller?.getView("mapview") as? KakaoMap else {
                print("view is nil in createPois")
                return
            }
            let manager = view.getLabelManager()
            let layer = manager.getLabelLayer(layerID: "PoiLayer")
            let poiOption = PoiOptions(styleID: "PerLevelStyle")
            poiOption.rank = 0
            
            let poi1: Poi?
            if let location = location {
                poi1 = layer?.addPoi(option: poiOption, at: MapPoint(longitude: location.locationX, latitude: location.locationY))
                print("location on")
            } else {
                poi1 = layer?.addPoi(option: poiOption, at: MapPoint(longitude: 126.978365, latitude: 37.566691))
                print("default location")
            }
            
            guard let poi1 = poi1 else {
                print("Failed to create POI")
                return
            }
            
            poi1.show()
        }
        
        func containerDidResized(_ size: CGSize) {
            guard let mapView = controller?.getView("mapview") as? KakaoMap else {
                print("mapView not found in containerDidResized")
                return
            }
            mapView.viewRect = CGRect(origin: .zero, size: size)
            if first {
                let cameraUpdate = CameraUpdate.make(target: MapPoint(longitude: 126.978365, latitude: 37.566691), mapView: mapView)
                mapView.moveCamera(cameraUpdate)
                first = false
            }
        }
        
        func authenticationSucceeded() {
            auth = true
        }
        
        var controller: KMController?
        var container: KMViewContainer?
        var first: Bool
        var auth: Bool
    }
}
