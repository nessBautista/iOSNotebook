//
//  CameraViewController.swift
//  CameraFramework
//
//  Created by Nestor Hernandez on 2/23/19.
//  Copyright © 2019 Nestor Hernandez. All rights reserved.
//

import UIKit
import AVFoundation

public class CameraViewController: UIViewController {

    var session = AVCaptureSession()
    var discoverySession: AVCaptureDevice.DiscoverySession? {
        return AVCaptureDevice.DiscoverySession(deviceTypes: [AVCaptureDevice.DeviceType.builtInWideAngleCamera], mediaType: AVMediaType.video, position: AVCaptureDevice.Position.unspecified)
    }
    var videoOutput = AVCaptureVideoDataOutput()
    
    public init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func getPreviewLayer(session: AVCaptureSession) -> AVCaptureVideoPreviewLayer {
        let previewLayer = AVCaptureVideoPreviewLayer(session: self.session)
        previewLayer.frame = self.view.bounds
        return previewLayer
    }
    
    func getDevice() -> AVCaptureDevice? {
        guard let discoverySession = self.discoverySession else {return nil}
        
        for device in discoverySession.devices {
            if device.position == AVCaptureDevice.Position.back {
                return device
            }
        }
        return nil
    }
}
