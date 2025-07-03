import { createState } from "ags";
import { WindowCustomProps } from "../../types/windowCustomProps";
import { network } from "../../variables/network";
import Astal from "gi://Astal?version=3.0";
import { setMenuState } from "../../app";
import { execAsync } from "ags/process";

export default function NewNetwork({ gdkmonitor, menuState }: WindowCustomProps) {

    const [text, setText] = createState("")

    const [error, setError] = createState("")

    return (
        <window
            class="new-network"
            name={`new-network-${gdkmonitor.get_model()}`}
            gdkmonitor={gdkmonitor}
            exclusivity={Astal.Exclusivity.NORMAL}
            anchor={Astal.WindowAnchor.TOP |
                Astal.WindowAnchor.RIGHT}
            visible={menuState(s => s === `control-center-button-${gdkmonitor.get_model()}-wifi-pw` ? true : false)}
            keymode={Astal.Keymode.ON_DEMAND}
        >
            <box class="new-network-box shadow" vexpand vertical>
                <box>
                    <box class={"new-network-header"} spacing={10}>
                        <button onClick={() => {
                            setError("")
                            setError("")
                            setMenuState(`control-center-button-${gdkmonitor.get_model()}-wifi`)
                        }}>
                            <icon icon="go-previous-symbolic" />
                        </button>
                        <label label={"New Network"} xalign={0} hexpand />
                        <button onClick={() => {
                            setMenuState("none")
                        }}>
                            <icon icon="window-close-symbolic" />
                        </button>
                    </box>
                </box>
                <box vertical class={"new-network-form"} spacing={10}>
                    <label
                        label={network.as(s => `Network: ${s}`)}
                        xalign={0}
                        truncate
                    />
                    <box>
                        <label label={"Password:"} xalign={0} hexpand />
                        <entry
                            visibility={false}
                            placeholderText={"Password"}
                            hexpand
                            onNotifyText={self => setText(self.text)}
                            onActivate={self => {
                                self.text = ""
                            }}
                        />
                    </box>
                </box>
                <label label={error(error => `${error}`)} hexpand />
                <box vertical spacing={10}>
                    <button onClick={async () => {
                        try {
                            const pass = `nmcli device wifi connect "${network.get()}" password "${text.get()}"`
                            await execAsync(pass)
                            setMenuState("none")
                            setText("")
                            setError("")
                        }
                        catch (e) {
                            setError("Failed! Reset and try again")
                        }
                    }}>
                        <label label={"Connect"} />
                    </button>
                    <button onClick={async () => {
                        try {
                            await execAsync(`nmcli c delete ${network.get()}`)
                            setError("")
                            setError("")
                        }
                        catch (e) {

                        }
                    }}>
                        <label label={"Reset"} />
                    </button>
                </box>
            </box>
        </window>
    )
}   
