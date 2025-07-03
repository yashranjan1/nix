import { execAsync } from "ags/process"

export default function Shutdown() {
    return (
        <button onClick={() => execAsync("shutdown now")} class="shutdown">
            <box>
                <icon icon="system-shutdown-symbolic" />
                <label label="Shutdown" />
            </box>
        </button>
    )
}
