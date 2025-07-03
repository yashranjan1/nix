import AstalNetwork from "gi://AstalNetwork";
import { Gdk } from "gi://Gdk?version=3.0";
import { execAsync } from "ags/process";
import { setMenuState } from "../../../app";
import { setNetwork } from "../../../variables/network";

export default function WifiOption({ ap, gdkmonitor }: { ap: AstalNetwork.AccessPoint, gdkmonitor: Gdk.Monitor }) {


    return (

        <box class={"wifi-label"} spacing={20}>
            <box hexpand>
                <icon icon={ap.icon_name} />
                <label label={ap.ssid} xalign={0} truncate />
            </box>

            <button
                onClick={async () => {
                    try {
                        await execAsync(`nmcli device wifi connect ${ap.ssid}`)
                        setMenuState("none")
                    }
                    catch (e) {
                        setNetwork(ap.ssid)
                        setMenuState(`control-center-button-${gdkmonitor.get_model()}-wifi-pw`)
                    }
                }}
            >
                <label label={"Connect"} xalign={0} />
            </button>
        </box>
    )
}
