//
//  WeatherIcon.swift
//  Weather
//
//  Created by Anton Axelsson on 2019-09-16.
//  Copyright © 2019 Telia Company. All rights reserved.
//

import Foundation
enum WeatherIcon: String, CaseIterable {

    case ThunderstormWithLightRain
    case ThunderstormWithRain
    case ThunderstormWithHeavyRain
    case LightThunderstorm
    case Thunderstorm
    case HeavyThunderstorm
    case RaggedThunderstorm
    case ThunderstormWithLightDrizzle
    case ThunderstormWithDrizzle
    case ThunderstormWithHeavyDrizzle

    case LightIntensityDrizzle
    case Drizzle
    case HeavyIntensityDrizzle
    case LightIntensityDrizzleRain
    case DrizzleRain
    case HeavyIntensityDrizzleRain
    case ShowerRainAndDrizzle
    case HeavyShowerRainAndDrizzle
    case ShowerDrizzle

    case LightRain
    case ModerateRain
    case HeavyIntensityRain
    case VeryHeavyRain
    case ExtremeRain
    case FreezingRain
    case LightIntensityShowerRain
    case ShowerRain
    case HeavyIntensityShowerRain
    case RaggedShowerRain

    case LightSnow
    case Snow
    case HeavySnow
    case Sleet
    case LightShowerSleet
    case ShowerSleet
    case LightRainAndSnow
    case RainAndSnow
    case LightShowerSnow
    case ShowerSnow
    case HeavyShowerSnow

    case Mist
    case Smoke
    case Haze
    case SandDustWhirls
    case Fog
    case Sand
    case Dust
    case VolcanicAsh
    case Squalls
    case Tornado

    case ClearSky
    case FewClouds
    case ScatteredClouds
    case BrokenClouds
    case OvercastClouds

    init?(id: Int) {
        guard let weather = WeatherIcon.allCases.first(where: { $0.id == id }) else { return nil }
        self = weather
    }

    var id: Int {

        switch self {
        case .ThunderstormWithLightRain: return 200
        case .ThunderstormWithRain: return 201
        case .ThunderstormWithHeavyRain: return 202
        case .LightThunderstorm: return 210
        case .Thunderstorm: return 211
        case .HeavyThunderstorm: return 212
        case .RaggedThunderstorm: return 221
        case .ThunderstormWithLightDrizzle: return 230
        case .ThunderstormWithDrizzle: return 231
        case .ThunderstormWithHeavyDrizzle: return 232

        case .LightIntensityDrizzle: return 300
        case .Drizzle: return 301
        case .HeavyIntensityDrizzle: return 302
        case .LightIntensityDrizzleRain: return 310
        case .DrizzleRain: return 311
        case .HeavyIntensityDrizzleRain: return 312
        case .ShowerRainAndDrizzle: return 313
        case .HeavyShowerRainAndDrizzle: return 314
        case .ShowerDrizzle: return 321

        case .LightRain: return 500
        case .ModerateRain: return 501
        case .HeavyIntensityRain: return 502
        case .VeryHeavyRain: return 503
        case .ExtremeRain: return 504
        case .FreezingRain: return 511
        case .LightIntensityShowerRain: return 520
        case .ShowerRain: return 521
        case .HeavyIntensityShowerRain: return 522
        case .RaggedShowerRain: return 531

        case .LightSnow: return 600
        case .Snow: return 601
        case .HeavySnow: return 602
        case .Sleet: return 611
        case .LightShowerSleet: return 612
        case .ShowerSleet: return 613
        case .LightRainAndSnow: return 615
        case .RainAndSnow: return 616
        case .LightShowerSnow: return 620
        case .ShowerSnow: return 621
        case .HeavyShowerSnow: return 622

        case .Mist: return 701
        case .Smoke: return 711
        case .Haze: return 721
        case .SandDustWhirls: return 731
        case .Fog: return 741
        case .Sand: return 751
        case .Dust: return 761
        case .VolcanicAsh: return 762
        case .Squalls: return 771
        case .Tornado: return 781

        case .ClearSky: return 800
        case .FewClouds: return 801
        case .ScatteredClouds: return 802
        case .BrokenClouds: return 803
        case .OvercastClouds: return 804
        }
    }

