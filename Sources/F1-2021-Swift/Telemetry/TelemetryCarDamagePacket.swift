//
//  File.swift
//  
//
//  Created by Leigh McLean on 25/11/21.
//

import Foundation

class TelemetryCarDamagePacket: TelemetryPacket {
    
    override init(data iter: inout Data.Iterator) throws {
        try super.init(data: &iter)
        
        // get car damage telemetry
        var carDamageTelemetry: [Telemetry] = []
        for _ in 1...NumberOfParticipants {
            carDamageTelemetry.append(try TelemetryCarDamage(data: &iter))
        }
        self.telemetryPackets["CARDAMAGE"] = carDamageTelemetry
    }
}
