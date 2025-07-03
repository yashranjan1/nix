import { Accessor } from "ags"
import Gdk from "gi://Gdk?version=3.0"

type WindowCustomProps = {
    gdkmonitor: Gdk.Monitor
    menuState: Accessor<string>
}