    var iconName: String {
        switch self {
        case .ThunderstormWithLightRain: return "11d"
        case .ThunderstormWithRain: return "11d"
        case .ThunderstormWithHeavyRain: return "11d"
        case .LightThunderstorm: return "11d"
        case .Thunderstorm: return "11d"
        case .HeavyThunderstorm: return "11d"
        case .RaggedThunderstorm: return "11d"
        case .ThunderstormWithLightDrizzle: return "11d"
        case .ThunderstormWithDrizzle: return "11d"
        case .ThunderstormWithHeavyDrizzle: return "11d"

        case .LightIntensityDrizzle: return "09d"
        case .Drizzle: return "09d"
        case .HeavyIntensityDrizzle: return "09d"
        case .LightIntensityDrizzleRain: return "09d"
        case .DrizzleRain: return "09d"
        case .HeavyIntensityDrizzleRain: return "09d"
        case .ShowerRainAndDrizzle: return "09d"
        case .HeavyShowerRainAndDrizzle: return "09d"
        case .ShowerDrizzle: return "09d"

        case .LightRain: return "10d"
        case .ModerateRain: return "10d"
        case .HeavyIntensityRain: return "10d"
        case .VeryHeavyRain: return "10d"
        case .ExtremeRain: return "10d"
        case .FreezingRain: return "13d"
        case .LightIntensityShowerRain: return "09d"
        case .ShowerRain: return "09d"
        case .HeavyIntensityShowerRain: return "09d"
        case .RaggedShowerRain: return "09d"

        case .LightSnow: return "13d"
        case .Snow: return "13d"
        case .HeavySnow: return "13d"
        case .Sleet: return "13d"
        case .LightShowerSleet: return "13d"
        case .ShowerSleet: return "13d"
        case .LightRainAndSnow: return "13d"
        case .RainAndSnow: return "13d"
        case .LightShowerSnow: return "13d"
        case .ShowerSnow: return "13d"
        case .HeavyShowerSnow: return "13d"

        case .Mist: return "50d"
        case .Smoke: return "50d"
        case .Haze: return "50d"
        case .SandDustWhirls: return "50d"
        case .Fog: return "50d"
        case .Sand: return "50d"
        case .Dust: return "50d"
        case .VolcanicAsh: return "50d"
        case .Squalls: return "50d"
        case .Tornado: return "50d"

        case .ClearSky: return "01d"
        case .FewClouds: return "01d"
        case .ScatteredClouds: return "01d"
        case .BrokenClouds: return "01d"
        case .OvercastClouds: return "01d"
        }
    }



}

extension WeatherIcon {
    var iconUnicode: String {
        switch self {
        case .ThunderstormWithLightRain: return "\u{f01d}"
        case .ThunderstormWithRain: return "\u{f01d}"
        case .ThunderstormWithHeavyRain: return "\u{f01d}"
        case .LightThunderstorm: return "\u{f01d}"
        case .Thunderstorm: return "\u{f01d}"
        case .HeavyThunderstorm: return "\u{f01d}"
        case .RaggedThunderstorm: return "\u{f01d}"
        case .ThunderstormWithLightDrizzle: return "\u{f01d}"
        case .ThunderstormWithDrizzle: return "\u{f01d}"
        case .ThunderstormWithHeavyDrizzle: return "\u{f01d}"

        case .LightIntensityDrizzle: return "\u{f01a}"
        case .Drizzle: return "\u{f01a}"
        case .HeavyIntensityDrizzle: return "\u{f01a}"
        case .LightIntensityDrizzleRain: return "\u{f01a}"
        case .DrizzleRain: return "\u{f01a}"
        case .HeavyIntensityDrizzleRain: return "\u{f01a}"
        case .ShowerRainAndDrizzle: return "\u{f01a}"
        case .HeavyShowerRainAndDrizzle: return "\u{f01a}"
        case .ShowerDrizzle: return "\u{f01a}"

        case .LightRain: return "\u{f009}"
        case .ModerateRain: return "\u{f009}"
        case .HeavyIntensityRain: return "\u{f009}"
        case .VeryHeavyRain: return "\u{f009}"
        case .ExtremeRain: return "\u{f009}"
        case .FreezingRain: return "\u{f01b}"
        case .LightIntensityShowerRain: return "\u{f01a}"
        case .ShowerRain: return "\u{f01a}"
        case .HeavyIntensityShowerRain: return "\u{f01a}"
        case .RaggedShowerRain: return "\u{f01a}"

        case .LightSnow: return "\u{f01b}"
        case .Snow: return "\u{f01b}"
        case .HeavySnow: return "\u{f01b}"
        case .Sleet: return "\u{f01b}"
        case .LightShowerSleet: return "\u{f01b}"
        case .ShowerSleet: return "\u{f01b}"
        case .LightRainAndSnow: return "\u{f01b}"
        case .RainAndSnow: return "\u{f01b}"
        case .LightShowerSnow: return "\u{f01b}"
        case .ShowerSnow: return "\u{f01b}"
        case .HeavyShowerSnow: return "\u{f01b}"

        case .Mist: return "\u{f014}"
        case .Smoke: return "\u{f014}"
        case .Haze: return "\u{f014}"
        case .SandDustWhirls: return "\u{f014}"
        case .Fog: return "\u{f014}"
        case .Sand: return "\u{f014}"
        case .Dust: return "\u{f014}"
        case .VolcanicAsh: return "\u{f014}"
        case .Squalls: return "\u{f014}"
        case .Tornado: return "\u{f014}"

        case .ClearSky: return "\u{f00d}"
        case .FewClouds: return "\u{f002}"
        case .ScatteredClouds: return "\u{f002}"
        case .BrokenClouds: return "\u{f002}"
        case .OvercastClouds: return "\u{f002}"
        }
    }
}
