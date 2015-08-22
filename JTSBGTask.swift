//
//  bgtask.swift
//  Rotation
//
//  Created by Jared Sinclair on 8/15/15.
//  Copyright © 2015 Nice Boy LLC. All rights reserved.
//

import UIKit

/**

//-----------------------------------------------------------------------------

static func start() -> BGTask?

Convenience for initializing a task with a default expiration handler;
@return Returns nil if background task time was denied.

//-----------------------------------------------------------------------------

func startWithExpirationHandler(handler: (() -> Void)?) -> Bool

Begins a background task.

@param handler The expiration handler. Optional. Will be called on whatever
thread UIKit pops the expiration handler for the task. The handler should
perform cleanup in a synchronous manner, since it is called when background
time is being brought to a halt.

@return Returns YES if a valid task id was created.

//-----------------------------------------------------------------------------

end()

Ends the background task for `taskId`, if the id is valid.

*/

public class BGTask {
    
    // MARK: Public
    
    public static func start() -> BGTask? {
        let task = BGTask();
        let successful = task.startWithExpirationHandler(nil)
        return (successful) ? task : nil
    }
    
    public func startWithExpirationHandler(handler: (() -> Void)?) -> Bool {
        self.taskId = UIApplication.sharedApplication().beginBackgroundTaskWithExpirationHandler {
            if let safeHandler = handler { safeHandler() }
            self.end()
        }
        return (self.taskId != UIBackgroundTaskInvalid);
    }
    
    public func end() {
        if (self.taskId != UIBackgroundTaskInvalid) {
            let taskId = self.taskId
            self.taskId = UIBackgroundTaskInvalid
            UIApplication.sharedApplication().endBackgroundTask(taskId)
        }
    }
    
    // MARK: Private
    
    private var taskId: UIBackgroundTaskIdentifier = UIBackgroundTaskInvalid
    
}
