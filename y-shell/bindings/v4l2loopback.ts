import Gio from "gi://Gio?version=2.0";
import GObject, { property, register } from "ags/gobject";
import { monitorFile } from "ags/file";
import { exec } from "ags/process";
import run_loopback from "../helpers/loopback";

@register({ GTypeName: "VirtualCam" })
export default class VirtualCam extends GObject.Object {

    static instance: VirtualCam

    static get_default() {
        if (!this.instance)
            this.instance = new VirtualCam()

        return this.instance
    }

    @property(Boolean) state = this.checkForLoopbackDevice()

    get get_state() { return this.state }

    set set_state(state: boolean) {
        if (state) {
            this.state = state
        } else {
            this.state = state
        }
        return
    }

    toggle_state() {
        run_loopback(!this.state)
    }

    checkForLoopbackDevice(): boolean {
        let output: string;
        try {
            output = exec("v4l2-ctl --list-devices");
        } catch (error) {
            return false;
        }
        if (!output || output.trim().length === 0) {
            return false;
        }
        const loopbackDeviceFound = /\/dev\/video\d+/g.test(output);

        return loopbackDeviceFound;
    }

    constructor() {
        super()

        const statePath = "/dev/v4l2loopback"

        monitorFile(statePath, (file, event) => {
            if (event === Gio.FileMonitorEvent.CHANGES_DONE_HINT) {
                this.state = true
            } else if (event === Gio.FileMonitorEvent.DELETED) {
                this.state = false
            }
        })

    }
}
