import Mpris from "gi://AstalMpris"
import { createBinding } from "ags"
import Gtk from "gi://Gtk?version=3.0"
import { For } from "ags"

function lengthStr(length: number) {
    const min = Math.floor(length / 60)
    const sec = Math.floor(length % 60)
    const sec0 = sec < 10 ? "0" : ""
    return `${min}:${sec0}${sec}`
}

function MediaPlayer({ player }: { player: Mpris.Player }) {

    const title = createBinding(player, "title").as(t =>
        t || "Unknown Track")

    const artist = createBinding(player, "artist").as(a =>
        a || "Unknown Artist")

    const coverArt = createBinding(player, "coverArt").as(c =>
        `background-image: url('${c}')`)

    const position = createBinding(player, "position").as(p => player.length > 0
        ? p / player.length : 0)

    const playerIcon = createBinding(player, "entry").as(e => {
        return "audio-x-generic-symbolic"
    }
    )
    const playIcon = createBinding(player, "playbackStatus").as(s =>
        s === Mpris.PlaybackStatus.PLAYING
            ? "media-playback-pause-symbolic"
            : "media-playback-start-symbolic"
    )


    return (
        <box spacing={10} expand={true} class="mpris-player">
            <box>
                <box class="cover-art" css={coverArt} />
            </box>
            <box vertical hexpand={true}>
                <box class="title">
                    <label truncate hexpand halign={Gtk.Align.START} label={title} />
                    <icon icon={playerIcon} halign={Gtk.Align.END} css={"margin-left: 20px;"} />
                </box>
                <label halign={Gtk.Align.START} valign={Gtk.Align.START} vexpand wrap label={artist} />
                <slider
                    visible={createBinding(player, "length").as(l => l > 0)}
                    onDragged={({ value }) => player.position = value * player.length}
                    value={position}
                    class={"music-slider"}
                />

                <centerbox class="actions">
                    <label
                        hexpand
                        class="position"
                        halign={Gtk.Align.START}
                        visible={createBinding(player, "length").as(l => l > 0)}
                        label={createBinding(player, "position").as(lengthStr)}
                    />
                    <box spacing={10}>
                        <button
                            onClicked={() => player.previous()}
                            visible={createBinding(player, "canGoPrevious")}>
                            <icon icon="media-skip-backward-symbolic" />
                        </button>
                        <button
                            onClicked={() => player.play_pause()}
                            visible={createBinding(player, "canControl")}>
                            <icon icon={playIcon} />
                        </button>
                        <button
                            onClicked={() => player.next()}
                            visible={createBinding(player, "canGoNext")}>
                            <icon icon="media-skip-forward-symbolic" />
                        </button>
                    </box>
                    <label
                        class="length"
                        hexpand
                        halign={Gtk.Align.END}
                        visible={createBinding(player, "length").as(l => l > 0)}
                        label={createBinding(player, "length").as(l => l > 0 ? lengthStr(l) : "0:00")}
                    />
                </centerbox>
            </box>
        </box>
    )
}

export default function MprisPlayers() {
    const mpris = Mpris.get_default()
    const players = createBinding(mpris, "players")
    return <box vertical>
        <For each={players}>
            {player => <MediaPlayer player={player} />}
        </For>
    </box>
}
