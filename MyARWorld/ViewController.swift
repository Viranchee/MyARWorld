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
    
    var objects: [SCNNode] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        sceneView.delegate = self
        sceneView.showsStatistics = true
        sceneView.debugOptions = [ARSCNDebugOptions.showWorldOrigin, .showFeaturePoints, .showBoundingBoxes]
        sceneView.autoenablesDefaultLighting = true
        
        drawObjects()
        
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
    
}

extension ViewController {
    enum Objects: CaseIterable {
        case sphere
        case box
        case pyramid
        case cat
        
        var value: SCNNode {
            switch self {
            case .sphere:
                let sphere = SCNNode(geometry: SCNSphere(radius: 0.05 ))
                sphere.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
                sphere.position = SCNVector3(0, 0, 0)
                return sphere
                
            case .box:
                let box: SCNNode = SCNNode(geometry: SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.0))
                box.geometry?.firstMaterial?.diffuse.contents = UIColor.orange
                box.geometry?.firstMaterial?.specular.contents = UIColor.green
                box.position = SCNVector3(0, 0.2, -0.3)
                return box
            case .pyramid:
                let pyramid = SCNNode(geometry: SCNPyramid(width: 0.1, height: 0.1, length: 0.1))
                pyramid.geometry?.firstMaterial?.diffuse.contents = UIColor.purple
                pyramid.geometry?.firstMaterial?.specular.contents = UIColor.red
                pyramid.position = SCNVector3(0, -0.2, 0.3)
                return pyramid
            case .cat:
                let plane = SCNNode(geometry: SCNPlane(width: 0.1, height: 0.1))
                plane.geometry?.firstMaterial?.diffuse.contents = UIColor.magenta
                plane.geometry?.firstMaterial?.specular.contents = UIColor.yellow
                plane.position = SCNVector3(-0.2,0,0)
                return plane
            }
        }
    }
    
    func drawObjects() {
        for node in Objects.allCases {
            let theNode = node.value
            sceneView.scene.rootNode.addChildNode(theNode)
            objects.append(theNode)
        }
    }
}
