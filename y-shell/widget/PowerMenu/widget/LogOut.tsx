import { execAsync } from "ags/process"

export default function LogOut() {
    return (
        <button onClick={() => execAsync("hyprctl dispatch exit")} class="logout">
            <box>
                <icon icon="system-log-out-symbolic" />
                <label label="Log Out" />
            </box>
        </button>
    )
}
