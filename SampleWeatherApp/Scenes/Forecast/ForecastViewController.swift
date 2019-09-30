//
//  ForecastViewController.swift
//  SampleWeatherApp
//
//  Created by Renata Guttenová on 29/09/2019.
//  Copyright © 2019 Renata Guttenová. All rights reserved.
//

import Alamofire
import CoreLocation
import UIKit

protocol ForecastControlling {
    var coordinator: ForecastCoordinating? { get set }
}

class ForecastViewController: UIViewController, CLLocationManagerDelegate, ForecastControlling {
    var coordinator: ForecastCoordinating?

    @IBOutlet private var tableView: UITableView!
    @IBOutlet var gifImageView: UIImageView!

    let locationManager = CLLocationManager()
    var currentLocation: CLLocation!
    var forecastWeather: ForecastWeather!
    var forecastArray = [ForecastWeather]()
    var newForecastArray = [ForecastWeather]()
    private let cellHeight: CGFloat = 70

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        callDelegates()
        setupLocation()
    }

    override func viewDidAppear(_: Bool) {
        downloadForecastWeather {
            print("DATA DOWNLOADED")
        }
        configureGIFView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationController?.setNavigationBarHidden(true, animated: true)
    }

    func callDelegates() {
        locationManager.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
    }

    func setupLocation() {
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startMonitoringSignificantLocationChanges()
    }

    func downloadForecastWeather(completed: @escaping downloadComplete) {
        Alamofire.request(FORECAST_API_URL).responseJSON { response in
            let result = response.result

            if let dictionary = result.value as? Dictionary<String, AnyObject> {
                if let list = dictionary["list"] as? [Dictionary<String, AnyObject>] {
                    for item in list {
                        let forecast = ForecastWeather(weatherDictionary: item)
                        self.forecastArray.append(forecast)
                    }

                    self.newForecastArray = [self.forecastArray[8], self.forecastArray[16], self.forecastArray[24], self.forecastArray[32]]
                    self.tableView.reloadData()
                }
            }
            completed()
        }
    }

    func configureGIFView() {
        let gifURL: String = "https://media.giphy.com/media/f0VAdbPiiLmsU/giphy.gif"
        let imageURL = UIImage.gifImageWithURL(gifURL)
        let gifImageView = UIImageView(image: imageURL)
        gifImageView.frame = CGRect(x: 20.0, y: 20.0, width: view.frame.size.width - 40.0, height: 310.0)
        view.addSubview(gifImageView)
    }
}

extension ForecastViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in _: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // swiftlint:disable:next force_cast
        let cell = tableView.dequeueReusableCell(withIdentifier: "ForecastCell") as! ForecastCell
        cell.configureCell(forecastData: newForecastArray[indexPath.row])

        return cell
    }

    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return newForecastArray.count
    }

    func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
        return cellHeight
    }
}
