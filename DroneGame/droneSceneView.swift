////
//  droneSceneView.swift
//  DroneGame
//
//  Created by Guest1 on 13/10/17.
//  Copyright © 2017 GCS. All rights reserved.
//

import UIKit
import ARKit
import SceneKit

class droneSceneView: ARSCNView {
    var droneNode:SCNNode!
    var blade1:SCNNode!
    var blade2:SCNNode!
    var rotorR:SCNNode!
    var rotorL:SCNNode!
    
    
    
    func setupDrone(){
        
        scene = SCNScene(named:"art.scnassets/Drone_dae.scn")!
        droneNode=scene.rootNode.childNode(withName: "helicopter", recursively: false)
        //-Float(Double.pi)/2---        planeNode.transform = SCNMatrix4MakeRotation(-Float.pi / 2, 1, 0, 0)

        droneNode.transform=SCNMatrix4MakeRotation(-Float.pi / 2, 1, 0, 0)
        print(" droneNode.transform*****\(droneNode.transform)")
         print("droneNode.position\(droneNode.position)")
        droneNode.position=SCNVector3(droneNode.position.x,droneNode.position.y,droneNode.position.z-1)
        blade1=droneNode?.childNode(withName: "Rotor_R_2", recursively: true)
        blade2=droneNode?.childNode(withName: "Rotor_L_2", recursively: true)
        rotorL=blade2?.childNode(withName: "Rotor_L", recursively: true)
        rotorR=blade1?.childNode(withName: "Rotor_R", recursively: true)
        styleUPDrone()
        spinBlade()
     
    }
    
    func styleUPDrone(){
        
    
        let materialFroDrone=SCNMaterial()
        materialFroDrone.diffuse.contents=UIColor.red
        droneNode.geometry?.materials=[materialFroDrone]
        scene.rootNode.geometry?.materials=[materialFroDrone]
        
        let bladeMaterial=SCNMaterial()
        bladeMaterial.diffuse.contents=UIColor.orange
        blade1.geometry?.materials=[bladeMaterial]
       
        let blade2Material=SCNMaterial()
        bladeMaterial.diffuse.contents=UIColor.green
        blade2.geometry?.materials=[blade2Material]
        
        let rotorLMaterial=SCNMaterial()
        rotorLMaterial.diffuse.contents=UIColor.blue
        rotorR.geometry?.materials=[rotorLMaterial]
       
        let rotoRMaterial=SCNMaterial()
        rotoRMaterial.diffuse.contents=UIColor.gray
        rotorL.geometry?.materials=[rotoRMaterial]
  
    }
    
    func spinBlade(){
     let rotateAction = SCNAction.rotateBy(x: 0, y: 0, z: 200, duration: 0.5)
        let roateScequens = SCNAction.sequence([rotateAction])
        let rotateForever = SCNAction.repeatForever(roateScequens)
        rotorR.runAction(rotateForever)
        rotorL.runAction(rotateForever)
    }
    func moveLeft() {
        SCNTransaction.begin()
        SCNTransaction.animationDuration = 0.5
        droneNode.position = SCNVector3(droneNode.position.x - 0.5, droneNode.position.y, droneNode.position.z)
        blade2.runAction(SCNAction.rotateBy(x: 0.3, y: -0.1, z: 0, duration: 1.5))
        blade1.runAction(SCNAction.rotateBy(x: 0.3, y: 0, z: 0, duration: 1.5))
        SCNTransaction.commit()
        blade2.runAction(SCNAction.rotateBy(x: -0.3, y: 0.1, z: 0, duration: 0.25))
        blade1.runAction(SCNAction.rotateBy(x: -0.3, y: 0, z: 0, duration: 0.25))
    }
    
  
    func moveRight() {
        SCNTransaction.begin()
        SCNTransaction.animationDuration = 0.5
        print(scene.rootNode.childNodes[0].position)
        droneNode.position = SCNVector3(droneNode.position.x + 0.5, droneNode.position.y, droneNode.position.z)
        blade2.runAction(SCNAction.rotateBy(x: 0.3, y: 0, z: 0, duration: 1.5))
        blade1.runAction(SCNAction.rotateBy(x: 0.3, y: 0.1, z: 0, duration: 1.5))
        SCNTransaction.commit()
        blade2.runAction(SCNAction.rotateBy(x: -0.3, y: 0, z: 0, duration: 0.25))
        blade1.runAction(SCNAction.rotateBy(x: -0.3, y: -0.1, z: 0, duration: 0.25))
    }
    func moveForward() {
        SCNTransaction.begin()
        SCNTransaction.animationDuration = 0.5
        droneNode.position = SCNVector3(droneNode.position.x, droneNode.position.y, droneNode.position.z - 0.5)
        blade2.runAction(SCNAction.rotateBy(x: 0.3, y: 0, z: 0, duration: 1.5))
        blade1.runAction(SCNAction.rotateBy(x: 0.3, y: 0, z: 0, duration: 1.5))
        SCNTransaction.commit()
        blade2.runAction(SCNAction.rotateBy(x: -0.3, y: 0, z: 0, duration: 0.25))
        blade1.runAction(SCNAction.rotateBy(x: -0.3, y: 0, z: 0, duration: 0.25))
    }
    
    func reverse() {
        SCNTransaction.begin()
        SCNTransaction.animationDuration = 0.5
        droneNode.position = SCNVector3(droneNode.position.x, droneNode.position.y, droneNode.position.z + 1.5)
        blade2.runAction(SCNAction.rotateBy(x: 0.3, y: 0, z: 0, duration: 1.5))
        blade1.runAction(SCNAction.rotateBy(x: 0.3, y: 0, z: 0, duration: 1.5))
        SCNTransaction.commit()
        blade2.runAction(SCNAction.rotateBy(x: -0.3, y: 0, z: 0, duration: 0.25))
        blade1.runAction(SCNAction.rotateBy(x: -0.3, y: 0, z: 0, duration: 0.25))
    }
    func changeAltitude(value: Float) {
        SCNTransaction.begin()
        SCNTransaction.animationDuration = 0.5
        droneNode.position = SCNVector3(droneNode.position.x, value, droneNode.position.z)
        SCNTransaction.commit()
    }
        /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
