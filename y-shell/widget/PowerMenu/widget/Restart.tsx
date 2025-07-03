import { execAsync } from "ags/process"

export default function Restart() {
    return (
        <button onClick={() => execAsync("reboot")} class="restart">
            <box>
                <icon icon="system-reboot-symbolic" />
                <label label="Restart" />
            </box>
        </button>
    )
}
