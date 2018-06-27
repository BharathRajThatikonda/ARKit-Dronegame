//
//  ViewController.swift
//  DroneGame
//
//  Created by Guest1 on 13/10/17.
//  Copyright © 2017 GCS. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet weak var sliderOutlet: UISlider!{
        didSet{
            // sliderOutlet.transform =  CGAffineTransform(rotationAngle: -CGFloat.pi/2)
        }
    }
    @IBOutlet weak var scenView: droneSceneView!
    @IBAction func sliderChange(_ sender: Any) {
        guard let slider = sender as? UISlider else { return }
        scenView.changeAltitude(value: slider.value)
    }
    
    @IBAction func downSide(_ sender: Any) {
        scenView.reverse()
    }
    @IBAction func leftSide(_ sender: Any) {
        scenView.moveLeft()
    }
    @IBAction func rightSide(_ sender: Any) {
        scenView.moveRight()
    }
    @IBAction func upwardAction(_ sender: Any) {
        scenView.moveForward()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        scenView.delegate = self
        
        // Show statistics such as fps and timing information
        scenView.showsStatistics = true
        
        // Create a new scene
        //let scene = SCNScene(named: "art.scnassets/ship.scn")!
        
        // Set the scene to the view
       // scenView.scene = scene
        
        scenView.setupDrone()
        sliderOutlet.value = scenView.scene.rootNode.childNodes[0].position.y
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        scenView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        scenView.session.pause()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
