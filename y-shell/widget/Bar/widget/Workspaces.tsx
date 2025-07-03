import Hyprland from "gi://AstalHyprland"
import { createBinding, For, With } from "ags"

function FocusedClient() {
    const hypr = Hyprland.get_default()
    const focused = createBinding(hypr, "focusedClient")


    return <box
        class="focused-client"
        visible={focused.as(Boolean)}>
        <With value={focused}>
            {(client) => <label label={client.title} truncate max_width_chars={24} />}
        </With>
    </box>
}

function Workspaces() {
    const hypr = Hyprland.get_default()
    const workspaces = createBinding(hypr, "workspaces").as(ws => ws.filter(ws => !(ws.id >= -99 && ws.id <= -2)).sort((a, b) => a.id - b.id))

    const styles = "workspace-tab"

    return <box class="Workspaces">
        <For each={workspaces}>
            {ws => (
                <button
                    class={createBinding(hypr, "focusedWorkspace").as(fw =>
                        ws === fw ? `focused ${styles}` : styles)}
                    onClicked={() => ws.focus()}>
                </button>
            )}
        </For>
        <FocusedClient />
    </box>
}

export default Workspaces;
