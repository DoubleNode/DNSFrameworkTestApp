//
//  WKRBeaconstacBeaconWorker.swift
//  TestApp
//
//  Created by Darren Ehlers on 12/2/19.
//  Copyright © 2019 DoubleNode.com, LLC. All rights reserved.
//

//import Beaconstac
import CoreLocation
import DNSProtocols
import UIKit

open class WKRBeaconstacBeaconWorker: NSObject, PTCLBeacon_Protocol, CLLocationManagerDelegate
{
    public var nextWorker: PTCLBeacon_Protocol?

    private lazy var locationManager: CLLocationManager = createLocationManager()
    //private lazy var beaconstacManager: Beaconstac = createBeaconstac()

    override public required init() {
        super.init()
    }

    public required init(nextWorker: PTCLBeacon_Protocol) {
        self.nextWorker = nextWorker
    }

    open func configure() {
    }

    open func enableOption(option: String) {
        nextWorker?.enableOption(option: option)
    }

    open func disableOption(option: String) {
        nextWorker?.disableOption(option: option)
    }

    /*
    private func createBeaconstac() throws -> Beaconstac {
        do {
            Beaconstac.sharedInstance(TESTAppConstants.beaconstacDevKey, completion: { (beaconstac, error) in
                if retval = beaconstac {
                    return beaconstac
                } else if error {
                    throw error
                }
            })
        } catch let error {
            print(error)
            throw error
        }
    }
 */
    private func createLocationManager() -> CLLocationManager {
        let retval = CLLocationManager()
        retval.delegate = self
        retval.requestAlwaysAuthorization()
        return retval
    }

    public func locationManager(_ manager: CLLocationManager,
                                 didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways {
            //beaconstac?.startScanningBeacons()
        } else {
            //beaconstac?.stopScanningBeacons()

            // Show Alert to enable alwyas permission
        }
    }

    // MARK: - Business Logic / Single Item CRUD
}
