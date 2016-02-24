﻿using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class PowerupManager : MonoBehaviour {

    public List<IPowerup> powerups = new List<IPowerup>();

    //@TODO: setup a death signal to politely pop a hole in the containing powerup list

	// Use this for initialization
	void Start () {
        
    }
	
	// Update is called once per frame
	void FixedUpdate () {
	    foreach(IPowerup powerup in powerups) {
            powerup.Update(Time.fixedDeltaTime);
        }
	}

    // methods for handling powerups
    public void CollectPowerup(IPowerup powerup) {
        Debug.Log("COLLECTING POWERUP " + powerup);
        powerup.OnCollect(gameObject);
        powerups.Add(powerup);
    }
}