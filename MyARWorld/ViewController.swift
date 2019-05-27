//
//  ViewController.swift
//  MyARWorld
//
//  Created by dev on 24/05/19.
//  Copyright © 2019 viranchee. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sceneView.delegate = self
        sceneView.showsStatistics = true
        sceneView.debugOptions = [ARSCNDebugOptions.showWorldOrigin, .showFeaturePoints, .showBoundingBoxes]
        sceneView.autoenablesDefaultLighting = true
        
        drawSphere(at: SCNVector3(0, 0, 0))
        drawBox(at: SCNVector3(0, 0.2, -0.3))
        drawPyramid(at: SCNVector3(0, -0.2, 0.3))
        drawCat(at: SCNVector3(-0.2,0,0))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let configuration = ARWorldTrackingConfiguration()

        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        sceneView.session.pause()
    }
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        
    }
}

extension ViewController {
    func drawSphere(at vector3: SCNVector3) {
        let sphere = SCNNode(geometry: SCNSphere(radius: 0.05 ))
        sphere.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
        sphere.position = vector3
        sceneView.scene.rootNode.addChildNode(sphere)
        
    }
    func drawBox(at vector3: SCNVector3) {
        let box = SCNNode(geometry: SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.0))
        box.position = vector3
        box.geometry?.firstMaterial?.diffuse.contents = UIColor.orange
        box.geometry?.firstMaterial?.specular.contents = UIColor.green
        sceneView.scene.rootNode.addChildNode(box)
    }
    func drawPyramid(at vector3: SCNVector3) {
        let pyramid = SCNNode(geometry: SCNPyramid(width: 0.1, height: 0.1, length: 0.1))
        pyramid.position = vector3
        pyramid.geometry?.firstMaterial?.diffuse.contents = UIColor.purple
        pyramid.geometry?.firstMaterial?.specular.contents = UIColor.red
        sceneView.scene.rootNode.addChildNode(pyramid)
    }
    func drawCat(at vector3: SCNVector3) {
        let plane = SCNNode(geometry: SCNPlane(width: 0.1, height: 0.1))
        plane.geometry?.firstMaterial?.diffuse.contents = UIColor.magenta
        plane.geometry?.firstMaterial?.specular.contents = UIColor.yellow
        plane.position = vector3
        sceneView.scene.rootNode.addChildNode(plane)
    }
}
